class RecordsSliceService
  def self.slice(data, sort_by, pagination)
    sort_by ||= { created_at: :desc }
    data = data.reorder(sort_by)
    paginate(data, pagination)
  end

  def self.paginate(data, pagination)
    page = pagination[:page]
    limit = pagination[:limit]
    data.page(page).per(limit)
  end
end
