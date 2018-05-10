package com.jxufe.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

public class ImageUtil {
	private static final char[] codes = {
		'0','1','2','3','4','5','6','7','8','9',
		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',  
        'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',  
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',   
        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
	
	private static int SIZE = 4;//字符数量,用户设置
	
	private static int FONT_SIZE = 30;//字体大小
	
	private static int WIDTH = 80;//宽度，根据字符数量和字体自动生成	
	
	private static int HEIGHT = 34;//高度,根据字体自动生成
	
	
	
	public static int getSIZE() {
		return SIZE;
	}

	public static void setSIZE(int sIZE) {
		SIZE = sIZE;
	}

	public static int getWIDTH() {
		return WIDTH;
	}

	public static void setWIDTH(int wIDTH) {
		WIDTH = wIDTH;
	}

	public static int getHEIGHT() {
		return HEIGHT;
	}

	public static void setHEIGHT(int hEIGHT) {
		HEIGHT = hEIGHT;
	}

	public static int getFONT_SIZE() {
		return FONT_SIZE;
	}

	public static void setFONT_SIZE(int fONT_SIZE) {
		FONT_SIZE = fONT_SIZE;
	}


	public static Object[] createImage(){
		
		BufferedImage bufferedImage = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		Graphics graphics = bufferedImage.getGraphics();
		
		graphics.setColor(new Color(245, 245, 245));
		graphics.setFont(new Font("宋体", Font.BOLD|Font.ITALIC, 20));
		graphics.fillRect(0, 0, WIDTH, HEIGHT);
		
		Random random = new Random();
		int x = 8;
		String code = "";
		
		for (int i = 0; i < SIZE; i++) {
			Color color = new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
			graphics.setColor(color);
			code = codes[random.nextInt(codes.length)]+"";
			
			graphics.drawString(code, x, 25);
			x+=20;//验证码数字之间的距离
		}
		
		return new Object[]{code, bufferedImage};
	}
	
	
	public static void main(String[] args){
		Object[] obj = ImageUtil.createImage();
		
		String code = (String) obj[0];
		BufferedImage image = (BufferedImage)obj[1];		
		Random random = new Random();
		
		try {
			ImageIO.write(image, "png", new FileOutputStream("d:/"+random.nextInt(100)+".png"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();	
		}
	}
	
}