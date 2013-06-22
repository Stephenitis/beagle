Beagle::Application.routes.draw do
  get "widget/show"

  post '/search_bills' => 'billssearch#search_sunlight_for_bill'
  # post '/search_bills' => 'billssearch#search_sunlight_for_bill'
  root to: "home#home_page"
  post "/search_bills" => "home#search"
end
