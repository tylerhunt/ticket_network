module TicketNetwork::Catalog
  class Performance < Base
    class Parser
      include ParseHelper

      class Performer
        include ParseHelper

        element :event_id
        element :performer_id, :as => :id
        element :performer_name, :as => :name
      end

      elements :event_performer, :as => :performers, :class => Performer
    end

    get :get_event_performers, :as => :fetch

    class << self
      def all(parameters={})
        fetch(parameters).performers
      end
    end
  end
end
