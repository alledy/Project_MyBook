package mybook.my.book;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {

	 /* 인증 요청문을 구성하는 파라미터 */
		//client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
		//response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.
		//redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다.
		//state: 애플리케이션이 생성한 상태 토큰
	private final static String CLIENT_ID = "Ch1Mh8atP6hvX2X5HGQM";
    private final static String CLIENT_SECRET = "_nng9isaQ0";
    private final static String REDIRECT_URI = "http://localhost:8000/book/naver/callback.do";
    private final static String SESSION_STATE = "oauth_state";
    /* ?��로필 조회 API URL */
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    /* ?��?���? ?��?��?���? ?���?  URL ?��?��  Method */
    public String getAuthorizationUrl(HttpSession session) {

    	/* 세션 유효성 검증을 위하여 난수를 생성 */
        String state = generateRandomString();
        /* ?��?��?�� ?��?�� 값을 session?�� ???�� */
        setSession(session,state);        

        /* Scribe?��?�� ?��공하?�� ?���? URL ?��?�� 기능?�� ?��?��?��?�� ?��?���? ?���? URL ?��?�� */
        OAuth20Service oauthService = new ServiceBuilder()                                                   
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state) //?��?�� ?��?��?�� ?��?��값을 ?���? URL?��?��?�� ?��?��?��
                .build(NaverLoginApi.instance());

        return oauthService.getAuthorizationUrl();
    }

    /* ?��?��버아?��?���? Callback 처리 �?  AccessToken ?��?�� Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{

    	   /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
        String sessionState = getSession(session);
        if(StringUtils.pathEquals(sessionState, state)){

            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());

            /* Scribe?��?�� ?��공하?�� AccessToken ?��?�� 기능?���? ?��?���? Access Token?�� ?��?�� */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }

    /* ?��?�� ?��?��?�� �?증을 ?��?�� ?��?�� ?��?���? */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }

    /* http session?�� ?��?��?�� ???�� */
    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);     
    }

    /* http session?��?�� ?��?��?�� �??��?���? */ 
    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }
    /* Access Token?�� ?��?��?��?�� ?��?���? ?��?��?�� ?��로필 API�? ?���? */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI).build(NaverLoginApi.instance());

            OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }

}