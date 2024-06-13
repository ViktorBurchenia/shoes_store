module OrdersServices
  class Filter < ::BaseFilter
    def initialize(params, orders = nil)
      @params = params
      @orders = orders || Order.all
    end

    def call
      filtered_collection
    end

    private

    attr_reader :params, :orders

    def filtered_collection
      scope_filters.reduce(orders, :merge)
    end

    def scope_filters
      [
        id_filter,
        address,
        city,
        state,
        status,
        size,
        zip_code,
        shoe_id,
        user_id
      ].compact
    end

    def id_filter
      regular_filter(:id)
    end

    def address
      regular_filter(:address)
    end

    def city
      regular_filter(:city)
    end

    def state
      regular_filter(:state)
    end

    def status
      regular_filter(:status)
    end

    def size
      regular_filter(:size)
    end

    def zip_code
      regular_filter(:zip_code)
    end

    def shoe_id
      regular_filter(:shoe_id)
    end

    def user_id
      regular_filter(:user_id)
    end
  end
end
