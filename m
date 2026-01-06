Return-Path: <linux-gpio+bounces-30180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9800CF75F0
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 09:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C47F305E3DE
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 08:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA6330ACE8;
	Tue,  6 Jan 2026 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLPHJ2W0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERssMXZp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27861309F1D
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767689728; cv=none; b=KHgUaoPqa2UU4zZszlcG6Up+hcYrTG1GJVqurTPMWsksCoVVBsuYrXrr72rIhMdp/gFBB6FLS1E4tz8xSs0F1Xyr3L6d4KJqv4osCGOvyAqI3fgRMtLtIsg2CL8/ACdN/Ubog5efDvkO4ESVBmOo6hcav6Lnt5AF6+sD0rfwFEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767689728; c=relaxed/simple;
	bh=Mg9idUWKe3zv6/uftS231zF6sORslUFWIoC1eDxGfJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d3ZDfj7YNilLMwnD+ZPBikafI4hs64Ki5gkAzWFOYp2XG2Yp1EUlE8Dur6fMX3XwUKNxrN0nF5ObtkmQeHe9r6xPmTv+aVV6PsaXNwkGe+qi72qrYnop0GQpT5lRRLhBofTpn/xXm8NSp6f9i230Ner2T4siYKZdy8Eb2JHSAEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLPHJ2W0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERssMXZp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q7ua3442254
	for <linux-gpio@vger.kernel.org>; Tue, 6 Jan 2026 08:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OLntyfjjyt1SpCyW5jaihTrhxEUyaOdPS3O
	BALP6sE0=; b=aLPHJ2W0uZ4N9+nMk7NvPxJI5VOBQbeKQwRcvxMwerWEA1ccgfz
	jCNGrmI9y4C659750jq3jnsy5YNyypRPdaUjYJXkS5zgSS+AC1ksUf6ESK8w0X2S
	5rIprL1jEu0IiNcliscZ9xeZSpltQw52nBQ3weHa7/3PBPRIlNTIZe5XC9BO1JSf
	J3cUbUJLXw+Te4EaUM7cWg42XlKeprSlMtGCdiT3b8ucs3idG18ZxC6pWulPxWFz
	OIkTPvnkKrl1IBTNARdvFee/E9H7oIWu55PN4o5ZiRsWCHCWffbcM8IEVkgty9Su
	WuEnGZzoM+lkmn/T0q6YiL4j0qeWgcVOA/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh9s0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 08:55:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f35f31000cso11487161cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 00:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767689725; x=1768294525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLntyfjjyt1SpCyW5jaihTrhxEUyaOdPS3OBALP6sE0=;
        b=ERssMXZp1WP5HYWVSGBBl8rjl63OHhTonUet2R5qiQ+fUJKywG66FZvaTJ5ch7svYo
         TgS2DMWhbhzzYS2wGthlXMqEaUxFAHttyhfKI4oyIqv12r+L3vZi3WdZcfhlsz93qYMo
         0iHltgiY1nJWlzdYPOVdme6ETKeyofBtH29h5nO36aHqcdWvqyPSsrY5qjEM8SwyqUWI
         H/4RxFMvp6K4sVFLNJoEDrBaY6zsYffWCl/8If7HI/xcfgU73O1sK0npEUkcV/AHY0gl
         JLF59NYdh5KawVr/I0A6T/URnWugWlfuzTCbcE/k34RGvFckP/+0UJXS97lXtuV/Wb6j
         WeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689725; x=1768294525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLntyfjjyt1SpCyW5jaihTrhxEUyaOdPS3OBALP6sE0=;
        b=S9/l5tesMw2HJbEXYcVz+RmAZBVnNr5YX12Xk3FGBVNnccZ0uvqdNlLiFl5+eKMo9W
         jQLP7ZGStwmt/QV40bq8UTDm5H8HakaeTDChWoyrx3E2RmCPRX4JV+0Zu4RpxZxRPRbr
         9Yt4yG6AeIJyB8RNUKPsxbwqRsaOOKhKil2+i2HZZDSpJJskwttAE3TijqZ5hJMRSLuA
         ru+2imNNL1ZevhpGRIbEkcRIAJK9C73edwhC+Fpl5KPnzABGPa2ggEJabdTqw85cu7u7
         hWB3BpxHq3gHZ6xUUV2fOU6+KmRi/fFRtTup/oEAJK0UD1mFRz73cZRBxpLPrkf+L295
         YFjQ==
X-Gm-Message-State: AOJu0YweRyudxU51jpH5+6i2+PyE1rYYiYG70LA25axNPo8gfr0zVh1t
	5bwbzb2snRIF5cAXnAXB+wZvE5vdjWSlq7SXpa4e16MKESxoB0bPazboCVjy694XOxRkIroH77Y
	Q2Sfcavm8UZN2GRSaCKWtE7mK49olWLKffsYbYxOpXMPWXxhYbmhxLqEAQAD4VXWA3iYLcRUF
X-Gm-Gg: AY/fxX7i0v+CisiZhyuNGng0CPSq5TSLx+UFaIekMrq6uhjgClHcQ3JNaSNGg2Jn5/p
	3bxoU9b0+Y2bS/HqAgfNpTLqZ1pRtvi5cqMz0F4R1gZXswobpPxYmt2Cs8ivxMvhVXAGbef3Pu1
	xsDSoG/kBnSzmtzhw9zzYaO+O4sXaeszGt0IszAWOtcrA5Wh1J4bf/A+8Ik9KZPNuUz+aFT0+rl
	v5sGcRx0p0jj/Djr9MmuzJsPMy812TBixoLJBY47yXridNoSujneYaPbE9bq6tAy8Y/sczY9Htr
	gdspTqzlCCm8q3XB8t7sFffJNKzMg5zfC7yE74dx25xEj4IOAqmiZlxFyBOaBZ8hPy/4taXpelE
	gq2HGlBTcMa3pLLOem3Vi8vydJ2Hi/zIz0D2sdT4=
X-Received: by 2002:ac8:5fce:0:b0:4ed:e064:1638 with SMTP id d75a77b69052e-4ffa77aa962mr28559791cf.40.1767689725073;
        Tue, 06 Jan 2026 00:55:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMU7QLas00J/5wXs1CjykWn9MmTc1yCeZJJVduAIoL1KbaKbhKziwT3E3DaYERxdSgROGv5A==
X-Received: by 2002:ac8:5fce:0:b0:4ed:e064:1638 with SMTP id d75a77b69052e-4ffa77aa962mr28559581cf.40.1767689724599;
        Tue, 06 Jan 2026 00:55:24 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm3326754f8f.24.2026.01.06.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:55:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
Date: Tue,  6 Jan 2026 09:55:20 +0100
Message-ID: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cMIVmyjeIR3xxms8oplBnHxpN6vZKhKX
X-Proofpoint-ORIG-GUID: cMIVmyjeIR3xxms8oplBnHxpN6vZKhKX
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695ccdfd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=kI-syGhB69xVGPkSyq8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NSBTYWx0ZWRfX0Q/Hq6HyHksi
 58Pap4aXmhRfDhYdH2W+wCY9RFE4RfdSOAepfYT2mlIbfQVFXYYysXjjDkLbuPszAoGhO1/UINw
 6zZ3vaWZav5mqqMaWMeMJdQZx+vvVlRLSBfsoNk0Ha/3ygsiuzRgeq7+lehDLLA733q7Zgk4tO5
 Nd8wCe1uwIu/rhBWtW3hnAQ7I0L2qpEFDnU52gYPl0PzkhraUsIqdRpFSTKxANxt9h6gfcJGIAu
 FQGPRZHANqs1SaMguZVHa6QrqvnOVSI7kXuLoZJrd1NxCaIOgxaAvUrAhHk9U4t3xogII08gum0
 SMAfmguLmeeYybwTNom78rgNcoVnf+kRWQ+vh9CyYg3rjGD1WzvFc090T0RoweaxBVRk//OnRE8
 h3bXFaPhNaEtPV/+A90Iy1EOFwG4m8mBUAjHvKQGKw2ZGzl0G5uTVBNd0nrkgpJeXsMK2jIKCSZ
 VoSMC/z9io8+s7lzJog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060075

We currently only build these drivers on ARM but there's nothing that
should stop us from building it with allmodconfig on other
architectures. Extend the build coverage for all meson drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/meson/Kconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 0315e224bce6..ce6aeec2fc79 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -15,25 +15,25 @@ if PINCTRL_MESON
 
 config PINCTRL_MESON8
 	bool "Meson 8 SoC pinctrl driver"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON8B
 	bool "Meson 8b SoC pinctrl driver"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_GXBB
 	tristate "Meson gxbb SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_GXL
 	tristate "Meson gxl SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
@@ -42,7 +42,7 @@ config PINCTRL_MESON8_PMX
 
 config PINCTRL_MESON_AXG
 	tristate "Meson axg Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
@@ -51,25 +51,25 @@ config PINCTRL_MESON_AXG_PMX
 
 config PINCTRL_MESON_G12A
 	tristate "Meson g12a Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_A1
 	tristate "Meson a1 Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_S4
 	tristate "Meson s4 Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_A4
 	bool "AMLOGIC pincontrol"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	default ARCH_MESON
 	help
 	  This is the driver for the pin controller found on Amlogic SoCs.
@@ -80,13 +80,13 @@ config PINCTRL_AMLOGIC_A4
 
 config PINCTRL_AMLOGIC_C3
 	tristate "Amlogic C3 SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_T7
 	tristate "Amlogic T7 SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
-- 
2.47.3


