class ReportsController < ApplicationController
	DATE_FORMAT = '%d.%m.%Y'

	def index
		@date = (params[:date] ? Time.parse(params[:date]) : Time.now).strftime(DATE_FORMAT)
		a = AgentSiteua.new
		@stat = a.getstats(@date)
		@copypasts_ratio = cookies[:copypasts_ratio] || 100
		@rewrites_ratio = cookies[:rewrites_ratio] || 70

	end
end
