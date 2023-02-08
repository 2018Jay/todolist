package bean;

import java.text.SimpleDateFormat;
import java.time.LocalDate;

public class todobean {
	public String task,start_time,end_time;
  public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		start_time=new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}


  
}
