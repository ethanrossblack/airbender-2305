class AvatarService

  def nation_search(nation_query)
    get_url("/api/v1/characters?affiliation=#{nation_query}&perPage=500")
    # Note: Setting the 'perPage' param high at 500 because I want every single character returned from the affiliated nation and the API only returns 20 by default. I'm assuming that there will not be more than 500 characters from a given nation.
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://last-airbender-api.fly.dev')
  end
end