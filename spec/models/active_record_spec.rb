describe Post do
  it 'Post.entity' do
    expect(Post.entity).to eq(Post::Entity)
  end
  it 'Post.first.entity' do
    post = create(:post)
    expect(post.entity).to be_instance_of(Post::Entity.new(post).class)
    expect(post.entity.object).to eq(post)
  end
  it 'Post.all.entity' do
    3.times { create(:post) }
    expect(Post.all.entity).to be_instance_of(Post::Entity.new(Post.all).class)
    expect(Post.all.entity.object).to eq(Post.all)
  end
end
