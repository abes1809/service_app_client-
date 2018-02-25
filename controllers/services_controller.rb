module ServicesController 

  def services_index_action 
    services_hashs = Unirest.get("http://localhost:3000/services").body
    
    services = []

    services_hashs.each do |service_hash|
      services << Service.new(service_hash)
    end 

    services_index_view(services)

  end 

  def law_services_create_action

    service_params = services_create_view

    response = Unirest.post("http://localhost:3000/law_services", parameters: service_params).body

    if response.code == 200
      service = Service.new(response.body)
      services_show_view(service)
    elsif response.code == 422
      errors = repsonse.body["errors"]
      # products_errors_view(errors)
    elsif response.code == 401
      puts JSON.pretty_generate(response.body)
    end 
  end 

  def mental_health_services_create_action

    service_params = services_create_view

    response = Unirest.post("http://localhost:3000/mental_health_services", parameters: service_params).body

    if response.code == 200
      service = Service.new(response.body)
      services_show_view(service)
    elsif response.code == 422
      errors = repsonse.body["errors"]
      # products_errors_view(errors)
    elsif response.code == 401
      puts JSON.pretty_generate(response.body)
    end 
  end 

  def shelters_create_action

    service_params = services_create_view

    response = Unirest.post("http://localhost:3000/shelters", parameters: service_params).body

    if response.code == 200
      service = Service.new(response.body)
      services_show_view(service)
    elsif response.code == 422
      errors = repsonse.body["errors"]
      # products_errors_view(errors)
    elsif response.code == 401
      puts JSON.pretty_generate(response.body)
    end 
  end 

  def services_update_action

    puts "What type of service would you like to create?"
    puts "     [1] Law Service"
    puts "     [2] Mental Health Service"
    puts "     [3] Shelter Service"

    service_type = gets.chomp 

    if service_type == "1"

      print "Enter service ID: "
      input_id = gets.chomp 

      service_hash = Unirest.get("http://localhost:3000/law_services/#{input_id}").body
      service = Service.new(service_hash)

      service_params = services_update_view(service)

      response = Unirest.patch("http://localhost:3000/law_services/#{input_id}", parameters: service_params)

    elsif service_type == "2"

      print "Enter service ID: "
      input_id = gets.chomp 

      service_hash = Unirest.get("http://localhost:3000/mental_health_services/#{input_id}").body
      service = Service.new(service_hash)

      service_params = services_update_view(service)

      response = Unirest.patch("http://localhost:3000/mental_health_services/#{input_id}", parameters: service_params)

    elsif service_type == "3"

      print "Enter service ID: "
      input_id = gets.chomp 

      service_hash = Unirest.get("http://localhost:3000/shelters/#{input_id}").body
      service = Service.new(service_hash)

      service_params = services_update_view(service)

      response = Unirest.patch("http://localhost:3000/shelters/#{input_id}", parameters: service_params)
      
    end 

    if response.code == 200
      service = Service.new(response.body)
      services_show_view(service)
    elsif response.code == 422
      errors = repsonse.body["errors"]
      # products_errors_view(errors)
    elsif response.code == 401
      puts JSON.pretty_generate(response.body)
    end 

  end 

  def services_delete_action

    puts "What type of service would you like to create?"
    puts "     [1] Law Service"
    puts "     [2] Mental Health Service"
    puts "     [3] Shelter Service"

    service_type = gets.chomp 

    if service_type == "1"

    print "Enter service ID: "
    input_id = gets.chomp 

    response = Unirest.delete("http://localhost:3000/law_services/#{input_id}").body

    elsif service_type == "2"
      print "Enter service ID: "
      input_id = gets.chomp 

      response = Unirest.delete("http://localhost:3000/mental_health_services/#{input_id}").body
   
    elsif service_type == "3"
      print "Enter service ID: "
      input_id = gets.chomp 

      response = Unirest.delete("http://localhost:3000/shelters/#{input_id}").body
    end   

    puts response["message"]

  end 


end 



