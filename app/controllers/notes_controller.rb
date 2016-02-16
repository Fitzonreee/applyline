class NotesController < ApplicationController

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to '/welcome'
  end

end
