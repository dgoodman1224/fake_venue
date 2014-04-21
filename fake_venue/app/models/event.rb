class Event < ActiveRecord::Base
	validates_uniqueness_of :title, :date, message: "This must be unique from other events"
	validates_presence_of :price, :artist, message: "This field cannot be left blank"
	validate :valid_date, :make_number, :unique_artists

	def valid_date
		if self.date == nil
			self.errors.add :no_date, "You must enter a date for this event"
			return false
		elsif self.date > Date.today
			return true
		else
			self.errors.add :future, "The date you entered has already passed"
			return false
		end
	end

	def make_number
		price = self.price
		return false if !price
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
		bands = [self.artist, self.artist_second, self.artist_third, self.artist_fourth]
		bands.delete("")
		if bands.count == bands.uniq.count
			true
		else
			self.errors.add :unique_artists, "The same artist cannot play more than once at the same event"
			false
		end
	end

end