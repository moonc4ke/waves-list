json.extract! review, :id, :user_id, :surf_spot_id, :rating, :comment, :wave_quality, :consistency, :accessibility, :amenities, :beauty, :created_at, :updated_at
json.url review_url(review, format: :json)
