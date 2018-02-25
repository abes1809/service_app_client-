module ServicesViews

  def services_show_view(service)

    puts
    puts "Service name: #{service.name}"
    puts
    puts "Service specialty: #{service.specialty}"
    puts 
    puts "Service contact information: "
    puts "_____________________________"
    puts 
    puts "Phone number: #{service.phone_number}"
    puts "Email: #{service.email}"
    puts "Address: #{service.address}"
    puts "City: #{service.city}"
    puts "State: #{service.state}"
    puts "Zipcode: #{service.zip}"

  end 

  def services_index_view(services)

    services.each do |service| 
      puts "============================"
      services_show_view(service)
    end 

  end 

  def services_create_view 
    service_params = {}

    puts "Name: "
    service_params[:name] = gets.chomp 

    puts "Service Specialty: "
    service_params[:specialty] = gets.chomp 

    print "Email: "
    service_params[:email] = gets.chomp

    print "Phone Number: "
    service_params[:phone_number] = gets.chomp

    print "Address: "
    service_params[:address] = gets.chomp 

    print "City: "
    service_params[:city] = gets.chomp 

    print "State: "
    service_params[:state] = gets.chomp

    print "Zip Code: "
    service_params[:zip] = gets.chomp

    puts "Prefered Method of Communication: "
    puts "  [1] email"
    puts "  [2] phone"
    puts "  [3] in person"
    service_params[:prefered_contact_method] = gets.chomp

    service_params

  end 

  def services_update_view(service)

    service_params = {}

    puts
    puts
    print "Name (#{service.name}): "
    service_params[:name] = gets.chomp 

    print "Service Specialty (#{service.specialty}): "
    service_params[:specialty] = gets.chomp 

    print "Email (#{service.email}): "
    service_params[:email] = gets.chomp

    print "Phone Number: (#{service.phone_number}): "
    service_params[:phone_number] = gets.chomp

    print "Address (#{service.address}): "
    service_params[:address] = gets.chomp 

    print "City (#{service.city}): "
    service_params[:city] = gets.chomp 

    print "State (#{service.state}): "
    service_params[:state] = gets.chomp

    print "Zip Code (#{service.zip}): "
    service_params[:zip] = gets.chomp

    puts "Prefered Method of Communication: (#{service.prefered_contact_method})"
    puts "  [1] email"
    puts "  [2] phone"
    puts "  [3] in person"
    service_params[:prefered_contact_method] = gets.chomp

    service_params.delete_if{ |key, value| value.empty?}
    service_params

  end 


end 
























