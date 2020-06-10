Feature: Test User API

  Background:
    Given url 'https://api.octoperf.com'
    Given path '/public/users/login'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And request 'username=PruebaOcto03@gmail.com&password=Prueba01'
    When method post
    Then status 200
    * def Token = response.token
    * def workspaceId = ""


  Scenario: Fetch all users

    Given path '/workspaces/member-of'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And header Authorization = 'Bearer ' + Token
   # And request 'username=PruebaOcto03@gmail.com&password=Prueba01'
    When method get
    Then status 200

    * def workspaceId = response[0].id
  * print "workspaceId........:"+workspaceId


    Given path '/design/projects/by-workspace/'+workspaceId+'/DESIGN'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And header Authorization = 'Bearer ' + Token
   # And request 'username=PruebaOcto03@gmail.com&password=Prueba01'
    When method get
    Then status 200
    Given url 'https://my-json-server.typicode.com'
    Given path '/user/repo/posts/1'
    And header Content-Type = 'application/x-www-form-urlencoded'
   # And request 'username=PruebaOcto03@gmail.com&password=Prueba01'
    When method get
    Then status 200






