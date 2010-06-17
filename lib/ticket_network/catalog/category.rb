module TicketNetwork::Catalog
  class Category < Base
    class Parser
      include ParseHelper

      class Category
        include ParseHelper

        element :child_category_description, :as => :child_name
        element :child_category_id, :as => :child_id
        element :grandchild_category_description, :as => :grandchild_name
        element :grandchild_category_id, :as => :grandchild_id
        element :parent_category_description, :as => :parent_name
        element :parent_category_id, :as => :parent_id
      end

      elements :category, :as => :categories, :class => Category
    end

    get :get_categories_master_list, :as => :fetch

    class << self
      def all(parameters={})
        fetch(parameters).categories
      end

      def sanitize_name(name)
        name = name.titleize
        name.strip!
        name.gsub!(/Div I A/, 'Div I-A')
        name.gsub!(/Div I-Aa/, 'Div I-AA')
        name.gsub!(/ And /, ' and ')
        name
      end
      private :sanitize_name
    end
  end
end
