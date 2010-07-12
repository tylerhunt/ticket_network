require 'active_support/core_ext'
require 'patron'
require 'sax-machine'

module TicketNetwork
  ROOT = 'tnwebservices.ticketnetwork.com/TNWebService/v3.1'.freeze
  CATALOG = "http://#{ROOT}/TNWebServiceStringInputs.asmx".freeze
  CHECKOUT = "https://#{ROOT}/TNCheckoutWebServiceStringInputs.asmx".freeze

  Error = Class.new(StandardError)
  AuthorizationError = Class.new(Error)
  ParameterError = Class.new(Error)
  NetworkError = Class.new(Error)

  mattr_accessor :client_id

  autoload :Base,              'ticket_network/base'
  autoload :FormatHelper,      'ticket_network/format_helper'
  autoload :ParseHelper,       'ticket_network/parse_helper'

  module Catalog
    autoload :Base,            'ticket_network/catalog/base'
    autoload :Category,        'ticket_network/catalog/category'
    autoload :Configuration,   'ticket_network/catalog/configuration'
    autoload :Event,           'ticket_network/catalog/event'
    autoload :Performance,     'ticket_network/catalog/performance'
    autoload :Performer,       'ticket_network/catalog/performer'
    autoload :PerformerRank,   'ticket_network/catalog/performer_rank'
    autoload :Ticket,          'ticket_network/catalog/ticket'
    autoload :Venue,           'ticket_network/catalog/venue'
  end

  module Checkout
    autoload :Address,         'ticket_network/checkout/address'
    autoload :AddressType,     'ticket_network/checkout/address_type'
    autoload :Base,            'ticket_network/checkout/base'
    autoload :CreditCard,      'ticket_network/checkout/credit_card'
    autoload :Customer,        'ticket_network/checkout/customer'
    autoload :Order,           'ticket_network/checkout/order'
    autoload :PhoneNumber,     'ticket_network/checkout/phone_number'
    autoload :PhoneNumberType, 'ticket_network/checkout/phone_number_type'
  end
end
