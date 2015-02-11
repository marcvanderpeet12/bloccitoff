class TodosController < ApplicationController

  def index
    @todos = current_user.todos
    @todo = Todo.new

    if params[:search]
      @todos = Todo.search(params[:search]).order("created_at DESC")
    else
      @todos = Todo.all.order('created_at DESC')
    end
    
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if params[:preview_button] #|| !@todo.save
      render :action => 'new'
    elsif
      redirect_to todos_path, notice: 'Your new TODO was saved'
      @user = current_user
      @user.todos << @todo
    end

  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
   @todo = Todo.find(params[:id])
   
   if @todo.update_attributes(todo_params)
    flash[:notice] = "Todo was updated."
    redirect_to @todo
   else
    flash[:error] = "There was an error saving the post. Please try again."
    render :edit
    end 
   end

   def destroy
    @todo = Todo.find(params[:id])
    
    if @todo.destroy  
     flash[:notice] = "Your todo was deleted!"
     redirect_to todos_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end

  end 
 
private
 
 def todo_params
     params.require(:todo).permit(:description)
 end
end