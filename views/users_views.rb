module UsersViews

  def users_create_view 
    client_params = {}

    print "Name: "
    client_params[:name] = gets.chomp 

    # print "Email: "
    # contact_params[:email] = gets.chomp 

    print "Password: "
    client_params[:password] = gets.chomp 

    print "Password Confirmation: "
    client_params[:password_confirmation] = gets.chomp

    puts
    print "Please take a couple minutes to fill out this quick suvery so we can provide you the best matches possible"
    puts
    puts

    print "What is your gender?: "
    answer = gets.chomp

    if answer == "female" || answer == "girl"
        client_params[:gender] = 1 
    elsif answer == "male" || answer == "boy"
        client_params[:gender] = 2
    else 
        client_params[:gender] = 3
    end 

    print "What is your biological sex?: "
    answer = gets.chomp

    if answer == "female" || answer == "girl"
        client_params[:sex] = 1 
    elsif answer == "male" || answer == "boy"
        client_params[:sex] = 2
    end

    print "Are you or a member of your household a survivor of domestic violence?: (please type y for yes or n for no) "
    answer = gets.chomp

    if answer == "y" 
        client_params[:domestic_violence_victim] = 1 
    elsif answer == "n"
        client_params[:domestic_violence_victim] = 2
    end

    print "What is your gross annual income? (Add up everyone in your households income): "
    client_params[:annual_income] = gets.chomp

    client_params

  end 

  def users_login_view

    puts "Login"
    puts
    puts "Email: "
    input_email = gets.chomp 

    print "Password: "
    input_password = gets.chomp

  end 

  # def basic_survey 

  #  survey_params = {}

  #  print "Please take a couple minutes to fill out this quick suvery so we can provide you the best matches possible"

  #   print "What is your gender?: "
  #   survey_params[:gender]

  #   print "What is your biological sex?: "
  #   survey_params[:sex]

  #   print "Are you or a member of your household a survivor of domestic violence?: "
  #   survey_params[:domestic_violence_victim]

  #   print "What is your gross annual income? (Add up everyone in your households income): "
  #   survey_params[:annual_income]

  # end

end 