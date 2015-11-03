class User

	attr_accessor :first, :last, :id

	def initialize(first="", last="")
		@first = first
		@last = last
		@id = id
	end

	def self.create_table
		`psql -d exercise -c "CREATE TABLE users(id serial PRIMARY KEY, fname varchar(50), lname varchar(50));"`
	end

	def self.create(first, last)
		`psql -d exercise -c "INSERT INTO users (fname, lname) VALUES ('#{first}', '#{last}')"`	
	end

	def self.find(myid)
		sql_results_parser(`psql -d exercise -c "SELECT * FROM users WHERE id = #{myid};"`)
	end
	
	def self.destroy(one_id)
		`psql -d exercise -c "DELETE FROM users WHERE id = #{one_id};"`	
	end
	
	def self.destroy_all
		`psql -d exercise -c "DELETE FROM users;"`
	end
	
	def self.delete_table
		`psql -d exercise -c "DROP TABLE users;"`
	end

	def self.where(first, last)
		sql_results_parser(`psql -d exercise -c "SELECT * FROM users WHERE (fname, lname) = ('#{first}', '#{last}');"`)
	end

	def self.first
		`psql -d exercise -c "SELECT * FROM users WHERE id = 1;"`
	end

	def self.all
    		`psql -d exercise -c "SELECT * FROM users"`
    		# sql_results_parser command
  	end


	def save	
		`psql -d exercise -c "INSERT INTO users (fname, lname) VALUES ('#{self.first}', '#{self.last}')"`
	end

	def self.update(up_id, first, last)
		`psql -d exercise -c "UPDATE users SET fname = '#{first}', lname = '#{last}' WHERE id = '#{up_id}';"`
	end

  def self.sql_results_parser(results)
  
	 # puts results 

	 # Remove text not relevant to data
  	 a= results.split
  	 a = a[6...a.length]

  	 # print the id, first,and last name of person in DB
  	puts a[0]
  	puts f = a[2]
  	puts l = a[4]

	if !f.nil? && !l.nil?
		user = self.new(f,l)
	else
		user = nil
	end
  	# return if the last name is nil or not- to show if anyone was even found in DB
  	return user
  	# puts self.new(a[8])
    #some code to parse what gets returned from the SQL command
  end

  # def self.sql_results_parser_first(first)
	#  puts first
 #  end
  
end


