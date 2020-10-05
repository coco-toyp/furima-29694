class GoodsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_good, only: [:destroy, :show]

  def index
    @goods = Good.all.order(id: "DESC")
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    if @good.valid?
      @good.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def show
  end

  def destroy
    if good.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def good_params
    params.require(:good).permit(:name, :description, :category_id, :condition_id, :shipping_bill_id, :shipping_area_id, :shipping_date_id, :price, :user, :image).merge(user_id: current_user.id)
  end

  def set_good
    @good = Good.find(params[:id])
  end

end
