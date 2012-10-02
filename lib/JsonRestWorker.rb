require 'HTTParty'
require 'JSON'

class JsonRESTWorker
  def initialize(target_url)
    @json_result = nil
    @url = target_url
  end

  def run
    response = HTTParty.get(@url)
    @json_result = JSON.parse(response.body, {:symbolize_names => true})
  end

  def get_json
    @json_result
  end
end
