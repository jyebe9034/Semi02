package kh.semi.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimerTask;

import kh.semi.dao.ManagerDAO;
import kh.semi.dto.TimePersonCountDTO;
import kh.semi.servlet.MembersController;

public class TimeVisiterCount extends TimerTask{
	ManagerDAO dao = new ManagerDAO();
	TimePersonCountDTO dto = new TimePersonCountDTO();
	 @Override
	 public void run() {
			try {
				SimpleDateFormat format = new SimpleDateFormat ("HHmmss");
				Date time = new Date();
				String time1 = format.format(time);
				int realTime=Integer.parseInt(time1)/10000+1;
				int realTime2 = Integer.parseInt(time1);
				dao.timePerson(MembersController.timePerson,realTime);
				if(235900<realTime2 && realTime2<235959) {
					dao.allTimeUpdate();
					MembersController.visitPerson=0;
				}
				if(MembersController.count==60) {
					MembersController.timePerson = 0;
				System.out.println(MembersController.timePerson);
				MembersController.count=0;
				}else {
					MembersController.count++;		
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	 }	 
}
