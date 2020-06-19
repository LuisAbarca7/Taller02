
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Log {
	//VARIABLES
	File file = new File("src/archivos/log.txt");
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
		try {
			FileWriter fw;
			if(file.exists()) {
				fw = new FileWriter(file,true);
			}else {
				fw = new FileWriter(file);
			}
			fw.write("\n");
			fw.write("deposito : "+ tiempo);
			fw.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	pointcut callRetiro() : call(* *.*Withdrawal());
	after() : callRetiro(){
		hora =cal.get(Calendar.HOUR_OF_DAY);
		minutos = cal.get(Calendar.MINUTE);
		segundos = cal.get(Calendar.SECOND);
		String tiempo = hora + ":" + minutos + ":" + segundos; 
		System.out.println("El retiro se realizo a las " +hora + ":" + minutos + ":" + segundos);
		try {
			FileWriter fw;
			if(file.exists()) {
				fw = new FileWriter(file,true);
			}else {
				fw = new FileWriter(file);
			}
			fw.write("\n");
			fw.write("retiro : "+ tiempo);
			fw.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
}
