module Square
  module Connect
    class Category < Node
      attr_accessor(
        :merchant,
        :id,
        :name
      )

      def initialize(*args)
        super do |attributes|
          self.merchant = if attributes[:merchant_id]
            Merchant.new attributes[:merchant_id], access_token
          else
            Merchant.me access_token
          end
          self.id = attributes[:id]
          self.name = attributes[:name]
        end
      end
    end
  end
end