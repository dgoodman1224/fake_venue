class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

    	t.string :title
    	t.string :artist
    	t.string :artist_second
    	t.string :artist_third
    	t.string :artist_fourth
    	t.date :date
    	t.integer :price
    	t.string :event_time
      t.string :url


      t.timestamps
    end
  end
end
