#!/usr/bin/env ruby

require "json"
require "uri"
require "net/http"
require "sinatra"

require "./lib/graphql_client"
require "./lib/projects"

configure do
  set :views, "./views"
end

get "/" do
  erb :index
end

get "/batch_tokens" do
  erb :batch_tokens
end

get "/projects" do
  erb :projects, locals: { list: Projects.list }
end
