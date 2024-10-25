namespace :populate do
  desc 'popula banco de dados com filmes'
  task movies: :environment do
    10.times do
      Movie.create(
        title: Faker::Movie.title,
        description: Faker::Name.name,
        release_year: Faker::Date.between(from: '1900-01-01', to: '2024-01-01')
      )
    end
    puts "Filmes cadastrados com sucesso"
  end

  desc 'popula banco de dados com usuários'
  task users: :environment do
    10.times do
      User.create(
        email: Faker::Internet.email,
        password: '123456'
      )
    end
    puts "Usuários criados com sucesso"
  end
end