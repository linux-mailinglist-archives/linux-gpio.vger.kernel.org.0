Return-Path: <linux-gpio+bounces-35034-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAbaHkQ72mn0zAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35034-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:15:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FCB3DFC85
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EAB0307E07B
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F4C352C51;
	Sat, 11 Apr 2026 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9S4tiow";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VRfClOuN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FA734C81E
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909461; cv=none; b=I1bpPSC1TaBHMIqBt3IdRYz1ehoRMQDSO9U18PvKdYBjo8kYC3DokUFb+AK+w6lOriHT5gF5WVSiKdcBwkl/KxTwdsOVFV1mWr+dUk9EPkIricryIa7sTYTnodrjZjdo4X1WRBYxUhic4+s4UhMxH1h3WPCWU8DbOwuY+px97hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909461; c=relaxed/simple;
	bh=9BUAPXzA40V6xuiE1cTes3j3rjDbHWpL9QzXZmTLuNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qCkA7BhlXwCR9hr3Cxuf1hTwRFaAfadLxyc8iVIZVwX2vVeQ4A89xxloMKXA2fTc8wjgmSxlTvJ/TrhuKFYrPBLTe1z4/59ocAwjyqVcYtcCgxx4h013DIix2nzu1WwWkAQWaMw33o2+F88SOr4qiPrpSbIifQ7Mvp3yRZPwaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9S4tiow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VRfClOuN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B48NSE1201965
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=; b=E9S4tiowfZFoDsAp
	TLO9fEv9u+ITc+ygALNIqMhaKy1la1Ow1HP6qBjM9i/YtoZk25SA+3LDsgEGPMrE
	fu1Y4Ccpe2Imp8T9yfLh1yZL8JIhKpILf1aQdtIm376xRFxaVsMU/KDgH9LqUlB/
	wKnWGwTYFbn5j9Aep1382T2gSsLjcSoTiyoVJQkAkxRoSqX/mOzbCLWvE8eBtCAF
	qMcwrwM6nK2/I95RGk79RFxBP6PJhwIdi/DdawWJb2g48H7ePaiy0oP28iSyuW/z
	x/KzbyRoWIlX/lKvNEwBth8Xo+dwrMgQEYrkZcbtmCc164bB9TaHBDe5KZUjkilz
	fYcAiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrn8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d831e8083so26146661cf.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909457; x=1776514257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=;
        b=VRfClOuNHg7zGlxoG0PuZfZaaYw+DyP9IpIocDDlmxPDbzDA0cRThDqDpBHRklULfE
         oAmr9f83M+JfnV0sAB+7jNATMcMf1lNNJluSe4ym6LMP1ajoua9OqwmlD0QbU9JJGyhM
         YmPmww+2Wo7r/s884o2gouUpqd1Qiji4pn+rkZqeOv0Uxhd5VPFuhMAqttnVvM474uFP
         Wfj+4Jimi9NEEyIjnxx3Rekq0qtqW/ogl09WKuzxmSSWPVkRWh5g9glFvQQRzK6C9PoH
         /wIj15TwB0YbO6HxmjVZVoqJhgSS0js2rdc36bgMQgcsWLAQrSf0MMDwLQQIB7fY2iH4
         tIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909457; x=1776514257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yu5MwmsD6H0oMm1hsBHM+snwkT5wJGW0nrEZxLfZo1A=;
        b=hlKjk596p0+fYPxpPEXsirVv8xSQhdDKW+4vbdkeTIzCr/6skZwZmlZ8h023+w8dlg
         LGttQNCIgQ7J3DZTpRb47GOZPwNdItHArcHfzA+zn1CpJnsnWV/xzQZV0UhZf1TsSNyQ
         Ckz/q2H9p1j/wXVWBjD60xRtfbzCw7ZyTL3lamD5s/kWljFQVYQ7OAaUb/XLDg5CrBei
         xjs6z6nfhe3Z68ZaafpOdycKcS1IdU+e1KoQ675rNQn6D3Ka0mMXcW/cnhgawYPpgzka
         MrLSwQRAGWpAK0bV7KOUypK5ftLphn21HRFz5ivrJXsk6uBS/bxpvH83szRkZOXAuym+
         S6AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe6psA1aIY2jG/ULQAk2Vk2qR58rauRMbOI09AbYwQC9ShWJTuGcmG3cqEkCOLtXAxp37JguC1PLey@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRLJ2+6037T9mfBDGShlLxlAtV+8nuerO/ywNs5SII07Mh2Bs
	kWIJyzQ4mRQTeN/sWPMHIZWrnQK1DiR2FTI5Q6bm1GW5kerULTkw/EqkySq17RvmfH1FIK9iCD4
	+Qy5FFjmkLYpH/K6nfT/xVcHaumNjNM/Q6gAFg26HbruurPF3AvErvyOjK4JyKEP8
X-Gm-Gg: AeBDiet0HWjyxqpq5H619rG7bxm3XV7uX6MHI+ZPHXYdEU6TBYxOd4fGYSLM2eKVpSC
	Aeceq/cqtElNM9A+nywBvjz57gIfdgs+/zxdKAqTlM8HTemgsfmLFSJe+3KAuXeipdrz29VQ5IR
	MyL6H7SuhlWmeZF5ks1MNTDdrX7TIByAHdOnSPleVs4M08cUYQfuiKbCcwy8uhgiW/hRQVjApfa
	UKteINNKCT1RykOhX1QSoEkUwON+RWoep+QTsHZXpQw+dJlhdXocipncYuNufTZXtzJWMcv4iUp
	qKF3PPc+kFvB8FrvMVejD0HLSqL23dExnhzO+Z/tngWwVEp93VDqfmSAhPRmmPnXMKTCSfnmaTl
	nwIZ0AIsoEHBPQ9IKOAlxY7TJ8vX7LoHCfIM1rx65M6/GUL5/Mr5SJDA81n//1IeoiPSgxguebF
	EGF6HxVD0hkHiprLk9BNIgyE6igu8oA3GR2v4=
X-Received: by 2002:ac8:7d86:0:b0:50b:4c84:67ab with SMTP id d75a77b69052e-50dd5b0ff39mr103408811cf.17.1775909457505;
        Sat, 11 Apr 2026 05:10:57 -0700 (PDT)
X-Received: by 2002:ac8:7d86:0:b0:50b:4c84:67ab with SMTP id d75a77b69052e-50dd5b0ff39mr103408311cf.17.1775909457072;
        Sat, 11 Apr 2026 05:10:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:24 +0300
Subject: [PATCH v2 04/21] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-4-75cdbeac5156@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9BUAPXzA40V6xuiE1cTes3j3rjDbHWpL9QzXZmTLuNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpFbocrGiN7ZBRTZM2TGbU+Z/32ClbWSrbxz
 BeQ+4Z1pWyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RQAKCRCLPIo+Aiko
 1aj5B/0c1m3T5bLh6t/sQxLI2Yj3c6WRggvJBal9skVpbLz1FZi2u7tP6Pm0K3KLzfuK4q2tbbz
 d0jX0pNWROKJx3ah5RXtsUQH8AwxudUdqkbZMp6Vaf053o29bwAt20NwyjmWiHl6K+bFYniIn9T
 TeaDNTCFYmoHzMZJ5isZuYJIKSyEIGbD93xrVoqqeieuOXmW1MNiWnys/Z6dMnSQC/WCTH3dSv5
 fXOMRELsG4AhrxY5HDMwE4mmcOOksaj/DoqB7PDhKoNJQb+12av1ioJHhjnTAb8B6xf9dwrQr/t
 Zx72oVVLteFTwZcqDFUgCnNWskT0rT/wKsg2znbtKB+xQTF5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfXzuAVD5XRy3XH
 JwMbmbl3Y9r4QuHUUGpxrARcLarnnjN6gWLp7y2KCg0jS9G2UZdQdi1/kPOZ385nB7jxMFf9GGt
 iDjVUDIpoPdh1jsyxxxViRNmThWMKQDwHgRNUEfrHeARtFBW+YMWflLGyG2ID47iPl3M/h5J2O+
 Y9jfx1R4EYT5K9j8OzAzwymFneeSTf0QBTAU1wVMlA11+/8ZCwUq8HT8Q6FvTNL9HttWPxQVeMV
 6BwqmdHIvCedXF8X/zJmai6wOY9GWNzgzE4ALYgzp4Qiqlg/zrcMxSddyw4FldgXp2ozXkJFLKc
 qkej8xj9HkvjSZzDc8SnKfrDBRFPhfHYHvBKrmCAuWZ2OdRGf9bSkTfTu9Eu0MLpO2N4LrouXX0
 uhSgh5PKOvaVEa1uMoCfql0Rsud12EawogJfnQmjxFqVbFppnqFeAvgs5PNT/5YjlGZRhB+BPDc
 BhgShyQr9fOKkkfOG6g==
X-Proofpoint-ORIG-GUID: fg_ck-nf2EXRLlxs_6hVOymTFnvPaf1K
X-Proofpoint-GUID: fg_ck-nf2EXRLlxs_6hVOymTFnvPaf1K
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da3a52 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=sGmTDZJufn-iKI-mlscA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35034-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 05FCB3DFC85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare 7" DSI panel which uses ILI9881 as a panel
controller. This panel requires two voltags supplies, so add separate
iovcc supply.

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


