class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :destroy, :edit, :update]

  def index
    @subjects = Subject.order(created_at: :desc).paginate page: params[:page]
  end

  def show
    @tasks = @subject.tasks
  end

  def new
    @subject = Subject.new
    2.times{@subject.tasks.build}
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:info] = t "createSubject"
      redirect_to subjects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      redirect_to subject_path
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = t "deletedSubject"
    redirect_to subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description,
      tasks_attributes: [:id, :name, :description, :_destroy]
  end

  def find_subject
    @subject = Subject.find_by id: params[:id]
    if @subject.nil?
      flash[:danger] = t "existedSubject"
      redirect_to subjects_path
    end
  end
end
