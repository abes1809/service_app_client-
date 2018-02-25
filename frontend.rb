require 'unirest'

require_relative 'views/services_views'
require_relative 'controllers/services_controller'
require_relative 'models/service'
require_relative 'views/users_views'
require_relative 'controllers/users_controller'
require_relative 'views/contact_infos_views'
require_relative 'models/contact_info'
require_relative 'controllers/contact_infos_controller'


class Frontend 

  include ServicesViews
  include ServicesController
  include UsersViews
  include UsersController
  include ContactInfosViews
  include ContactInfosController

  def run 
    while true 
      system 'clear'

      puts
      puts "Welcome to Service Connect! What type(s) of support are you seeking?"

      puts "[1] Show all services"
      puts "[2] Shelters"
      puts "[3] Mental Health Services"
      puts "[4] Law Services"
      puts
      puts "__________________________________"

      puts
      puts "[5] Create a new service"
      puts "[6] Update a service"
      puts "[7] Delete a Service"

      puts "__________________________________"

      puts
      puts "[s] Sign Up"
      puts "[l] Login"
      puts "[o] Logout"
      puts
      puts
      puts "[q] Quit"
      puts
      puts "-" * 60

      input_option = gets.chomp 

      if input_option == "1"

        services_index_action

      elsif input_option == "2"
        basic_survey 

      elsif input_option == "3"
        basic_survey

      elsif input_option == "4"
        basic_survey

      elsif input_option == "5"

        puts "What type of service would you like to create?"
        puts "     [1] Law Service"
        puts "     [2] Mental Health Service"
        puts "     [3] Shelter Service"

        service_type = gets.chomp 

        if service_type == "1"

          law_services_create_action

        elsif service_type == "2"

          mental_health_services_create_action

        elsif service_type == "3"

          shelters_create_action

        end 

      elsif input_option == "6"

       services_update_action

      elsif input_option == "7"

        services_delete_action

      elsif input_option == "s"

        users_create_action

      elsif input_option == "l"

        users_login_action

      elsif input_option == "o" 

        users_logout_action 

      elsif input_option == "q"
        puts "Thank you for visting this site!"
        exit

      end
      puts
      puts "Hit enter to continue"
      gets.chomp 
    end 
  end 
end 

