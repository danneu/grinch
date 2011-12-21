Post.destroy_all
Post.create(
  title: "My First Post",
  body: """
Hello,

This is my first time making a post.

I hope you enjoy."""
)
Post.create(
  title: "My Second Post",
  body: """
Fuck yeah.

Twice.

I'm excited.

    Here's some `pre` code.

How did that look? """
)
