RailsAdmin.config do |config|

  # число объектов на странице
  config.default_items_per_page = 25

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

    ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end

  config.current_user_method(&:current_admin)


  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.model 'Event' do
    fields_of_type :datetime do
      strftime_format "%Y-%m-%d %H:%M:%S"
    end
  end





  config.actions do
    # root actions
    dashboard                        # mandatory
    # collection actions
    index                            # mandatory
    new
    export
    ## With an audit adapter, you can add:
    # history_index
    # history_show
    bulk_delete
    # members actions
    show 
    edit
    delete
    show_in_app

  end

end
