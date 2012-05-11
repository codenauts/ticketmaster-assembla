require 'rubygems'
require 'active_support'
require 'active_resource'

# This library is a small wrapper around the REST interface.  

module AssemblaAPI
  class Error < StandardError; end
  class << self

    # Sets up basic authentication credentials for all the resources.
    def authenticate(username, password, site)
      @username = username
      @password = password
      @site = site

      self::Base.user = username
      self::Base.password = password

      AssemblaAPI::Project.site = @site + '/spaces/my_spaces'
      AssemblaAPI::Ticket.site = @site + '/spaces/:space_id/'
      AssemblaAPI::Comment.site = @site + '/spaces/:space_id/tickets/:ticket_number'
    end

    def resources
      @resources ||= []
    end

    def site
      @site
    end
  end
  
  class Base < ActiveResource::Base
    def self.inherited(base)
      AssemblaAPI.resources << base
      super
    end
  end

  class Project < Base
    self.format = ActiveResource::Formats::XmlFormat
  end

  class Ticket < Base
    self.format = ActiveResource::Formats::XmlFormat
  end

  class Comment < Base
    self.format = ActiveResource::Formats::XmlFormat
  end

end
