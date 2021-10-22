#!/usr/bin/env ruby

require "json"
require "uri"
require "net/http"

require "pry-byebug"

query = {
  program: "VCS",
  resourceIdentifier: "1742",
  serialStart: "88242454",
  serialEnd: "88267453",
}

API_URL = "https://registry.verra.org/uiapi/asset/asset/search"
# API_URL = "http://localhost:9999/uiapi/asset/asset/search"

params = {
  "maxResults": 2000,
  "$count": true,
  "$skip": 0,
  "$top": 50,
}

querystring = params.map { |k,v| [k, v].join("=") }.join("&")
url = [API_URL, querystring].join("?")

headers = {
  "Accept" => "application/json",
  "Content-Type" => "application/json",
}

json = query.to_json
puts json

uri = URI.parse(url)
resp = Net::HTTP.post(uri, json, headers)

puts resp.body
