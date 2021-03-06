require_relative '../../../spec_helper'

describe Datasource::Views::Page::Home do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/datasource/templates/page/home.html.erb') }
  let(:view)      { Datasource::Views::Page::Home.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end
