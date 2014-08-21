class CaseFiltersController < ApplicationController
  respond_to :json

  def index
    respond_with(CaseFilter.all)
  end
end
