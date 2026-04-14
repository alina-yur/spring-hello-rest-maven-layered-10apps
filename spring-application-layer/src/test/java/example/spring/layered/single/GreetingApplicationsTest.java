package example.spring.layered.single;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

class GreetingApplicationsTest {

	@ParameterizedTest
	@CsvSource(delimiter = '|', textBlock = """
		english|Hello
		french|Bonjour
		german|Hallo
		spanish|Hola
		italian|Ciao
		japanese|こんにちは
		ukrainian|Привіт
		portuguese|Olá
		korean|안녕하세요
		swiss|Grüezi
		""")
	void exposesLanguageGreetingFromEachApp(String language, String greeting) throws Exception {
		MockMvc mockMvc = MockMvcBuilders.standaloneSetup(applicationFor(language)).build();

		mockMvc.perform(get("/"))
			.andExpect(status().isOk())
			.andExpect(content().string(greeting));

		mockMvc.perform(get("/hello/" + language))
			.andExpect(status().isOk())
			.andExpect(content().string(greeting));
	}

	private static BaseSingleLanguageApplication applicationFor(String language) {
		return switch (language) {
			case "english" -> new HelloEnglish();
			case "french" -> new HelloFrench();
			case "german" -> new HelloGerman();
			case "spanish" -> new HelloSpanish();
			case "italian" -> new HelloItalian();
			case "japanese" -> new HelloJapanese();
			case "ukrainian" -> new HelloUkrainian();
			case "portuguese" -> new HelloPortuguese();
			case "korean" -> new HelloKorean();
			case "swiss" -> new HelloSwiss();
			default -> throw new IllegalArgumentException("Unsupported language: " + language);
		};
	}

}
