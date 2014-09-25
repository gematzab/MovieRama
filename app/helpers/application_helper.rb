module ApplicationHelper

	def error_messages_for(object)
		render(:partial => 'application/error_messages', :locals => {:object=> object})
	end 

	def sortable(column, title = nil)
		title ||= column.titleize
		link_to title, :sort => column
	end
end
