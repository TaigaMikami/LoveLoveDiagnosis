require 'net/http'
require 'json'

def azure(url_name='')
  # NOTE: You must use the same region in your REST call as you used to obtain your subscription keys.
  #   For example, if you obtained your subscription keys from westcentralus, replace "westus" in the
  #   URL below with "westcentralus".
  uri = URI('https://westus.api.cognitive.microsoft.com/emotion/v1.0/recognize')
  uri.query = URI.encode_www_form({
  })

  request = Net::HTTP::Post.new(uri.request_uri)
  # Request headers
  request['Content-Type'] = 'application/json'
  # NOTE: Replace the "Ocp-Apim-Subscription-Key" value with a valid subscription key.
  request['Ocp-Apim-Subscription-Key'] = 'c6d20fe2fac346469a785780b8e918e1'
  # Request body
  request.body = "{\"url\":\"#{url_name}\"}"

  response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
  end

  obj = JSON.load(response.body)
  # obj = response.body

  return obj[0]["scores"]["happiness"]
end

# puts azure.class

def lovePower(boy_url='', girl_url='')
  boy_love_power = azure(boy_url)
  girl_love_power = azure(girl_url)
  puts boy_love_power
  puts girl_love_power
  return (boy_love_power + girl_love_power) * 100 / 200 * 100
end
