Feature: Password Reset via Email Link

  Background:
    Given a registered user with an active email

  @functional
  Scenario: Request password reset with valid email
    Given I am on the login page
    When I click "Forgot Password"
    And I enter a valid registered email
    Then I should see a confirmation message
    And the system should send a password reset email

  @functional
  Scenario: Receive reset email with valid link
    Given I requested a password reset
    When the email is delivered
    Then it should contain a unique, secure, time-bound reset link

  @functional
  Scenario: Reset password successfully using valid link
    Given I click the reset link within the valid time window
    When I enter a new password that meets security requirements
    Then my password should be updated
    And I should be redirected to the login page
    And I should see a success message

  @negative
  Scenario: Handle expired or invalid reset link
    Given I click a reset link that is expired or already used
    Then I should see an error message
    And I should be prompted to request a new reset link

  @security
  Scenario: Security check for reset link
    Given I have received a password reset email
    When I attempt to reuse or tamper with the reset link
    Then the system should prevent reuse or tampering
    And display an error message