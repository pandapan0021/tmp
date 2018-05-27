package syncdata;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FetchAllController {

    @RequestMapping("/fetchall")
    public String fetchall(@RequestBody Map<String, String> map) {
        System.out.println("received");
        System.out.println(map);
        return "hello";
    }
}