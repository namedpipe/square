module Square
  module Connect
    module Connections
      module Categories
        def categories(params = nil)
          access_token_required!
          categories = handle_response do
            access_token.get endpoint_for(identifier, :categories), params
          end
          categories.collect do |category|
            Category.new category.merge(
              access_token: access_token
            )
          end
        end

        def category(category_id, params = nil)
          access_token_required!
          Category.new(
            category_id,
            merchant_id: identifier,
            access_token: access_token
          ).fetch
        end
      end
    end
  end
end