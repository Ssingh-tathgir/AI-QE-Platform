Feature: Password Reset via Email Link

  Background:
    Given the user is on the login page

  @functional @password_reset
  Scenario: Request password reset with valid email
    When the user clicks "Forgot Password"
    And enters a valid registered email
    Then a confirmation message should be displayed
    And the system should send a password reset email

  @functional @security
  Scenario: Receive reset email with valid link
    Given the user has requested a password reset
    When the email is delivered
    Then it should contain a unique, secure, time-bound reset link

  @functional @password_reset
  Scenario: Reset password using valid link
    Given the user clicks the reset link within the valid time window
    When the user enters a new password that meets security requirements
    Then the password should be updated
    And the user should be redirected to the login page
    And a success message should be displayed

  @negative @error_handling
  Scenario: Expired or invalid reset link
    Given the user clicks a reset link that is expired or already used
    Then an error message should be displayed
    And the user should be prompted to request a new reset link

  @negative @error_handling
  Scenario: Request password reset with unregistered email
    When the user clicks "Forgot Password"
    And enters an unregistered email
    Then an error message should be displayed: 'Email address not found.'