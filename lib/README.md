# PROGRAMMING ECTO
* [Programming Ecto](https://pragprog.com/titles/wmecto/programming-ecto/) is the book that I am using to learn everything related to `Ecto`.
* This **README** file is going to serve us a note-taking tool describing most of `Ecto` related information.
* I will divide the content based on each chapter and carry on from there. 
* This one serves as an intro for `Programming Ecto` and each chapter will have its own section in the program.


## CHAPTER ONE

### FUNDAMENTALS

- `Ecto` is the main go-to database library - something like ORM - for Elixir. 
- It was released in `2014` and still actively maintained by `Plataformatec`, the company behind Elixir itself. `Plataformatec` was acquired/hired by `Nubank` in 2020 and all the projects went to Elixir Core team and community.
- It is shipped together with `Phoenix`, a very popular framework for building web applications using Elixir.
- It is approachable, explicit, and flexible. 
- Since it's a late-comer to the party, it learned one or two things from other languages. For example:
  - One, it is built on top of other concepts on other tools and libraries, like `LINQ` - for how it queries results; and `ActiveRecord` - for migration syntax.
  - Second, it avoids the "magic" characterization from other ORMs by being very strict. For example, `Spring JPA` simplifies data access by abstracting many actions from the user. `SELECT * FROM USER WHERE ID = 1` is represented on the ORM as `User.finaById()`.
  - By avoiding such concepts and being explicit, `Ecto` helps the user to know what type of queries that they want to write and keep in check.
  - It also keeps you in check when you are designing your database structure, schema, update, and query.
  - Third, it is very flexible for the usage. You can adopt some part of it, even without needing a database. With `Ecto` you are the one in control, and the library provides you with everything you need to achieve your goal.

### MODULES

- `Ecto` contains **six** main modules: `Repo`, `Schema`, `Query`, `Changeset`, `Multi`, and `Migration`.
- We will discuss each of them one by one as a submodule for the modules. 

  #### REPO MODULE

    - This is the heart of the `Ecto` library. It can cover all the responsibility of making the CRUD operations.
    - `Ecto` uses the `Repository Pattern`, which defines as a single point of contact between the application and the database. It acts as a stand-in for the database, passing everything we want to use through itself.
    - The pattern is widely used in designing enterprise applications where it essentially creates an abstraction between the communication of the data-access layer and the business logic, enabling the business logic to interact with data access logic through the repository.
    - Given its relation with the `Repository Pattern`, `Ecto` contains a lot of functions to further the interactions. Functions such as, `get`, `insert`, `update`, `delete` and such. Also, there is no indirect call for these functions, as we are obliged to define our own `Repo` module inside the app. In our case:
      ```aiignore
      defmodule Database.Repo do
        use Ecto.Repo,
        otp_app: :database,
        adapter: Ecto.Adapters.Postgres
      end 
      ```
    - As you can see in the above, we have defined our `Repo` module and set up the adapter that we use for manipulating data into the database of our choice, in this case Postgres.
    - The `otp_app` is a required configuration point for the `Repo` to find its connection point. The paths and names for the database can be configured in `config/config.exs`, or `config/dev.exs` paths - assuming it is for local development. And if it is for production, we can configure it in `config/prod.exs` file.
    - `use` is a `macro` - we will explain what a macro is in depth as we move forward. 
    - Let's see some `Repo` functions usage in action in the following code snippet. We will see about `Schema` and `Migration` definition later on, and this code snippet assumes those things are met.
    ```aiignore
      defmodule AppName.RepositoryFunctionSample do
        alias Ecto.Repo, as: Repo
        alias AppName.User, as: UserRepository
    
        # insert/1 function
        # this function accepts one parameter as its input and insert the record to
        # database.
        user_insertion_content = %UserRepository{name: "John Doe"}
        insert_user = Repo.insert(user_insertion_content)
        IO.inspect(insert_user)
        # or
        insert_user_one_liner = Repo.insert(%UserRepository{name: "John Doe"})
        IO.inspect(insert_user_one_liner)
    
        # get/2 function
        # this function accepts 2 parameters as its input. 
        # one is the param field that we use for searching by primary key.
        # the other one is the table where it is going to look for.
        user = Repo.get(UserRepository, 1)
        IO.inspect(user)
    
        # get_by/2 function
        # this function accepts 2 parameters as its input - like the above.
        # it fetchs a record using that specific param or condition
        get_user = Repo.get_by(UserRepository, name: "John Doe")
        IO.inspect(get_user)
    
        # all/1 function
        # this function accepts 1 parameter and returns all elements in the table.
        user = Repo.all(UserRepository)
        IO.inspect(user) 
    
        # delete/1 function 
        # this function accepts 1 parameter and delete the record from database.
        user = Repo.get_by(UserRepository, name: "John Doe")
        deleted_user = Repo.delete(user)
        IO.inspect(deleted_user)
        # or
        deleted_user_one_line = Repo.delete(Repo.get_by(UserRepository, name: "John Doe"))
        IO.inspect(deleted_user_one_line)
      end
    ```
  
  #### QUERY MODULE

    - 