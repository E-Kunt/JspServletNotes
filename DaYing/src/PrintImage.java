import java.io.*;
import javax.print.*;
import javax.print.attribute.*;
import javax.print.attribute.standard.*;

/**
 * 打印图片的类
 * 
 * @author tianmaochun
 * 
 */
public class PrintImage {
	/**
	 * 画图片的方法
	 * 
	 * @param fileName[图片的路径]
	 */
	public void drawImage(String fileName) {
		try {
			DocFlavor dof = null;
			// 根据用户选择不同的图片格式获得不同的打印设备
			if (fileName.endsWith(".gif")) {
				// gif
				dof = DocFlavor.INPUT_STREAM.GIF;
			} else if (fileName.endsWith(".jpg")) {
				// jpg
				dof = DocFlavor.INPUT_STREAM.JPEG;
			} else if (fileName.endsWith(".png")) {
				// png
				dof = DocFlavor.INPUT_STREAM.PNG;
			}
			// 字节流获取图片信息
			FileInputStream fin = new FileInputStream(fileName);
			// 获得打印属性
			PrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();
			// 每一次默认打印一页
			pras.add(new Copies(1));
			// 获得打印设备 ，字节流方式，图片格式
			PrintService pss[] = PrintServiceLookup.lookupPrintServices(dof, pras);
			// 如果没有获取打印机
			if (pss.length == 0) {
				// 终止程序
				System.out.println("如果没有获取到打印机。");
				return;
			}
			// 获取第一个打印机
			PrintService ps = pss[2];
			System.out.println("Printing image..........." + ps);
			// 获得打印工作
			DocPrintJob job = ps.createPrintJob();

			// 设置打印内容
			Doc doc = new SimpleDoc(fin, dof, null);
			// 出现设置对话框
			PrintService service = ServiceUI.printDialog(null, 50, 50, pss, ps, dof, pras);
			if (service != null) {
				// 开始打印
				job.print(doc, pras);
				fin.close();
			}
		} catch (IOException ie) {
			// 捕获io异常
			ie.printStackTrace();
		} catch (PrintException pe) {
			// 捕获打印异常
			pe.printStackTrace();
		}
	}

	/**
	 * 主函数
	 * 
	 * @param args
	 * 
	 */
	public static void main(String args[]) {
		PrintImage dp = new PrintImage();
		dp.drawImage("D:/Users/Lenovo/Pictures/16.jpg");
	}

}