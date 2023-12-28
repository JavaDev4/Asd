import io.cucumber.java.en.*;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class PageaTypeControllerSteps {

    private PageaTypeController controller;
    private PageTypeResponse pageTypeResponse;
    private ErrorResponse errorResponse;
    private String clientId;
    private int actualStatusCode;

    @Given("the client is authorized with client ID {string}")
    public void the_client_is_authorized_with_client_id(String clientId) {
        this.clientId = clientId;
        // Setup your mock authorization here
    }

    @Given("a {string} page type request")
    public void a_page_type_request(String requestType) {
        // Mock the request based on requestType (valid or invalid)
        // Setup expected responses from pageTypeService
    }

    @When("the client sends a request to create a page type")
    public void the_client_sends_a_request_to_create_a_page_type() {
        // Call the controller method here and capture the response
        // Set the actualStatusCode based on the response
    }

    @Then("a response with status code {int} is returned")
    public void a_response_with_status_code_is_returned(int expectedStatusCode) {
        assertEquals(expectedStatusCode, actualStatusCode);
    }

    @Then("the response contains a {string} type")
    public void the_response_contains_a_type(String responseType) {
        // Assert based on responseType (PageTypeResponse or ErrorResponse)
    }

    // Additional steps and methods as needed
}