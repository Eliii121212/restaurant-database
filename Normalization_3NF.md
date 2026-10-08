# Database Normalization to Third Normal Form (3NF)

## First Normal Form (1NF)

The database is in First Normal Form because each table has a primary key and each column contains a single, atomic value. There are no repeating groups or lists of values stored in a single field.

## Second Normal Form (2NF)

The database is in Second Normal Form because it is in 1NF and every non-key attribute depends on the whole primary key. Each table uses a single-column primary key, so there are no partial dependencies on part of a composite primary key.

## Third Normal Form (3NF)

The database is in Third Normal Form because it is in 2NF and non-key attributes depend on the key, the whole key, and nothing but the key.

The data is separated into four tables:

- **RESTAURANT:** Stores restaurant details.
- **CUSTOMER:** Stores customer details.
- **RESTAURANT_TABLE:** Stores table numbers and capacities, linked to a restaurant through `restaurantID`.
- **BOOKING:** Stores booking dates, times and number of guests, linked to a customer and a restaurant table through foreign keys.

This separation avoids storing customer, restaurant and table details repeatedly in the booking records. The foreign keys maintain relationships between the tables, while primary keys uniquely identify each record.

Unique constraints also prevent duplicate table numbers within the same restaurant and prevent two bookings for the same table at the same date and time.

## Conclusion

The database schema satisfies 1NF, 2NF and 3NF. No further decomposition is required for the current set of attributes and relationships.