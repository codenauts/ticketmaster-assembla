module TicketMaster::Provider
  # This is the Assembla Provider for ticketmaster
  module Assembla
    include TicketMaster::Provider::Base
    TICKET_API = Assembla::Ticket # The class to access the api's tickets
    PROJECT_API = Assembla::Project # The class to access the api's projects
    
    # This is for cases when you want to instantiate using TicketMaster::Provider::Assembla.new(auth)
    def self.new(auth = {})
      TicketMaster.new(:assembla, auth)
    end
    
    # Providers must define an authorize method. This is used to initialize and set authentication
    # parameters to access the API
    def authorize(auth = {})
      @authentication ||= TicketMaster::Authenticator.new(auth)
      # Set authentication parameters for whatever you're using to access the API
      auth = @authentication
      if auth.username.blank? and auth.password.blank?
        raise "Please provide login and password"
      elsif auth.site.blank?
        raise "Please provide site url"
      end
      ::AssemblaAPI.authenticate(auth.username, auth.password, auth.site)
    end
    
    # declare needed overloaded methods here
    def projects(*options)
      Project.all
    end    
  end
end
