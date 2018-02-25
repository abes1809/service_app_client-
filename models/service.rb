class Service 

  attr_accessor :id, :name, :specialty, :email, :phone_number, :address, :city, :state, :zip, :prefered_contact_method, :contact_info_id

  def initialize(input_options)

    @id = input_options["id"]
    @name = input_options["name"]
    @specialty = input_options["specialty"]
    @email = input_options["email"]
    @phone_number = input_options["phone_number"]
    @address = input_options["address"]
    @city = input_options["city"]
    @state = input_options["state"]
    @zip = input_options["zip"]
    @prefered_contact_method = input_options["prefered_contact_method"]
    @contact_info_id = input_options["contact_info_id"]

  end 

end 