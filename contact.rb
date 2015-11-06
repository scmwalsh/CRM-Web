class Contact
	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :notes
	
	@@contacts = []
	@@id = 1

	def initialize(first_name, last_name, options = {})
		@first_name = first_name
		@last_name = last_name
		@email = options[:email]
		@notes = options[:notes]
		@id = @@id
		@@id += 1
	end

	def self.create(first_name, last_name, options = {})
		new_contact = Contact.new(first_name, last_name, options)	
		@@contacts << new_contact
		return new_contact
	end

	def self.find(id)
		@@contacts.each do |contact|
			if contact.id == id
				return contact
			end
		end
	end

	def update(field, new_value)
		self.send("#{field}=", new_value) 
	end


	def self.all
		@@contacts
	end

	def full_name
		"#{first_name} #{last_name}"
	end

	def self.delete_all
		@@contacts = []
	end

	def self.delete_contact
		@@contacts.delete_if { |contact| contact.id == user_specified_id}
	end

	def self.search_by_attribute(field, value)
		contacts =  []
		@@contacts.each do |contact|
			if field == "first_name"
				if value == contact.first_name
					contacts << contact
				end
			elsif field == "last_name"
				if value == contact.last_name
					contacts << contact
				end
			elsif field == "email"
				if value == contact.email
					contacts << contact
				end
			elsif field == "notes"
				if value == contact.notes
					contacts << contact

				end
			end

		end

		return contacts





			

	end



end