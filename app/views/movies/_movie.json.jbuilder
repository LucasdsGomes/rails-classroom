json.extract! movie, :id, :title, :decription, :release_year, :created_at, :updated_at
json.url movie_url(movie, format: :json)
