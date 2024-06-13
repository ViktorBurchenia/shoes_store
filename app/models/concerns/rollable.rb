module Rollable
  extend ActiveSupport::Concern

  ALLOWED_ACCESS_TYPES = %i[
  only_for_customers
  only_for_managers
  ].freeze

  def access?(*access_types)
    access_types.flatten.any? { |access_type| singular_access?(access_type) }
  end

  private

  def singular_access?(access_type) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
    return false if ALLOWED_ACCESS_TYPES.exclude?(access_type)

    case access_type
    when :only_for_customers then customer?
    when :only_for_managers  then manager?
    else false
    end
  end
end
