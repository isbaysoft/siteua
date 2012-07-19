class ReportsController < ApplicationController
	def index
		a = AgentSiteua.new		
		@rows = a.getstats
	end
end
