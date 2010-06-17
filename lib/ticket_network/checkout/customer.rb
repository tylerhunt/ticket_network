module TicketNetwork::Checkout
  class Customer < Base
    class Parser
      include ParseHelper

      element :email
      element :first_name, :as => :given_name
      element :id
      element :last_name, :as => :family_name
      element :notes
      element :password
      element :pin
    end

    get :get_customer_by_id, :as => :fetch do
      parameter :customer_id
    end

    post :write_customer, :as => :store do
      parameter :customer_id, :as => :ticket_network_id
      parameter :first_name, :as => :given_name
      parameter :last_name, :as => :family_name
      parameter :email
      parameter :password
      parameter :notes
    end

    class << self
      def find(customer_id)
        fetch(:customer_id => :customer_id)
      end

      alias_method :create, :store
      alias_method :update, :store
    end
  end
end
