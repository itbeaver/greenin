module ActiveRecord
  # Public: Add entity method to ActiveRecord::Relation class
  #
  # Examples
  #
  #   User.all.entity
  #   # => #<User::Entity:0x007fb4610d8a00
  #        @object=#<ActiveRecord::Relation [...]>, @options={}>
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
  #   User.new.entity
  #   # => #<User::Entity:0x007fb462263090 @object=
  #        #<User id: nil, ..., created_at: nil, updated_at: nil>, @options={}>
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
