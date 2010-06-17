module TicketNetwork::Catalog
  class Performer < Base
    class Parser
      include ParseHelper

      class Performer
        include ParseHelper

        element :id
        element :description, :as => :name
        element :home_venue_id, :as => :venue_id
      end

      elements :performer, :as => :performers, :class => Performer
    end

    get :get_performer_by_category, :as => :fetch do
      parameter :parent_category_id
      parameter :child_category_id
      parameter :grandchild_category_id
      parameter :has_event, :default => false
    end

    class << self
      def all(parameters={})
        fetch(parameters).performers
      end
    end
  end
end
