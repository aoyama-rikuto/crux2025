class SessionsController < ApplicationController

    #ログイン時のみセッション検証アクションをスキップ
    skip_before_action :session_timeout, only: [:new, :create]

    def new
        #既にログイン済の場合在庫一覧画面へ
        if session[:login_id]
            redirect_to items_path
            return
        end
        
        @user = User.new
        render("sessions/new")
    end

    def create
        @user = User.find_by(
            login_id: params[:login_id],
            password: params[:password])
        
        if @user != nil
            session[:login_id] = @user.login_id
            session[:first_name] = @user.first_name
            session[:last_name] = @user.last_name
            redirect_to items_path
        else
            redirect_to request.referer, alert: "ログインIDかパスワードが間違っています。"
        end
    end


    private
    #フォームから受け取るパラメータ
    def item_params
        params.require(:user).permit(:login_id, :password)
    end
    #ユーザ情報が見つからない場合のリダイレクトとalertメッセージ
    def record_not_found
        redirect_to request.referer, alert: "ログインIDかパスワードが間違っています。"
    end
end