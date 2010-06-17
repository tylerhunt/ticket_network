module TicketNetwork::Checkout
  class Base < TicketNetwork::Base
    service :checkout
  end

  ParseHelper = TicketNetwork::ParseHelper
end
