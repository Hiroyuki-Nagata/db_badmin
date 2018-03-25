module Datasource::Controllers::Todos
  class Create
    include Datasource::Action
    accept :json
    expose :todo

    def call(params)
      @todo = nil
      if request.post?
        repository = TodoRepository.new
        @json = JSON.parse(request.body.read)
        @todo = repository.create(task: @json['task'], is_completed: @json['isCompleted'] ? 1 : 0)
      end
    end
  end
end
