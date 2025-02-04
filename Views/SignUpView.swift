import SwiftUI

struct SignUpView: View {
    // MARK: - State Variables
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // We'll call AuthService here
                AuthService().signUp(email: email, password: password) { result in
                    switch result {
                    case .success(let user):
                        print("User signed up successfully: \(user.uid)")
                    case .failure(let error):
                        print("Sign-up error: \(error.localizedDescription)")
                    }
                }
            }) {
                Text("Create Account")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}