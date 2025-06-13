Return-Path: <linux-gpio+bounces-21520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A3FAD8942
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00F82189ED85
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 10:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0012DECAA;
	Fri, 13 Jun 2025 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SmXY4g70"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653D62D4B7C;
	Fri, 13 Jun 2025 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809793; cv=none; b=MWdYLsjWF5H8jGuSoV8yjHuGL84bnB2fOTa/qXySF+y7dy+gf3p3fc3l52bRtqbi3tD1DEonQfKsDVkxdWTUu5/uUxjOTE4TTyBICbNLpJP4YDxj4RD1PHHy14lAyqtvPoiq3XCDnrS8Az2+VRdTjYGKVsghkqvrWdbZss3o3mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809793; c=relaxed/simple;
	bh=4lgeUcntkB8hGROx3TWd47HBW0Gu/RzofzkzRiKszu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WKdS5+n55DCrylYYhvhsdrt4+vYLh09QosvGa6LoQbYCZDqTNNEE+0AWD9RwasVNnJ1DkTvRDWCTWS0UaAKxhLZ050SzbawE+Lvw2QX4n/iv1dYH8toUbK7ddj2fz05G4QlDTWANsP/5/CTt8YNPhZFJCEp8QyWmN2CnfP6V0ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SmXY4g70; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9wdHZ002442;
	Fri, 13 Jun 2025 12:16:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Cp2gFOEZRolrC1cu3ilAyN1wQaeSGonjrUSYtHJ5W+g=; b=SmXY4g70YJNSrCYw
	kF5SRQUW/VRfN1n8xRz8ou9gkRMZq/roq2liY5r0j5izZCQfK+s6d8YM6MOBHG7z
	cOWbTbDw6xIJr2h9FHrwb9f9qvR5ju/yCoDOzafzngczjTZJUTxL4DSnD+YC9fqC
	4qNgNPvKz8MpjOUcxCQ1G4XRv9H08M2Y8kvONaRD9iZWCmefGtmztBWhATeyiEOV
	pDnIFXVyOyUrxeFOed4oJ2STuKt7s/uTyyPr7TtIOsKUJWEf7wVNfvnbsqJVt8+Q
	RJNqir/HK1CYx0uicMSWlYynOEXEb7lwMyosNn4wethYbNqVCorR/orimLC3OZcZ
	/uDx3A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs356au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 12:16:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 76B8B4005D;
	Fri, 13 Jun 2025 12:15:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D76F2F6F05;
	Fri, 13 Jun 2025 12:14:21 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 12:14:20 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 13 Jun 2025 12:14:16 +0200
Subject: [PATCH v5 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250613-hdp-upstream-v5-5-6fd6f0dc527c@foss.st.com>
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
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
X-Mailer: b4 0.15-dev-0537a
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01

Add the hdp devicetree node for stm32mp13 SoC family.

Keep the node disabled as HDP needs the pinctrl SoC configuration to be
able to output its mux output signal outside of the SoC, on the SoC pad.
This configuration is provided in the board dtsi file through 'pinctrl-*'
properties as well as HDP mux configuration.
Thus, if needed, HDP should be enabled in board dtsi file.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 492bcf586361..7519ffa0dba8 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -954,6 +954,13 @@ dts: thermal@50028000 {
 			status = "disabled";
 		};
 
+		hdp: pinctrl@5002a000 {
+			compatible = "st,stm32mp131-hdp";
+			reg = <0x5002a000 0x400>;
+			clocks = <&rcc HDP>;
+			status = "disabled";
+		};
+
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;

-- 
2.43.0


