# Chatter

https://chatter-ap.herokuapp.com

An application to duplicate the core functionality of Twitter, using Rails 6 and Ruby 2.6.3 with a PostgreSQL database, achieved using TDD.

### Key Features
- Any user can view a user's profile page which displays the user's followers/following statistics and the user's paginated posts in reverse chronological order.
- Logged-in users can see a paginated list of all users (which link to the associated user profile page), edit
their account settings, post and delete their own messages via the homepage or their profile page.
- User registration, authentication, authorisation implemented via customising the devise gem and using before filters.  
- Feed of posts on a logged-in user's homepage to display a user's own posts and the posts of users they are following, implemented via the use of raw SQL commands in the model layer.
- Follow/unfollow functionality for logged-in users implemented via model has_many through associations.
