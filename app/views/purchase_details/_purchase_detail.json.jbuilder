json.extract! purchase_detail, :id, :cantidad, :created_at, :updated_at
json.url purchase_detail_url(purchase_detail, format: :json)