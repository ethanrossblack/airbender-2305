class NationMember
  attr_reader :name,
              :photo_url,
              :affiliation,
              :allies,
              :enemies

  def initialize(params)
    @name        = params[:name]
    @photo_url   = params[:photoUrl]
    @allies      = params[:allies]
    @enemies     = params[:enemies]
    @affiliation = params[:affiliation]
  end



end