class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
    	t.integer :match_id
    	t.integer :team_number
    	t.integer :totalcount, default: 10
    	t.string  :team_name
    	t.string  :team_image_id
      t.boolean :result, default: false
      t.timestamps
    end
  end
end
