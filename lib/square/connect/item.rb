module Square
  module Connect
    class Item < Node
      attr_accessor(
        :merchant,
        :creator,
        :created_at,
        :description,
        :name,
        :visibility,
        :category_id,
        :category,
        :variations
      )

      def initialize(*args)
        super do |attributes|
          self.merchant = if attributes[:merchant_id]
            Merchant.new attributes[:merchant_id], access_token
          else
            Merchant.me access_token
          end
          self.created_at = if attributes[:created_at]
            Time.parse attributes[:created_at]
          end
          self.description = attributes[:description]
          self.name = attributes[:name]
          self.visibility = attributes[:visibility]

          self.category = Hash(attributes[:category]) if attributes[:category]
          self.category_id = self.category[:id] if attributes[:category]
          self.category_id = attributes[:category_id] if attributes[:category_id]

          self.variations = Array(attributes[:variations]).collect do |variation_attributes|
            ItemVariation.new variation_attributes
          end
          self.endpoint = endpoint_for merchant.identifier, :items, identifier
        end
      end
    end
  end
end