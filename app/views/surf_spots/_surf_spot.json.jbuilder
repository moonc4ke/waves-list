json.extract! surf_spot, :id, :name, :location, :country, :description, :wave_type, :break_type, :optimal_swell_direction, :optimal_wind_direction, :best_tide, :difficulty_level, :crowd_level, :localism_level, :monthly_cost, :rental_cost, :lesson_cost, :created_at, :updated_at
json.url surf_spot_url(surf_spot, format: :json)
