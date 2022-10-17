module OfferVip
  extend ActiveSupport::Concern

  def offer_vip(contacts)
    ranker = contacts.group_by { |x| x['introsOffered']['vip'] }[0].max_by{|rank| rank[:ranking] }
    if ranker["introsOffered"]["vip"] == 0
      ranker["introsOffered"]["vip"] += 1
    end
  end
end