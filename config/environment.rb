require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/db_badmin'
require_relative '../apps/datasource/application'

Hanami.configure do
  mount Datasource::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/db_badmin_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/db_badmin_development'
    #    adapter :sql, 'mysql://localhost/db_badmin_development'
    #
    adapter :sql, ENV['DATABASE_URL']

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/db_badmin/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV['SMTP_HOST'], port: ENV['SMTP_PORT']
    end
  end
end
