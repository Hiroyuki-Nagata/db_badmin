module Datasource::Controllers::Todos
  class Destroy
    include Datasource::Action

    def call(params)
      repository = TodoRepository.new
      @todo = repository.delete(params[:id]) if params[:id]
    end
  end
end
