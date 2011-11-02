class VacanciesController < ApplicationController
  respond_to :html
  
  def index
    @vacancies = Vacancy.approved.not_outdated.page(params[:page]).per(2)
    respond_with(@vacancies)
  end

  def new
    respond_with(@vacancy = Vacancy.new)
  end

  def create
    @vacancy = Vacancy.new(params[:vacancy])
    
    if @vacancy.save
      VacancyMailer.creation_notice(@vacancy).deliver
      flash[:success] = t("vacancies.create.success")
    end
    
    respond_with(@vacancy)
  end

  def show
    @vacancy = Vacancy.find(params[:id])
    respond_with(@vacancy)
  end

  def edit
  end
end
