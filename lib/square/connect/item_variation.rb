module Square
  module Connect
    class ItemVariation
      attr_accessor(
        :name,
        :pricing_type,
        :price_money,
        :sku
      )

      def initialize(attributes = {})
        self.name = attributes[:name]
        self.pricing_type = attributes[:pricing_type]
        self.price_money = attributes[:price_money]
        self.sku = attributes[:sku]
      end
    end
  end
end