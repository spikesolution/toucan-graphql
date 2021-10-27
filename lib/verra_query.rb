class VerraQuery
  attr_reader :serial_number

  REGISTRY_SEARCH_URL = "https://registry.verra.org/uiapi/asset/asset/search"

  HEADERS = {
    "Accept" => "application/json",
    "Content-Type" => "application/json",
  }

  COMMON_PARAMS = {
    "maxResults": 2000,
    "$count": true,
    "$skip": 0,
    "$top": 50,
  }

  def initialize(str)
    @serial_number = str
  end

  def program
    components[3]
  end

  def resource_identifier
    components[9]
  end

  def serial_start
    components[1]
  end

  def serial_end
    components[2]
  end

  def result
    @result ||= begin
      json = query.to_json
      uri = URI.parse(url)
      resp = Net::HTTP.post(uri, json, HEADERS)
      JSON.parse(resp.body)
    end

    @result["totalCount"] == 1 ? @result["value"][0] : nil
  end

  private

  def url
    querystring = COMMON_PARAMS.map { |k,v| [k, v].join("=") }.join("&")
    [REGISTRY_SEARCH_URL, querystring].join("?")
  end

  def query
    {
      program: program,
      resourceIdentifier: resource_identifier,
      serialStart: serial_start,
      serialEnd: serial_end,
    }
  end

  def components
    @comp ||= @serial_number.split("-")
  end

end
