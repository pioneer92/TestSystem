package com.njupt.tools;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author 鏈�
 */
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

/*鐢熸垚楠岃瘉鐮佸浘鐗�
 */
public class MakeCertPic {

    //楠岃瘉鐮佸浘鐗囦腑鍙互鍑虹幇鐨勫瓧绗﹂泦锛屽彲浠ユ牴鎹渶瑕佷慨鏀�
    private char mapTable[] = {
        'a', 'b', 'c', 'd', 'e', 'f',
        'g', 'h', 'i', 'j', 'k', 'l',
        'm', 'n', 'o', 'p', 'q', 'r',   
        's', 't', 'u', 'v', 'w', 'x',
        'y', 'z', '0', '1', '2', '3',
        '4', '5', '6', '7', '8', '9'
    };

    public String getCertPic(int width, int height, OutputStream os) {
        if (width <= 0) {
            width = 60;
        }
        if (height <= 0) {
            height = 20;
        }
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //鑾峰彇鍥惧舰涓婁笅鏂�
        Graphics g = image.getGraphics();
        //璁惧畾鑳屾櫙棰滆壊
        g.setColor(new Color(0xDCDCDC));
        g.fillRect(0, 0, width, height);
        //鐢昏竟妗�
        g.setColor(Color.black);
        g.drawRect(0, 0, width - 1, height - 1);
        //闅忔満浜х敓鐨勯獙璇佺爜
        String strEnsure = "";
        //4浠ｈ〃4涓洪獙璇佺爜锛屽鏋滆浜х敓鏇村浣嶇殑楠岃瘉鐮侊紝鍒欏姞澶ф暟鍊�
        for (int i = 0; i < 4; ++i) {
            strEnsure += mapTable[(int) (mapTable.length * Math.random())];
        }
        //灏嗚璇佺爜鏄剧ず鍒板浘鍍忎腑锛屽鏋滆鐢熸垚鏇村浣嶇殑楠岃瘉鐮侊紝澧炲姞drawString璇彞
        g.setColor(Color.black);
        g.setFont(new Font("Atlantic Inline", Font.PLAIN, 18));
        String str = strEnsure.substring(0, 1);
        g.drawString(str, 8, 17);
        str = strEnsure.substring(1, 2);
        g.drawString(str, 20, 15);
        str = strEnsure.substring(2, 3);
        g.drawString(str, 35, 18);
        str = strEnsure.substring(3, 4);
        g.drawString(str, 45, 15);
        //闅忔満浜х敓15涓共鎵扮偣
        Random rand = new Random();
        for (int i = 0; i < 10; i++) {
            int x = rand.nextInt(width);
            int y = rand.nextInt(height);
            g.drawOval(x, y, 1, 1);
        }
        //閲婃斁鍥惧舰涓婁笅鏂�
        g.dispose();
        try {
            //杈撳嚭鍥惧舰鍒伴〉闈�
            ImageIO.write(image, "JPEG", os);

        } catch (IOException e) {
            return "";
        }
        return strEnsure;
    }
}
