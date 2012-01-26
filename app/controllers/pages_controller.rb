class PagesController < ApplicationController
  def about_me
  end

  def projects
    @projects = Project.all
  end
end
