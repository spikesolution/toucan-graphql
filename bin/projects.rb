#!/usr/bin/env ruby

#######################################################################
# This script is deprecated. The code is left here for reference only #
#######################################################################

require "json"
require "uri"
require "net/http"

require_relative "../lib/graphql_client"

client = GraphQlClient.new

body = """
{
  projects(orderBy: timestamp) {
    id
    projectId
  }
}
"""

API_URL = "https://api.thegraph.com/subgraphs/name/co2ken/tokenizer"

json = client.query(body: body, url: API_URL)

rtn = JSON.parse(json)

pp rtn
