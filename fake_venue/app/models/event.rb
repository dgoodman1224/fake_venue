class Event < ActiveRecord::Base
	validates :title, :date, uniqueness: true
	validates :price, :presence => {:message => 'Price cannot be blank, Task not saved'}
	before_save :valid_date

	def valid_date
		self.date > Date.today
	end
	def self.messages(error)
		messages = {title: "The title must be unique", price: "The price must be listed", date: "There is already an event scheduled for that day"}
		messages[error]
	end
end
