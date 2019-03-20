class CreateCountresults < ActiveRecord::Migration[5.2]
  def change
    create_table :countresults do |t|
    	t.integer :user_id
    	t.integer :countresult, default: 0
      t.timestamps
    end
  end
end
