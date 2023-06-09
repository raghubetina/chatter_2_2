namespace :dev do
  desc "Pre-populate database with dummy data"
  task prime: :environment do
    User.destroy_all

    users = []
    
    usernames = %w(alice bob carol dave eve faith grace heidi ivan judy keith)
    
    usernames.each do |username|
      user = User.find_or_create_by(username: username) do |user|
        user.email = "#{username}@example.com"
        user.password = "password"
        user.bio = Faker::Job.title
        user.link = Faker::Internet.url
        user.location = Faker::Address.city
        user.name = "#{username.capitalize} #{Faker::Name.last_name}"
      end

      if user.persisted?
        users << user
      else
        ap user
        ap user.errors.full_messages
      end
    end

    quote_methods = %i(famous_last_words fortune_cookie jack_handey matz most_interesting_man_in_the_world robin singular_siegler yoda mitch_hedberg)

    users.each do |user|
      users.sample(rand(12)).each do |leader|
        user.leaders << leader
      end

      rand(5..20).times do
        posts = []

        post = user.own_posts.create(
          body: Faker::Quote.send(quote_methods.sample)
        )

        if post.persisted?
          posts << post

          users.sample(rand(12)).each do |fan|
            post.fans << fan
          end
  
          users.sample(rand(12)).each do |bookmarker|
            post.bookmarkers << bookmarker
          end
  
          rand(15).times do
            post.comments.create(
              commenter: users.sample,
              body: Faker::Quote.send(quote_methods.sample)
            )
          end
        else
          ap post
          ap post.errors.full_messages
        end
      end
    end

    puts "There are #{User.count} rows in the users table."
    puts "There are #{Follow.count} rows in the follows table."
    puts "There are #{Post.count} rows in the posts table."
    puts "There are #{Comment.count} rows in the comments table."
    puts "There are #{Like.count} rows in the likes table."
    puts "There are #{Bookmark.count} rows in the bookmarks table."
  end
end
