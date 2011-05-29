SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :peeps, 'Peeps', peeps_path, highlights_on: /\/peeps/, link: {class: 'noicon'}
    primary.item :print, 'Print', print_path, highlights_on: /\/print/, link: {class: 'noicon'}
    primary.item :account, 'Account', account_path, highlights_on: /\/account/, link: {class: 'noicon'}
    primary.dom_id = 'nav'
  end
end