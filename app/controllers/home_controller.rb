class HomeController < ApplicationController
  def index
    if !@volunteer
      @volunteer = Volunteer.new()
    end

    # i18n converts Åland to Aland
    @countries_collection = CS.countries.map { |c| [I18n.transliterate(c[1]), c[0]] }
    @countries_collection.delete(["country_name", :COUNTRY_ISO_CODE])
    @countries_collection = @countries_collection.sort_by {|c| c[0]}
    @volunteer_crews = Volunteer.crews.collect{|k,v| [k.humanize, k]}

    # Pre-selected New York
    @states_collection = CS.states(:US).map { |c| [I18n.transliterate(c[1]), c[0]] }
    @cities_collection = CS.cities(:NY, :US)
  end
end
