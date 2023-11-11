import "expo-webauthn";

import registerRootComponent from "expo/build/launch/registerRootComponent";
import { useEffect } from "react";

registerRootComponent(function App() {
  useEffect(() => {
    navigator.credentials
      .create({
        publicKey: {
          rp: { id: "localhost", name: "expo-webauthn" },
          user: { id: new Uint8Array(32).buffer, name: "expo-webauthn", displayName: "expo-webauthn" },
          pubKeyCredParams: [{ type: "public-key", alg: -7 }],
          authenticatorSelection: { requireResidentKey: true, residentKey: "required" },
          challenge: new Uint8Array(32).buffer,
        },
      })
      .then(console.log);
  }, []);
  return null;
});
