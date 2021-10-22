class GraphQlClient
  def query(params)
    body = params.fetch(:body)
    json = {query: body}.to_json
    uri = URI.parse(params.fetch(:url))
    resp = Net::HTTP.post(uri, json)
    resp.body
  end
end
