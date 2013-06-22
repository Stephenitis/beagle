Beagle::Application.routes.draw do
  get "widget/show"

  post '/search_bills' => 'billssearch#search_sunlight_for_bill'
end
