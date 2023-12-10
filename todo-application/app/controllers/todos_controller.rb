class TodosController < ApplicationController
  # その他のアクション...

  def index
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path, notice: 'タスクが正常に作成されました。'
    else
      render :new
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path, notice: 'タスクが更新されました。'
    else
      render :edit
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path, notice: 'タスクが削除されました。'
  end

  def show
    @todo = Todo.find(params[:id])
  end
  private

  def todo_params
    params.require(:todo).permit(:title)
  end

end
