class MovieService
  class << self
    def save(movie)
      movie.save
    end

    def update(movie, movie_params)
      if movie.update(movie_params.except(:photos))
        if movie_params[:photos].present?
          movie.photos.attach(movie_params[:photos])
        end
        true
      else
        false
      end
    end

    def delete(movie)
      movie.destroy
    end
  end
end
