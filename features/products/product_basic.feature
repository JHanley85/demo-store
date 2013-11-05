Feature: Manage Store
  In order to make a store
  As a client
  I want to be able to edit basic information
  Examples:
  |name|description|referral_url|
  |"Flaming Moe's"|"If you can't beat \'em, try harder"|"example.com"|

Scenario Outline:
  Given I am a user
  And I am a client
  And I have a store
  And my store's name is <store>
  And my store's description is <description>
  And my store's url is <referral_url>


Scenario:
  Given I have 1 products
  When I go to the "edit my products" page
  Then I should see "Editing <name>"


