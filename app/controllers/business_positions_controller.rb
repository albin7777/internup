class BusinessPositionsController < ApplicationController
   def index
    @positions = current_user.positions
   end

end
