package dywh.ml.util;

import java.io.File;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FileTools {
	/**
	 * 获取ueditor上传到本地的文件src
	 * @param htmlTag
	 * @return
	 */
	public static String getFileSrc(String htmlTag) {
		Set<String> pics = new HashSet<>();
		String img = "";
        Pattern p_image;
        Matcher m_image;
        String regEx_img = "<*src\\s*=\\s*(.*?)[^>]*?>";
        p_image = Pattern.compile
                (regEx_img, Pattern.CASE_INSENSITIVE);
        m_image = p_image.matcher(htmlTag);
        while (m_image.find()) {
            // 得到所有src标签数据
            img = m_image.group();
            // 匹配src标签
            Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
            while (m.find()) {
                pics.add(m.group(1));
            }
        }
        String src=null;
        for(String str:pics) {
        	src=str;
        }
        return src;
	}
	/**
	 * 文件删除
	 */
	public static boolean delFile(String path) {
		String phyPath = "D:\\\\upload";
		String filePath =null;
		if(path!=null) {
			filePath = phyPath + path.substring(14).replaceAll("/", "\\\\\\\\");
		}
		System.out.println("filePath:" + filePath);
		boolean flag=false;
		if(filePath!=null) {
			File f = new File(filePath);
		if (f.exists()) {
			if (f.isFile()) {
				System.out.println("fName:" + f.getName()+"删除成功");
				f.delete();
				flag=true;
			}
		}
		}else {
			flag=true;//文件为空，无须删除
		}
		return flag;
	}
}
