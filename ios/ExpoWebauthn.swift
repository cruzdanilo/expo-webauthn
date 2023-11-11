import ExpoModulesCore

public class ExpoWebauthn: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoWebauthn")

    AsyncFunction("create") {
      (pubKeyCredParams: [PublicKeyCredentialParameters], promise: Promise) in
      DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        promise.resolve(pubKeyCredParams[0].type)
      }
    }
  }
}

struct PublicKeyCredentialParameters: Record {
  @Field
  var alg: Int

  @Field
  var type: String
}
