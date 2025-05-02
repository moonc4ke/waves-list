class CreateSpotChangeProposals < ActiveRecord::Migration[8.0]
  def change
    create_table :spot_change_proposals do |t|
      t.references :surf_spot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :field_name, null: false
      t.text :old_value
      t.text :new_value, null: false
      t.string :status, default: 'pending'
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0

      t.timestamps
    end
  end
end
