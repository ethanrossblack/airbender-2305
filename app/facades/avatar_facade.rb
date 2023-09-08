class AvatarFacade
  attr_reader :nation_query

  def initialize(params)
    @nation_query = params[:nation]
  end

  def nation_members
    @_nation_members ||= avatar_service.nation_search(@nation_query)
  end

  def total_nation_members
    nation_members.count
  end

  def first_25_nation_members
    nation_members.first(25).map do |member_attributes|
      NationMember.new(member_attributes)
    end
  end

  def avatar_service
    @_avatar_service ||= AvatarService.new
  end
end