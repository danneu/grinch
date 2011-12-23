Post.destroy_all
Category.destroy_all

Category.create(name: Category::DEFAULT_NAME)
Category.create(name: "programming")
Category.create(name: "how-to")

Post.create(
  title: "My First Post",
  body: """
Hello,

This is my first time making a post.

I hope you enjoy.""")

Post.create(
  title: "My Second Post",
  body: """
Fuck yeah.

Twice.

I'm excited.

How did that look? """)

Post.create(
  title: "This is my Latest Post",
  body: """
This is my most recent post.

It should appear at the top.

This should be *emphasized* and this should be **emboldened**.

# h1 Header

## h2 Header

### h3 Header

#### h4 Header

##### h5 Header

###### h6 Header

And that's it! """)
