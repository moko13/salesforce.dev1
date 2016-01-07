public class StringArrayTest {

    public static List<String> generateStringArray(Integer Nb) {
    
        List<String> Strings = new List<String>();
        for (Integer i = 0;i<Nb;i++)
            Strings.add('Test ' + i);
    
        return Strings;
    }
}