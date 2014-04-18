class Event < ActiveRecord::Base
	validates :title, :date, uniqueness: true
	validates :price, :artist, :date, :presence => true
	validate :valid_date, :make_number, :unique_artists

	def valid_date
		if self.date > Date.today
			return true
		else
			self.errors.add :future, "The date you entered has already passed"
			return false
		end
	end

	def self.messages(error)
		messages = {artist: "Event must have a main artist", title: "The title must be unique", future: "The date you entered has already passed", price: "The price must be listed", date: "There is already an event scheduled for that day"}
		messages[error]
	end

	def make_number
		price = self.price
	return true if price > 0
	if price[0] == "$"
		self.price = price.slice(1..-1).to_i
		return true
	else
		self.errors.add :price, "Please enter a valid price"
		return false
	end
	end

	def unique_artists
		artists = []
		artists << self.artist
		artists << self.artist_second
		artists << artist_third
		artists << artist_fourth
		artists.delete("")
		artists.count == artists.uniq.count
	end
end
