class TicketsController < ApplicationController
  def index
    @tickets = policy_scope(Ticket).where(status: "pending")

    @tickets = @tickets.where.not(latitude: nil, longitude: nil)

    if params["wheels"] or params["tune_up"] or params["brakes"] or params["flat_tire"] or params["chain"] or params["gears"] or params["frame"] or params["other"]
      paramHash = {}

      paramHash[:wheels] = true if params["wheels"]
      paramHash[:brakes] = true if params["brakes"]
      paramHash[:flat_tire] = true if params["flat_tire"]
      paramHash[:chain] = true if params["chain"]
      paramHash[:gears] = true if params["gears"]
      paramHash[:frame] = true if params["frame"]
      paramHash[:tune_up] = true if params["tune_up"]
      paramHash[:other] = true if params["other"]
      @tickets = @tickets.where(paramHash)
    end



    @markers = @tickets.map do |ticket|
      {
        lng: ticket.longitude,
        lat: ticket.latitude
      }
    end
  end

  def show
    @user = current_user
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(strongparams)
    authorize @ticket
    @ticket.user = current_user
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(strongparams)
    authorize @ticket
    redirect_to ticket_path(@ticket)
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    @ticket.destroy
    redirect_to dashboard_path
  end

  def details
    @ticket = Ticket.find(params[:id])
    @response = Response.new
    authorize @ticket
  end

  def change_status
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    @ticket.status = "completed"
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  private

  def strongparams
    params.require("ticket").permit(:status, :photo_1, :photo_2, :photo_3, :user, :city, :postal_code, :tune_up, :brakes, :flat_tire, :chain, :gears, :wheels, :frame, :other, :description, :address, :specific_details)
  end
end
