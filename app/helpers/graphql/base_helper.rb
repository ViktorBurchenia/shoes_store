module Graphql
  module BaseHelper
    def current_resource
      @current_resource ||= context[:current_resource]
    end
  end
end
