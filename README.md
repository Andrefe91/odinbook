# odinbook
Final project for the Ruby on Rails module from "The Odin Project".

Requisites:

    ✔️ 1) Use PostgreSQL for your database from the beginning (not SQLite3), that way your deployment will go much more smoothly.
    ✔️ 2) Users must sign in to see anything except the sign in page - (Altered, the user can enter as a guest an watch all the post but no interactions are permited without log in)
    ✔️ 3) User sign-in should use the Devise gem. Devise gives you all sorts of helpful methods so you no longer have to write your own user passwords, sessions, and #current_user methods. See the Railscast (which uses Rails 3) for a step-by-step introduction. The docs will be fully current.
    ✔️ 4) Users can send follow requests to other users. (Altered, the user can follow anybody without them accepting the follow request, twitter style)
    ✔️ 5) Users can create posts (begin with text only).
    ✔️ 6) Users can like posts.
    ✔️ 7) Users can comment on posts.
    ✔️ 8) Posts should always display the post content, author, comments, and likes.
    ✔️ 9) There should be an index page for posts, which shows all the recent posts from the current user and users they are following.
    ✔️ 10) Users can create a profile with a profile picture. You may be able to get the profile picture when users sign in using OmniAuth. If this isn’t the case you can use Gravatar to generate the photo.
    ✔️ 11) A user’s profile page should contain their profile information, profile photo, and posts.
    ✔️ 12) There should be an index page for users, which shows all users and buttons for sending follow requests to users the user is not already following or have a pending request. (Altered, there is no follow acceptance required).
    13) Set up a mailer to send a welcome email when a new user signs up. Use the letter_opener gem (see docs here) to test it in development mode.
    14) Deploy your App to a hosting provider.
    15) Set up an email provider and start sending real emails.

Extra credit

    1) Make posts also allow images (either just via a URL or, more complicated, by uploading one).
    ✔️ 2) Use Active Storage to allow users to upload a photo to their profile.
    3) Make your post able to be either a text OR a photo by using a polymorphic association (so users can still like or comment on it while being none-the-wiser).
    4) Style it up nicely! We’ll dive into HTML/CSS in the next course.
