module TicketNetwork::Checkout
  class PhoneNumber < Base
    class Parser
      include ParseHelper

      class PhoneNumber
        include ParseHelper

        element :display_order, :as => :order
        element :id
        element :number
        element :type_description
        element :type_id
      end

      elements :phone, :as => :phone_numbers, :class => PhoneNumber
    end

    get :get_phone, :as => :fetch do
      parameter :customer_id
      parameter :phone_id, :as => :id
      parameter :phone_type_id, :as => :type_id
    end

    post :write_phone, :as => :store, :parser => Parser::PhoneNumber do
      parameter :customer_id
      parameter :display_order, :as => :order, :default => 0
      parameter :phone_number, :as => :number
      parameter :phone_type_id, :as => :type_id
    end

    class << self
      def all(parameters={})
        fetch(parameters).phone_numbers
      end

      alias_method :create, :store
      alias_method :update, :store
    end
  end
end
