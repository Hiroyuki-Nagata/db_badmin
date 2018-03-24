require_relative '../../../spec_helper'

describe Datasource::Controllers::Todos::List do
  let(:action) { Datasource::Controllers::Todos::List.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
