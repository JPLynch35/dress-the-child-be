# Dress-The-Child-BackEnd

This is the back-end API for the front-end donation page for the Dress the Child organization.  

The purpose of this API is to provide a secure back-end for Stripe to process credit card charges.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

This application was created in Rails v5.1.6, utilizing Ruby v2.4.1.

### Installing

Clone the project down locally to your machine.  
```
git clone https://github.com/JPLynch35/dress-the-child-be.git
```  
Inside the project directory, prepare the gems for development with bundler.  
```
bundle install
``` 
Now create the database, prep the migrations, and load the seed data.
```
rake db:{create,migrate}
``` 

### Testing

This project involves StripeMock, RSpec, FactoryBot, and Figaro with regards to testing.  
An API is needed to run the test suite.
