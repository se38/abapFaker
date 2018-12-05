*abapFaker* is an ABAP package that generates fake data for you. Whether you need to bootstrap your database, create good-looking XML documents, fill-in your persistence to stress test it, or anonymize data taken from a production service, Faker is for you.

Design inspired by https://github.com/joke2k/faker.

----

    _|_|_|_|          _|
    _|        _|_|_|  _|  _|      _|_|    _|  _|_|
    _|_|_|  _|    _|  _|_|      _|_|_|_|  _|_|
    _|      _|    _|  _|  _|    _|        _|
    _|        _|_|_|  _|    _|    _|_|_|  _|

	
For more details, see the [`extended docs`](https://abapfaker.readthedocs.io/en/latest/).

Installation
-----------
This project is supported by [`ABAPGit Project`](https://github.com/larshp/abapGit). Download ZIP file or integrate this project to him. 

Basic Usage
-----------
See also demo report [`Z_ABAP_FAKER_DEMO`](https://raw.githubusercontent.com/se38/abapFaker/master/src/z_abap_faker_demo.prog.abap).

Providers
-----------
Each of the generator properties (like name, address...) are called "fake". A faker generator has many of them, packaged in "providers".

```
DATA(faker) = NEW zcl_faker( ).
cl_demo_output=>display( |{ faker->person->first_name( ) } { faker->person->last_name( ) }| ).
```

Check the [`extended docs`](https://abapfaker.readthedocs.io/en/latest/) for a list of [`providers.`](https://abapfaker.readthedocs.io/en/latest/)

Localization
-----------
zcl_faker's class constructor can take a locale as an argument, to return localized data. If no localized provider is found, the constructor falls back to the default en_US locale.

```
METHOD constructor.

_locale = SWITCH #( i_locale
                    WHEN `` THEN get_locale( )
                    ELSE i_locale
                  ).
...
```

You can check available abapFaker locales in the source code, under the providers package. The localization of abapFaker is an ongoing process, for which we need your help. Please don't hesitate to create a localized provider for your own locale and submit a Pull Request (PR).

Included localized providers:

-  [`de_DE`](https://abapfaker.readthedocs.io/en/latest/locales/de_DE.html) - German
-  [`en_US`](https://abapfaker.readthedocs.io/en/latest/locales/en_US.html) - English (United States)
-  [`pt_BR`](https://abapfaker.readthedocs.io/en/latest/locales/pt_BR.html) - Portuguese (Brazil)

License
-----------
abapFaker is released under the MIT License. See the bundled [`LICENSE`](https://github.com/se38/abapFaker/blob/master/LICENSE) file for details.
