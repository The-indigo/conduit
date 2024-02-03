https://main--realworld-docs.netlify.app/docs/specs/backend-specs/endpoints
<h4>A medium backend Api clone</h4>
Database Technology: PostgreSql
<br>
Framework: SpringBoot 

<br>
Includes Spring security with oauth2 using Jwt authentication

<p>To run the application, add the following properties in your application.properties file</p>

<hr>
spring.datasource.url= jdbc:postgresql://localhost:5432/conduit
<br>
spring.datasource.username=<yourusername>
  <br>
spring.datasource.password=<yourpassword>
  <br>
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.PostgreSQLDialect
