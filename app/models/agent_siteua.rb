#coding: UTF-8
class AgentSiteua
	require 'csv'
	require 'iconv'

	attr_reader :user_login, :password, :agent

	def initialize
		@user_login = 'stefa85'
		@password = 'stefa_siteua'
		@agent = Mechanize.new
		login
	end

	def login
		url = 'http://siteua.org/manage'
		page = agent.get(url)
		page.form do |form|
    	form.login  = user_login
    	form.password = password
  	end.submit
	end

	def getstats
		url = 'http://siteua.org/manage/reports/viewsstats'
		page = agent.get(url)
		page = page.form do |form|
			form.radiobutton_with(:name => 'period', :value => '2').check
			form.radiobutton_with(:name => 'author').check
		end.submit

		page = agent.click(page.link_with(:text => /CSV/))
		s = page.body.force_encoding('utf-8')

		arr_of_arrs = CSV.parse(s,:col_sep => ';', :headers => true)

		arr_of_arrs
	end

end
