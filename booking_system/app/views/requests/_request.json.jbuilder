json.extract! request, :id, :room_id, :description, :date, :start, :end, :created_at, :updated_at, :category, :pending, :created_at, :updated_at
json.url request_url(request, format: :json)
