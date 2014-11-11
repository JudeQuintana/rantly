class Search
  attr_reader :search_text

  def initialize(search_text)
    @search_text = search_text
  end

  def results
    unless @search_text.nil?
      @users = User.where('last_name ilike ? ', "%#{@search_text}%")
      return @rants = Rant.where(user: @users)
    end

    []
  end


end