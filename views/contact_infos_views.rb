module ContactInfosViews

  def user_contact_infos_create_view 
    contact_params = {}

    print "Email: "
    contact_params[:email] = gets.chomp 

    print "What is the best phone number to reach you at?: "
    contact_params[:phone_number] = gets.chomp

    print "Are you currently experience homelessness? (please type y for yes or n for no): "
    homelessness_answer = gets.chomp
      
    if homelessness_answer == "y" 
         print "What is the date you started experiencing homelessness (if you are unsure simply put your best guess): "
         contact_params[:homeless_date] = gets.chomp 
    else 
         print "What is your current address?: "
         contact_params[:address] = gets.chomp 
    end 

    print "What state do you live in?: "
    contact_params[:state] = gets.chomp 

    print "What is your Zipcode?: "
    contact_params[:zip] = gets.chomp 

    contact_params
    
  end 

  def service_contact_infos_create_view

    contact_params = {}

    print "Email: "
    contact_params[:email] = gets.chomp

    print "Phone Number: "
    contact_params[:phone_number] = gets.chomp

    print "Address: "
    contact_params[:address] = gets.chomp 

    print "City: "
    contact_params[:city] = gets.chomp 

    print "State: "
    contact_params[:state] = gets.chomp

    print "Zip Code: "
    contact_params[:zip] = gets.chomp

    puts "Prefered Method of Communication: "
    puts "  [1] email"
    puts "  [2] phone"
    puts "  [3] in person"
    contact_params[:prefered_contact_method] = gets.chomp

    contact_params

  end 

  def service_contact_infos_update_form 

    contact_params = {}

    print "Email: (#{service.email})"
    contact_params[:email] = gets.chomp

    print "Phone Number: (#{service.phone_number})"
    contact_params[:phone_number] = gets.chomp

    print "Address: (#{service.address})"
    contact_params[:address] = gets.chomp 

    print "City: (#{service.city})"
    contact_params[:city] = gets.chomp 

    print "State: (#{service.state})"
    contact_params[:state] = gets.chomp

    print "Zip Code: (#{service.zip})"
    contact_params[:zip] = gets.chomp

    puts "Prefered Method of Communication: (#{service.prefered_contact_method})"
    puts "  [1] email"
    puts "  [2] phone"
    puts "  [3] in person"
    contact_params[:prefered_contact_method] = gets.chomp

    contact_params.delete_if{ |key, value| value.empty?}
    contact_params

  end 

end 