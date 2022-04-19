class RegisterTagForm

def save
  @post = Post.create(post_content: post_content, address: address)
  tag = 