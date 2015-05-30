module Square
  module Connect
    class Fee < Node
      attr_accessor :name, :calculation_phase, :rate, :adjustment_type, :applies_to_custom_amounts, :type, :id, :inclusion_type, :enabled

      def initialize(*args)
        super do |attributes|
          self.merchant = if attributes[:merchant_id]
            Merchant.new attributes[:merchant_id], access_token
          else
            Merchant.me access_token
          end
          self.name = attributes[:name]
          self.calculation_phase = attributes[:calculation_phase]
          self.rate = attributes[:rate]
          self.adjustment_type = attributes[:adjustment_type]
          self.applies_to_custom_amounts = attributes[:applies_to_custom_amounts]
          self.type = attributes[:type]
          self.inclusion_type = attributes[:inclusion_type]
          self.enabled = attributes[:enabled]
          self.endpoint = endpoint_for merchant.identifier, :fees, identifier
        end
      end
    end
  end
end