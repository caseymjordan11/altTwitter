Tweet.destroy_all
Reply.destroy_all

Tweet.create(content: "Hello World!")
Tweet.create(content: "This is a Tweet")

Reply.create(content: "Hi.", tweet_id: 1)
Reply.create(content: "Yes it is", tweet_id: 1)
