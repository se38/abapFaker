abapFaker
---------

abapFaker is an ABAP package that generates fake data for you. Whether you need to bootstrap your database, create good-looking XML documents, fill-in your persistence to stress test it, or anonymize data taken from a production service, Faker is for you.

Design inspired by [Faker Project](https://github.com/joke2k/faker)

Instalation
-----------
Use the [ABAPGit Project](https://raw.githubusercontent.com/abapGit/build/master/zabapgit.abap) and upload this project.

Basic usage
-----------
See also demo report Z_ABAP_FAKER_DEMO.

Providers
---------
Each of the generator properties (like name, address, and lorem) are called "fake". A faker generator has many of them, packaged in "providers".

`
DATA(faker) = NEW zcl_faker( ).
cl_demo_output=>display( |{ faker->person->first_name( ) } { faker->person->last_name( ) }| ).
`

