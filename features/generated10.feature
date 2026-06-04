Feature: Password Reset via Email

  Background:
    Given the user is on the login page

  @functional @password-reset
  Scenario: Request password reset with valid email
    When the user clicks "Forgot Password"
    And enters a valid registered email
    Then a confirmation message is displayed
    And a password reset email is sent

  @functional @email @security
  Scenario: Receive reset email with valid link
    Given the user has requested a password reset
    When the email is delivered
    Then it contains a unique, secure, time-bound reset link

  @functional @password-reset @security
  Scenario: Reset password successfully using valid link
    Given the user has a valid reset link
    When the user clicks the reset link
    And enters a new password that meets security requirements
    Then the password is updated
    And the user is redirected to the login page
    And a success message is displayed

  @negative @error-handling @security
  Scenario: Handle expired or invalid reset link
    Given the user has an expired or used reset link
    When the user clicks the reset link
    Then an error message is displayed prompting a new request

  @negative @email @error-handling
  Scenario: Request password reset with unregistered email
    When the user clicks "Forgot Password"
    And enters an unregistered email
    Then an error message is displayed indicating the email is not registered