class Search
  attr_reader :search_text

  def initialize(search_text)
    @search_text = search_text
  end

  def results
    if @search_text.nil?
      []
    else
      search_text = search_format
      @users = User.where('last_name ilike :search or first_name ilike :search or username ilike :search', search: search_text)
      @rants = (Rant.where(user: @users) + Rant.where('title ilike :search or body ilike:search', search: search_text)).uniq
    end

  end

  def search_format
    "%#{@search_text}%"
  end


end