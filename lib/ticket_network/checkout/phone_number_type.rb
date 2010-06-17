module TicketNetwork::Checkout
  class PhoneNumberType < Base
    class Parser
      include ParseHelper

      class PhoneNumberType
        include ParseHelper

        element :id
        element :description, :as => :name
      end

      elements :phone_type, :as => :phone_number_types,
        :class => PhoneNumberType
    end

    get :get_phone_types, :as => :fetch

    class << self
      def all(parameters={})
        fetch(parameters).phone_number_types
      end
    end
  end
end
