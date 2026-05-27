Feature: SDSDSDD Password Reset via Email Link

  As a registered user,
  I want to reset my password using a secure email link,
  So that I can regain access to my account without contacting support.

  Background:
    Given I am on the login page

  @functional @happy-path
  Scenario: Request password reset with valid email
    When I click "Forgot Password"
    And I enter a valid registered email
    Then I should see a confirmation message
    And the system should send a password reset email

  @functional @happy-path
  Scenario: Receive reset email with valid link
    Given I requested a password reset
    When the email is delivered
    Then it should contain a unique, secure, time-bound reset link

  @functional @happy-path
  Scenario: Reset password successfully using valid link
    Given I click the reset link within the valid time window
    When I enter a new password that meets security requirements
    Then my password should be updated
    And I should be redirected to the login page
    And I should see a success message

  @negative @edge-case
  Scenario: Handle expired or invalid reset link
    Given I click a reset link that is expired or already used
    Then I should see an error message
    And I should be prompted to request a new reset link

  @negative
  Scenario: Request password reset with unregistered email
    When I click "Forgot Password"
    And I enter an unregistered email
    Then I should see an error message indicating the email is not registered