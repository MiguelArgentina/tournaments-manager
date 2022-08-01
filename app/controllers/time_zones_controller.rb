class TimeZonesController < ApplicationController
  def search
    @time_zones = TZInfo::Timezone.all.select{|c| c=~/#{params[:search].capitalize}/}.map{|tz| [tz.to_s, tz.name]}
    puts "#" * 50
    puts @time_zones
    puts "#" * 50
    render 'devise/registrations/edit'
  end
end
