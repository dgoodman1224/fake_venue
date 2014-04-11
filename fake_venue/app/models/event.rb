class Event < ActiveRecord::Base
	validates :title, :date, uniqueness: true
	validates :price, :presence => true
	validate :valid_date

	def valid_date
		if self.date > Date.today
			return true
		else
			self.errors.add :future, "The date you entered has already passed"
			return false
		end
	end
	def self.messages(error)
		messages = {title: "The title must be unique", future: "The date you entered has already passed", price: "The price must be listed", date: "There is already an event scheduled for that day"}
		messages[error]
	end
end
