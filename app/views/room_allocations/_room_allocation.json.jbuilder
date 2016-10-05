json.extract! room_allocation, :id, :patient_id, :room_id, :created_at, :updated_at
json.url room_allocation_url(room_allocation, format: :json)