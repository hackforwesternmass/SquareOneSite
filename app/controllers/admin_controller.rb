class AdminController < ApplicationController
     
     def index
         redirect_to root_path
     end
     
     # GET admin/search
     def search
        
     end
     
      # GET admin/attendance
     def attendance
        
     end
     
     # GET admin/attendance_results, get id and redirect to providers/id/children/recordAttendance.html.erb
     def attendance_results
        provider_id = params[:provider_id]
        redirect_to recordAttendance_provider_children_path(provider_id)
     end
     
      # GET admin/daily_attendance_results, get id and redirect to providers/id/children/recordAttendance.html.erb
     def daily_attendance_results
        provider_id = params[:provider_id]
        redirect_to dailyAttendance_provider_children_path(provider_id)
     end
     
     # GET admin/providers goes to /providers, not using
     def providers
       @providers = Provider.order('"lName"').all
       render "providers/index"
     end
 
     # GET admin/children goes to /children, not using
     def children
        @children = Child.order('"lName"').all
        render "children/index"
     end
end
