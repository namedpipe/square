require 'spec_helper'

describe Square::Connect::Connections::Items do
  let(:access_token) { 'access_token' }
  let(:me) { Square::Connect::Merchant.me access_token }

  describe '#items' do
    it 'should return an array of Square::Connect::Items' do
      items = mock_request 'me/items', 'items/list' do
        me.items
      end
      expect(items).to be_a Array
      expect(items).to_not be_blank
      items.each do |item|
        expect(item).to be_a Square::Connect::Item
      end
    end
  end
end