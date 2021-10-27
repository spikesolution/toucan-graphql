#!/usr/bin/env ruby

require "json"
require "uri"
require "net/http"
require "sinatra"

require "./lib/graphql_client"
require "./lib/projects"
require "./lib/batches"

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
