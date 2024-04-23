class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
  #This counter_cache tells Rails to automatically increment/decrement the "comments_count" column
  #in the "post" table whenever a comment is added or removed.

  # This counter_cache requires a field in the Post model named modelName_count
  # The counter_cache option makes sure the number in that field automatically
  # updates whenever a response is added or removed. More information here:
  # https://blog.appsignal.com/2018/06/19/activerecords-counter-cache.html

  validates :body, presence: true
end
