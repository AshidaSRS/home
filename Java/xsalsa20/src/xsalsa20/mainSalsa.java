package xsalsa20;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;


public class mainSalsa {
	public static void main(String[] args) throws NoSuchAlgorithmException, NoSuchPaddingException {
		byte[] MESSAGE = "Test message to encrypt";
		KeyGenerator kg = KeyGenerator.getInstance("XSALSA20");
		SecretKey key = kg.generateKey();
		
		// Create a secure random number generator
		SecureRandom sr = SecureRandom.getInstance("XSALSA20");

		// Get 1024 random bits
		byte[] bytes = new byte[1024/8];
		   sr.nextBytes(bytes);

	    // Create two secure number generators with the same seed
		int seedByteCount = 10;
		byte[] nonce = sr.generateSeed(seedByteCount);
		
		Cipher cipher = Cipher.getInstance("XSALAS20");
		cipher.init(Cipher.ENCRYPT_MODE, key);
		byte[] encrypted= new byte[cipher.getOutputSize(MESSAGE.length())];
		int enc_len = cipher.update(MESSAGE, 0, MESSAGE.length(), encrypted, 0);
		enc_len += cipher.doFinal(encrypted, enc_len);
	}
}
