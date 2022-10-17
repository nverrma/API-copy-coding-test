class AssignRankingService
  attr_accessor :contact

  def initialize(contact)
    @contact = contact
  end

  def call
    assign_ranking(contact)
  end

  def assign_ranking(contact)
    base_rank = ENV['BASE_RANK'].to_i
    non_domain_rank = ENV['NON_DOMAIN_RANK'].to_i

    if contact['email'][/.+@(gmail|outlook|hotmail)\.com$/].present?
      overall_rank = contact['introsOffered'].values.inject(0, :+) + base_rank
    else
      overall_rank = contact['introsOffered'].values.inject(0, :+) + base_rank + non_domain_rank
    end
    contact.merge!({ranking: overall_rank})
  end
end