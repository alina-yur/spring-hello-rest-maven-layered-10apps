package example.spring.layered.single;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.jackson.autoconfigure.JacksonAutoConfiguration;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootConfiguration(proxyBeanMethods = false)
@EnableAutoConfiguration(exclude = JacksonAutoConfiguration.class)
@RestController
public final class HelloPortuguese extends BaseSingleLanguageApplication {

	private static final String GREETING = "Olá";

	public static void main(String[] args) {
		launch(HelloPortuguese.class, args);
	}

	@GetMapping(path = "/hello/portuguese", produces = TEXT_PLAIN)
	public String hello() {
		return GREETING;
	}

	@Override
	protected String greeting() {
		return GREETING;
	}

}
