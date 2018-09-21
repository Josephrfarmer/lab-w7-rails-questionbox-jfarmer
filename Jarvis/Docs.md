* Jarvis 

* Ruby version
Ruby version being used in the API is:
2.5.1

* Schema 
Answers
  body:text
  user_id: integer
  question_id: integer
   

Questions
  body: text
  user_id: integer 


Users
  name: string
  username: string 
  email: string 
    

All data is sent and recieved as JSON 

You can access this data by using Postman. 

* EndPoints/Routes 

- GET localhost:3000/api/questions 

  -This will return all questions

- GET localhost:3000/api/questions/:id

  -This will return a individual question 

- POST localhost:3000/api/questions

  -You can post a new question by using this route.
    -example 
      {
	      "question":{
	      	"body": "What is the meaning of life?",
		      "user_id": 5
	      }
      }

  You can only post a new question with authorization by creating an account. 

- DELETE localhost:3000/api/questions/:id

  -This will delete a "question". 
  -You must have authorization to delete a byte (creating an account or signing into an account will give you authorization.) 
  -You will only have authorization to delete questions that you have created. 

- GET localhost:3000/api/questions/:question_id/answers 

  -This will return all of the answers associated with one question. 
  -You must have authorization to create a answer for a Question(signed in or create an account).

- POST localhost:3000/api/questions/:question_id/answers

  -This will create a answer for an accociated question
  -You must have authorization to create a comment. 

- DELETE localhost:3000/api/questions/:question_id/answers/:id

  -This will delete a particular answer accociated with a particular Question. 
  -You must have authorization to delete a comment.