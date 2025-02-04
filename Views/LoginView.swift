import SwiftUI

struct LoginView: View {
    // MARK: - State Variables
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
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
                AuthService().login(email: email, password: password) { result in
                    switch result {
                    case .success(let user):
                        print("User logged in: \(user.uid)")
                    case .failure(let error):
                        print("Login error: \(error.localizedDescription)")
                    }
                }
            }) {
                Text("Log In")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}