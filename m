Return-Path: <linux-gpio+bounces-16535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C52A43829
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 09:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D15F7A34BC
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 08:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FA7260A43;
	Tue, 25 Feb 2025 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OobzFqHw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4949325D537;
	Tue, 25 Feb 2025 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473536; cv=none; b=fMCgOAbIYYvEFHOdelLiIQEVDmIp6Axe2VGB8p5zJstDnZznv6oElxLNScHwAYeGUWHmpHW0ELW124K7jvNhKVGIOHae6CQ2F9hDtH5ch6YM1RHTbUW1+AFEpwNFeaHIY6FFj+EF/uHo7SQOE2pacJV6jXdfcjGstFmjUx1Bagg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473536; c=relaxed/simple;
	bh=LviwH8yE9UuOU2SYd544OhDvKPCehHxX76NFfoZGPPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SXQjC+Rx2Y+V0/o0iw/Z86JTpoic3pYlk7MLU5QICceONumyl71igS3W3wrjm5akKq6+uDDOIJ+IxpEKL20oxdXfA4FsIAsH14f1N+F2bGPHBhCFmSpOLTL1fa4Y2X15rtY/zoRAbyo2Iet5JMHCazcuSMIFoGUtyBVqIWd/9NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OobzFqHw; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7sKDe025535;
	Tue, 25 Feb 2025 09:52:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	qshWsQ62zn+WBqylxlNNYzQrO9nvJuXPz/RW+NlbInI=; b=OobzFqHwO918AGM1
	cBTd87yWWmntg6r2Wv0VD04NrPthmT7TVY/qtxFxsCGOhuEHe5d9PCr2S5UK2JsI
	OK5GYxPxCePUV6K5lkYspI7CW0a9AZWLo5unIfnUvnmPzjaXT8kzEiZV9Yzb0zAk
	0aehEflp28CWSh/2y3YS89Ek04/K8nbkrBYqkubU6JZwPyrDkReyPlDwLBJao0t0
	uy5nwJOvRebLukuz7/DsdXI3TC6aIE27tExhHFFzUTHJckNAatYbnIpzN1sz5V5l
	kwi94Jm1IuUJs8wUibReOAwRildp1ZZeO3ZG8maKilqs35BPOY66EIyXsj6QTZ8f
	OLTgDw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512spstfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:52:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BDBD64005E;
	Tue, 25 Feb 2025 09:50:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCCBD47A7D4;
	Tue, 25 Feb 2025 09:48:11 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:11 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:48:07 +0100
Subject: [PATCH 8/9] ARM: dts: stm32: add alternate pinmux for HDP pin and
 add HDP pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250225-hdp-upstream-v1-8-9d049c65330a@foss.st.com>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
In-Reply-To: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
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
X-Mailer: b4 0.15-dev-42535
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01

Introduce hdp node to output a user defined value on port hdp2.
Add pinctrl nodes to be able to output this signal on one SoC pin.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
index 95fafc51a1c8..76ff0d6634b4 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -4,6 +4,15 @@
  * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
  */
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
+#include <dt-bindings/pinctrl/stm32mp15-hdp.h>
+
+&hdp {
+	/omit-if-no-ref/
+	hdp2_gpo: hdp2-pins {
+		function = HDP2_GPOVAL_2;
+		pins = "hdp2";
+	};
+};
 
 &pinctrl {
 	/omit-if-no-ref/
@@ -687,6 +696,23 @@ pins {
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


