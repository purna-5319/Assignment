import java.util.*;

class PasswordValidator {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        boolean isvalid = false;
        while (!isvalid) { // retry mechanism
            System.out.print("Enter your password: ");
            String str = sc.nextLine().trim();
            isvalid = Solve(str);
        }
    }

    // validating the password
    public static boolean Solve(String str) {
        boolean isupper = false;
        boolean isdigit = false;
        if (str.length() < 8) { // checking the string length
            System.out.println("Too Short");
            return false;
        } else {
            for (char ch : str.toCharArray()) {
                if (Character.isUpperCase(ch)) { // checking for uppercase letter
                    isupper = true;
                }
                if (Character.isDigit(ch)) { // checking for digit
                    isdigit = true;
                }
            }
        }
        // feedback
        if (isupper && isdigit) {
            System.out.println("Password created successfully");
            return true;
        } else if (isupper && !isdigit) {
            System.out.println("Missing a digit");
        } else if (!isupper && isdigit) {
            System.out.println("Missing an uppercase letter");
        } else {
            System.out.println("Password must contain an uppercase alphabet and a digit");
        }
        return false;
    }
}