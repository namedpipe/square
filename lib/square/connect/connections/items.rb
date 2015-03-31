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
      end
    end
  end
end