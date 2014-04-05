class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

    	t.string :title
    	t.string :arist
    	t.string :artist_second
    	t.string :artist_third
    	t.string :artist_fourth
    	t.date :date
    	t.integer :price
    	t.string :event_time


      t.timestamps
    end
  end
end
