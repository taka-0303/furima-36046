require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: :item)
  end

  describe '購入情報登録' do
    context '購入情報登録できる場合' do
      it '全ての項目が埋まっていれば登録できる' do
        expect(@purchase_shipping).to be_valid
      end

      it '建物名が空でも登録できる' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '購入情報登録できない場合' do
      it 'tokenが空では登録できない' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号がないと登録できない' do
        @purchase_shipping.postal_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと登録できない' do
        @purchase_shipping.postal_code = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県がないと登録できない' do
        @purchase_shipping.area_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Area can't be blank")
      end

      it '都道府県に「---」が選択されている場合は登録できない' do
        @purchase_shipping.area_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Area must be other than 1")
      end

      it '市町村がないと登録できない' do
        @purchase_shipping.municipalities = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地がないと登録できない' do
        @purchase_shipping.address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号がないと登録できない' do
        @purchase_shipping.telephone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号にハイフンがあると登録できない' do
        @purchase_shipping.telephone_number = '090-1234-5678'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number is invalid. Do not include hyphens (-)")
      end
    end
  end
end

