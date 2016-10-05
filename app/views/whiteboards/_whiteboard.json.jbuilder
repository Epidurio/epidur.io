json.extract! whiteboard, :id, :room_id, :patient_id, :created_at, :updated_at
json.url whiteboard_url(whiteboard, format: :json)