module UsersController

  def users_create_action
    client_params = users_create_view

    contact_params = user_contact_infos_create_action

    new_contact_info_id = contact_infos_last_id

    client_params[:contact_info_id] = new_contact_info_id
    client_params[:homeless_date] = contact_params[:homeless_date]

    response = Unirest.post("http://localhost:3000/users", parameters: client_params)

    puts JSON.pretty_generate(response.body)

  end

  def users_updates_action



  end 

  def users_login_action 
    puts "Login"
    puts
    puts "Email: "
    input_email = gets.chomp 

    print "Password: "
    input_password = gets.chomp

    response = Unirest.post(
                            "http://localhost:3000/user_token",
                            parameters: {
                                          auth: {
                                                  email: input_email,
                                                  password: input_password
                                                 }
                                        }
                            )
    puts JSON.pretty_generate(response.body)
    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")

  end 

  def users_logout_action
    jwt = ""
    Unirest.clear_default_headers 

  end 

end