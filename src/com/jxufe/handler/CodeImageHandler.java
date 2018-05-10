package com.jxufe.handler;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jxufe.util.ImageUtil;

public class CodeImageHandler extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public CodeImageHandler() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Object[] obj = ImageUtil.createImage();
		
		String code = (String) obj[0];
		BufferedImage image = (BufferedImage)obj[1];
		response.setContentType("image/png");
		try {
			ImageIO.write(image, "png", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
//	char[] codeList ={'A','B','C','D','E','F','G','H','A','B','C','D','E','F','G','H','I','J','K',
//			'L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i',
//			'D','E','F','G','H','A','B','C','D','E','F','G','H','A','B','C','D','E','F','G','H',
//			'j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
//			'0','1','2','3','4','5','6','7','8','9'};
//	Random random = new Random();
//	int width=140;
//	int height=40;
//	BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//	Graphics graphics = bufferedImage.getGraphics();
//	Color color = new Color(245, 245, 245);
//	graphics.setColor(color);
//	graphics.fillRect(0, 0, width, height);
//	
//	Font font = new Font("ËÎÌו",Font.BOLD|Font.ITALIC,20);
//	graphics.setFont(font);
//	int x = 30;
//	for(int i=0;i<4;i++){
//		color = new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));
//		graphics.setColor(color);
//		graphics.drawString(codeList[random.nextInt(codeList.length)]+"", x, 25);
//		x+=20;
//	}
//	ImageIO.write(bufferedImage, "jpg", response.getOutputStream());

}
