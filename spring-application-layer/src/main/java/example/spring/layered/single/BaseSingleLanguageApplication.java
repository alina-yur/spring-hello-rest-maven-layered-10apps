package example.spring.layered.single;

import org.springframework.boot.SpringApplication;
import org.springframework.web.bind.annotation.GetMapping;

public abstract class BaseSingleLanguageApplication {

	protected static final String TEXT_PLAIN = "text/plain;charset=UTF-8";

	protected static void launch(Class<?> applicationClass, String[] args) {
		SpringApplication.run(applicationClass, args);
	}

	@GetMapping(path = "/", produces = TEXT_PLAIN)
	public String index() {
		return greeting();
	}

	protected abstract String greeting();

}
