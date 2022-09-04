class Api::ContestsController < ApplicationController
  def index
    @contest = if params[:name] && params[:timings]
                 Contest.where(name: params[:name], timings: params[:timings])
               else
                 Contest.order('created_at DESC')
               end
    render json: {
      status: 'SUCCESS', message: 'Loaded contests', data: @contest
    }, status: :ok
  end

  def create
    @contest = Contest.new(contest_params)

    if @contest.valid? && @contest.save
      render json: {
        status: 'SUCCESS', message: 'Contest is saved', data: @contest
      }, status: :ok
    else
      render json: {
        status: 'Error', message: 'Contest is not saved', data: @contest.errors
      }, status: :unprocessable_entity
    end
  end

  private

  def contest_params
    params.permit(:name, :description, :platform, :registration, :timings)
  end
end
