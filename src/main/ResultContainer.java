package main;

import java.util.ArrayList;
import java.util.List;

public class ResultContainer {
    private List<Result> results;

    public ResultContainer() {
        this.results = new ArrayList<>();
    }

    public List<Result> getResults() {
        return this.results;
    }

    public ResultContainer add(Result result) {
        this.results.add(result);
        return this;
    }
}
