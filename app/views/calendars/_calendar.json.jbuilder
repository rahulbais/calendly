json.extract! calendar, :id, :subject, :start_time, :end_time, :user_id, :created_at, :updated_at
json.url calendar_url(calendar, format: :json)
