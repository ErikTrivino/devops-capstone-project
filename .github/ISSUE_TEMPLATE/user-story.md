Historia de Usuario 1: Leer una cuenta
As a Customer Service Representative

I need to retrieve a single customer account by its ID

So that I can view the details of a specific customer.

Details and Assumptions:

El endpoint debe ser GET /accounts/<id>.

Si el ID no existe, debe devolver un error 404.

Acceptance Criteria:

Gherkin

Given the database is populated with accounts
When I send a GET request to /accounts/1
Then I should receive a 200 OK response with the account details
Historia de Usuario 2: Listar todas las cuentas
As a Data Analyst

I need to list all customer accounts

So that I can see an overview of our entire customer base.

Details and Assumptions:

Endpoint: GET /accounts.

Debe devolver una lista (array) de objetos.

Acceptance Criteria:

Gherkin

Given there are multiple accounts in the system
When I send a GET request to /accounts
Then I should receive a 200 OK and a list containing all accounts
Historia de Usuario 3: Actualizar una cuenta
As a Customer

I need to update my personal information

So that my account data remains accurate.

Details and Assumptions:

Endpoint: PUT /accounts/<id>.

Solo se deben permitir cambios en campos editables (ej. nombre, dirección).

Acceptance Criteria:

Gherkin

Given an account with ID 5 exists
When I send a PUT request to /accounts/5 with updated data
Then I should receive a 200 OK and the account should be updated in the DB
Historia de Usuario 4: Eliminar una cuenta
As a Compliance Officer

I need to delete a customer account

So that we comply with data privacy "right to be forgotten" requests.

Details and Assumptions:

Endpoint: DELETE /accounts/<id>.

Acceptance Criteria:

Gherkin

Given an account with ID 10 exists
When I send a DELETE request to /accounts/10
Then I should receive a 204 No Content and the account should no longer exist