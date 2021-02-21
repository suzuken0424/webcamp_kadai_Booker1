
Rails.application.routes.draw do
  # Fordetails on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'books#top'
  get 'books' => 'books#index'
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destory', as: 'destory_book'
end
