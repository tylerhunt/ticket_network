module TicketNetwork::Checkout
  class CreditCard < Base
    class Parser
      include ParseHelper

      class CreditCard
        include ParseHelper

        element :expires_month, :as => :expiration_month
        element :expires_year, :as => :expiration_year
        element :id
        element :masked_number
        element :name_displayed, :as => :name
        element :type_description
        element :type_id
      end

      elements :credit_card, :as => :credit_cards
    end

    get :get_credit_card, :as => :fetch do
      parameter :credit_card_id
      parameter :credit_card_type_id
      parameter :customer_id
    end

    post :write_credit_card, :as => :store, :parser => Parser::CreditCard do
      parameter :billing_address_id, :as => :address_id
      parameter :billing_phone_id, :as => :phone_number_id
      parameter :customer_id
      parameter :expires_month, :as => :expiration_month
      parameter :expires_year, :as => :expiration_year
      parameter :name_displayed, :as => :name
      parameter :number
    end

    class << self
      def all(parameters={})
        fetch(parameters).credit_cards
      end

      alias_method :create, :store
      alias_method :update, :store
    end
  end
end
