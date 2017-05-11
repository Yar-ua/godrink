module GmapDotsHelper
  
  #def gmap_dots_to_json (array_hash)
  #	@a = []
  #	array_hash.each do |hash|
  #	  @a << hash
  #	end
  #	return @a
  #end

  def gmap_dots_to_json (array_hash)
  	@json = []
  	array_hash.each do |hash|
  	  @json << { lat: hash.lat, lon: hash.lon, title: hash.title, html: hash.html, 
  	  			icon: 'http://maps.google.com/mapfiles/marker.png' }.to_json
  	end

  	# 'values: <%= JSON.parse(@json_stata_l_na_100_km) %>'
  	return @json
  end

end
