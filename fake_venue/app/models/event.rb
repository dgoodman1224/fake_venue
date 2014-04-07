class Event < ActiveRecord::Base
	validates :title, uniqueness: true
	validates :price, :presence => {:message => 'Price cannot be blank, Task not saved'}
end
