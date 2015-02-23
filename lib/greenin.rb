require "greenin/version"

module Greenin
end

module ActiveRecord
  class Relation
  	def entity
      self.model::Entity.new(self) if defined? self.model::Entity
  	end
  end

  class Base
  	def entity
      self.class::Entity.new(self) if defined? self.class::Entity
  	end

    def self.entity
      self::Entity if defined? self::Entity
    end
  end
end
