describe 'API Spec' do
  subject do
    Class.new(Grape::API) do
      params do
        optional :root, default: ''
      end
      get '/posts' do
        status 200
        root = params[:root]
        root = false if params[:root] == 'false'
        root = nil if params[:root] == ''
        if root.nil?
          present Post.all.entity.to_json
        else
          present Post.all.entity(root: root).to_json
        end
      end
    end
  end

  def app
    subject
  end

  it 'check getting one object entity without root' do
    create(:post)
    get '/posts', root: 'false'
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq([{"title"=>"Some title"}])
  end
  it 'check getting one object entity with changed root' do
    create(:post)
    get '/posts', root: 'postik'
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq({"postik"=>[{"title"=>"Some title"}]})
  end
  it 'check getting one object entity' do
    create(:post)
    get '/posts'
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq({"posts"=>[{"title"=>"Some title"}]})
  end
  it 'check getting relation entity with changed root' do
    3.times { create(:post) }
    get '/posts', root: 'postes'
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq({"postes"=>[{"title"=>"Some title"}, {"title"=>"Some title"}, {"title"=>"Some title"}]})
  end

end