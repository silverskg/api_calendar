class EventsController < ApplicationController
  def index
    # イベントデータの一覧を返す
    render json: Event.all
  end

  def show
    # 指定したidのイベントを返す
    render json: Event.find(params[:id])
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event
    else
      render json: event.errors, status: 422
    end
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      render json: event
    else
      render json: event.errors, status: 422
    end
  end

  private

  def event_params
    params.require(:event).permit(:id, :name, :start, :end, :timed, :description, :color)
  end
end
