package visualChart;

import java.util.*;

public class JSONObject
{
    private List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
    
    private String name = "object";
    
    private String[] keyName;
    
    public void putkey(String... json) {
        keyName = new String[json.length];
        for(int i = 0 ; i < json.length; i++)
        {
            keyName[i] = json[i];
        }
    }
    
    public void putValue(Object[] json)
    {
        try
        {
            HashMap map = new HashMap();
            for (int i = 0; i < json.length; i++)
            {
                map.put(keyName[i], json[i]);
            }
            list.add(map);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    @Override
    public String toString()
    {
        String line = "{ \"" + getName() + "\":[{\n";
        for(HashMap map : list)
        {
            Iterator<Map.Entry<String, Object>> it = map.entrySet().iterator();
            while(it.hasNext())
            {
                Map.Entry<String, Object> me = it.next();
                try{
                    Integer.parseInt((String)me.getValue());
                    line += "\t\"" + me.getKey() +"\":\"" + me.getValue() +"\",\n";
                }catch (Exception e) {
                    line += "\t\"" + me.getKey() +"\":" + me.getValue() +",\n";
                }
            }
            
            line = line.substring(0,line.length() -2 );
            line += "\n},\n{";
        }
        line = line.substring(0,line.length() -3 );
        line += "\n]};";
        return line;
    }
}
