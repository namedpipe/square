module ActiveSupportExtensions
  module HashWithIndifferentAccess
    module ToJson
      def to_json(*args, &block)
        to_hash.to_json(*args, &block)
      end
    end
  end
end

