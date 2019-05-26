namespace :db do
  desc 'Full Reset (Drop, Create, Migrate, Seed)'
  task :dev_reset do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
  end
  task :prod_reset do
    system 'heroku pg:reset DATABASE --confirm cocktail-mr'
    system 'heroku run rails db:migrate'
    system 'heroku run rails db:seed'
  end
end
