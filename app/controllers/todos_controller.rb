class TodosController < ApplicationController

  before_action :set_todo, :only => [:show, :edit, :update, :destroy, :done]
  def index
    @todos = Todo.all.order(:date)

  end

  def new
    @todo = Todo.new  
  end

  def done
    @todo.update(done: !(@todo.done))
  end

  #def show
   # set_todo
  #end

  def create
    @todo= Todo.new(todo_params)

    if @todo.save
      redirect_to todos_path, notice: "新增項目成功"
    else
      # 新增失敗
      render :action => :new
    end

  end

  def update
    #set_todo

    if @todo.update_attributes(todo_params)
    redirect_to todos_path, notice: "項目成功"
    else
      render :action => :edit
    end
  end

  #def edit
   # set_todo
  #end

  def destroy
   # set_todo
    if (@todo.date - Date.today).to_i > 0
      @todo.destroy
      flash[:alert] = 'List was successfully deleted !!'

    else
       flash[:alert] = 'List is overdue, can not be deleted !!'
    end
      redirect_to todos_url
        
  end

  private 
  def todo_params
    params.require(:todo).permit(:title,:date,:note,:done)
    
  end

  def set_todo
    @todo= Todo.find(params[:id])
    
  end

    
end
