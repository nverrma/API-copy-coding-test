class ContactOptionsController < ApplicationController
  include OfferVip

  before_action :load_contact

  # get all contacts options data
  def contacts
    render json: sort_by_name, status: 200
  end

  # Show all contacts data with there ranking and offer vip to highest ranker
  def show_contacts_ranking
    response = load_contact.map {|contact| AssignRankingService.new(contact).call }
    #extra work for calculating and writing data in new file
    offer_vip(response)
    UpdateContactsService.new(response).update_contact_options

    render json: response, status: 200
  end

  private

  def load_contact
    RetriveContactsService.new.contact_options_load
  end

  def sort_by_name
    #sorting by last name and then first name
    load_contact.sort_by do |contact|
      [contact["name"].split()[-1], contact["name"].split()[0]]
    end
  end
end
