module TicketNetwork::Checkout
  class Order < Base
    class Parser
      include ParseHelper

      element :confirmation_email_text
      element :request_id, :as => :id
      element :sale_total, :as => :total
    end

    post :create_request, :as => :store do
      parameter :customer_id
      parameter :credit_card_id
      parameter :billing_address_id
      parameter :credit_card_security_code, :as => :security_code
      parameter :ticket_group_id, :as => :ticket_id
      parameter :ticket_quantity, :as => :quantity
      parameter :shipping_method_id
      parameter :special_instructions, :as => :notes
      parameter :promo_code
      parameter :accept_alternate, :as => :alternate_acceptable
      parameter :referral_source_id
      parameter :referral_source_details
      parameter :ppcsrc
      parameter :override_price
      parameter :customer_ip_address
    end

    class << self
      alias_method :create, :store
    end
  end
end
