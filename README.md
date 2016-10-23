#spareChange
A web-app to round up transactions to the nearest dollar and donate that money to a charity of your choosing.

[Live Heroku deployment](https://spare-change.herokuapp.com/)
##An app by:
- [Dan Dobrick](https://github.com/DanDobrick)
- [Audrey Kang](https://github.com/hkang10)
- [Cy Weisman](https://github.com/cypweisman)
- [Jake Fishbain](https://github.com/jakefishbain)

##How it works
1. First you create an account on the site, using your first name, last name and email address.
2. Using our secure bank login provided by PLAID and your financial institution, you authorize us to round up each transaction to the nearest dollar, we call this amount a "round-up."
3. Utilizing our search powered by <a href="http://orghunter.com/">OrgHunter</a> you choose from over 2 million charities in the United States.
4. Throughout the month, we round up the transactions you make and ear-mark that amount for the charity that you've chosen.
5. At the end of the month, we debit the total of all the "round-ups" from your securely authorized account and, in partnership with <a href="http://makemydonation.org/">MakeMyDonation</a>, we send the donation amount to your charity.
6. On the first of the month, your 'round-ups' reset and you start earning donations all over again!

##Screenshots
###Home Page
![Home Page](/screenshots/home.png?raw=true "Home Page")
###User Page
![User Page](/screenshots/user.png?raw=true "User Page")
###How it works
![How It Works](/screenshots/how.png?raw=true "How It Works")
###Choosing an Account
![Choose Your Bank](/screenshots/choose-bank.png?raw=true "Choose Your Bank")
###Connected Account
![Connected Account](/screenshots/chase-connected.png?raw=true "Connected Account")

##Code Status
[![Build Status](https://travis-ci.org/DanDobrick/spare-change.svg?branch=master)](https://travis-ci.org/DanDobrick/spare-change)

##Technologies used
- [Ruby on Rails](https://github.com/rails/rails)
- [JavaScript](https://www.javascript.com/)
- [Typeahead.js](https://twitter.github.io/typeahead.js/)
- [Plaid](https://plaid.com/)
- [Stripe](https://stripe.com/)
- [Make My Donation](http://makemydonation.org/)
- [Org Hunter](http://orghunter.com/)
