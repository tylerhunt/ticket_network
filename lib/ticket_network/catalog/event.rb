module TicketNetwork::Catalog
  class Event < Base
    class Parser
      include ParseHelper

      class Event
        include ParseHelper

        element :child_category_id
        element :city
        element :clicks
        element :date
        element :display_date
        element :grandchild_category_id
        element :id
        element :is_womens_event
        element :map_url
        element :name
        element :parent_category_id
        element :state_province
        element :state_province_id
        element :venue
        element :venue_configuration_id
        element :venue_id
      end

      elements :event, :as => :events, :class => Event
    end

    get :get_events, :as => :fetch do
      parameter :begin_date
      parameter :child_category_id
      parameter :city_zip, :as => :locality_postal_code
      parameter :end_date
      parameter :event_date
      parameter :event_id
      parameter :event_name
      parameter :grandchild_category_id
      parameter :high_price
      parameter :low_price
      parameter :modification_date
      parameter :near_zip, :as => :near_postal_code
      parameter :no_performers
      parameter :number_of_events, :as => :limit, :default => 100_000
      parameter :only_mine
      parameter :order_by_clause, :as => :order
      parameter :parent_category_id
      parameter :performer_id
      parameter :performer_name
      parameter :state_id
      parameter :state_prov_desc, :as => :region
      parameter :venue_id
      parameter :venue_name
      parameter :where_clause, :as => :where
    end

    class << self
      def all(parameters={})
        fetch(parameters).events
      end
    end
  end
end
