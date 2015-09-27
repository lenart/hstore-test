class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find params[:id]
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new candidate_params

    if @candidate.save
      redirect_to :candidates
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.find params[:id]
  end

  def update
    @candidate = Candidate.find params[:id]
    if @candidate.update_attributes candidate_params
      redirect_to :candidates, notice: "Updated"
    else
      render :edit
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit!
  end
end
