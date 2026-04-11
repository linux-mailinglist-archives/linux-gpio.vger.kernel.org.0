Return-Path: <linux-gpio+bounces-35031-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDyxDNI62mn0zAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35031-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:13:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C803DFBEC
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0673C305959B
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5898353EC0;
	Sat, 11 Apr 2026 12:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feTuxqXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hC7wq1Sa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0873537DD
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909455; cv=none; b=We+4ymlyYcWCIAweMVAze7oU/3mpIfTPjge/jqQkaH4LRaNFPdQ+LA12UEeh8JzdMHKo2Mhv3ehS8hJb1iC9ArYEc3FP9ypoKR6WpUHn3jpsMp1MFCkYFZVikkGE6n3ihNfreDfln4RYo3dQVpSw2Y6JYTR4NC5jGCvFHd7kACo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909455; c=relaxed/simple;
	bh=USkwXBfci9sIWJW06UXbOmxrqKMlrITA2EN65WJiKAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlXiDWZ8OGTllzkSGpiYrFO4v0hzXGB8xyeGkDc9r6mAfhz2Ix3ryXlJMc2uLJjo4pU26qo/1hCgg6AITOb9bXKBlNP1I0+q5rKXBqeZT8h6qrlFme03rXTYLrW+MVF1gGvNxFCVRK+cOLQBlAdIVxZm18cvnC7j1R+jMDgDov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feTuxqXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hC7wq1Sa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B433j32736600
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=; b=feTuxqXsGcTt9uq/
	6+2xm7UTQX8lQOiyqNWortvOz2yCLVQTs7BBZJ1ZnMLMjdqsAtQL/UiclIiiJ98J
	v6XJla6kY71vBQA7bfIKMK3SNOVYqEkSVgYCQCtbc3203EGPa0jPDpWk3WqH1HNR
	KAozu5PgpJsZvq3d35M7etgA4OQ7KCD1Yi51YFraLxADgDbMglU0sr0sGCrE5CYY
	S+hcQvV1/Rrh01qjSCbVOTLbltrd7EdOgXUVcgT4357hU3YNWS3cS9HboaYLcK2a
	GqcXni2mQXoDrvtCWWLIYXrUy2xEcDELvzcBPS6/CkBJu3QH5Rm0h1YBlmYi5akw
	+snIjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcrn00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d68dbb77bso19110001cf.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909452; x=1776514252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=;
        b=hC7wq1SajOc10T4tCXS2/h0sIjZ+lJcE/98pfGFT03LWyPV7XAuDsZME8EPsFWzYi7
         uZI4CkF8eEvb4IyavcR0XjHL2Hzzxejc3fcVpyIZDISN6h9A6j08gGJnfge+lkmnk9OR
         ZlsA2kL582eusj/0nt+XLUtHE/FZgGFw330JiDJsQhEOCunJoWdIAtZ3ZvDWxdNlJpec
         LneZ3T9q8fPLWczE3VQeNoODZJAGNoHMfYS48SogHKKu9os7rF7hVp/rBMtsYDLO7Iba
         6glq1AcNmMKyvfgOfbAh5ql4fUIxzTwCwxuBLrf7L2/sHkrJNItGiO/CF+4kDpt6vrx/
         viCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909452; x=1776514252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETYWoaJyM9VmKmVawKGSIxoRtEFEsHcnX/Tz5qCocnY=;
        b=ZPYJsoceYYBdwJXX4/+3JlXIrepiHa3PKMzSTwBiYPRjpqUOZs5p0rE+AusQ2+1oVV
         Tbmc0FU9qtVxkzmfJDGak/zMNcWKD8ZZyz19RWbWOodLzq71pTkdHQETdxEyTMya43Fk
         zaXOqiu3Ek8RdQdwgNC2V50LjGkvb6kxNgALyBN4p4weDH5YpqcUhuU/aKXhfgFr4UMJ
         3KKW1LM6yD4UfkY4Mu+kAmWK7HCe4nWDPCb6TtiMt8BnR1v3EFU2aMHW4CGHK6QjDG7k
         rXLzf08bR7xDo9zAHSuuiy5GriAWRS/kZRECJNXtpcdtBruICY+giwIbqR9RpYF/5HYk
         vaGA==
X-Forwarded-Encrypted: i=1; AJvYcCVOHCX8sv8hYweOTXEQIlN4i4HPux1voJb5buWX5n8yvKDwpVIlVH31xOAgtQ7QgQTvlUABxxxRhUk5@vger.kernel.org
X-Gm-Message-State: AOJu0YyYt+l29IpkJQyPMgTPsq7MyDZgF91ihQrRjxGj28GUSLJqm3uC
	5AwRJUATrnIgciV43zDAXpw/x5g5tw5YC57THPxelpxg7T1zgchT+Ecvuo/5tE10RvJRyaP1MA1
	mQyUOrIuJJUFNiTXToJUo8egga8oEZj5Vq9BwEVqpAjKJWmm+cT5aSISoA9HtoTdc
X-Gm-Gg: AeBDiev8jgpM+yTBT7XGmWexu81zI4fkcN0WfTboaU/fW6vVeyvEmUmVVXRJqL7f1qg
	nuGWiFN7e5S/wlyps86SVhJPWDmKXS/HdhsB3SkLgZZoau1brt3LCul9OH2BhxYI7Ly5DRLJl1o
	4VQbKD2oDVrolzhdYPCJZHU8cdImFfkOZWBY/sgcraropzJqsCvw7PMnSGLclROLErohAyXBdB1
	m3tuX0kt10uzk68vNb+wzwRtVvYV5Y8p184FkrUicmB2ZlnIApYfqgo5ZEGHpsm5E0eAbwU6qkl
	y6sInOTMFlOBcwDRBYEivKdmAzA7bc6+1584QrZwRYtQXGfVE+NOf1pZGvjpNuVJfypSTO3GFxz
	QOePxnlK7j72TegZ+aonBAsRPmwb9iCUePcbygwU8+d7S7FrFqMq9yd5W1xS0wLi5rqjoWrMOOH
	4I4SKtKMENw3CD28qh0Px4bpGClnXv3dZ9qM0=
X-Received: by 2002:a05:622a:1985:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50dd5ad15e5mr93537481cf.8.1775909451854;
        Sat, 11 Apr 2026 05:10:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1985:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50dd5ad15e5mr93536911cf.8.1775909451378;
        Sat, 11 Apr 2026 05:10:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:21 +0300
Subject: [PATCH v2 01/21] dt-bindings: display/panel: himax,hx83102:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-1-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=USkwXBfci9sIWJW06UXbOmxrqKMlrITA2EN65WJiKAk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpEO9zdh8EzzHxiRDkHCUG+msrq/SXCklYuc
 pmmv0HX3+GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RAAKCRCLPIo+Aiko
 1SH1B/9Cr49LTloTdRXJKJpX7BeidSo8YeqxqZ6HSt8IrpYuMOtkxtPJdf/mPsN6S6m5+af4Cy8
 j/ekpWPhZ+dRaXSfhADqSWB+6zFsmKx9n861kfdOryJgk6HAw2v7ttzUmqt9WPApaaXPSyG5Yqo
 Kq5mASdK+J3ZVqM9lpohHF7rLcxfBMiFbKgMBCDxkgDHLmbg2twHcQunTswlhKdJu+PUCDPoPIa
 iQE+/Bcx2tfokUjYUZCtDtS9Vgsm1rZ01+AAgUuhRJ1yMPImb21SgwNmjFmM2p04wP1kH5QI3Xy
 KlooENrA0RQHmqxPTuObwWxhGPTG4l88HVnE4yFiiedUPzoX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX3Srgma+yFmGj
 YZw6sJBzJMA6NjB7LvnIHjj40rF7fsM9u8Ukzw/q4MP8Sddv6ZsHMfWMeJtBYbO7qGPWmjHK0Yf
 wMb3CuBfazTPq9fuYv6FMmW6FiQ7un4y/4ZWfVzjRqxdoq7eRsUHWfSXOpEvAeHnmDV57OVvPx3
 e472xwtaQw3ZGLyHCwHXJCdFXxdWa8coVWVABI545/TukTbnALF/bjHUMJaM09TR1GfO7DPmzu5
 c6N+dk8y5q3THyy8zCyUmrEmO6IgR0NzTqpryKfmMYVIqWbAl96/0TKlE1Mc83fcHxC2TugyMSQ
 PwfY6kb+cszX61QcGUR0xIa+T6Bo54wkexyUYYgfXHPCXLSJw+4Mc37+B6f+rh53iclf2b8naNm
 MqC+Rb6o/Yq7otR1Gp10oZPX+IwVR3EkxJfaZ2i3HpP1nY3tbuWPiFyULko+AOksHtJmTaTfHhr
 IFF5HglATTC4aF7EzCg==
X-Proofpoint-GUID: T39UPCtCfkSlztoxEXEswVkY3bfiaVYw
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69da3a4c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dDwtKCuX-g0vR4_aJEQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: T39UPCtCfkSlztoxEXEswVkY3bfiaVYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35031-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
X-Rspamd-Queue-Id: A2C803DFBEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare 12.3-DSI-TOUCH-A panel which allegedly uses HX83102
as a panel controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


