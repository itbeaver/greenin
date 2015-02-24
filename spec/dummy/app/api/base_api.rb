class BaseApi < Grape::API
  def self.inherited(subclass)
    super
    subclass.instance_eval do
      version 'v1', using: :header, vendor: 'dummy', cascade: false
      format :json
      default_format :json
    end
  end
end