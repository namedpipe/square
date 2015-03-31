require 'spec_helper'

describe Square::Connect::Connections::Payments do
  let(:access_token) { 'access_token' }
  let(:me) { Square::Connect::Merchant.me access_token }

  describe '#payments' do
    it 'should return an array of Square::Connect::Payment' do
      payments = mock_request 'me/payments', 'payments/list' do
        me.payments
      end
      expect(payments).to be_a Array
      expect(payments).to_not be_blank
      payments.each do |payment|
        expect(payment).to be_a Square::Connect::Payment
      end
    end
  end
end