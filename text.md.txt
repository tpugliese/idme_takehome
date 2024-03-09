# Technical Takehome

- [ ]  Initialize Framework (30 min)
    - [x]  Create Github Repo
    - [x]  Create Jupyter Notebook
    - [x]  Create Notion Guide
    - [x]  Create Local File on Windows Computer
- [ ]  Create Technical Structure (2.5 hours)
    - [x]  Generate Questions on Jupyter Notebook
    - [x]  Install PostgreSQL
    - [x]  Create Local Database as facsimile of DogDB
    - [x]  Import packages on Conda Environment
    - [x]  Save PostgreSQL credentials
    - [x]  Connect SQL Alchemy & PostgreSQL
- [ ]  Data Generation
    - [ ]  Create Full Database of Tables as stated:
    - [ ]  Create TPug Edit of Tables as suggested
- [ ]  Prompt Answering
    - [ ]  Question 1: Initial Thoughts and Shortcomings
    - [ ]  Question 2: Accounting Support and Queries
    - [ ]  Question 3: Data Support for the Analyst
    - [ ]  Question 4: Trouble Shooting Tips
    - [ ]  Question 5: First Week Recap
- [ ]  Iteration Review
    - [ ]  Extra Problems
    - [ ]  Placeholders
    - [ ]  Ensure EVERY Question has an appropriate answer
- [ ]  Prepare for Sign-off and Sending
    - [ ]  Personal Reflection on Assignment
    - [ ]  Next Steps in Assignment
    - [ ]  Upload SQL File Document to the Assignment
- [ ]  Extra Credit
    - [ ]  Securely Storing Credits in an environment file
    - [ ]  Put Personal Assessment in ReadMe

Instructions: The narrative below presents a hypothetical situation where you are an analytics engineer at a SAAS startup and poses some scenarios in a chronological order. Use your previous work experience and judgment to augment the details provided. Build your own narrative around the fictional SAAS company and your role there, and then detail how you would build an analytics foundation that solves their data needs.

Answers do not need to be isolated to the immediate preceding prompt; you may use previously given information as well as context from your previous answers.

DogDB is a California based company that has developed a novel NoCATS database and offers a managed, hosted solution as a monthly SAAS subscription with free, medium ($50/mo), and enterprise tiers ($500/mo). DogDB is seeing their number of customer accounts skyrocket (“up and to the right”) and have hired you as the first dedicated analytics engineer to help them understand and scale their data capabilities, in anticipation of an incipient funding round.

DogDB sells their service through a web-facing rails application. Here, a DogDB customer can sign up for an account, choose a pricing tier, and configure their NoCATS deployment. The accounting settings and configurations are stored in a PostgreSQL database.

1.) Based on the table design, what are you initial thoughts about DogDB’s data tracking? What are
some of the advantages (if any) of their data models, and what are the shortcomings (if any) you foresee in DogDB’s future?

- no pks in tables
- service rep names should be its own table
- customer licenses can be multiple and clash (account id 6 has two active licenses)
- license data json should be broken out into individual columns.  use licnese id as primary key
- schema should be:
    - customer_accounts
    - customer_pricing_plans
    - customer_interactions
    - interaction_agents
    - customer_licenses

this model does a good job of laying out the basics of the customer model but lacks primary keys on its important tables 

2.) active customer licenses, pricing tiers should be build in to their own table, from where pricing can be calculated.  only customers on the enterprise tiers should be sent an invoice.

3.) interaction channel, category, service rep, interaction status.  build comprehenssive table

4.) materialization of the table, if it’s view, it’s not stored in memory, determine hte most recent need, widest breadth and size of the data.  the data seems integral to multiple dashboards so it should be treaded more pristinely than other ones

5.) first week, #1 priority would be getting a schema up and running that can handle the growth of multiple customers, with multiple licenses and multiple touch point interactions with service members.  I would work with the team and look at the dashboards, the views, finding out where pain points are, the way the data is structured and ensure the modeling can match what people’s expectations are.