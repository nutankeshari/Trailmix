public class StringArrayTest {
    public static List<String> generateStringArray(Integer val){
        List<String> lst = new List<String>();
        for(Integer i = 0; i <val ; i++) {
            lst.add('Test ' + i);
        }
        return lst;
    }
}