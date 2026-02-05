class ItemsController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    #在庫一覧画面
    def index
        @items = Item.all
        render("items/index")
    end

    #商品登録画面
    def new
        @item = Item.new
        render("items/new")
    end

    #商品登録処理
    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to items_path, notice: "登録しました。"
        else
            render :new, status: :unprocessable_entity
        end
    end

    #商品編集画面
    def edit
        @item = Item.find(params[:id])
        render("items/edit")
    end

    #商品情報更新処理
    def update
        @item = Item.new(item_params)
        if @item.save
            redirect_to items_path, notice: "更新しました。"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    #商品削除処理
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to items_path, notice: "削除しました。"
    end

    private
    #フォームから受け取るパラメータ
    def item_params
        params.require(:item).permit(:item_name, :inventory_quantity)
    end

    #商品が見つからない場合のリダイレクトとalertメッセージ
    def item_not_found
        redirect_to items_path, alert: "指定された商品は存在しません"
    end
end