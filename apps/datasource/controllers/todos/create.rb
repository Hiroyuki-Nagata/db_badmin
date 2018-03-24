module Datasource::Controllers::Todos
  class Create
    include Datasource::Action
    accept :json

    def call(params)
      if request.post?
        repository = TodoRepository.new
        @json = JSON.parse(request.body.read)
        @todo = repository.create(task: @json['task'], is_completed: @json['isCompleted'])
      end
    end
  end
end
