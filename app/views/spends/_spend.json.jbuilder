json.extract! spend, :id, :name, :amount, :author_id, :created_at, :updated_at

json.url spend_url(spend, format: :json)
