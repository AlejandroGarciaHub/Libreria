json.extract! stock, :id, :en_stock, :stockActual, :fechaIngreso, :created_at, :updated_at
json.url stock_url(stock, format: :json)