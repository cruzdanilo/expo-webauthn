import { requireNativeModule } from "expo-modules-core";

export default requireNativeModule<{
  create: (pubKeyCredParams: PublicKeyCredentialParameters[]) => Promise<string>;
}>("ExpoWebauthn");
