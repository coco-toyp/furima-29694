require 'rails_helper'


describe Good do
  before do
    @good = FactoryBot.build(:good)
  end
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "name,description,category_id,condition_id,shipping_bill_id,shipping_area_id,shipping_date_id,price,imageが存在すれば出品できる" do
        expect(@good).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it 'nameが存在しないと保存できない' do
        @good.name = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが存在しないと保存できない' do
        @good.description = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが存在しないと保存できない' do
        @good.category_id = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが存在しないと保存できない' do
        @good.condition_id = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_bill_idが存在しないと保存できない' do
        @good.shipping_bill_id = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Shipping bill can't be blank")
      end
      it 'shipping_area_idが存在しないと保存できない' do
        @good.shipping_area_id = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_date_idが存在しないと保存できない' do
        @good.shipping_date_id = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'priceが存在しないと保存できない' do
        @good.price = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは300以上でないと保存できない' do
        @good.price = 200
        @good.valid?
        expect(@good.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceは99999999以下でないと保存できない' do
        @good.price = 1000000000000
        @good.valid?
        expect(@good.errors.full_messages).to include("Price must be less than or equal to 99999999")
      end
 
      it 'imageが存在しないと保存できない' do
        @good.image = nil
        @good.valid?
      end
      it 'userが紐付いていないと保存できないこと' do
        @good.user = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("User must exist")
      end
    end
  end
end
