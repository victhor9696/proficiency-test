class ClassRoomsController < ApplicationController
  layout "application"
  before_filter :load_attr

  def index
    @classrooms = ClassRoom.all
  end

  def new
  	@classroom = ClassRoom.new
  end

   def find
    @classroom = ClassRooms.where("student_id = :id or course_id  = :id",
    	:id => params[:term])
    respond_to do |format|
      format.json { render json: @student }
    end
  end

  def edit
    @classroom = ClassRoom.find(params[:id])
  end

  def create
    @classroom = ClassRoom.new(classroom_params)
    respond_to do |format|
  
      if @classroom.save
      	flash[:success] = 'Matricula salvo com sucesso' 
        format.html { redirect_to '/classrooms' }
      else
        flash[:danger] = 'Preencha todos os campos e um aluno nao pode ser cadastrado no mesmo curso mais de uma vez.' 
        format.html { render action: "new" }
       end
    end
  end

  def save
    @classroom = ClassRoom.find(classroom_params['id'])
    respond_to do |format|
      if @classroom.update_attributes(classroom_params) == 'error'
        flash[:success] = 'Aluno já esta matriculado nesse curso.' 
        format.html { redirect_to '/classrooms' }
      end

      if @classroom.update_attributes(classroom_params)
        flash[:success] = 'Aluno salvo com sucesso' 
        format.html { redirect_to  '/classrooms'}
      else
      	flash[:danger] = 'Preencha os dados corretamente' 
        format.html { render action: "edit" }
      end
    end
  end

  def classroom_params
    params.require(:classroom).permit(:id,:student_id, :course_id,:entry_at)
  end

  def load_attr
    @courses = Course.where("status > :status",status: 0)
    @students = Student.where("status > :status",status: 0)
  end

end