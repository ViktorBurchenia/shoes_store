# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    include Graphql::BaseHelper

    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    ALLOWED_ACCESS = :default_type

    def self.allow_mutation_access(*access_types)
      define_method(:ready?) do |*_args|
        return true if current_resource.access?(access_types)

        errors_messages = access_types.flatten.map { |access_type| I18n.t("errors.mutation.#{access_type}") }
        raise GraphQL::ExecutionError, errors_messages
      end
    end
  end
end
