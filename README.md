# Grinch

(Work-in-progress)

A simple blog system made with Rails.

Lets the admin user log in, CRUD posts/categories, and then generates
page-cached static files into `public/` (soon).

## Why?

I wanted me own nook of the internet to share my thoughts with and contribute
back to the communities I've been a part of for years.

I wasn't happy with the Jekyll workflow. Rolling my own blog would be more
educational, fun to tweak, and interesting to maintain. I'm working on more
ambitious apps so I like the idea of having a "serious" app deployed that can
provide the workflow groundwork for bigger apps instead of practicing all day
alone in locahost:3000.

I've spent the past year scavenging for free time between university and work to
teach myself Rails. I intend for this app to be simple enough for any other self-teachers
to understand the code.

## The Details

* **Responsive design**: I modified Skeleton to have a max  width of 650px. I
  think it's easier to read.
* **One interface**: I initially dropped in the Active Admin gem and had the
  whole new post, authentication, authorization, manage posts workflow solved in
  10 minutes, but then I read 37Signal's concept of the One Interface which
  makes a compelling case for combining the admin/user interface instead of
  hiding the admin tools away into a separate admin backend. Active Admin also
  did too much for me considering the intents of this project.
* **Markdown formatting**: Write/edit posts in Markdown, saved to `@post.body`
  which then renders html saved in `@post.rendered_body`. This is handled with
  the RDiscount gem.
* **Authentication**: Uses the Sorcery gem which was a great break from Devise.

        Log in at: localhost:3000/login
        Log out at: localhost:3000/logout
* **Authorization**: Any User can do anything.
* **Syntax highlighting**: Uses the Coderay gem to colorize blocks of code.

## The Setup

* **Make the admin user**. One good spot to stick this is in the Sorcery Code
  migration file.

        User.create(username: "Dan", 
                    password: "secret",
                    email:    "dan@example.com")

    (I eventually want the blog to email me if I forget the password.)

## The TODO List

* Cache all posts to `public/`
* Add tests
* Implement security features and test for them, like adding `attr_accessible`
  to models
* Generate a sitemap that auto-submits to Google
* Make a real-time html preview of my Markdown as I type it

