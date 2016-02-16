class NotesController < ApplicationController

  def add
    Note.create(user_id: session[:current_user_id], job_id: params[:id], content: params["add_note"])
    redirect_to '/welcome'
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to '/welcome'
  end

end
