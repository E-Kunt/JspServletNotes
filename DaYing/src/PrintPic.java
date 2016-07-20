import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;

public class PrintPic {

	public static void main(String[] args) {
		PrinterJob job = PrinterJob.getPrinterJob();
		job.setPrintable(new HelloWorldPrinter());
		boolean doPrint = job.printDialog();
		if (doPrint) {
			try {
				job.print();
			} catch (PrinterException e) {
				System.out.println("The job did not successfully complete");
			}
		}

	}

}
