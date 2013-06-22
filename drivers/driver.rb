require "iron_worker_ng"
client = IronWorkerNG::Client.new(:token => "WLPyjw8B6dT634OMhKrQyySTYY0", :project_id => "51c533ae2267d8502c003422")
# launch 100 tasks in parallel
10.times do
  client.tasks.create("hello", foo: "bar")
end
