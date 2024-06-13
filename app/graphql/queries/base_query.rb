module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    description 'BaseQuery from which all queries are inherited'
    include Graphql::BaseHelper

    ALLOWED_ACCESS = :default_type

    def self.allow_query_access(*access_types)
      define_method(:ready?) do |*_args|
        return true if current_resource.access?(access_types)

        errors_messages = access_types.flatten.map { |access_type| I18n.t("errors.query.#{access_type}") }
        raise GraphQL::ExecutionError, errors_messages
      end
    end
  end
end
