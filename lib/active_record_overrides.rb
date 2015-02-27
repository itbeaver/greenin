module ActiveRecord
  # Public: Add entity method to ActiveRecord::Relation class
  #
  # Examples
  #
  #   User.all.entity(root: 'users').to_json
  #   # => { "users":
  #           [{
  #               "title": "Some title"
  #             },
  #             {
  #              "title": "Some title"
  #             },
  #             {
  #              "title": "Some title"
  #             }]
  #         }

  class Relation
    define_method(Greenin.entity_method_name) do |args={}|
      begin
        entity = %(#{model}::#{Greenin.entity_class_name}).constantize
      rescue NameError
        entity = nil
      end
      entity.represent(self, args) if entity
    end
  end

  # Public: Add entity methods to ActiveRecord::Base class
  #
  # Examples
  #
  #   User.entity
  #   # => User::Entity
  #
  #   User.first.entity(root: false).to_json
  #   # => {"title":"Some title"}
  class Base
    define_singleton_method Greenin.entity_method_name do
      begin
        entity = %(#{self}::#{Greenin.entity_class_name}).constantize
      rescue NameError
        entity = nil
      end
      entity
    end

    define_method(Greenin.entity_method_name) do |args={}|
      begin
        entity = %(#{self.class}::#{Greenin.entity_class_name})
                 .constantize
      rescue NameError
        entity = nil
      end
      entity.represent(self, args) if entity
    end
  end
end
