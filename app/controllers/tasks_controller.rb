class TasksController < ApplicationController
 # TasksControllerクラスはApplicationRecordクラスを継承している。
 # ApplicationRecordクラスが定義されたファイルはapp/controllers/application_controller.rb
 
  def index
    #@tasks = Task.order(created_at: :desc).page(params[:page]).per(5)
    #ページネーションで１ページに5個のタスクずつ、降順。
    #@tasks = Task.all.page(params[:page]).per(5) にすると、昇順になる。
    @tasks = current_user.tasks.page(params[:page]).per(5)
  end
 
  def show
    #@task = Task.find(params[:id])
    @task = current_user.tasks.find_by(id: params[:id])
    redirect_to root_url if @task.blank?
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    #Taskのインスタンスを生成するときにStrong Parameterが使用される
    #ログインしているユーザーのみがタスクデータを入力できる
    if @task.save
    # if文による条件分岐と、@taskの保存を同時に行っている
    # @task.saveは成功するとtrueを返し、失敗するとfalseを返す
      flash[:success] = 'タスクが正常に入力されました。'
      redirect_to @task
    #showルーティング(tasks/:id)に飛ばす。app/views/tasks/show.html.erbが表示される。
    else
      flash.now[:danger] = 'タスクが入力されませんでした。'
      render :new
    # app/views/tasks/new.html.erbが表示される。
    end
  end

  def edit
    #@task = Task.find(params[:id])
    @task = current_user.tasks.find(params[:id])
  end

  def update
    #@task = Task.find(params[:id])
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'タスクが正常に更新されました。'
      redirect_to @task
    #showルーティング(tasks/:id)に飛ばす。app/views/tasks/show.html.erbが表示される。
    else
      flash.now[:danger] = 'タスクが更新されませんでした。'
      render :edit
    # app/views/tasks/edit.html.erbが表示される。
    end
  end
  
  def destroy
    #@task = Task.find(params[:id])
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    
    flash[:success] = "タスクは正常に削除されました"
    redirect_to tasks_url
  end
end

private

#Strong Parameter
def task_params
  params.require(:task).permit(:task, :description, :status)
end
 
 