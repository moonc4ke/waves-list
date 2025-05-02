class CreateSurfSpots < ActiveRecord::Migration[8.0]
  def change
    create_table :surf_spots do |t|
      t.string :name
      t.string :location
      t.string :country
      t.text :description
      t.string :wave_type
      t.string :break_type
      t.string :optimal_swell_direction
      t.string :optimal_wind_direction
      t.string :best_tide
      t.string :difficulty_level
      t.string :crowd_level
      t.string :localism_level
      t.decimal :monthly_cost
      t.decimal :rental_cost
      t.decimal :lesson_cost

      t.timestamps
    end
  end
end
