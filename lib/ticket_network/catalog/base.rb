module TicketNetwork::Catalog
  class Base < TicketNetwork::Base
    service :catalog
  end

  ParseHelper = TicketNetwork::ParseHelper
end
