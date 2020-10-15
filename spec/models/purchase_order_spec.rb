require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '購入者情報の保存' do
    before do
      @purchase_order = FactoryBot.build(:purchase_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_order).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @purchase_order.building = nil
      expect(@purchase_order).to be_valid
    end
    it 'postalが空だと保存できないこと' do
      @purchase_order.postal = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Postal can't be blank")
    end
    it 'postalが半角のハイフンが必要であること' do
      @purchase_order.postal = '1111111'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
    end
    it 'shipping_area_idが存在しないと保存できない' do
      @purchase_order.shipping_area_id = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Shipping area can't be blank")
    end
    it 'shipping_area_idは---では保存できない' do
      @purchase_order.shipping_area_id = 1
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Shipping area must be other than 1")
    end
    it 'callが空だと保存できないこと' do
      @purchase_order.call = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Call can't be blank")
    end
    it 'callにハイフンが含まれると購入できない' do
      @purchase_order.call = "080-6765-1112"
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Call is invalid")
    end
    it 'callが11ケタ以上であると購入できない' do
      @purchase_order.call = "0001110001112"
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Call is invalid")
    end
    it 'cityが空だと保存できないこと' do
      @purchase_order.city = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @purchase_order.address = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Address can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @purchase_order.token = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end