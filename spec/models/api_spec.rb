describe 'API Spec' do
  subject do
    Class.new(Grape::API) do
      params do
        optional :limit, default: 1
        optional :root, default: 'postes'
      end
      get '/posts' do
        status 200
        root = params[:root]
        root = false if params[:root] == 'false'
        present Post.all.limit(params[:limit]).entity(root: root).to_json
      end
    end
  end

  def app
    subject
  end

  it 'get posts' do
    3.times { create(:post) }
    get '/posts', limit: 3
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq({"postes"=>[{"title"=>"Some title"}, {"title"=>"Some title"}, {"title"=>"Some title"}]})
    get '/posts', limit: 1
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq({"postes"=>[{"title"=>"Some title"}]})
    get '/posts', limit: 1, root: 'false'
    expect(last_response.status).to eq(200)
    expect(JSON.parse(last_response.body)).to eq([{"title"=>"Some title"}])
  end

end