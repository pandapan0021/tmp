package syncdata;

import java.util.List;

class Lines{
    private long id;
    private List<String> lines;

    public Lines(long id, List<String> lines){
        this.id = id;
        for(int i=0; i<lines.size(); i++){
            this.lines = lines;
        }
    }

    public long getId(){
        return this.id;
    }

    public List<String> getLines(){
        return this.lines;
    }
}