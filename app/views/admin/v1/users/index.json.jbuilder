json.users do
  json.array! @loading_service.records, :id, :name, :email, :password, :password_confirmation, :profile
  
end

json.meta do
  json.partial! 'shared/pagination', pagination: @loading_service.pagination
end