require 'greenin/version'

# Public: Greenin settings module
# You can customize entity method name and entity class name
#
# Examples
#
#   Greenin.entity_method_name = 'form_ent'
#   Greenin.entity_class_name = 'Ent'
#
#   User::Ent
#   # => User::Ent
#   User.form_ent
#   # => User::Entity
#   User.all.form_ent
#   # => #<User::Entity:0x007fb4610d8a00
#        @object=#<ActiveRecord::Relation [...]>, @options={}>
#   User.first.form_ent
#   # => #<User::Entity:0x007fb462263090 @object=
#        #<User id: nil, ..., created_at: nil, updated_at: nil>, @options={}>
module Greenin
  mattr_accessor :entity_method_name
  @@entity_method_name = 'entity'

  mattr_accessor :entity_class_name
  @@entity_class_name = 'Entity'

  def self.setup
    yield self
  end
end

# Public: Generates methods after loading initializer
class Engine < ::Rails::Engine
  initializer 'set_settings', after: :load_config_initializers,
                              before: :build_middleware_stack do
    require 'active_record_overrides'
  end
end
