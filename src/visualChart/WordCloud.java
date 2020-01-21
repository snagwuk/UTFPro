package visualChart;

import java.util.*;
import java.util.Map.Entry;
import java.util.stream.Collectors;


import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WordCloud
{
    public static void main(String[] arg)
    {
        String url = "http://www.donga.com/news/article/all/20200120/99313577/1";
        String selector = "div[class~=article_txt]";
        //System.out.println(stringLine(url, selector, 0));
        System.out.println(map(url, selector,100));
    }
    
    private static String stringLine(String url, String selector, int i)
    {
        Document doc = null;
        String output = "";
        try
        {
            doc = Jsoup.connect(url).get();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        String line = doc.data();
        System.out.println(line);
        //line = line.substring(line.indexOf("cardList_wrap"));
        System.out.println(line);
        
        return line;
    }
    
    public static Map<String, Long> map(String url, String selector, int num)
    {
        Document doc = null;
        String output = "";
        List<String> list = new ArrayList();
        Map<String, Long> map = null;
        int count = 0;
        try
        {
            doc = Jsoup.connect(url).get();
        }
        catch (Exception e1)
        {
            e1.printStackTrace();
        }
        Elements titles = doc.select(selector);
        for( Element e :  titles)
        {
            String line = e.text();
            System.out.println(line);
            line=line.replace(",,",",");
            line=line.replace("\""," ");
            line=line.replace('1',' ');
            
            String [] strs = line.split(" ");
            list.addAll(Arrays.asList(strs));     
        }
        
        map = list.stream().filter(name -> !name.equals("")).collect(
                Collectors.groupingBy(String::toString,Collectors.
                                      mapping(String::toString, Collectors.counting())));
        Map<String,Long> map2 = map.entrySet().stream().sorted(new Comparator<Map.Entry>() {
            @SuppressWarnings("finally")
            public int compare(Entry o1,Entry o2)
            {
                long num1 = 0 ;
                long num2 = 0 ;
                try {
                    num1 = (long) (o1.getValue());
                    num2 = (long) (o2.getValue());
                }catch (Exception e) {
                     num1 = 0 ;
                     num2 = 0 ;
                }finally {
                    return (int) (num2-num1);
                }
            }

        }).collect(Collectors.toMap(s -> s.getKey() ,s -> s.getValue()));
        
        return map2;
    }
    
}
