import java.security.MessageDigest

/**
 * Created by illerax on 03.10.2015.
 */
class SHACodec {
    static encode = { target ->
        MessageDigest md = MessageDigest.getInstance('SHA')
        md.update(target.getBytes('UTF-8'))
        return new String(md.digest()).encodeAsBase64()
    }
}