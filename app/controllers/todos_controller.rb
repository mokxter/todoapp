class TodosController < ApplicationController
  def index
    if logged_in?
      @todo = current_user.todos.build
      @todo_items = current_user.todolist
    end
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to root_url
    else
      @todo_items = []
      render 'todos/index'
    end
  end

  def update
  end

  def destroy
    @todo = current_user.todos.find_by(id: params[:id])
    @todo.destroy
    flash[:success] = "Todo deleted"
    redirect_to root_url
  end

  private
    def todo_params
      params.require(:todo).permit(:content)
    end
end
