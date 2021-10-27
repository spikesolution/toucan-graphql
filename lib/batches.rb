class Batch
  attr_reader :id, :quantity, :serial_numbers

  def initialize(hash)
    @id = hash.fetch("id")
    @quantity = hash.fetch("quantity")
    @serial_numbers = hash.fetch("serialNumber")
  end
end

class Batches
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
    JSON.parse(json).dig("data", "batchTokens").map { |hash| Batch.new(hash) }
  end
end
