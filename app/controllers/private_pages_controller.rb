class PrivatePagesController < ApplicationController
    
    before_action :authenticate_user!
    
    def index
        @notes = current_user.notes.all
        @finished_notes = current_user.notes.where.not(finished_at: nil)
        @pending_notes = current_user.notes.where(finished_at: nil)
        @note = current_user.notes.new
    end
    
end
