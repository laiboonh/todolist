# Todolist

## Prerequisites

### Setup database
This is assuming you have postgres installed.

Run `createdb -O postgres todolist_dev` to create database that this app will be based on. 

Dev db settings are located in `config/dev.exs`


## Running the app

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Functionalities

| Functionality | In Progress | Done  | 
|---------------|-------------|-------|
| Login         |             |   X   |
| Logout        |             |   X   |
| Create Task   |      X      |       |
| List Task     |      X      |       |
| Edit task     |             |       |
| Delete Task   |             |       |