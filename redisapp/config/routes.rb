Rails.application.routes.draw do
  get 'emails' => "emails#index"

  post 'emails/standard'
  post 'emails/delayed'

   root 'letters#index'
   resources :letters, only: [:index] do
     member do
      patch :upvote 
      patch :downvote
     end
   end
end
