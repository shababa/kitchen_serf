class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true

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
