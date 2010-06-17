module TicketNetwork::Checkout
  class Address < Base
    class Parser
      include ParseHelper

      class Address
        include ParseHelper

        element :city, :as => :locality
        element :contact_name, :as => :name
        element :country_description, :as => :country
        element :country_id
        element :id
        element :state_province, :as => :region
        element :street1, :as => :street_address
        element :street2, :as => :extended_address
        element :type_description, :as => :type
        element :type_id
        element :zip_code, :as => :postal_code
      end

      elements :address, :as => :addresses, :class => Address
    end

    get :get_address, :as => :fetch do
      parameter :address_id, :as => :id
      parameter :customer_id
      parameter :address_type_id, :as => :type_id
    end

    post :write_address, :as => :store, :parser => Parser::Address do
      parameter :address_type_id, :as => :type_id
      parameter :city, :as => :locality
      parameter :contact_name, :as => :name
      parameter :country
      parameter :country_id
      parameter :customer_id
      parameter :state_prov_abbr, :as => :region
      parameter :street1, :as => :street_address
      parameter :street2, :as => :extended_address
      parameter :zip_code, :as => :postal_code
    end

    class << self
      def all(parameters={})
        fetch(parameters).addresses
      end

      alias_method :create, :store
      alias_method :update, :store
    end
  end
end
