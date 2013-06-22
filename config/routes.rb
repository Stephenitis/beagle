Beagle::Application.routes.draw do
  post '/search_bills' => 'billssearch#search_sunlight_for_bill'
end
