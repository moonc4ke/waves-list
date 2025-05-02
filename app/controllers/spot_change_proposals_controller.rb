class SpotChangeProposalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_surf_spot, only: [ :new, :create, :index ]
  before_action :set_proposal, only: [ :show, :vote_up, :vote_down ]

  # GET /surf_spots/:surf_spot_id/spot_change_proposals
  def index
    @proposals = @surf_spot.spot_change_proposals.order(created_at: :desc)
  end

  # GET /spot_change_proposals/:id
  def show
  end

  # GET /surf_spots/:surf_spot_id/spot_change_proposals/new
  def new
    @proposal = @surf_spot.spot_change_proposals.new
  end

  # POST /surf_spots/:surf_spot_id/spot_change_proposals
  def create
    @proposal = @surf_spot.spot_change_proposals.new(proposal_params)
    @proposal.user = Current.user

    # Set the old value from the current surf spot
    @proposal.old_value = @surf_spot.send(@proposal.field_name) if @surf_spot.has_attribute?(@proposal.field_name)

    if @proposal.save
      redirect_to @proposal, notice: "Change proposal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # POST /spot_change_proposals/:id/vote_up
  def vote_up
    @proposal.upvote!
    redirect_to @proposal, notice: "You upvoted this proposal."
  end

  # POST /spot_change_proposals/:id/vote_down
  def vote_down
    @proposal.downvote!
    redirect_to @proposal, notice: "You downvoted this proposal."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surf_spot
      @surf_spot = SurfSpot.find(params[:surf_spot_id])
    end

    def set_proposal
      @proposal = SpotChangeProposal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proposal_params
      params.require(:spot_change_proposal).permit(:field_name, :new_value)
    end

    def authenticate_user!
      redirect_to sign_in_path, alert: "Please sign in to continue." unless Current.user
    end
end
