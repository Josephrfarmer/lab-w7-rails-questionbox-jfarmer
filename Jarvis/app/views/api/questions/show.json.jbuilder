json.links do
  json.self api_question_url(@question)
  json.list api_questions_url
  json.update do
    json.method "PUT"
    json.href api_question_url(@question)
  end
  json.delete do
    json.method "DELETE"
    json.href api_question_url(@question)
  end
end
json.data do
  json.id @question.id
  json.attributes do
    json.body @question.body
    json.user_id @question.user_id
  end
end