class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
    	t.integer :genre
    	t.integer :match_status, default: 0
    	t.string  :match_name
    	t.datetime :match_day
      t.timestamps
    end
  end
end
