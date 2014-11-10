module RantsHelper

  def sort_by_fav_count(rant_collection)
    rant_collection.sort_by { |rant| rant.favorites.count }.reverse
  end

end