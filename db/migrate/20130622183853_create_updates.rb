class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :details
      t.datetime :datetime
      t.references :bill
    end
  end
end
