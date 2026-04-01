Return-Path: <linux-gpio+bounces-34530-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPyHDqHKzGn5WgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34530-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:34:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1DB375FAC
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25EDD3118B35
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3F137DEBB;
	Wed,  1 Apr 2026 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="od46VEHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3Grcxka"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE3437DE8D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028405; cv=none; b=UTp0CTW2Tg9J6dYRqR3cJdjYYmdWmEID8aLdJoo2d82SPO1wsjHpmzcHIpeG1qxQjaBgrUeVa1HOCJIjATf0tlwa/uDu4KX/Tn0t6Pyld8y6RggcuIS0ncspTAmiC/Ci3iIb90KirghVTRMJ0xkCXw6cbetHILTvyx9PlEsudtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028405; c=relaxed/simple;
	bh=CKt4o9MtJVlHGeGwYzQvEJIoQaM/NF+MZ+0HmD/yJ9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pr6jKxPfj5kPB6yNE20NfqPakkBqwGTWSDeCD9bq5d142nDAnInOBu3Z0hv+lBG2FZW66OAjOPf0LeHnCEqg9uw/CBUtzxvDWKGLBgSjWC4XlTSa4TUkpsSsltDN/+x1kVT8AzkemIGIiZXjiXrNov+BRbcjVc8oRfqKDJnMna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=od46VEHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3Grcxka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316P6Vs639170
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N12IT7QQm6dQyXdftpTiwQDPXATOjkTcFh3mc09NiTw=; b=od46VEHNjwjDL3Vx
	/OeLgV/Jzx3wRxqL6pce+ExMJvYw6dHlupKe05x8TX6+rs4cT2kQKPGJCaSIbKmD
	DF8PMicQUjDhsnJLoivbRz1wF4WXF+ZyRXxCjmFgU7poj8QiyQabSYEzQ1Q06Asu
	20+Y3WDEJWN+b7t/VBuVY1rp/tUfNWJDxnWZ6Y0KVnOaOhRAu9Fr/sc0ZjDcw4ng
	dJAAd7OSOYlV3lWfS5oP4WfDmHGmYbGSaXqoRHoS6VcajAMm6CVbpgz9TLlZ8K9y
	SmNVPk0SKTHsIFZ73K4usrY/2+mISWzohT+PIIb5wkLv0hz4o+K4UV+/9nObAjoq
	GeisFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2auxc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:26:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b92f327so205144381cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028402; x=1775633202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N12IT7QQm6dQyXdftpTiwQDPXATOjkTcFh3mc09NiTw=;
        b=C3Grcxkapkxc2UIIPU2BStpWdIHUmycRkf3v6X+xhglt16yXf5jd62f9Jf8SqDo2MB
         GpuqxByUawyV1CExmOeCZbekNSZXjlTJ1oMaSA+1FRTTd3CjA3FC6dev3Xh8UTMoXcs+
         RAk3p2F0fks+3sF1GCbrNpbckYCXVg3p5hMDP8HckRk9/9u/BBlQzPXieZ8DwXH2xNda
         kX6se0vrYro7Eje7OD0IbAUVM17LjmbNMJI3tG5c/24iMhYN041wzEF2SIpScUug0ju+
         DFtPPhWz9jaUrHk5Yey0XCZgYTiAKIJOmDbs1idPu4WRTls+kVEADTgi+P4shXsMQe/a
         Twfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028402; x=1775633202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N12IT7QQm6dQyXdftpTiwQDPXATOjkTcFh3mc09NiTw=;
        b=TNdSZapiI5ooR6SfYozCMKYBq+UzG8GUsnLl77ZgRYOoSt3i2oAY/TtAR2RWbC+OHI
         6cn7nINBGrA2rdXoI4Q8+1CbhMukFMqhWEpSCWeJg+nBytwQEKCQIEsbBSVtWTTP/kvJ
         a6k94u0ERkxndTME3FozkUNzjr9A5lKw+wuij5ThB1XeWVCuJKVAQXfKfKt/FCAaUkDS
         vXAfSU8lJyCeo5sdujmc/KcQiPiMaGNCjsb/kPva2Oo5F3jMuKON660kNM7KPtp33oCP
         9VtYNOYg9geezJ3ulIi9UKJUmOGeMGLrTzjq7NVl25EorPVyeawZKEfwNuIrvui9PEwS
         2Zzg==
X-Forwarded-Encrypted: i=1; AJvYcCU1Q9njViMHZ0kCbqCRUxlgs5UirW6cDi7yo4VHPikH6WAr/QfMO6bud38uE63N4XOlpk3o6MsZtQ7D@vger.kernel.org
X-Gm-Message-State: AOJu0YybXlrgpeaZBS0loomWCiLy6+fNHLTmP6qGeqroq5Een4CQG69v
	s6Jvo4XrmbssJ8o2JpQB6kfDDTFiVJmPwerK+VMBfhALY+rGVQO1clqwAanIV9t60z9zYiniGg+
	PPze+IV25GQs3yLh45z+7SSp9xaaA5+WsmpCJkS8Nu+2fGsPpdkQIreFIwl49U2mV
X-Gm-Gg: ATEYQzy5UJw2T08562tEYyfiwKOWlxb4JVttvqAWkw4KY/SijtiAsgdMTH1r3YARNa0
	8GMeFK60mfs18FwSr4oOFjEYALEUgKpowdYBf72AsyGwH2sysZ/SGCpbaGl8nK1J6VYb6MvrbLF
	yyIwLcmzaRFId0Ksbq83EWO74ZOj0SCfcRNFolLrfMAy0KzEg+RsEMIS5Iegu0O/cwCAJfrIEo4
	kEAK2O57YCNJRKIWikSYnxevqEQSU6fYxN+58TKxieO5I7eECKpUs84PLrMjzcXTITCKdusZQfF
	9aTzG42k9qVn/jNlQnnGW4/Sk+kMeNRpvBlcIrjoOzDivlx2/daARv1fDeRrJGE2v8EEjRQUm2W
	C1YFSrd1uLbtX5Gg6cG5FQGAn7WsTww+CbHfv/K54eLI5byCtcBzoOUUryZOxnJ8AWowogwPl+k
	8U5UUhBnV+/mxrJPEQUAT25dkbcfx/FcFalaM=
X-Received: by 2002:a05:622a:347:b0:509:31bd:3de4 with SMTP id d75a77b69052e-50d3bd36066mr35219991cf.56.1775028402498;
        Wed, 01 Apr 2026 00:26:42 -0700 (PDT)
X-Received: by 2002:a05:622a:347:b0:509:31bd:3de4 with SMTP id d75a77b69052e-50d3bd36066mr35219721cf.56.1775028402051;
        Wed, 01 Apr 2026 00:26:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:20 +0300
Subject: [PATCH 01/19] dt-bindings: display/panel: himax,hx83102: describe
 Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-1-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CKt4o9MtJVlHGeGwYzQvEJIoQaM/NF+MZ+0HmD/yJ9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMir8s4mocEGfwo31npITXA+knKdJ0LlAlBqt
 gVKdrFjX8WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1VWYB/wJdQeubNmHeczzuJLLmF7yqFrmL82/+5J8KYZss0rUKi5WcUnMkcq6dn2fLFtWP5otFYy
 8uHY1u4ofoZopDx3Frg/jcOb/L0ALVBm8Liwf59rXDFNAUL53MkK6CjqzFYaykpQQrdDdmpVpHT
 6xTTKR9Q1WRwfIDgfJYehbSfDWWxKanI10Pi2s+5DhWL8CTZ307txR8hYtFg+JTts18TPlxkm0U
 DyK2pxAdKhSzJM/MACuc2ekEc7q6hPx3FqAjAWxKKh2uVu1L78A/6Cgj3LkoSD91cvBniugcYw6
 Kn88RcMJU+B/YNJPqamd152wYxjGoUV+4qCJ/+XmwyPPSexa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX6saBjOsDbD10
 NyTseyQwc9taBNGtZvknGOqTTdBh/VzWVe4ES3RPVQVCAEuqxRJjnhriP2sU6PYA5MjLoQCi+qa
 QMlOdRUCUuEY6lvOKP34eZKziVMjmfvlTFit3ch05W1dVTshfQ+s+k74o1IcgQ39DK78sxmYgZ9
 cNRkK2NgXpa7AATp4/Nx4URSaswpEOWNoxMg+OdIybdW7VJJXgD0fqBVJpRyiJ+mpSQZG0N+QIi
 1SvHuJKx7Xg60/HvGxslAfLgq75q0wh/De0uSc8klzGll7U7I7wVX/iRdkUGD+rESBjhEaOP5v/
 ND3BFw3RfHQOsz+L3cpyFiWcnoPmOSTaD2vnihiBuGRfl/ErQmRv8q7H+uEO9qEHf6Sbq/IZf25
 FgyUzZ/NSqsMyCYYeYFi2lbfVrq93I5yvxZ+bGdIXOMEaNShj4YKHgVz+Z0T5aK1ZtmsXLiBumu
 zpfpYDZRAgFcV6r3t3w==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69ccc8b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dDwtKCuX-g0vR4_aJEQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yn8nGYRoDuvAxvRkmBnx0y2h_LSuOgA1
X-Proofpoint-ORIG-GUID: yn8nGYRoDuvAxvRkmBnx0y2h_LSuOgA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34530-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE1DB375FAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare 12.3-DSI-TOUCH-A panel which allegedly uses HX83102
as a panel controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index 66404b425af3..7667428bf9a8 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -30,6 +30,8 @@ properties:
           - starry,2082109qfh040022-50e
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
+          # Waveshare 12.3-DSI-TOUCH-A panel
+          - waveshare,12.3-dsi-touch-a
       - const: himax,hx83102
 
   reg:

-- 
2.47.3


