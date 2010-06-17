module TicketNetwork::Catalog
  class PerformerRank < Base
    class Parser
      include ParseHelper

      class PerformerRank
        include ParseHelper

        element :id, :as => :performer_id
        element :percent
      end

      elements :performer_percent, :as => :ranks, :class => PerformerRank
    end

    get :get_high_sales_performers, :as => :fetch do
      parameter :child_category_id
      parameter :grandchild_category_id
      parameter :num_returned, :default => 50_000
      parameter :parent_category_id
    end

    class << self
      def all(parameters={})
        fetch(parameters).ranks
      end
    end
  end
end
