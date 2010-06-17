module TicketNetwork::Checkout
  class AddressType < Base
    class Parser
      include ParseHelper

      class AddressType
        include ParseHelper

        element :id
        element :description, :as => :name
      end

      elements :address_type, :as => :address_types, :class => AddressType
    end

    get :get_address_types, :as => :fetch

    class << self
      def all(parameters={})
        fetch(parameters).address_types
      end
    end
  end
end
