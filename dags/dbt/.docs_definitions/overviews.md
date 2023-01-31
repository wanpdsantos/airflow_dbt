{% docs __overview__ %}

# DBT Project Documentation
Tests
This project is intended to be a playground to test [DBT](https://docs.getdbt.com/docs/introduction) functionalities, including:

- Models: There are some example dimensions, facts, and summary models.
- Tests: For each of the models, it is included specific tests.
- Documentation: Documentation is generated automatically and its available [here](tobeadded).

Project deployed by Wanderson Santos.
...

{% enddocs %}

{% docs __dimensions__ %}

# Dimensions Models

A dimension table or dimension entity is a table or entity in a star, snowflake, or starflake schema that stores details about the facts.

Since the data in a dimension table is often denormalized, dimension tables have a large number of columns. The dimension tables contain fewer rows of data than the fact table. The columns of a dimensional table are used to create reports or display query results. For example, the textual descriptions of a report are created from the column labels of a dimension table.
...

{% enddocs %}

{% docs __bookings__ %}

# Bookings Models

This is the description of the Bookings DBT project.
...

{% enddocs %}

{% docs __dbt_utils__ %}

# Utility macros

Our dbt project heavily uses this suite of utility macros, especially:

- `surrogate_key`
- `test_equality`

{% enddocs %}
