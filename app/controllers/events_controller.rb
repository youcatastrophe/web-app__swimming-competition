MyApp.get "/events/new" do
  erb :"events/new_event"
end

MyApp.post "/events/create" do
  x = Event.new
  x.name = params["new_event"] 
  x.num_entries = params["new_entries"]
  x.start_time = params["new_time"]
  x.save
  redirect "/events"
end

MyApp.get "/events" do
  @events = Event.all
  erb :"events/all_events"
end

MyApp.get "/events/edit/:id" do
  @event = Event.find_by_id(params[:id])
  erb :"events/edit_event"
end

MyApp.post "/events/process_edit/:id" do
  @event = Event.find_by_id(params[:id])
  @conference.name = params["edit_event"]
  @conference.num_entries = params["edit_entries"]
  @conference.start_time = params["edit_time"]
  @conference.save
  erb :"updated"
end