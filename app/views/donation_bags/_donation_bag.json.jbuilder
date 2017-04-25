json.extract! donation_bag, :id, :user_id, :bag_status_id, :total_quantity, :created_at, :updated_at
json.url donation_bag_url(donation_bag, format: :json)
