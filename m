Return-Path: <linux-gpio+bounces-30559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D08B0D1FD89
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E5F5302AD89
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEBF321426;
	Wed, 14 Jan 2026 15:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzCSBoD9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbZ5YuQS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF57939C644
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404626; cv=none; b=QfIRQ3KNJ27McBvG98wju5Vtfdpb4N8wndGWHUiCU/6ygSHEYXUoOAwDDggRwYdnqXBZGlO0GjbOP58rMUO3d99gf+0oWPWJW5jvM6wUDzUkJfQ8ViIR9sF13TeJBjzZHBB8/0h8rkbrQowirnVSsFozSHlIf9BrUcBVlByfvM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404626; c=relaxed/simple;
	bh=BOg98/1JJXf+vGTTUwHW2mMQjVbfd13nI6bPXirGFB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+MfUzdnlE8aUkn8DxDkMCEuAbzlA8+QsOgH0qV8ZDpzEEY/Ak0Dn3EjbRvfuk4ooq9KL9ik4iOaanv8chn20gf7XkyozWMZwsx1Z0JGoKwb4JGNzLoEsol8e5MhC57L8HinFkkBcoGnhrOtSItX0L1cxSvoU9i8EDdsii2cLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzCSBoD9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbZ5YuQS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EChZ9j3925545
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=; b=AzCSBoD9J/kAgn5b
	NYPVaY6w6+Qs5o+wVDPdmbCawKNIhRSVPAqH4gl4pai6bAKuHoVYlq7/WKsYLNjB
	KQrB6jYs0vWaY6+W+3SN1noeudRgeyidixzfP+OYATvIPWpHkiBDpg3e23JWTX1p
	4fhGq2IJnlZ5KJqbzP+NLxCB5Fc1xLFL8bw49SWoU1rGDiQ5rHou2y4mHufOcRST
	Ob3AkdvukE7IKJsynwD1ZBbOatQM6y+aklUfu6NiWhUft8INyUsny/4bx+2bR/QX
	ghWJPg8SbaF1jmdhlrH19G4Z/HY6XW41soqrc0WF1wihTWOXPxte9gbGFoCEMnSl
	JSycfQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbrh83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88051c72070so214458796d6.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404623; x=1769009423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=;
        b=GbZ5YuQSGdY2Q7OwINIfvTMFTKpQg7dD6FoD5orzAiXOEm6ATbfDNLzdkbdzE1iDfG
         TE3PDBYIOfGKWNH5AgTUEDKJiqnjIR4SlvYY4DeAUWoZcqW+QGr6jfJYEL2YxMs3XaRy
         gCQ6uOVzePUKvUAGLzaGsoFDuEI/3vq9OMky2MGM7MecUMahB4XgoeYphMYIJFmiSK8V
         ckysUan2se+yFYq+ytrxHflJu5MD3a7x8x01XNVytA1f/PmWMlWL4GFUYiiM4SxOxxHY
         k8EJe3dt/IGVZXFzVrdSmGZXVY8jc1s7HjQ5/1TU5Au5eoO0JpnoIf2d3n+TrLziz6M/
         W5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404623; x=1769009423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=;
        b=RTlMrLz3taIcEJLNstk+yvJImg30niq4a0mHTHEQcUGxkWZQ9MtXxZooj4QtixnExU
         1QwgQwdbqVt7z+31vpE8HNWOMNjAMIIVLlzdv1LTYxorI2M/NxyOCYs9TifyosDPo8oC
         Uou5umMAQ5mWAw6OjsEld5jjYHw269LsNvc0h3uUVKthHhoHsTB6VYp8QQWt1dPoSdvT
         45hWKOXS0kj2QBBR8yuh/tyCX07MOPwQZY2AzZk4xaL7uw59NkCyOuLCV/pnNUqXrFM0
         /KeaOTl1w4s38ieW6x1C5QgeWEg63heO6yEbppeR9v5HSrEiG1AYrCKe6L9iAKWhruJx
         zROA==
X-Forwarded-Encrypted: i=1; AJvYcCU75ySrQmersjxviHu/PVq5ZN+6VvzlLxdIt8XLzqPa8bJvV9GR+S20rBaJOqwGif5oXzB7vQn31G3t@vger.kernel.org
X-Gm-Message-State: AOJu0YyPI0EL0fAPRghSIZ8LwjfEUA1KiLtKbuNXRn7FAYAt576RaJyF
	MeFvaQkIURskv0Fe0GL/B3lXftmQ2VtVNqCh6PW772s6Rs6UVkVdYpw9PX85OolMFmXv+8jLghr
	vBVNGpoDWc4ooYNo+ljIkdH7hyAMxYDXr3hKrapedRQeBvPLtu7FBcskCQY6TGquY
X-Gm-Gg: AY/fxX6wlmzrVz/ivsnJ9mHleu/3/g5DKBDUnL1LkDDvNGh4rUs1cPa172Htk+jx5lR
	B01slGi44ML+2dBpTnfcx+8A2PI2j2wVOxaj3uAFgi+SHq6VVmVm1tkWqnlz43OtjarHQmrEygp
	s1SQ5vxcEH0axd54olOU6VTScrJLY4knDyXf1c9gMvnv6T8R+BS73MBc8+VQaOKzD9g2HlXMt3B
	rsTe14HGmRgcOA/x6lNVzJ0JaOQMlSGumxBJtJdBuLfVwl0k2w7xTTL0i5NCogiEAbZPFUe2XFs
	wCAOD87jxg/QZnaN49muUvWM8t+iICZtiJsMp3ZqWKb1Ti5Ia4Z5TxXEuICRzuYLIcd0Uyquou4
	VgVmlBzg7PMMLgPbmMrVv4QwgBZl0LXphSw==
X-Received: by 2002:a05:620a:2556:b0:8b2:d72d:e41b with SMTP id af79cd13be357-8c52fbdd3aamr433295985a.44.1768404622653;
        Wed, 14 Jan 2026 07:30:22 -0800 (PST)
X-Received: by 2002:a05:620a:2556:b0:8b2:d72d:e41b with SMTP id af79cd13be357-8c52fbdd3aamr433288585a.44.1768404622116;
        Wed, 14 Jan 2026 07:30:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:02 +0100
Subject: [PATCH 01/11] pinctrl: aspeed: Cleanup header includes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-1-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BOg98/1JJXf+vGTTUwHW2mMQjVbfd13nI6bPXirGFB4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aA2bajX7HJFoPmqSFCGOiGBqLJt6NM8LzAd
 XAIqmeyi3uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gAAKCRDBN2bmhouD
 1zSHD/97RdnKd17RjQ4GZXnl1GK1sM4fAIbv/Er4l/nCYrCsRStOmpsNfQQNQ7KbiFIy6ka6EQQ
 RmCybnj6DI01+PJ7LKfZjIhsVOdQRCKSSRsSOzZ2sWtH7UtF7Qco6eaNduwhfUDaSknYVE8yIKS
 q89qtgMa00kGUI0EqHfiZ8qCSnSWxZL+xPFwD+VaK2PMANj3eijWok9TKqlbKkGTmMKho7c3WOD
 kkTSfcVXpAaccbQNmgEAkCUer3aTG6Z0QKWdyinivpOZRSpzni6zy3iZTvH5qnQ5okqQ8+u1yVL
 ZcUZ45bRE9Lxm2YaqTb/8FMSOpMAAXKgnB8X6QA+InLQGRJSNoaNEwmu6nNF/vR2K8ztj6axVXY
 0vmcCDYOnJbcX5YBUAIDooVFlUG0XDfrGrUzdObWOPhSE4k/LWR6KvxxHSM13yiEttuiUh5j5Wc
 uyOWQQHPn+CHVSxzd/HqrsGACkpKblq5HaElBupSYgsEcP/sLU1GEEwHHqCpdn+EPpwcITg6hft
 gzyvN7ZCzN1S8gDsA7ykKbGnB5dKBWHADzwQtqQEP8YvZiOnvQuPH0X2k8Vbd6e0GSxIUydR1xh
 u9u70zyMvvsb2RcwG5zaIi3AprWfNihRSpPswPd5WpF2M6sS9zQbZzeHDly67NBW2wG1jPitQdo
 U7H9zvpSdKlaUmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6967b68f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KvQaFmux51imLjMCrhIA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: oBG3jfFrn3mv1bR3PKgRfVXHo8TSTgcD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX45Prm5SPPCSA
 lECChySSb+o0sOjBnc3YP5vvD/MYoVAIMRiJLw0KLcZqmMEZPBfsjLC8MqOHXwuCZQtmmnTLz8a
 1cq361yWTgAV00NBYDN7YSU6BuSZw2/qT8mjS0VMkgaklw6QEG8UQ/LqBsK69Jc6kQKh/1PbbBv
 LmXeErQtH01pP6fZ8MnxSlgNa5bY5g1f9NubRF4UTt6TecCsbCULLCdFLNWzFFNFFVGQACPGziu
 1lR0qtanXw9YztSyPIxEsao6s0jZ+2v5JWDkvANZ/IGfyJsIjS3W3L+CW2qTHg/7z0UyuI0rYND
 1DrY8zt237tmbJRgYDUF4X6t1ScvkLSs8FdwTLwGE+WKaVXe784kMq+hXg26uKi9Wluqgi9w8NY
 R5GaeEu7B6m24yBk07O48ChiL9JKPV1ZeSg14tteyYxqCV08bMhm+jawqqXh6Evv1KPXDeVSwuN
 7eKwFtY0BVgo2CTOP7Q==
X-Proofpoint-GUID: oBG3jfFrn3mv1bR3PKgRfVXHo8TSTgcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140129

Remove unused includes (no mutexes, string functions, no OF functions)
and bring directly used mod_devicetable.h (previously pulled via of.h).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 4 +---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 3 +--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 5 +----
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index cb295856dda1..f9d8fb1ab1ec 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -6,14 +6,12 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 792089628362..9934ef6205d6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -7,14 +7,13 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
-#include <linux/mutex.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index b0c7e4f6df9c..8cf61aab81b1 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -4,13 +4,10 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/mfd/syscon.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"

-- 
2.51.0


