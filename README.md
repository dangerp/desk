A simple ruby interface to Desk.com

## Installation
    gem install desk_api

## Usage

Oauth (recommended):

    client = Desk::Client.new(site: "my-site-name", consumer_key: "consumer-key", consumer_secret: "consumer-secret", token: "token", token_secret: "token_secret")

Basic Auth:

    client = Desk::Client.new(site: "my-site-name", email: "email@example.com", password: "mypassword")

Example usage:

    client.cases.all
    client.cases.show(1234)
    client.cases.create(data)
    client.cases.update(1234, data)
    client.article.all

## To do

Add more endpoints  
Pagination
