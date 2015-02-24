describe Post do
  it 'Post.entity' do
    expect(Post.entity).to eq(Post::Entity)
    expect(Post.first.entity).to eq(Post::Entity.new(Post.first))
    expect(Post.all.entity).to eq(Post::Entity.new(Post.all))
  end
end
