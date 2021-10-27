# Toucan

Code to interact with the [Toucan Protocol](https://toucan.earth/) [sub-graph](https://thegraph.com/hosted-service/subgraph/co2ken/tokenizer?selected=playground)

Clicking on the serial number of a batch queries the [Verra Registry](https://registry.verra.org/) and displays any data returned.

## Run

Requires [ruby](https://www.ruby-lang.org) version >= 2.7.1

```
bundle install
./bin/server.rb
```

Then visit `http://localhost:4567`
