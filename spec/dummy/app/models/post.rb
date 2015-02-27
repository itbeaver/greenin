class Post < ActiveRecord::Base
  class Entity < Grape::Entity
    root 'posts', 'post'
    expose :title, documentation: { type: 'String', desc: 'Post title' }
  end
end
