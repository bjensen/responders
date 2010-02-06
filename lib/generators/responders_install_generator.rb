class RespondersInstallGenerator < Rails::Generators::Base
  desc "Creates an initializer with default responder configuration"

  def create_responder_initializer
    create_file "config/initializers/responders.rb", <<-FILE
class #{Rails.application.class.name}Responder
  include FlashResponder
  include HttpCacheResponder
end

ApplicationController.respond_to :html
ApplicationController.responder = #{Rails.application.class.name}Responder
    FILE
  end
end