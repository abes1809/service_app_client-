module ServicesController 

  def services_index_action 
    services_hashs = Unirest.get("http://localhost:3000/services").body
    
    services = []

    services_hashs.each do |service_hash|
      services << Service.new(service_hash)
    end 

    services_index_view(services)

  end 

  def services_create_action

    service_params = services_create_view

    service_contact_infos_create_action 

    new_contact_info_id = contact_infos_last_id

    service_params[:contact_info_id] = new_contact_info_id

    response = Unirest.post("http://localhost:3000/services", parameters: service_params)

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

    print "Enter category of service you want to delete (enter law, mental health, or shelter): "
    category = gets.chomp

    print "Enter service ID: "
    input_id = gets.chomp 

    service_hash = Unirest.get("http://localhost:3000/services/#{category}/#{input_id}").body
    service = Service.new(service_hash)

    service_params = services_update_view(service)
    # contact_params = service_contact_infos_update_form 

    response = Unirest.patch("http://localhost:3000/services/#{category}/#{input_id}", parameters: service_params)

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

    print "Enter category of service you want to delete (enter law, mental health, or shelter): "
    category = gets.chomp

    print "Enter service ID: "
    input_id = gets.chomp 

    service_hash = Unirest.get("http://localhost:3000/services/#{category}/#{input_id}").body
    service = Service.new(service_hash)
    contact_info_id = service.contact_info_id

    response = Unirest.delete("http://localhost:3000/services/#{category}/#{input_id}").body
    Unirest.delete("http://localhost:3000/contact_infos/#{contact_info_id}")

    puts response["message"]

  end 

end 