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

      def attributes
        {sku: sku,
          name: name,
          pricing_type: pricing_type,
          price_money: price_money.is_a?(Hash) ? price_money : price_money.attributes}
      end
    end
  end
end