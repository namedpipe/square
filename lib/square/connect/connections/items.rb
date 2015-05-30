module Square
  module Connect
    module Connections
      module Items
        def items(params = nil)
          access_token_required!
          items = handle_response do
            access_token.get endpoint_for(identifier, :items), params
          end
          items.collect do |item|
            Item.new item.merge(
              access_token: access_token
            )
          end
        end

        def item(item_id, params = nil)
          access_token_required!
          Item.new(
            item_id,
            merchant_id: identifier,
            access_token: access_token
          ).fetch
        end

        def create_item(item_attributes={})
          symbol_hash = ActiveSupport::HashWithIndifferentAccess.new item_attributes
          access_token_required!
          Item.new(
            symbol_hash.merge(access_token: access_token, merchant_id: identifier)
          ).create
        end

        def apply_fee_to_item(item_id, fee_id)
          access_token_required!
          item = Item.new(
            item_id,
            merchant_id: identifier,
            access_token: access_token
          ).fetch
          fee = Fee.new(
            fee_id,
            merchant_id: identifier,
            access_token: access_token
          ).fetch
          if fee && item
            item.endpoint = item.endpoint + "/fees/" + fee_id
            item.update
          else
            return false
          end
        end

      end
    end
  end
end