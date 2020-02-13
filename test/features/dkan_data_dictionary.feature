@api
Feature: Resource-level data dictionaries

  Background:
    Given users:
      | name    | mail                | roles             |
      | John    | john@example.com    | site manager      |
      | Katie   | katie@example.com   | content creator   |

  @noworkflow @javascript
  Scenario: Add a data dictionary
    Given resources:
      | title       | author   | published | description |
      | Resource 09 | Katie    | Yes       | Test        |
    Given I am logged in as "John"
    And I am on "Resource 09" page
    And I click "Edit"
    And I click "JSON Schema"
    And I enter '{"fields":[{"name":"Lorem Ipsum","type":"string","description":"Dolor sit amet"}]}' into the JSONEditor
    And I press "Save"
    Then I should see "Dolor sit amet"
    When I click "Edit"
    And I click "JSON Schema"
    Then I should see "Dolor sit amet"
