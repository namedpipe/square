require 'rack/oauth2'
require 'active_support'
require 'active_support/hash_with_indifferent_access'

module Square
end

require 'active_support_extensions/hash_with_indifferent_access'

ActiveSupport::HashWithIndifferentAccess.send(:include, ActiveSupportExtensions::HashWithIndifferentAccess::ToJson)

require 'square/exception'
require 'square/oauth2'
require 'square/connect'
