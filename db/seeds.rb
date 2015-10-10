include RandomData

50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "#{Post.count} posts created"
Post.find_or_create_by(title: "Unique title", body: "This is the unique body.")
puts "#{Post.count} posts created"

puts "#{Comment.count} comments created"
Comment.find_or_create_by(post: posts.sample, body: "This is a unique comment.")
puts "#{Comment.count} comments created"

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
