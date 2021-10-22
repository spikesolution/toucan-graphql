#!/usr/bin/env ruby

require "json"
require "uri"
require "net/http"

require_relative "../lib/graphql_client"

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

API_URL = "https://api.thegraph.com/subgraphs/name/co2ken/tokenizer"

json = client.query(body: body, url: API_URL)

rtn = JSON.parse(json)

puts "ID, Quantity, Serial Number"
rtn.dig("data", "batchTokens").each do |bt|
  puts [
    bt.fetch("id"),
    bt.fetch("quantity"),
    bt.fetch("serialNumber"),
  ].join(", ")
end
