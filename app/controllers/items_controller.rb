class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grievance
  before_action :set_pipeline
  before_action :set_item, only: [:edit, :update, :destroy]

  

  
  def new
    @item = @pipeline.items.new
  end

  
  def edit
  end

  
  def create
    @item = @pipeline.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @grievance, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @grievance, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to @grievance, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_grievance
      @grievance = current_office.grievances.includes(pipelines: :items).find(params[:grievance_id])
    end 

    def set_pipeline
      @pipeline = @grievance.pipelines.find(params[:pipeline_id])
    end

    
    def set_item
      @item = @pipeline.items.find(params[:id])
    end

    
    def item_params
      params.require(:item).permit(:pipeline_id, :content)
    end
end
