Feature: XYZ Password Reset via Email

  Background:
    Given the user is a registered user with an active email

  @functional @password_reset
  Scenario: ABC Request password reset with valid email
    Given I am on the login page
    When I click "Forgot Password"
    And I enter a valid registered email
    Then I should see a confirmation message
    And the system should send a password reset email

  @functional @email @security
  Scenario: Receive password reset email
    Given I requested a password reset
    When the email is delivered
    Then it should contain a unique, secure, time-bound reset link

  @functional @password_reset @security
  Scenario: Reset password using valid link
    Given I click the reset link within the valid time window
    When I enter a new password that meets security requirements
    Then my password should be updated
    And I should be redirected to the login page
    And I should see a success message

  @negative @error_handling @security
  Scenario: Handle expired or invalid reset link
    Given I click a reset link that is expired or already used
    Then I should see an error message
    And I should be prompted to request a new reset link