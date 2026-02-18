class ApplicationController < ActionController::Base

    #各アクションの実行前にタイムアウトの検証を実行
    before_action :session_timeout

    private
    #セッションタイムアウトの検証
    def session_timeout
        
        #セッションがなければログイン画面へ
        unless session[:login_id]
            redirect_to login_path
            return
        end
        
        #10分以上操作していなければログアウト
        if session[:last_access_time] && session[:last_access_time] < 10.minutes.ago
            #セッションをリセット
            reset_session
            #ログイン画面へ移動
            redirect_to login_path, alert: "一定時間操作がなかったためログアウトしました。"
        else
            #最後に操作した時刻を更新
            session[:last_access_time] = Time.current
        end
    end
end
