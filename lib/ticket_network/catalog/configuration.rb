module TicketNetwork::Catalog
  class Configuration < Base
    MAP_ROOT = 'http://maps.seatics.com/'.freeze

    class Parser
      include ParseHelper

      class Configuration
        include ParseHelper

        element :capacity
        element :id
        element :map_site
        element :map_url
        element :type_description
        element :type_id
        element :venue_id
      end

      elements :venue_configuration, :as => :venue_configurations, :class => Configuration
    end

    get :get_venue_configurations, :as => :fetch do
      parameter :venue_id
    end

    class << self
      def all(parameters={})
        fetch(parameters).venue_configurations
      end

      def map_url(venue_configuration)
        unless venue_configuration.map_url.blank?
          map_site = venue_configuration.map_site || MAP_ROOT
          map_url = "#{map_site}/#{URI.escape(venue_configuration.map_url)}"
          map_url.gsub!('[', '%5B')
          map_url.gsub!(']', '%5D')
          uri = URI.parse(map_url)
          uri.path.gsub!(/\/\//, '/')
          uri.to_s
        end
      end
      private :find_map
    end
  end
end
