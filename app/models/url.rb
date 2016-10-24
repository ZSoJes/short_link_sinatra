class Url < ActiveRecord::Base
validates :long_url, presence: true, uniqueness: true

# def initialize(long_url)
#     @long_url = long_url
# end

    before_create :create_url_short


  def create_url_short

    if self.long_url != nil

        # long_url
        self.short_url = long_url[0..4]
    end
  end

end
