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
      @todo_items = current_user.todolist
      render 'todos/index'
    end
  end

  def update
    @todo = current_user.todos.find_by(id: params[:id])
    if @todo.update_attribute(:done, params[:todo][:done].to_i)
      if @todo.done
        if current_user.post_permission?
          FbGraph::User.me(current_user.oauth_token).feed!( :message => @todo.content )
        end
      end
    end
    @todo = current_user.todos.build
    @todo_items = current_user.todolist
    render 'todos/index'

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
