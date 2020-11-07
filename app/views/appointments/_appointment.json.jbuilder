json.extract! appointment, :id, :office_id, :citizen_id, :subject, :venue, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
