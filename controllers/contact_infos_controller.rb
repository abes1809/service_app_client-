module ContactInfosController 

  def contact_infos_index_action 
    contact_infos_hashs = Unirest.get("http://localhost:3000/contact_infos").body
    
    contact_infos = []

    contact_infos_hashs.each do |contact_info_hash|
      contact_infos << ContactInfo.new(contact_info_hash)
    end 

    contact_infos

  end 

  def user_contact_infos_create_action

    contact_params = user_contact_infos_create_view

    # Unirest.post("http://localhost:3000/contact_infos", parameters: contact_params)

  end 

  def service_contact_infos_create_action

    contact_params = service_contact_infos_create_view

    Unirest.post("http://localhost:3000/contact_infos", parameters: contact_params)

  end 

  def contact_infos_last_id 

    contact_infos = contact_infos_index_action

    contact_info_ids = contact_infos.last

    contact_info_last_id = contact_info_ids.id

    contact_info_last_id 

  end 



end 