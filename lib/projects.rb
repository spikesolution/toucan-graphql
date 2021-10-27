class Projects
  PROJECTS_API = "https://api.thegraph.com/subgraphs/name/co2ken/tokenizer"

  def self.list
    client = GraphQlClient.new

    body = """
{
  projects(orderBy: timestamp) {
    id
    projectId
  }
}
    """

    json = client.query(body: body, url: PROJECTS_API)
    rtn = JSON.parse(json).dig("data", "projects")
  end
end
