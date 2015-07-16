json.error do
  json.code @error_code
  json.message @error_message
  json.details @errors
end