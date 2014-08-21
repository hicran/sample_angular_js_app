require 'spec_helper'

describe LabelsController do
  describe 'index' do
    it "responds with 200 response code" do
      get :index, format: 'json'

      expect(response).to be_success
    end

    it 'returns the list of labels in json format' do
      label = create(:label)

      get :index, format: 'json'

      labels = JSON.parse(response.body)
      expect(labels.size).to eq(1)
      expect(labels.first['name']).to eq(label.name)
    end
  end

  describe 'create' do
    it 'responds with head ok' do
      post :create, label: {name: 'Name'}

      expect(response).to be_success
    end

    it 'passes the label attributes hash to create method' do
      expect(Label.count).to eq(0)

      post :create, label: {name: 'Name'}


      expect(Label.count).to eq(1)
      expect(Label.first.name).to eq('Name')
    end
  end
end
