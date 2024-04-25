50.times do
  Post.create(
              title: Faker::TvShows::BrooklynNineNine.character,
              body: Faker::TvShows::BrooklynNineNine.quote,
              user_id: rand(1..20)
  )
end
