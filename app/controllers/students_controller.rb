class StudentsController < ApplicationController
  layout "application"

  def index
    @students = Student.all
    @status = Student.status_arr
  end

  def new
  	@status = Student.status_arr
  	@student = Student.new
  end

   def find
    @student = Student.where("name LIKE :name or register_number LIKE :register_number",
    	:name => "%"+params[:term]+"%",:register_number => "%"+params[:term]+"%")
    respond_to do |format|
      format.json { render json: @student }
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
  	@status = Student.status_arr
    @student = Student.find(params[:id])
  end

  def create
  	@status = Student.status_arr
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
      	flash[:sucess] = 'Aluno salvo com sucesso' 
        format.html { redirect_to '/students' }
      else
      	flash[:danger] = 'Preencha os dados corretamente' 
        format.html { render action: "new" }
      end
    end
  end

  def save
  	@status = Student.status_arr
    @student = Student.find(student_params['id'])
    respond_to do |format|
      if @student.update_attributes(student_params)
        flash[:success] = 'Aluno salvo com sucesso' 
        format.html { redirect_to  '/students'}
      else
      	flash[:danger] = 'Preencha os dados corretamente' 
        format.html { render action: "edit" }
      end
    end
  end

  def student_params
    params.require(:student).permit(:name, :status, :id, :register_number)
  end

end
