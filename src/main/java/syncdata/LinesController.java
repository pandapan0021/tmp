package syncdata;

import java.util.List;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LinesController {

    private List<String> lines;
    private final AtomicLong counter = new AtomicLong();

    @RequestMapping("/lines")
    public Lines lines() {
        lines = new ArrayList<String>();
        for(int i=0; i<100; i++){
            lines.add(i, Integer.toString(i));
        }
        return new Lines(counter.incrementAndGet(), lines);
    }
}