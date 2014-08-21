class CasesController < ApplicationController
  respond_to :json

  def index
    cases = Case.includes(:case_filters).where("case_filters.id" => params[:filter_id])
    respond_with(cases.as_json(include: :labels))
  end

  def replace_labels
    caze = Case.find(params[:id])
    labels = params[:label_ids].present? ? Label.where(id: params[:label_ids]) : []
    caze.labels = labels
    caze.save!
    head :ok
  end
end
