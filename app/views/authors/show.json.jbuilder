json.extract! @author, :id, :name, :created_at, :updated_at
json.array!(@books) do |book|
  json.extract! book, :id, :title
end
