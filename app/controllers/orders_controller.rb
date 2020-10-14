class OrdersController < ApplicationController
  before_action :set_good

  def index
    @purchase_order = PurchaseOrder.new
  end

  def create
    @purchase_order = PurchaseOrder.new(order_params)
    if @purchase_order.valid?
      Payjp.api_key = "sk_test_9261f0d617a10d4f90d76b1d"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @good.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def set_good
    @good = Good.find(params[:good_id])
  end

  def order_params
    params.permit(:postal, :shipping_area_id, :city, :address, :building, :call, :token).merge(good_id: @good.id, user_id: current_user.id)
  end


end
