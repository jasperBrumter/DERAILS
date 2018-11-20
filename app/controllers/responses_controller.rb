class ResponsesController < ApplicationController
  def index
    @responses = policy_scope(Response)
  end

  def show
    @response = Response.find(params[:id])
    authorize @response
  end

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @response = Response.new
    authorize @response
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @response = Response.new(strongparams)
    @response.ticket = @ticket
    # authorize @response
    # @response.user = current_user
    # if @response.save
    #   redirect_to response_path(@response)
    # else
    #   render :new
    # end
  end

  def destroy
    @response = Response.find(params[:id])
    authorize @response
    @response.destroy
  end
end
