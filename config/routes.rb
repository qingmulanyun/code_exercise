Rails.application.routes.draw do
  root 'welcome#index'
  get 'contacts' => 'contacts#index'
  get '/contacts/upload' => 'contacts#upload'

  post '/contacts/do_upload' => 'contacts#do_upload'
end
