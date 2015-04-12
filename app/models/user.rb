class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validate :only_one_current 

def only_one_current
	# If the table is empty or a current user has not been set
	# then there are no current users 
	# If the tabe is populated, than there is only one current user 
	User.where(:is_current => true).count < 2
end	

def self.get_current_person
	@current.nil? ? User.find_by(last_time: Date.today.prev_day) : current 
end

def self.go_to_next_person
	@current = get_current_person
	if @current.nil?
		@current = User.first
	else 
		@current = User.where(id: @current.id + 1)
	end		 
	@current.update(last_time: Date.today)
	@current
end	

end
