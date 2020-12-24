json.coupons do
  json.array! @loading_service.records, :id, :name, :code, :status, :discount_value, :due_date, :max_use
end

json.meta do
  json.partial! 'shared/pagination', pagination: @loading_service.pagination
end