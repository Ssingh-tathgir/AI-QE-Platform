Feature: Password Reset via Email

  Background:
    Given the user is on the login page

  @functional @password-reset
  Scenario: Request password reset with valid email
    When the user clicks "Forgot Password"
    And enters a valid registered email
    Then a confirmation message is displayed
    And a password reset email is sent

  @functional @security
  Scenario: Receive reset email with valid link
    Given the user has requested a password reset
    When the email is delivered
    Then it contains a unique, secure, time-bound reset link

  @functional @password-reset
  Scenario: Reset password using valid link
    Given the user clicks the reset link within the valid time window
    When they enter a new password that meets security requirements
    Then the password is updated
    And the user is redirected to the login page
    And a success message is displayed

  @negative @security
  Scenario: Handle expired or invalid reset link
    Given the user clicks a reset link that is expired or already used
    Then an error message is displayed
    And the user is prompted to request a new reset link

  @security @logging
  Scenario: Security log for password reset attempts
    When the user attempts to reset the password
    Then the attempt is logged in the system with timestamp and user details