json.array! @questions do |question|
  json.extract! question, :id, :name, :email, :username, :password
end