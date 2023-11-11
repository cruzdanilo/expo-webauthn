import ExpoModulesCore

public class ExpoWebauthn: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoWebauthn")

    AsyncFunction("create") { (pubKeyCredParams: [PublicKeyCredentialParameters]) -> [UInt8]? in
      let attributes: NSDictionary = [
        kSecAttrKeyType: kSecAttrKeyTypeECSECPrimeRandom,
        kSecAttrKeySizeInBits: 256,
        kSecAttrTokenID: kSecAttrTokenIDSecureEnclave,
        kSecPrivateKeyAttrs: [
          kSecAttrIsPermanent: true,
          kSecAttrApplicationTag: "webauthn".data(using: .utf8)!,
          // kSecAttrApplicationTag: name.data(using: .utf8)!,
          kSecAttrAccessControl: access,
        ],
      ]

      guard let privateKey = SecKeyCreateRandomKey(attributes, &error) else {
        return nil
      }

      return 69
    }

    // AsyncFunction("getPublicKey") { (keyName: String) -> [UInt8]? in
    //   var error: Unmanaged<CFError>?
    //   guard let key = getOrCreateKey(name: keyName) else {
    //     return nil
    //   }
    //   guard let publicKey = SecKeyCopyPublicKey(key) else {
    //     return nil
    //   }
    //   guard let publicKeyData = SecKeyCopyExternalRepresentation(publicKey, &error) as Data? else {
    //     throw error!.takeRetainedValue() as Error
    //   }
    //   return [UInt8](publicKeyData)
    // }
  }
}

struct PublicKeyCredentialParameters: Record {
  @Field
  var alg: Int

  @Field
  var type: String
}
