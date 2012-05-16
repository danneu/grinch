# Grinch

(Work-in-progress)

A simple blog system made with Rails. [Live demo](http://danneu.com)

Lets the admin user log in, CRUD posts/categories, and then generates
page-cached static files into `public/`.

## Why?

I wasn't happy with the Jekyll workflow. A git push to fix a typo is a bit much. 

Rolling my own blog would be more
educational, fun to tweak, and interesting to maintain. I'm working on more
ambitious apps so I like the idea of having a "serious" app deployed that can
provide the workflow groundwork for bigger apps instead of practicing all day
alone in locahost.

## The Details

* **Responsive design**: I modified Skeleton to have a max width of 650px. I
  think it's easier to read.
* **One interface**: I read 37Signal's concept of the [One Interface](http://gettingreal.37signals.com/ch09_One_Interface.php) which
  makes a compelling case for combining the admin/user interface instead of
  hiding the admin tools away into a separate admin backend.
* **Markdown formatting**: Write/edit posts in Markdown, saved to `@post.body`
  which then renders html saved in `@post.rendered_body`.
* **Post preview**: When writing/editing a post, a preview button will show you what it will look like before you submit it.
* **Authentication**: Using the Sorcery gem.
* **Authorization**: Any User can do anything.
* **Syntax highlighting**: Uses the Pygmentize to colorize blocks of code.
* **Sitemap generator**: Whenever a post is created/destroyed, search engines are pinged with an updated sitemap.

## The Setup

* **Make the admin user**. 

        User.create(username: "Dan", 
                    password: "secret",
                    email:    "dan@example.com")

## The TODO List

* Add tests
* Categories

