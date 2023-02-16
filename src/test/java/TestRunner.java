
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;

import static org.junit.Assert.*;


public class TestRunner {

    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:features").parallel(6);
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);

    }

}
