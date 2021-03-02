public class UserDAO {
    public static User buscarPorNome(String strNome){
        return [
            SELECT
                Id
            FROM
                User
            WHERE
                Name = :strNome
            LIMIT
                1
        ];
    }
}
