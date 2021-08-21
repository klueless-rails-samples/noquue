class HomeController < ApplicationController
  def index
    data = {
      first_name_label: I18n.t('first_name'),
      first_name: 'David',
      last_name_label: I18n.t('last_name'),
      last_name: 'Cruwys'      
    }

    @model = OpenStruct.new(data)
  end
end
