module TicketNetwork::Catalog
  class Ticket < Base
    PARKING_REGEX = /park/i.freeze

    class Parser
      include ParseHelper

      class Ticket
        class Split
          include ParseHelper

          elements :int, :as => :ints
        end

        include ParseHelper

        element :actual_price
        element :event_id
        element :face_price
        element :high_seat
        element :id
        element :is_mine
        element :low_seat
        element :marked
        element :notes
        element :parent_category_id
        element :rating
        element :rating_description
        element :retail_price
        element :row
        element :section
        element :ticket_quantity
        element :wholesale_price

        elements :valid_splits, :as => :splits, :class => Split
      end

      elements :ticket_group, :as => :tickets, :class => Ticket
    end

    get :get_tickets, :as => :fetch do
      parameter :event_id
      parameter :high_price
      parameter :low_price
      parameter :number_of_records, :as => :limit
      parameter :order_by_clause, :as => :order
      parameter :requested_tix_split, :as => :requested_split
      parameter :ticket_group_id, :as => :ticket_id
      parameter :where_clause, :as => :where
    end

    class << self
      def all(parameters={})
        fetch(parameters).tickets
      end

      def raw(parameters={})
        all(parameters).collect do |ticket|
          parking = parking?(ticket)

          {
            :ticket_network_id => ticket.id.to_i,
            :price => ticket.actual_price.to_f,
            :quantity => ticket.ticket_quantity.to_i,
            :section => ticket.section.to_s.gsub(/\//, ' / '),
            :row => ticket.row,
            :notes => ticket.notes,
            :splits => find_splits(ticket),
            :general_admission => false,
            :is_mine => ticket.is_mine == 'true',
            :parking_pass => !!parking,
            :lot => parking ? find_lot(ticket) : nil
          }
        end
      end

      def parking?(ticket)
        ticket.section =~ PARKING_REGEX || ticket.row =~ PARKING_REGEX
      end
      private :parking?

      def find_splits(ticket)
        ticket.splits.first.ints.collect(&:to_i).sort
      end
      private :find_splits

      def find_lot(parking_pass)
        if !parking_pass.section.blank? && parking_pass.section !~ PARKING_REGEX
          parking_pass.section
        elsif !parking_pass.row.blank? && parking_pass.row !~ PARKING_REGEX
          parking_pass.row
        end
      end
      private :find_lot
    end
  end
end
