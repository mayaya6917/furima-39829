require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_address).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_shipping_address.post_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping_address.post_code = '1231234'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post code input correctly")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_shipping_address.prefecture_id = '1'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture select")
      end
      it 'cityが空だと保存できないこと' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'adressesが空だと保存できないこと' do
        @order_shipping_address.adresses = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Adresses can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @order_shipping_address.phone_number = '０３１２３４５６７８'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number input only number")
      end
      it 'phone_numberにハイフンを含むと保存できないこと' do
        @order_shipping_address.phone_number = '03-1234-5678'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number input only number")
      end
      it "tokenが空では登録できないこと" do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it "電話番号が空では購入できないこと" do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が9桁以下では購入できないこと" do
        @order_shipping_address.phone_number = '12345678'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number input only number")
      end
      it "電話番号が12桁以上では購入できないこと" do
        @order_shipping_address.phone_number = '123456789012'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number input only number")
      end
      it "userが紐付いていなければ購入できないこと" do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていなければ購入できないこと" do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end