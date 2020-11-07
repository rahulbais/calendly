json.extract! meeting, :id, :start_time, :end_time, :user_id, :citizen_id, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
