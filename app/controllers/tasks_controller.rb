class TasksController < ApplicationController
  before_action :set_task, only: %i[ edit update destroy ]

  # GET /tasks or /tasks.json
  def index # get all
    @tasks = Task.all # fica disponivel nas views
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        #redirect_to task_url(@task), notice: "Tarefa foi criada com sucesso." 
        redirect_to tasks_path, notice: "Tarefa foi criada com sucesso." 
      else
        flash.now[:alert] = @task.errors.full_messages.to_sentence
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        # format.html { redirect_to task_url(@task), notice: "Tarefa foi modificada com sucesso." }
        # format.json { render :show, status: :ok, location: @task }
        redirect_to tasks_path, notice: "Tarefa foi modificada com sucesso." 
      else
        flash.now[:alert] = @task.errors.full_messages.to_sentence
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Tarefa foi deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:description, :due_date, :done)
  end
end
