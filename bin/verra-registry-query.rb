#!/usr/bin/env ruby

#######################################################################
# This script is deprecated. The code is left here for reference only #
#######################################################################

require "json"
require "uri"
require "net/http"

require "pry-byebug"

# e.g. serial number:
# 10643-233905433-233912432-VCS-VCU-279-VER-BR-1-896-01012012-30062012-0

query = {
  program: "VCS",
  resourceIdentifier: "896",
  serialStart: "233905433",
  serialEnd: "233912432",
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
