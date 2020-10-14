require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '購入者情報の保存' do
    before do
      @purchase_order = FactoryBot.build(:purchase_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
    end
    it 'postalが空だと保存できないこと' do
    end
    it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    end
    it 'shipiing_area_idを選択していないと保存できないこと' do
    end
    it 'buildingは空でも保存できること' do
    end
  end
end