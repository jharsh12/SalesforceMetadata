public class StringArrayTest {
    public static List<String> generateStringArray(Integer len){
        List<String> StrArr = new List<String>();
        for (Integer i=0; i<len; i++){
            StrArr.add('Test '+i);
            System.debug(StrArr[i]);
        }
        return StrArr;
    }
}