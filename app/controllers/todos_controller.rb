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

  def show
    @todo = Todo.find_by(id: params[:id])
  end

  def update
    @todo = current_user.todos.find_by(id: params[:id])
    if @todo.update_attribute(:done, params[:todo][:done].to_i)
      # Post to facebook only if done is true
      if @todo.done
        # check if app has corrent permission
        if current_user.post_permission?
          # Post the content of To-do item to user's facebook wall
          FbGraph::User.me(current_user.oauth_token).feed!( :message => @todo.content )
        end
      end
    end
    redirect_to root_path

  end

  def destroy
    @todo = current_user.todos.find_by(id: params[:id])
    @todo.destroy
    redirect_to root_url
  end

  private
    def todo_params
      params.require(:todo).permit(:content)
    end
end
