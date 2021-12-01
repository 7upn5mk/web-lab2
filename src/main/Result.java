package main;

import java.util.Date;

public class Result {
    private double x,y,r;
    Date start_time;
    long executed_time; //millisecond
    private boolean hit;

    public Result(double x,double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.start_time = new Date();
        long startTime = System.nanoTime();
        this.hit = verify();
        long endTime = System.nanoTime();
        this.executed_time = (endTime - startTime);
    }

    private boolean verify() {
        return ((x<=r&&x>=0&&y<=r/2&&y>=0)||(x<=0&&y>=0&&(-x+y<=r))||(x<=0&&y<=0&&(x*x+y*y)<=r*r));
    }

    @Override
    public String toString() {
        return "{\"x\":"+x+",\"y\":"+y+",\"r\":"+r+",\"result\":"+(hit?"\"true\"":"\"false\"")+",\"time\":\""+start_time.toString()+"\",\"executed_time\":"+executed_time+"}";
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public Date getStart_time() {
        return start_time;
    }

    public long getExecuted_time() {
        return executed_time;
    }

    public boolean isHit() {
        return hit;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void setR(double r) {
        this.r = r;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public void setExecuted_time(long executed_time) {
        this.executed_time = executed_time;
    }

    public void setHit(boolean result) {
        this.hit = result;
    }
}
