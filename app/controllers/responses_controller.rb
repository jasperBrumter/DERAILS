class ResponsesController < ApplicationController
  def index
    @responses = policy_scope(Response)
  end

  def show
    @response = Response.find(params[:id])
    authorize @response
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @response = Response.new(strongparams)
    @response.ticket = @ticket
    @response.user = current_user
    authorize @response
    if @response.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def destroy
    @response = Response.find(params[:id])
    authorize @response
    @response.destroy
  end

  private

  def strongparams
    params.require(:response).permit(:content, :price, :contact)
  end
end
