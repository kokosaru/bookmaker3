class CreateCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :counts do |t|
    	t.integer :user_id
    	t.integer :team_id
    	t.integer :count, default: 0
      t.timestamps
    end
  end
end
