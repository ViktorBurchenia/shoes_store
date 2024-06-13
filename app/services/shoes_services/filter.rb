module ShoesServices
  class Filter < ::BaseFilter
    def initialize(params, shoes = nil)
      @params = params
      @shoes = shoes || Shoe.all
    end

    def call
      filtered_collection
    end

    private

    attr_reader :params, :shoes

    def filtered_collection
      scope_filters.reduce(shoes, :merge)
    end

    def scope_filters
      [
        brand_name,
        category,
        color,
        model,
        id_filter,
        size,
        price,
        search_filter
      ].compact
    end


    def brand_name
      regular_filter(:brand_name)
    end

    def category
      regular_filter(:category)
    end

    def color
      regular_filter(:color)
    end

    def model
      regular_filter(:model)
    end

    def id_filter
      regular_filter(:id)
    end

    def size
      regular_filter(:size)
    end

    def price
      regular_filter(:price)
    end

    def search_filter
      search_input = params[:search_input]
      return if search_input.blank?

      -> { by_query(search_input) }
    end
  end
end
