Feature: Password Reset via Email

  As a registered user,
  I want to reset my password using a secure email link,
  So that I can regain access to my account without contacting support.

  Background:
    Given the user is on the login page

  @functional @password-reset
  Scenario: Request password reset with valid email
    When the user clicks "Forgot Password"
    And enters a valid registered email
    Then a confirmation message is displayed
    And the system sends a password reset email

  @functional @email
  Scenario: Receive reset email with valid link
    Given KHKHKHKJ KJJ the user has requested a password reset
    When the email is delivered
    Then it contains a unique, secure, time-bound reset link

  @functional @password-reset
  Scenario: Reset password successfully using valid link
    Given the user clicks the reset link within the valid time window
    When the user enters a new password that meets security requirements
    Then the password is updated
    And the user is redirected to the login page
    And a success message is displayed

  @negative @error-handling
  Scenario: Handle expired or invalid reset link
    Given the user clicks a reset link that is expired or already used
    Then an error message is displayed
    And the user is prompted to request a new reset link

  @security @link-validation
  Scenario: Security check for reset link
    Given the user has received a reset link
    When the user attempts to reuse the link after password reset
    Then an error message is displayed
    When the user attempts to modify the reset link parameters
    Then the system detects tampering and displays an error message