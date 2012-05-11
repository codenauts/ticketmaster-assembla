module TicketMaster::Provider
  module Assembla
    # Ticket class for ticketmaster-assembla
    #
    
    class Ticket < TicketMaster::Provider::Base::Ticket
      def initialize(*object)
        if object.first
          object = object.first
          @system_data = {:client => object}
          unless object.is_a? Hash
            hash = {
              :id => object.number,
              :description => object.description,
              :title => object.summary,
              :status => object.status,
              :priority => object.priority
            }
          else
            hash = object
          end
          super hash
        end
      end

      # declare needed overloaded methods here
      def title
        self.summary
      end
      
      def created_at
        begin
          Time.parse(self[:created_on])
        rescue
          self[:created_on]
        end
      end
      
      def updated_at
        begin
          Time.parse(self[:updated_at])
        rescue
          self[:updated_at]
        end
      end
      
      def project_id
        self.prefix_options[:space_id]
      end

      def number
        self[:number]
      end

      def comments(*options)
        begin
          if options.empty?
            comments = AssemblaAPI::Comment.find(:all, :params => {:space_id => project_id, :ticket_number => number}).collect { |comment| TicketMaster::Provider::Assembla::Comment.new comment }
          else
            super(*options)
          end
        rescue
         []
        end
      end

     def self.create(*options)
        ticket = AssemblaAPI::Ticket.new(*options)
        ticket.save
        
        ticketn = self.new ticket
        ticketn
      end

    end
  end
end
