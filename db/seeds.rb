# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



ApplicationRecord.transaction do
    puts 'Destroying tables...'
    Cat.destroy_all

    puts 'Resetting id sequences...'
    %w(cats).each do |table_name|
        puts 'Resetting id sequences of ' + table_name.to_s
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    puts 'Creating seed data...'
    Cat.create(color: "orange", name: "moe", sex: "M", birth_date: "1/1/2010", description: "loves lasagna").save
    Cat.create(color: "brown", name: "Garfield", sex: "M", birth_date: "10/12/2012").save
    Cat.create(color: "tortuga", name: "Frank", sex: "M", birth_date: "1/1/2000", description: "Stein").save
    Cat.create(color: "void", name: "Howard", sex: "F", birth_date: "1/1/2022").save
    Cat.create(color: "white", name: "Leonard", sex: "F", birth_date: "1/1/2021").save

    puts 'Done!'

end
