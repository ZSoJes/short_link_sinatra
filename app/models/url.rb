class Url < ActiveRecord::Base
# @@contador = 0
validates :long_url, presence: true, uniqueness: true
# validates :click_count, presence: true
# def initialize(long_url)
#     @long_url = long_url
# end
# n = 1
    
    before_create :create_url_short
  def create_url_short(long_url)

    if self.long_url != nil
        # self.short_url = long_url[0..4]
        # self.increment_counter(:click_count, :id)

        uri = URI.parse(self.long_url)

         if uri.scheme == "http" || uri.scheme == "https"
        
            var = []
            6.times{ rand(0..1) == 1 ? var << rand(97..122).chr : var << rand(0..9) }

             self.short_url = "#{uri.scheme}.cow.lo/#{var.join}"
        else

              self.short_url="no valido"
        end


        #self.click_count + 1
        # self.click_count += 2
        # self.click_count += 1
# @@contador += 1
        # self.click_count = @@contador
        
        # self.increment(:click_count)
        # click_count.save
        # click_count.reload
       # self.click_count.save
    end # if

  end#metodo

end
