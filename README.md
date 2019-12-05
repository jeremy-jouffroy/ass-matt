A rails App to calculate precisely how much hours you must declare on https://www.pajemploi.urssaf.fr/ for your "assitante maternelle" (A.K.A super nanny)

#Setup

Ruby Version : 2.6.3
Rails version 5.2.2.1

## install
Classic rail app just   run a bundle install

``bundle install``

then launch rail server 

``rails server``

In case of error message related to webpack run an install through 

``bundle exec rake webpacker:install``

## Investigation and extra documentation
- case of a mensualised pay slip with google spreadsheet : 
    https://docs.google.com/spreadsheets/d/1c4FYBv1sEHnN-lK0WBVC3XZSvuqRZmp8Vy5mxc8XvSo/edit?usp=sharing$
- doc from PAJE ursaff site : 
    https://www.pajemploi.urssaf.fr/pajewebinfo/cms/sites/pajewebinfo/accueil/employeur-dassistante-maternelle/je-remunere-et-je-declare.html

- DB schema  : 
    https://drive.google.com/file/d/1M8sXA5OIMj7OXmZFOIIm3jJxc70ISqnC/view?usp=sharing
- workflow of the app : 
    https://whimsical.com/CWfYugLCdHzTQH5MK4vchH
- sketches (FIGMA)
    https://www.figma.com/file/M59MVPfbF2b1418YV9BorB/Untitled?node-id=0%3A1
 

## Calendar proposal
- gem simple_calendar 
https://github.com/excid3/simple_calendar

-  node module tui.calendar 
https://github.com/nhn/tui.jsdoc-template


### rails  generation
rails generate model Salary user:references contract_type:string hourly_rate:integer starting_hour:time ending_hour:time day_per_week:integer working_on_banks_holliday:boolean cleaning_cost:integer meal_cost:integer daily_meals:integer 
rails generate model PaySlip month:datetime salary:references
rails generate model Day day_date:date pay_slip:references status:string starting_hour:time ending_hour:time daily_meal:integer

rails g controller salaries index show new edit
rails g controller pay_slips show new edit
rails g contoller days index show new edit

