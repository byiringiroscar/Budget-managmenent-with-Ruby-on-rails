json.extract! category, :id, :name, :icon, :author_id, :created_at, :updated_at

json.url category_url(category, format: :json)
