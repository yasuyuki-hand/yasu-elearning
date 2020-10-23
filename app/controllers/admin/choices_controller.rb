class Admin::ChoicesController < ApplicationController
  # def create
  #   @choice = current_user.choices.build(choice_params)
  #       if @choice.save
  #           redirect_to root_url
  #       else
  #           #Collection: -> in_feed.html.erb will get all micropost and show it here in the []
  #           # 1. Create Micropost
  #           # 2. Save in Database
  #           # 3. Displays in User show page
  #           # 4. Displays in Home Page because of @feed_items = []
  #           # @feed_items = []
  #           # redirect_to root_url
  #       end #end of if
  # end

  # def destroy
  # end

  # private
  #   def choice_params
  #       params.require(:choice).permit(:choice, :contents)
  #   end
end
