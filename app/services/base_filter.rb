class BaseFilter
  def regular_filter(filter_key)
    filter_value = params[filter_key]
    return if filter_value.nil?

    -> { where(filter_key => filter_value) }
  end
end
