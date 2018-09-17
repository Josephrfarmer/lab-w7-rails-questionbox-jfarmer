json.links do
  json.self api_answer_url(@answer)
  json.list api_answers_url
  json.update do
    json.method "PUT"
    json.href api_answer_url(@answer)
  end
  json.delete do
    json.method "DELETE"
    json.href api_answer_url(@answer)
  end
end
json.data do
  json.id @answer.id
  json.attributes do
    json.body @answer.body
    json.user_id @answer.user_id
    json.question_id @answer.question_id
  end
end