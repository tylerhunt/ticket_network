module TicketNetwork::Catalog
  class Venue < Base
    class Parser
      include ParseHelper

      class Venue
        include ParseHelper

        element :box_office_phone
        element :capacity
        element :child_rules
        element :city, :as => :locality
        element :country, :as => :country_name
        element :directions
        element :id
        element :name
        element :notes
        element :number_of_configurations
        element :parking
        element :public_transportation
        element :rules
        element :state_province, :as => :region
        element :street1, :as => :street_address
        element :street2, :as => :extended_address
        element :url
        element :will_call
        element :zip_code, :as => :postal_code
      end

      elements :venue, :as => :venues, :class => Venue
    end

    get :get_venue, :as => :fetch do
      parameter :venue_id
    end

    class << self
      def all(parameters={})
        fetch(parameters).venues
      end
    end
  end
end
