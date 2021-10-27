#!/usr/bin/env ruby

require "json"
require "uri"
require "net/http"
require "sinatra"

require "./lib/graphql_client"
require "./lib/projects"
require "./lib/batches"
require "./lib/verra_query"

configure do
  set :views, "./views"
end

get "/" do
  erb :index
end

get "/batches" do
  erb :batches, locals: { list: Batches.list }
end

get "/projects" do
  erb :projects, locals: { list: Projects.list }
end

get "/verra_registry_search" do
  serial_number = params.fetch("serial_number")
  data = VerraQuery.new(serial_number).result
  erb :verra_registry_search, locals: { serial_number: serial_number, data: data }
end
