Return-Path: <linux-gpio+bounces-20349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F45ABDE26
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 17:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24E661B68090
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407712512D7;
	Tue, 20 May 2025 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="heNo7AI6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6424B24EAA3;
	Tue, 20 May 2025 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753477; cv=none; b=sP+UTXjIdJFjQB+qEIZIyX1UjD3D64cfLKLzL4tAhliJVkKaKM41kM8U6GMmdED1kSAGtEdx3fy3XZapKKdnjL4Fh2HR4LFv2uZoblYUCVZWLJxQqH+s/q1CaApSk1p5yOXuQ41umtO/Kl1wU2d/vxQS6jRB9QNHWm1cGiohoE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753477; c=relaxed/simple;
	bh=0gXlghNReQ3xJ96aGlYAz/HNqdU+fsvzFoHWeweIWEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ht+JKlXfJT6j6N+IeSPSJJ3yk4VtWs5KGtCxaHWH5tMzUX7gFlwzTKSaVYBmaiT29nCRC5DqT0pS2F2u8596ucKeX0d0H2JRj+RCIXl4rOVDm2Oyh8kjxTt1M0B+JecGzsfmI8mHrGxR573/YS0CChdBb37YKfY2hubO2XRZ96s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=heNo7AI6; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDnjY0020033;
	Tue, 20 May 2025 17:04:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	E50xYFA31UxV2r8i4ZX3G+C/OQH/OeYpXAFoahXjSdE=; b=heNo7AI6keTGRoSg
	D6m4qP7hfRf4sjLajY1bZBtmQAKLlSqr84pVbZmMlXYbWbgdxI3MkyB86YGbAuA7
	M0IH+ZQfS9ME4C9Nu0qCeqNOMAlEdT/LWhH6JKwZ/rjIuCUOlFS5cri6xxms8j7e
	AAVQw5Zi8jWAhwG3rC52rZqrpUzdyNUTvxo5poX1bIyZ3oohmFaNX3HG7KaQMdOb
	tzErUdV6oHF0scfhPEADpNonY5pEGolWmWPIbck496E3SOwDyVkTMoEURiQ1Iq0O
	0WApu1uRhhgzsfse8o34U3xuSNNfXfu8nsXaHaS2q53/tP6LHpLXFMW91HkVIqJy
	vUt/HQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46phbgnja2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 17:04:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 51DB94005B;
	Tue, 20 May 2025 17:03:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 176B2B20B01;
	Tue, 20 May 2025 17:02:37 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:02:36 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 20 May 2025 17:02:34 +0200
Subject: [PATCH v2 7/8] ARM: dts: stm32: add alternate pinmux for HDP pin
 and add HDP pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250520-hdp-upstream-v2-7-53f6b8b5ffc8@foss.st.com>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-6f78e
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01

Introduce hdp node to output a user defined value on port hdp2.
Add pinctrl nodes to be able to output this signal on one SoC pin.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
index 40605ea85ee1..4a31e9f7a897 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -5,6 +5,14 @@
  */
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
+&hdp {
+	/omit-if-no-ref/
+	hdp2_gpo: hdp2-pins {
+		function = "gpoval2";
+		pins = "HDP2";
+	};
+};
+
 &pinctrl {
 	/omit-if-no-ref/
 	adc1_ain_pins_a: adc1-ain-0 {
@@ -731,6 +739,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	hdp2_pins_a: hdp2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, AF0)>; /* HDP2 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	hdp2_sleep_pins_a: hdp2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>; /* HDP2 */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c1_pins_a: i2c1-0 {
 		pins {

-- 
2.43.0


