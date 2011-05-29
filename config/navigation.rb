SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :peeps, 'Peeps', peeps_url, link: {class: 'noicon'}
    primary.item :print, 'Print', print_url, link: {class: 'noicon'}
    primary.item :peeps, 'Account', account_url, link: {class: 'noicon'}
    primary.dom_id = 'nav'
  end
end