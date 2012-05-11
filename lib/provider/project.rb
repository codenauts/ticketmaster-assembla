module TicketMaster::Provider
  module Assembla
    # Project class for ticketmaster-assembla
    #
    #
    class Project < TicketMaster::Provider::Base::Project
      def initialize(*object) 
        if object.first
          object = object.first
          unless object.is_a? Hash
            hash = {:id => object.id,
                    :name => object.name,
                    :description => object.description,
                    :created_at => object.created_at,
                    :updated_at => object.updated_at}

          else
            hash = object
          end
          super hash
        end
      end

      def self.all
        AssemblaAPI::Project.find(:all).collect { |prj| Project.new(prj) }
      end

      # declare needed overloaded methods here
      def name
        self[:name]
      end

      def created_at
        begin
          Time.parse(self[:created_at])
        rescue
          self[:created_at]
        end
      end
      
      def updated_at
        begin
          Time.parse(self[:updated_at])
        rescue
          self[:updated_at]
        end
      end
    
      def tickets(*options)
        begin
          if options.first.is_a? Hash
            #options[0].merge!(:params => {:id => id})
            super(*options)
          elsif options.empty?
            tickets = AssemblaAPI::Ticket.find(:all, :params => {:space_id => id}).collect { |ticket| TicketMaster::Provider::Assembla::Ticket.new ticket }
          else
            super(*options)
          end
        rescue
          []
        end
      end

      def ticket!(*options)
        options[0].merge!(:space_id => id) if options.first.is_a?(Hash)
        provider_parent(self.class)::Ticket.create(*options)
      end

      # copy from this.copy(that) copies that into this
      def copy(project)
        project.tickets.each do |ticket|
          copy_ticket = self.ticket!(:title => ticket.title, :description => ticket.description)
          ticket.comments.each do |comment|
            copy_ticket.comment!(:body => comment.body)
            sleep 1
          end
        end
      end

    end
  end
end


