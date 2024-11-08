class MovieService
  class << self
      def save(movie)
          movie.save
      end

      def update(movie, movie_params)
          if movie.update(movie_params.except(:photos))
              movie.photos.attach(movie_params[:photos]) if movie_params[:photos].present?
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