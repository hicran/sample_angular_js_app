class LabelsController < ApplicationController
  respond_to :json

  def index
    respond_with(Label.all)
  end

  def create
    Label.create!(label_params)
    head :ok
  end

  private

  def label_params
    params.require(:label).permit(:name, :description)
  end
end
