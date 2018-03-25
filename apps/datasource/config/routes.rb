# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
get '/', to: 'page#home'
get '/home', to: 'page#home'

get '/todos', to: 'todos#list'
post '/todos', to: 'todos#create'
delete '/todos/:id', to: 'todos#destroy'
