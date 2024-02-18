# Movie API
For this API, I used Vapor, the Swift web framework, along with a MongoDB database. This is a small demo project for testing purposes, where you can perform all CRUD operations.

## How to install
1. Install [Docker][1]
2. Then download this project 
3. After downloading, navigate with your terminal into this folder.
4. At the end, you can only execute the command `docker compose up -d` this will start the database and the application as a container. 


## How to use
To check if the application and database are running, navigate to the container section in Docker Desktop and look for a container named 'movies app'.

Once confirmed, you can begin making requests to the API endpoints. However, you will need a program capable of making HTTP requests. I recommend using [Proxyman][2]. 

### These are the requests you can make
#### Create a new movie 
Your request (POST):
`http://127.0.0.1:8080/api/movies`

Body:
	{
	  "title": "Avatar",
	  "year": 2009
	} 

The response could look like this:
	{
	  "id": "DF7B0239-BDD6-4938-9BB3-13E1D379725D",
	  "year": 2009,
	  "title": "Avatar"
	}


#### Get all movies
Your request(GET):
`http://127.0.0.1:8080/api/movies` 

The response could look like this:
	[
	  {
		"id": "B4DD8F9A-8A70-4725-995D-3B9DC11134AE",
		"title": "Batman Begins",
		"year": 2010
	  },
	  {
		"id": "3233E368-356C-41CD-8C0A-95DC8F5B4AB5",
		"title": "Minions",
		"year": 2023
	  }
	]


#### Get a movie by ID
Your request(GET):
`[http://127.0.0.1:8080/api/movies] http://127.0.0.1:8080/api/movies/B4DD8F9A-8A70-4725-995D-3B9DC11134AE ` 

The response could look like this:
	{
	  "id": "B4DD8F9A-8A70-4725-995D-3B9DC11134AE",
	  "year": 2010,
	  "title": "Batman Begins"
	}

#### Delete a movie
Your request (Delete):
`http://127.0.0.1:8080/api/movies/3233E368-356C-41CD-8C0A-95DC8F5B4AB5 `

The response could look like this (the channel which you deleted):
	{
	  "id": "3233E368-356C-41CD-8C0A-95DC8F5B4AB5",
	  "year": 2023,
	  "title": "Minions"
	}


#### Update the movie
Your request(PUT):
`http://127.0.0.1:8080/api/movies/C5A35A34-CD83-458D-A362-A1D4A382CC34`

Body:
	{
	  "title": "Despicable Me 4",
	  "year": 2024
	}

The response could look like this (the channel which you updated):
	{
	  "id": "C5A35A34-CD83-458D-A362-A1D4A382CC34",
	  "year": 2024,
	  "title": "Despicable Me 4"
	}

[1]:	https://www.docker.com/products/docker-desktop/
[2]:	https://proxyman.io/