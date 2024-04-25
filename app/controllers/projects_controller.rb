class ProjectsController < ApplicationController
  def index
    projects = Rails.cache.fetch("projects", expires_in: 12.hours) do
      Project.includes(:packages, :milestones).all.to_a
    rescue StandardError => e
      Rails.logger.error "Failed to fetch projects with includes: #{e.message}\n#{e.backtrace.join("\n")}"
      []
    end
    if projects.empty?
      render json: { error: "No projects found" }, status: :not_found
    else
      render json: projects, status: :ok
    end
  rescue StandardError => e
    Rails.logger.error "Failed to render projects: #{e.message}\n#{e.backtrace.join("\n")}"
    render json: { error: "Failed to load projects" }, status: :internal_server_error
  end
end