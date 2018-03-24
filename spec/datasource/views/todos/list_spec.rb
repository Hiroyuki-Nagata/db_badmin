require_relative '../../../spec_helper'

describe Datasource::Views::Todos::List do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/datasource/templates/todos/list.html.erb') }
  let(:view)      { Datasource::Views::Todos::List.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end
