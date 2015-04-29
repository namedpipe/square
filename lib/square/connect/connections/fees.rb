module Square
  module Connect
    module Connections
      module Fees
        def fees(params = nil)
          access_token_required!
          fees = handle_response do
            access_token.get endpoint_for(identifier, :fees), params
          end
          fees.collect do |fee|
            Fee.new fee.merge(
              access_token: access_token
            )
          end
        end

        def fee(fee_id, params = nil)
          access_token_required!
          Fee.new(
            fee_id,
            merchant_id: identifier,
            access_token: access_token
          ).fetch
        end

        def create_fee(item_attributes={})
          symbol_hash = ActiveSupport::HashWithIndifferentAccess.new item_attributes
          access_token_required!          
          Fee.new(
            symbol_hash.merge(access_token: access_token, merchant_id: identifier)
          ).create
        end

      end
    end
  end
end