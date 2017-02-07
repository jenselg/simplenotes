class NotesController < ApplicationController
    
    before_action :authenticate_user!
    
    def create
        @note = current_user.notes.new(note_params)
        # Following code is for rendering which will be switched to realtime rendering
        if @note.save
            redirect_to auth_root_path, notice: "Note succesfully created!"
        else
            redirect_to auth_root_path, notice: "Error creating note. Please try again."
        end
    end
    
    def destroy
        @notes = current_user.notes.all
        @note = @notes.find(params[:id])
        @note.delete
        # Following code is for rendering which will be switched to realtime rendering
        redirect_to auth_root_path, notice: "Note succesfully deleted!"
    end
    
    def finish
        @notes = current_user.notes.all
        @note = @notes.find(params[:format])
        if @note != nil
            @note.finished_at = Date.today
            @note.save
            # Following code is for rendering which will be switched to realtime rendering
            redirect_to auth_root_path, notice: "Note marked as finished!"
        else
            redirect_to auth_root_path, notice: "Error marking note as finished!"
        end
    end
    
    private
    
    def note_params
        params.require(:note).permit(:content)
    end
    
end
