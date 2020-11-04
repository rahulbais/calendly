class PipelinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grievance
  before_action :set_pipeline, only: [:edit, :update, :destroy]

 
  def new
    @pipeline = @grievance.pipelines.new
  end

  # GET /pipelines/1/edit
  def edit
  end

  # POST /pipelines
  # POST /pipelines.json
  def create
    @pipeline = @grievance.pipelines.new(pipeline_params)

    respond_to do |format|
      if @pipeline.save
        format.html { redirect_to @grievance, notice: 'Pipeline was successfully created.' }
        format.json { render :show, status: :created, location: @pipeline }
      else
        format.html { render :new }
        format.json { render json: @pipeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pipelines/1
  # PATCH/PUT /pipelines/1.json
  def update
    respond_to do |format|
      if @pipeline.update(pipeline_params)
        format.html { redirect_to @grievance, notice: 'Pipeline was successfully updated.' }
        format.json { render :show, status: :ok, location: @pipeline }
      else
        format.html { render :edit }
        format.json { render json: @pipeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pipelines/1
  # DELETE /pipelines/1.json
  def destroy
    @pipeline.destroy
    respond_to do |format|
      format.html { redirect_to @grievance, notice: 'Pipeline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_grievance
      @grievance = current_office.grievances.includes(:pipelines).find(params[:grievance_id])
    end 
  
    
    def set_pipeline
      @pipeline = @grievance.pipelines.find(params[:id])
    end

    
    def pipeline_params
      params.require(:pipeline).permit(:grievance_id, :name)
    end
end
