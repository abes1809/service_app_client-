class ContactInfo

  attr_accessor :id, :email, :phone_number, :address, :city, :state, :zip, :prefered_contact_method 

  def initialize(input_options)

    @id = input_options["id"]
    @email = input_options["email"]
    @phone_number = input_options["phone_number"]
    @address = input_options["address"]
    @city = input_options["city"]
    @state = input_options["state"]
    @zip = input_options["zip"]
    @prefered_contact_method = input_options["prefered_contact_method"]
    
  end 

end 