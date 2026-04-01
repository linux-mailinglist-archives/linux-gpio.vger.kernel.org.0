Return-Path: <linux-gpio+bounces-34542-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNH5IMzJzGn5WgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34542-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:31:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACF5375EDC
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06508306B57E
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD8A3859C7;
	Wed,  1 Apr 2026 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuV95Bfd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDNHCqX+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656337F8CE
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028432; cv=none; b=gak2lEuKkWigSS4d6dzy0rRvDb2hXsy8iVwXX6xDzY1z7y7SbWiK6GNxIYsHjgM9cgXn6NhjBZR2rCZnWHmlCBMRhjKIM0g76krKV+6RVZ8A8LvWIHuSRJ9uJkQQWBI1Ze3cwlz5hXD0+jD8i7NuG8ZMdwuPjhtgA+2pDclBgQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028432; c=relaxed/simple;
	bh=EnIudP2dkv0psMSTc/VxhMNE1Y82xgXO/GhT4OjRcK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=riX5s2vFY0odgvp84e2Jxzls5fxqIbP31R0VW1gUQ7r0W0iDLyBL8OkbdasXbh5Fn8okYa/cJ5NiKxl7OSIC9ByIkZNuMXkwxKZ2ykZ58GYjE5KJK4LZLhgFmqPsOHFXuf9Rh/BBVnw0ztLgnoIxc2x+QkK2eVkgrxQeZWJImFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuV95Bfd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDNHCqX+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313VFtA1459094
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3tt35zca4Yf0zt4f6l5trL2SRMBblb/msuZnR25dvg=; b=AuV95BfdhL+Opmfg
	jcU4C8KMnOx/l9/5FzjcE5B4pfGuP8jEZoHMQC+hcUtQCtD7o5vRc1UVSEDuzcUM
	HzVOTHep4X4VKRBZ+Q1b+Vc5A8XihEi4Hjb+kfG8XVl+dFbGplSU1ae3LyNnqpyu
	r/XEuaGQs4UsFSeVEgbeLXUgTJIJqyBhdVAAdDuS/7Y1z6cT0nmd2f0p2ZSpvdcK
	zKE+CVGzPNbGIhyUVD6mGF0QO/3aXUhvyhMQTAxzLAIbQj4nnQdIX/DkYBuN/EQF
	eSv9Qiqwet/IlbNfQaHmYbOa2cWVABIxKaicDPO+ZVUeDFJJIKI/NrDhyeGPAO1R
	hfKXVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg0uvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso71926761cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028429; x=1775633229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3tt35zca4Yf0zt4f6l5trL2SRMBblb/msuZnR25dvg=;
        b=HDNHCqX+iNKpjtZND+seCQdCb7Uaqov/3+Ep8SnliNbqg2ITXcH4y6Pu/l26jDUrLp
         DWd2JAWt0nATBgFwgH+mJLBFj/88Htcj1dUH7iUQHLiVszThYIfvOYeOdlilwoF6DjwI
         e40VVqOovzfNvwhvpvBOiR4TMkKSyc2h7xorc1oliu7SyMDPXSg2pUCeBqhyIgVDNPad
         glRWlEKTOsNC1/zo325tQW7NoLmU4oGzWsOgYw6PmxGwocgkiuSxqbmCIx5VS52ULIJG
         VOGxRc2/YfuHgB8NXf7wYmkTFlkSZ8ahv39aNh6bN7sMHO8tDZ/2kPYPj6HYaxmC4kiQ
         fo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028429; x=1775633229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3tt35zca4Yf0zt4f6l5trL2SRMBblb/msuZnR25dvg=;
        b=VUNTy/yPRalVRAY1tmNFGm62gfR+l14+8XHKyvQQ8PGzXKvhCTnCsuN1VQ/nDzNpyf
         pIRyKJ1wW7MGNIHY4l2nqKoV4h/6tYf5dXcQjcqKsGkOh7Hi9Klu5y4uaMdtLACd6Zhl
         /IXuAITAppB8Duw5/jjhASlEWBjj4HKsNjzMr/xfLis6mBE4wzghxHA84kqicdkT5AgV
         SGnJx5fzDoaM3AV4VgAmlrgS2zOFtFkMW4ziCi/UbS18MQjaLs25vRBIvcbZHKCaw83o
         LLUSD77p0SrPJgzZEmEvpV7keGZb831NtgyzvMuhVXi5AbDEO66SD49rI1SICln4RSnt
         8VjA==
X-Forwarded-Encrypted: i=1; AJvYcCULGkNsFGgCOUm4EUZjZm8u1xLXi8gZSh05WzI8UPheyfT7NNeag/0EIp7/rSq+teB/rxe+QrkI4p/1@vger.kernel.org
X-Gm-Message-State: AOJu0YyqWJiFySzFcBtKWNCVKjCyELuVhk2iBIrznnsfiwoNqqXJxDhR
	pLWh3Tk368IJrcLIDM80ReQQh3NpX6lb8Jn6Z/ilatbILvQ8XupOrblMAlubAotE5NkPgPP3cgx
	2/w/jopdImgYeDaZ571FUyzUpBQjGPzmXpZJOJWsx8IFRAvHnrJ1xIpMoXPjTZ2Oh
X-Gm-Gg: ATEYQzx2vFt/eGnmDrunOLRU8JkykhWryNyxRM0KARV6vX2r2UijA7djUhCcgMmwnIb
	xJ4TWyKXAcApAEPRgnljhsHgcnbSdQaRMMHTkg7nSY+33rtNBYb5WLp+DFIMRpPAwpeBRYY19dt
	ALeNSJZqpH8FW0i9b0FrW9WAsq76eyoT2gjkWqmFWDsGgtLSdmYtbXddRsMCTeqjJhzV5MiUe/P
	2I2kZ14A6hb5JMe7WVaLBb7rZf4YMNdKqatqPChiHjvF4VGu1m9Emri5+IaUdqdA14dPb5rgzzA
	1ilJE9FeSBDGq7WpFdbbi4njaF/EZQGms64pGIh01TXLODOF0eB+X0tBx6mS+tr4tLDNXHUWaU9
	poq0/NehHzG0UMF91hM5DxD15v5ePrYmGYuvn2REvRuNKFt0BqQcXPcQ1oBNg1xSfFUUOa2GTvW
	YUlG6gvOk+F/RpQORcLdJj7eCJfLo+6z1t+tg=
X-Received: by 2002:a05:622a:1f0b:b0:50b:2708:6ba6 with SMTP id d75a77b69052e-50d3bd84b35mr33565841cf.37.1775028429080;
        Wed, 01 Apr 2026 00:27:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0b:b0:50b:2708:6ba6 with SMTP id d75a77b69052e-50d3bd84b35mr33563971cf.37.1775028425153;
        Wed, 01 Apr 2026 00:27:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:31 +0300
Subject: [PATCH 12/19] drm/panel: jadard-jd9365da-h3: support variable DSI
 configuration
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-12-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4628;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EnIudP2dkv0psMSTc/VxhMNE1Y82xgXO/GhT4OjRcK0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMise5q716JNb6mCOHextVpcrev8EGq1VfyrS
 XejKxWxc/CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrAAKCRCLPIo+Aiko
 1atlB/9ybXh0oNRRyVFpLsEO6chTzWL7HYwNjNu/Pf4qF1Lte3YiAXlwF+e5DzcRdGdmzLDuWw3
 orTibRNusLWwzPjASY44YPX9XKSstSru7XMZUXUk8rBMvlVtSgsvyZOIXxob01kAkzO6lGdaHHm
 75jyrWRT9FIqgGpu+mCBVio7tBEfFziYyTac5rvQf6kwc1ef0/RAiARmtFWFB3hmZnDF8+5SyHr
 OdI/3Lxq4YCFtd62ytRvvLd2PF4YYKttCc1rg59V3+YtPNg+nOvIQY13BMP2D1BNNDR4H+c7q7e
 93BCtdbug9bYsLRpzXagMO13gWpIeJaFyylQJwqYqo+WCIOS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX2LJT/wbRthoL
 Lw7EZW85nPu+JTKc+LdzE8uRvTbLTYruxtWeXo9495BhZOE2aB2NYuYBYZwl8ngp2xF0NcyMCHy
 39CFzL/0knkyylZXkQPLZ8U7zuignkLbal0Blrze59VjTDWdSXYRVFqnXJJptpol/DdF62Of4a6
 YgX9Ky1Sagl9cCnBRQkcQtIL+rnJ8ROy84zd++sWJjCxSYog+f5VkA/+wZcKHbKLxpkutDljfSN
 MrlEVkhS40KkaHM+ljdNtY+4JLMJ2c1EiOsVzfHl2Gunqp6ooHCa79GAQ0xAMl6+t2ZNo9MU3Uc
 Fs9mEwSlLcWbezQc6Erx2TtjmN9YRFasawAT59Ca43sEPSfIsL+Hv9j/hpF2SMhESVczoy4YKZ+
 k596S1fob4p+o/0lVD2lYVGwIvFy94Jc8wmsChXRuncEfNUoISvjiBQOx8gNNj8X7aoECmRT4FP
 +ViBo0QfgP+Tc0Sn70w==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccc8ce cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_FY8QkBUUwJpvv6m3lQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -dapaxWQw0d6bLo6L9HWvuQHRiYv2F22
X-Proofpoint-ORIG-GUID: -dapaxWQw0d6bLo6L9HWvuQHRiYv2F22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34542-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3ACF5375EDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Several panels support attachment either using 4 DSI lanes or just 2. In
some cases, this requires a different panel mode to fulfill clock
requirements. Extend the driver to handle such cases by letting the
panel description to omit lanes specification and parsing number of
lanes from the DT.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 32 +++++++++++++++++-------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 1884ad2404cd..5d9db2e1f28f 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -23,7 +24,8 @@
 struct jadard;
 
 struct jadard_panel_desc {
-	const struct drm_display_mode mode;
+	const struct drm_display_mode *mode_4ln;
+	const struct drm_display_mode *mode_2ln;
 	unsigned int lanes;
 	enum mipi_dsi_pixel_format format;
 	int (*init)(struct jadard *jadard);
@@ -57,7 +59,10 @@ static void jadard_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x93);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2, 0x65);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe3, 0xf8);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);
+	if (dsi_ctx->dsi->lanes == 2)
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x01);
+	else
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);
 }
 
 static inline struct jadard *panel_to_jadard(struct drm_panel *panel)
@@ -151,7 +156,10 @@ static int jadard_get_modes(struct drm_panel *panel,
 {
 	struct jadard *jadard = panel_to_jadard(panel);
 
-	return drm_connector_helper_get_modes_fixed(connector, &jadard->desc->mode);
+	if (jadard->dsi->lanes == 2)
+		return drm_connector_helper_get_modes_fixed(connector, jadard->desc->mode_2ln);
+	else
+		return drm_connector_helper_get_modes_fixed(connector, jadard->desc->mode_4ln);
 }
 
 static enum drm_panel_orientation jadard_panel_get_orientation(struct drm_panel *panel)
@@ -354,7 +362,7 @@ static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc radxa_display_8hd_ad002_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= 70000,
 
 		.hdisplay	= 800,
@@ -586,7 +594,7 @@ static int cz101b4001_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc cz101b4001_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= 70000,
 
 		.hdisplay	= 800,
@@ -819,7 +827,7 @@ static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
 
 		.hdisplay	= 800,
@@ -1070,7 +1078,7 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
 
 		.hdisplay	= 800,
@@ -1326,7 +1334,7 @@ static int anbernic_rgds_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc anbernic_rgds_display_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (640 + 260 + 220 + 260) * (480 + 10 + 2 + 16) * 60 / 1000,
 
 		.hdisplay	= 640,
@@ -1562,7 +1570,7 @@ static int taiguan_xti05101_01a_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
 
 		.hdisplay	= 800,
@@ -1614,6 +1622,12 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
+	if (!dsi->lanes) {
+		dsi->lanes = drm_of_get_data_lanes_count_remote(dsi->dev.of_node, 0, -1, 2, 4);
+		if (dsi->lanes < 0)
+			return dsi->lanes;
+	}
+	dev_dbg(&dsi->dev, "lanes: %d\n", dsi->lanes);
 
 	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(jadard->reset))

-- 
2.47.3


