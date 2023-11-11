import ExpoWebauthn from "./ExpoWebauthn";

// @ts-expect-error -- polyfill
global.navigator.credentials ??= {
  get(options) {
    throw new Error("not implemented");
  },
  async create(options) {
    if (!options?.publicKey) throw new Error("publicKey required");
    const { pubKeyCredParams } = options.publicKey;
    const result = await ExpoWebauthn.create(pubKeyCredParams);
    if (result) return result;
    throw new Error("no credential created");
  },
} as CredentialsContainer;
