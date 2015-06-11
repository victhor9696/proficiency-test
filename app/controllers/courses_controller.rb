class CoursesController < ApplicationController
  layout "application"
  before_filter :load

  def index
    @courses = Course.all
  end

  def new
  	@course = Course.new
  end

   def find
    @student = Course.where("name LIKE :name or description LIKE :name",
    	:name => "%"+params[:term]+"%")
    respond_to do |format|
      format.json { render json: @student }
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
      	flash[:success] = 'Curso salvo com sucesso' 
        format.html { redirect_to '/courses' }
      else
      	flash[:danger] = 'Preencha os dados corretamente' 
        format.html { render action: "new" }
      end
    end
  end

  def save
    @course = Course.find(course_params['id'])
    respond_to do |format|
      if @course.update_attributes(course_params)
        flash[:success] = 'Curso salvo com sucesso' 
        format.html { redirect_to  '/courses'}
      else
      	flash[:danger] = 'Preencha os dados corretamente' 
        format.html { render action: "edit" }
      end
    end
  end

  def course_params
    params.require(:course).permit(:id,:name, :status, :description)
  end

  def load
  	@status = Course.status_arr
  end

end