class BatchTokens
  BATCH_TOKENS_API = "https://api.thegraph.com/subgraphs/name/co2ken/tokenizer"

  def self.list
    client = GraphQlClient.new

    body = """
{
  batchTokens(where: {serialNumber_not: null, projectVintage: null, confirmationStatus: 0}, orderBy: timestamp) {
    id
    serialNumber
    quantity
  }
}
    """

    json = client.query(body: body, url: BATCH_TOKENS_API)
    rtn = JSON.parse(json).dig("data", "batchTokens")
  end
end
