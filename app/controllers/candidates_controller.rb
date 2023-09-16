class CandidatesController < ApplicationController
  
  def index
    @candidates = Candidate.all.order(id: :asc)
  end

  def show
    set_candidate
  end

  def create
    @candidate = Candidate.new candidate_params
    if @candidate.save
      flash[:notice] = "Candidate created"
      redirect_to candidate_path(@candidate)
    else
      flash[:alert] = @manager.errors.full_messages.join(',')
    end
  end

  def update
    set_candidate
    if @candidate.update candidate_params
      redirect_to candidate_path(@candidate), notice: "Candidate updated"
    else
      flash[:alert] = @candidate.errors.full_messages.join(', ')
    end
  end

  def destroy
    set_candidate
    if @candidate.destroy
      redirect_to candidates_path, alert: "Candidate deleted"
    else
      flash[:alert] = @candidate.errors.full_messages.join(', ')
    end
  end

  private

  def set_candidate
    @candidate = Candidate.find params[:id]
  end

  def candidate_params
    params.require(:candidate).permit!  
  end

end
