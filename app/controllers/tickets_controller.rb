class TicketsController < ApplicationController
  def index
    @tickets = policy_scope(Ticket)
  end

  def show
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
  end

  private

  def strongparams
    params.require("ticket").permit(:status, :photo_1, :photo_2, :photo_3, :user, :city, :postal_code, :tune_up, :brakes, :flat_tire, :chain, :gears, :wheels, :frame, :other, :description)
  end
end
