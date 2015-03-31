require 'spec_helper'

describe Square::Connect::Item do
  let(:klass) { Square::Connect::Item }
  let(:identifier) { 'item_1' }
  let(:merchant_id) { 'merchant_id' }
  let(:creator_id) { 'creator_id' }
  let(:access_token) { 'access_token' }

  describe '#initialize' do
    describe 'merchant' do
      context 'when merchant_id given' do
        subject { klass.new identifier, merchant_id: merchant_id }
        its(:merchant) { is_expected.to be_a Square::Connect::Merchant }
        its(:endpoint) { is_expected.to be == File.join(Square::Connect::ROOT_URL, "#{merchant_id}/items/#{identifier}") }
      end

      context 'otherwise' do
        subject { klass.new identifier }
        its(:merchant) { is_expected.to be_a Square::Connect::Merchant }
        its(:endpoint) { is_expected.to be == File.join(Square::Connect::ROOT_URL, "me/items/#{identifier}") }
      end
    end

    describe 'creator' do
      context 'when creator_id given' do
        subject { klass.new identifier, creator_id: creator_id }
        its(:creator) { is_expected.to be_a Square::Connect::Merchant }
      end

      context 'otherwise' do
        subject { klass.new identifier }
        its(:creator) { is_expected.to be_nil }
      end
    end
  end

  describe '#fetch' do
    let(:instance) { klass.new identifier, access_token }
    it "should be a item" do
      fetched = mock_request instance.endpoint, 'items/single' do
        instance.fetch
      end
      is_expected.to be_a klass
    end
  end
end