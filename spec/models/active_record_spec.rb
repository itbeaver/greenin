describe Post do
  it 'Post.entity' do
    expect(Post.entity).to eq(Post::Entity)
  end
  it 'Post.first.entity' do
    post = create(:post)
    expect(post.entity).to be_instance_of(Post::Entity.represent(post).class)
    expect(post.entity.to_json).to eq("{\"post\":{\"title\":\"Some title\"}}")
  end
  it 'Post.all.entity' do
    3.times { create(:post) }
    expect(Post.all.entity).to be_instance_of(Post::Entity.represent(Post.all).class)
    expect(Post.all.entity.to_json).to eq("{\"posts\":[{\"title\":\"Some title\"},{\"title\":\"Some title\"},{\"title\":\"Some title\"}]}")
  end
end
