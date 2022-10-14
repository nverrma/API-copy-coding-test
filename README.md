Ruby version : 3.1.2
Rails version : 7.0.4
command for run rake task : "rake import:json_data"

- Setup a '/copy' API endpoint that returns all the copy in JSON format.

- Setup a '/copy/greeting?name=Elon&app=Bridge' API with name and app parameters that return { value: 'Hi Elon, welcome to Bridge!' } responce.

- Setup a '/copy/greetingVIP?name=Elon&app=Bridge' API with name and app parameters that return { value: 'Hi Elon, welcome to Bridge! You're on the VIP plan.' } responce.

- Setup a '/copy/intro.created_at?created_at=1603814215' API with created_at timestamp parameters that return {value: 'Intro created on Tues Oct 27 3:56:55PM'} responce.

- Setup a '/copy/intro.updated_at?updated_at=1603814215' API with created_at timestamp parameters that return {value: 'Intro updated on Tues Oct 27 3:56:55PM'} responce.

- Setup another API for 'copy/refresh' endpoint that fetches latest copy data from airtable and updates the copy data without needing to re-run the rake task & restart the backend server.
