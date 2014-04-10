class Event < ActiveRecord::Base
	validates :title, uniqueness: true
	validates :price, :presence => {:message => 'Price cannot be blank, Task not saved'}
	before_save :valid_date
	def self.messages(error)
		messages = {title: "The title must be unique", price: "The price must be listed"}
		messages[error]
	end

	def valid_date
		(/\d{2}\/\d{2}\/\d{4}/).match(self.date) == !nil ? true : false
	end
end
