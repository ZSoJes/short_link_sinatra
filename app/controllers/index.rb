get '/' do
   # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
   @urls = Url.all
   # @dato = Url.find_by(long_url: params[:long_url])

   erb :index
end

post '/urls' do
  # crea una nueva Url
  @short_url = params[:long_url]
  
  puts @short_url
  # puts :long_url
  instancia = Url.new
  @short_url = instancia.create_url_short

  @url = Url.create(long_url: params[:long_url], short_url: @short_url)

  if @url.save
    # instancia.update(params[:long_url])

    @short_url
    redirect to('/')
    # erb :short_url
    erb :index
  else 
    redirect to('/error')
  end

end

get '/error' do
  erb :error
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  puts "::::::::::::::::::::::: "
  @url_click = params[:short_url]  
    x = Url.find_by({short_url: @url_click})
    x.click_count += 1
    x.save
    # cont.click_count = cont.id

    # cont.save
 redirect to ("/#{x.long_url}")
  # erb :index
end