
import java.io.File;
import java.util.Calendar;

public aspect Log {
	//VARIABLES
	int hora, minutos, segundos;
    Calendar cal = Calendar.getInstance();
    
    //ADVICES
    pointcut callDepositar() : call(* *.*Transaction() );
    after() : callDepositar() {
    	hora =cal.get(Calendar.HOUR_OF_DAY);
    	minutos = cal.get(Calendar.MINUTE);
    	segundos = cal.get(Calendar.SECOND);
    	String tiempo = hora + ":" + minutos + ":" + segundos; 
    	System.out.println("El deposito se realizo a las "+ tiempo);
    }
    
    pointcut callRetiro() : call(* *.*Withdrawal());
    after() : callRetiro(){
    	hora =cal.get(Calendar.HOUR_OF_DAY);
  	  	minutos = cal.get(Calendar.MINUTE);
  	  	segundos = cal.get(Calendar.SECOND);
  	  	String tiempo = hora + ":" + minutos + ":" + segundos; 
  	  	System.out.println("El retiro se realizo a las " +hora + ":" + minutos + ":" + segundos);
    }
}
