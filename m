Return-Path: <linux-gpio+bounces-35219-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OmbHFDA4mmF9wAAu9opvQ
	(envelope-from <linux-gpio+bounces-35219-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 01:20:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1144941F232
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 01:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D7C6307AA62
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 23:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAAA37F8AE;
	Fri, 17 Apr 2026 23:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6VdFk92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZN4b0r6I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8E237F727
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467792; cv=none; b=VzYdVULtkzTlCosb8tKQbWrsCIyID4F5VjWtzJNdye8NRigkPP1ORi6r/F5mZAlygIaDMesha/bUZD3K80PRQHPjaNn/DbyE0PfrHNWTmjNY6Y5eKVuToKeqNRdXichzux21wwuu77ATXm5ttF0S2c3imWMWRejzGtsg3oUB6qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467792; c=relaxed/simple;
	bh=00/cQNg1NYCrw4ioCag9pzQGr6M5HdXkljprZfWJ4u0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ofka9halrA2TDh8JIzhIX+G4gdGzoEQuAP2LWjLJVn/xpIS+rAqbH5jqIw1WwlMFzxbLkSisPQgixlRZPvf/lF8YsynsvTY56OuCR9KvYT233C0w/ETXXe46yMt6tsc39Dw1kI3H6hbhTDrHJpQW0i3Ibrl5p5SUqkI5NBcQBM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6VdFk92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZN4b0r6I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4XR3454890
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=; b=M6VdFk920NS+avqG
	GjTn/q0E1gYwG1uy/SDwcfo+AIsrrw5nkLAYe6Y6ePj/7zw/p4ojqxZvjIF0IIfL
	enG1wyz+BBCThgAwiD5yYr3L6Smiq6Ig1Eaxj8M+fr4445d9tf1jGdxUL43qAHa/
	y0hIVodbpU4Lzz/uckFim3hFtIhUhg/YASf3F4VRzwIRjITuD6vEhK6USBeF/avx
	DccxkncHRf7TqK0AqEN/H+ZT6HjpeUUdsUJ5X+mbn7SPgHAi3mW3XP9gEe+LUM9l
	IXzh2mLJvJRaDreN5pFXAsbBbxzNv8ETzW61NR9L4NE4WTSFfqgmPq3gJpH2pnKn
	hAv8JA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88u2s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 23:16:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da31af14cso34899741cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2026 16:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776467790; x=1777072590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=;
        b=ZN4b0r6Ip6EwUUco8sVj91m/rwsFs7oOVyHYcTHfViRy9n2GQrfFjE1Wwl0WkZSQl3
         bvjRVGyM0F0BIGm8p2URLLkhOeWMM/oxR6R1a6r/je1Kvw9VVSebpie562tdN3sHkB2j
         K5DApow/Cnt5rPG0Tayob+UpPpyrjM3pv5LEOnAwa62X2YjUAGuSmNP80Wv8DzCHe3p3
         9H5PEHHEzHLc/qPz+eHNrGMTd/hbLXL4xZEo5DbYpGdtRChYkchllRJCOpQCBd0xP/No
         FTa0mFQTQrTQPqOxvmd1aEy7D2PnFhsqZ4swkI3mBeBiulva16ucF8LPYqfe0rUxYwsu
         0n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776467790; x=1777072590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UaXfMj4md5QwxeQ+qMkZw/Ldu7dQBBhgDOqaQ8DvWT0=;
        b=XbN11MTSjo7xBA/GRLaTG6uhCTRPzsY+BB+gcR/mjM4IiisK6qo7dfPhQ21Wmxkpuz
         Hln9TzaMuvA2Wc+h2j9W1Ezkt8ghIzu8IsxNbv/dQSAqiGheJP+orwmQ7bNejYCpJe4k
         1eYVpYxh5/lIG5hDNdF2KWBXuNDT1MGTwGETpSyvS/XvkToQeRmWVcH06/2C266N9QZl
         6PtDqAHWB2jUZ/t0arXnIcH4qxY3it2Dgo+zKEolYsqVQC9uqn34JD0pn/Mpt2MyYTda
         dcFjBlMmQjIFLOsnQrkQ7RbRWLPPBvVRebBFpLuaprsfuUZ2BiiXF4GEL0zdJu9yU9L6
         7KCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Lx2WHu582TrWC5KIlEweWLjUGfZwgGQrpaQQzR4pYxMvCub5SHQu0r18ndFnMU+UDx0RBavosUvzV@vger.kernel.org
X-Gm-Message-State: AOJu0YxLkHIyByt5aWHNRGbsNdBljJ6MCRQ4Bd4md5MV4d9NKDEiyjhn
	AnMqDY0tn+bq5TUDhdToClHWKRqin33InLggviT9rFvmZPBClYCg8dgO5hzpEOto/VvTEcAuU8q
	yGTrKMy6KrzyyiGiNb4qwKLM5kDVDfjLR3O8sNlg5IZpsobDivc5+ogiwCrCQIOaX
X-Gm-Gg: AeBDieumzbd7tSXcebszYeeKfh+bwg9uCEb2Q8rI8zRCZ1bNWxaiQY8cphL0dV2HkkW
	YAOq7OBM/5ihz0CcRw4kalggmMUFo9BFlMPFzg6McZoDWGPOlEkse6L7fytCuG6maf4VwnAFjGg
	sD1SuVwedWHdHniKDsbNExx3QUMpq6HqpGvFH9Gz4hP0fDLUy8OEIAw0AOOWjCXckSv/1/t2hZ2
	x++t+mVZYEsq9V4x1mHaW++gCwwSF5/ofe2RWCY+tyfa2DdFPjCJjeb+ZS1A/D8ZfMdLiuGdNGy
	QsZbt8oPwATrqCry3TxY/q/+ybJZQtFStmRcBsfz3R51RR24lb8WLU3ysW5JQclK9lihW8Dobbp
	BdFkF6q4qNETrbcH0ZIe4+HW6jPb4I0GM3K9fCPW+d8wV96TfpOr1n5HRAky44OqS0+bXGHDLPj
	1NUWMLLVghFh45SlawLo0JS9TOqRS826tQxGnnd4XadSYRcQ==
X-Received: by 2002:a05:622a:a06:b0:509:3141:312c with SMTP id d75a77b69052e-50e36c39df8mr75420771cf.40.1776467789956;
        Fri, 17 Apr 2026 16:16:29 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:509:3141:312c with SMTP id d75a77b69052e-50e36c39df8mr75420261cf.40.1776467789530;
        Fri, 17 Apr 2026 16:16:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad12asm815695e87.1.2026.04.17.16.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:16:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 18 Apr 2026 02:16:20 +0300
Subject: [PATCH v4 1/4] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-waveshare-dsi-touch-v4-1-b249f3e702bd@oss.qualcomm.com>
References: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
In-Reply-To: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=00/cQNg1NYCrw4ioCag9pzQGr6M5HdXkljprZfWJ4u0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4r9I3pRwfKe7m7I0xhk+TZMgKAV07C9sH2XED
 p3U2kOs/rmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeK/SAAKCRCLPIo+Aiko
 1RMzCACS8ny///gSx5KtGdFeNzfsEAXWQCiN7UvY7WbiiTv9uAFzhoF2rhcpMq4hUP8XOkBXV+Z
 aM9Yr2dA7CM5gMEaE7ULarGlYjsr1tgxPn/foPrOGssvxvkkIBhhspHuw9SFU4MVMx/wgDc7DPN
 XLl9k4rrBa5setOah1P+peF4XISgxSE3uBKrJGLNS/37do+cbIaQS2muEdNT3dDUse+cK8Ce/B7
 g3J+EBrojUaK+ersgFWQ/Gj69UXHyrDaRQGepkvaKafWYgcHSVCzMkjmrxaAXHyvqTRFHiqsNVV
 ogHgfLXUwdYqX+/WT2ZuBEA2sxYGC8fE+mRkWYrLG3QZBbo2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: yNfP19Ymucf-0pfRYEEjs9D16RdmAnUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMSBTYWx0ZWRfX+8PVEX+ysrLN
 TjyjpmT5vjFwqheK2lE6mQ4dEYAzw2qjvGt+ujfl5xnJUCCZSbYSpiZ9Q3xQm3gsy6XBtXdKtsD
 inmASaV++BQ3VsI+rGCCg84TlWpwWi1wOVVFizpm3hsHQC6qJpLH103i3hX1m8DEokbHGFjdb+t
 sh1r4/lIHMCRIwP0dPMyIVKnUck5NH3Ecd1AyYRPLEbDYp/S2FhmgtXMtyrrlNKtNr4WK4MeQ5B
 1YP7UYnf5iCfYqXSqzrOLOAw9Ka+a5cz59L/06iT0z1vFxCmkPfZF7r0hakB5Uaii7aSk6COSFV
 CJO7GNvVRs2XqzLlswDuwyRuwG/1cIpiDFyCQ4Uh5k78h2gvVpdjIC0fQx40v+/BYImF93MH6Mc
 YvZcIG6DCRLH62qBciCN2AkGAdD61kMZez8y5sb1v2Wz0l8ui5Tk/RfRBTer0kwFRq5+SpMPJx6
 bK/mSpPaFLEiIHI4Csg==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e2bf4e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=sGmTDZJufn-iKI-mlscA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: yNfP19Ymucf-0pfRYEEjs9D16RdmAnUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170231
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35219-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1144941F232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare 7" DSI panel which uses ILI9881 as a panel
controller. This panel requires two voltags supplies, so add separate
iovcc supply.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index d979701a00a8..42e35986fbf6 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -24,6 +24,7 @@ properties:
           - raspberrypi,dsi-7inch
           - startek,kd050hdfia020
           - tdo,tl050hdv35
+          - waveshare,7.0-dsi-touch-a
           - wanchanglong,w552946aaa
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
@@ -34,6 +35,7 @@ properties:
   backlight: true
   port: true
   power-supply: true
+  iovcc-supply: true
   reset-gpios: true
   rotation: true
 

-- 
2.47.3


