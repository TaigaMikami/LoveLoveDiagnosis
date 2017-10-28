require 'net/http'
require 'json'
require 'open-uri'
require 'FileUtils'

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
  get_image(url_name)
  lovePower1 = obj[0]["scores"]["happiness"]
  lovePower2 = obj[1]["scores"]["happiness"]
  puts lovePower1
  puts lovePower2

  return ((lovePower1 + lovePower2)/2*100).floor
end

# puts azure.class
def get_image(url)
  # fileName = File.basename(url)
  fileName = "public/download_img/#{File.basename(url)}"

  open(fileName, 'wb') do |output|     #※１
    open(url) do |data|
      output.write(data.read)          #※２
    end
  end
end


# def get_image(url)
#   open("../../public/download_img/#{File.basename(url)}", 'wb') do |file|
#     file.puts(Net::HTTP.get_response(URI.parse(url)).body)
#   end
# end
