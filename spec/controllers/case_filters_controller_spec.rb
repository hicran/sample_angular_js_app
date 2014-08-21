require 'spec_helper'

describe CaseFiltersController do
  describe 'index' do
    it "responds with 200 response code" do
      get :index, format: 'json'

      expect(response).to be_success
    end

    it 'returns the list of case filters in json format' do
      case_filter = create(:case_filter)

      get :index, format: 'json'

      case_filters = JSON.parse(response.body)
      expect(case_filters.size).to eq(1)
      expect(case_filters.first['name']).to eq(case_filter.name)
    end
  end
end
