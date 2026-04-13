Return-Path: <linux-gpio+bounces-35098-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GNdDGr43GnLYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35098-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:06:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C34543ED01B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C4FC3014B89
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD973D6693;
	Mon, 13 Apr 2026 14:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dS7kjxdF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bh+mSvON"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF513D5643
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089144; cv=none; b=QUiAvaJwQFDNZZzxEoSRjFRfsBzVXfM9qevOGh+U2TNpEv9ExEVU5JeyAR4oMpVWnLLjc/D8iLL0CO2vwAvYBlNloiU36ApCfYEmVECfhZRY3+VUVFEEz5sFbjTZpMVEqBUNQF1iQhK1Wn3eUYAjIeAUm43vA5z6nU7mpx/zVv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089144; c=relaxed/simple;
	bh=N8CKm/X1r0MFwLfZruus26Jh9rArudtbcfuT15AgEuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Athke/pX9eqRR2u/anR/CQL8QMw5pNHYCb7lqe0kdPkSoFgcX1+KvgxfxdS/2vDZDMy1VM8Iku7R0W1KWyTTZVVVu3l6q6Va99K002kA4MK2e8CJXrsjKVRn82aamZcvGlC5do7qKf8ADIdViqyu+8/xohM1V5fdhsqItWArTPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dS7kjxdF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bh+mSvON; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DC7a492186199
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2x5lTfFSzhFGUpvlbYeEl+bXq1HLvTyRTgCgvYE/a3w=; b=dS7kjxdF3PZEKm0A
	sn85rVQZLfoWAfMoUoNnivArqgEwhdE947Yy4/MlM0nITN0fEMU341LDmz8By+1F
	StR/h7W7ZLlM8x1n3F5bFmQxa7mmPkK4H3uwhZXoPhrGWzmjXDuDC4MCNIIu4iBN
	CtC3n4Ov8VcJ9fHG/jSNccU6j95TdcRu6Zu+d+lLXPvWAQVQzYjjghqF4mHk0pnJ
	oftKwEEMYXPcozrvrvO6SI/jDWRMcLhSf3a6N1Y35qJ1GMxgPd8oN98NtPnTWuzC
	B8aiZorR5MhI/8myJ9caLY8n4NfuDy9LmA5/BCOYOWaUaqLgZQA9A9NwswYm89K+
	llqcgg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hgd6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:39 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-47545742ec3so5275495b6e.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089139; x=1776693939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2x5lTfFSzhFGUpvlbYeEl+bXq1HLvTyRTgCgvYE/a3w=;
        b=Bh+mSvON57Epc/UTHyYPTOBtb8KLZ3UC4uvdE1tH+HtikGPyzUTLbCcn9nyZK82MoT
         1oiyJ79NQqBYryGBxAm27Fwq44FWhi2nBlCxIYaGkAqva1JvMEBZug37XDctAM22TxB8
         4DvOVwKDLzNwPpwh6cVzHmSJYbEptxhAoBMiUy7mAep7nar1RhWfF+WhBJbHfu4MBM0d
         MAavV5y6fQS6vk4eXA/3H9e23inO0xLWjEeya9Tn9vXWYVDrrvcerg7UF/6vRdsMQ2nN
         viPomoMUDLVCf4/coOYd8wsq5Mw0d2vHRGqg9UUFaegpMmmiwH2q6pUKtbQfOEYthPOs
         5/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089139; x=1776693939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2x5lTfFSzhFGUpvlbYeEl+bXq1HLvTyRTgCgvYE/a3w=;
        b=VGi89w4JQnGCUlUamMYP3JbtKvkfpJPLKHiWGnY9no6tMsP+7iD6hDxdtZDnocPPUw
         loeBi4A6HA+byMCHlKRFiW9WkpDRoSwbxdacRlgM49UNWlRxTHZOplZyezOQ4rcfMoUj
         3xVfhpdpPBJJiRVYbVAPYJlrelp9luB53FS66J0BvL3D5JT3iZwbFQFZ4eHVSRY71x7p
         bYLjsPhDETWEwd8c8UyFBM5LuKAQNAB1n26eP4g2+A96v5D/1em4ZeRmxZQE2oaAwRXD
         W+wmKNLBxbDRQcIw5JjQSttYwVdTDJ68YP2qDeGn307XvyQ4cvR4ZiuoPUNjgZ+fl5ZI
         +y0g==
X-Forwarded-Encrypted: i=1; AFNElJ9rYJfchJK0XRx34g/97/5/PBa2t8L9p1pIXPJTbzb3qaACh7YjiY5t89C1lvfrKCvrWNbIEmYottmA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxjlkb5KiOxvKJ5+qy0b+PtyXVxyfl0QNYG8ygGbtzsS7fjlMS
	7kHWuZpTf0vUjSFw6wWccHyjPnUwJt2+sPqAXzmPPyzIUNxA29XdiltU1vajwzW5U/PKMoti4IL
	Xq1yeeyWt55c3sA+2xsEW7gSGIiDab2GvFpCCAFiXUDj+NZyInoob6v2NAH0FDd1N
X-Gm-Gg: AeBDievJLfqsRWhNFqjpXIU13QAdAYpvvBJXdQdTeuhVwFE13JG0/+JbwS6RHgdiR3W
	Xv2uvpifKd6ab15EafLgXl6A07IyYwO0TcK4Cjxg8e1nWbJDgklzI5WVBilZQhU1TiLmjQ0A9h5
	D6QKBwOECrmoj3yypSqmHlrEZWfCu//lEd11Hj8H7Z7pSAO7juSRKPldSBBdKzfiv3ujZErQF+Y
	UxkT5o265up6EZS+TMtSYWow3n4RfyihfPApkslOc7v1+BkyvLMnSX7fRPqIpG7ZrexSQZYHJYs
	fXIgSVz56nuzdxst3RyUQaKhQVa4jhJ33jG8xTq+PGCZq6lHDptxfSgk3qQ8JOOgAz20LHY1PlT
	8sgaG5Jwagkx51hdsaVmJWo4Ob2/k59Smb91o88SLDKSJKaVS+A3tH+MFG6WA46oTpI03pAgcIm
	IcPiPpJm+aRojpSKm30vkhJDtgBVJsvQXzibk=
X-Received: by 2002:a05:6808:6902:b0:45c:95ab:bce3 with SMTP id 5614622812f47-478a0808fb3mr7049819b6e.46.1776089138852;
        Mon, 13 Apr 2026 07:05:38 -0700 (PDT)
X-Received: by 2002:a05:6808:6902:b0:45c:95ab:bce3 with SMTP id 5614622812f47-478a0808fb3mr7049765b6e.46.1776089138303;
        Mon, 13 Apr 2026 07:05:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:26 +0300
Subject: [PATCH v3 03/21] dt-bindings: display/panel: jadard,jd9365da-h3:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-3-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N8CKm/X1r0MFwLfZruus26Jh9rArudtbcfuT15AgEuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgmtV2U4qkj8T0cpHphotJKmtI4IJGeFafmg
 qO3OLzIPsuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JgAKCRCLPIo+Aiko
 1UT8B/4q0xvq6ZwlObUFBLEhkHWQvegj9dvxQI7ZoiM+0M/GVuHpOSQ8lRveP/WDfIhcWYJNntK
 6A/lRe1kyNm3I9jUDhoS81pgt83FbET5h6itAm3CglrlTuldKzBv+3SyepEjZOloFYJQuFBKqdX
 tohASKSEEOie4+7VJcc7846HlFbreFEhlaeayc8hFpUPI8KK8S2yf+4smFhahr2zTEaIL8cMbEY
 PWP3pJBMQ+tKzPi7+jcL4oE79WhHp63HSuGhdq9sUiqETHjb9HrQQ3KndGCbdDxWlonuDLJLr//
 b+kb+Kao5L0jK7kKHxEENGAd6gIuUOwuTvcJ2Sr511VzueIU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JGMpppfWXexE2OXyMooOVvpCQynkrkzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX0T4OF4Unm4K7
 KwyFYMpEpzqHrQjiV699ssjQekHDhgUjqMFXf6DhGU/sYa1Z7AfmkFjltKGOOCgORBX3IVunwuy
 SdUOeqayyjiLrwl2XVj8oseHFcH7nB/XPHYwRCks8RmI1lOwNc1oMoFbmaySn1V08kSEEHlOgYp
 gwGOvbdM/4FRlkeMD0TUIm2My9+b+u0SylcSqPi6sXsKrK4dxTTUqkA54lQp54AgMWk4w0SEbeJ
 u6AsD6BUQjWNknhZO30mdsQendyAlA4Bzy4CExja2Sz0nTAcRl6pWWfOM46+2saC21M2QtMeSZz
 xrLizmXNkDrbXIko7AVL6nQABwsuXZTRXjMJ5C7wmC4KaVDGKdbH9FyvJ2cze2gyZIkcMGMu418
 H4EL0NR4lh098FLmfGsgpCIIH9lY89IP+hdy4DkjDlEev/8JnGM/tBMsxLo8jYBU3/5ItmXmcBE
 FBuuh85s1cuNJfVsGiA==
X-Proofpoint-GUID: JGMpppfWXexE2OXyMooOVvpCQynkrkzj
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dcf833 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3ozaZGYpt45I3yT0zMEA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35098-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: C34543ED01B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare DSI panels which use JD9365 as a panel controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index e39efb44ed42..4eae802de9fd 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -24,6 +24,12 @@ properties:
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
           - taiguanck,xti05101-01a
+          - waveshare,3.4-dsi-touch-c
+          - waveshare,4.0-dsi-touch-c
+          - waveshare,8.0-dsi-touch-a
+          - waveshare,9.0-dsi-touch-b
+          - waveshare,10.1-dsi-touch-a
+          - waveshare,10.1-dsi-touch-b
       - const: jadard,jd9365da-h3
 
   reg:

-- 
2.47.3


