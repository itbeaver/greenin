describe Post do
  it 'Post.entity.to_json' do
    expect(Post.entity).to eq(Post::Entity)
    puts Post.entity
  end
  it 'Post.first.entity.to_json' do
    post = create(:post)
    expect(post.entity).to be_instance_of(Post::Entity.represent(post).class)
    expect(post.entity.to_json).to eq("{\"post\":{\"title\":\"Some title\"}}")
    puts post.entity.to_json
  end
  it 'Post.all.entity.to_json' do
    3.times { create(:post) }
    expect(Post.all.entity).to be_instance_of(Post::Entity.represent(Post.all).class)
    expect(Post.all.entity.to_json).to eq("{\"posts\":[{\"title\":\"Some title\"},{\"title\":\"Some title\"},{\"title\":\"Some title\"}]}")
    puts Post.all.entity.to_json
  end
end
