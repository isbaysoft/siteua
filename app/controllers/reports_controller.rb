class ReportsController < ApplicationController
	def index
		a = AgentSiteua.new		
		@stat = a.getstats
		@copypasts_ratio = cookies[:copypasts_ratio] || 100
		@rewrites_ratio = cookies[:rewrites_ratio] || 70
		@date = Time.now.strftime('%m-%d-%Y') unless params[:reports] && params[:reports][:date]
	end
end
