require 'spec_helper'

describe CasesController do
  describe 'index' do
    it "responds with 200 response code" do
      get :index, format: 'json'

      expect(response).to be_success
    end

    it 'returns the list of cases filtered by case filter id in json format' do
      caze1 = create(:case)
      caze2 = create(:case)
      case_filter1 = create(:case_filter)
      case_filter2 = create(:case_filter)
      caze1.case_filters = [case_filter1]
      caze1.save
      caze2.case_filters = [case_filter2]
      caze2.save

      get :index, format: 'json', filter_id: case_filter2.id

      cases = JSON.parse(response.body)
      expect(cases.size).to eq(1)
      expect(cases.first['name']).to eq(caze2.name)
    end
  end

  describe 'replace_labels' do
    it 'responds with head ok' do
      caze = create(:case)
      label = create(:label)

      response = post :replace_labels, id: caze.id, label_ids: label.id, format: 'json'

      expect(response).to be_success
    end

    it 'sets the labels to the given labels on the given case' do
      caze = create(:case)
      label1 = create(:label)
      label2 = create(:label)
      expect(caze.labels).to be_empty

      response = post :replace_labels, id: caze.id, label_ids: [label1.id, label2.id], format: 'json'

      expect(caze.reload.labels.size).to eq(2)
    end

    it 'clears up the labels on the given case when no label is given' do
      caze = create(:case)
      label1 = create(:label)
      label2 = create(:label)
      caze.labels = [label1, label2]
      caze.save

      response = post :replace_labels, id: caze.id, label_ids: nil, format: 'json'

      expect(caze.reload.labels).to be_empty
    end
  end
end
