# abapFaker
abapFaker is an ABAP package that generates fake data for you. Whether you need to bootstrap your database, create good-looking XML documents, fill-in your persistence to stress test it, or anonymize data taken from a production service, Faker is for you.

Design inspired by https://github.com/joke2k/faker

Usage: see also demo report Z_ABAP_FAKER_DEMO.
```
DATA(faker) = NEW zcl_faker( ).
cl_demo_output=>display( |{ faker->person->first_name( ) } { faker->person->last_name( ) }| ).
```

Detailed documentation will follow.
