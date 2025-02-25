Return-Path: <linux-gpio+bounces-16538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A854BA4382F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 09:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D88D178A50
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 08:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EED260A53;
	Tue, 25 Feb 2025 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="3ZF/nRpS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907A25EFB8;
	Tue, 25 Feb 2025 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473537; cv=none; b=bGiL2rVXHltOtPEzbw/W8M1g7qNoEHy1kPuW/7SFPnFynkEFjjXM+wAdr+4xyU7AWJmCMeSOcIIa+QIs6WqMVifFMnpgZEK7ImgPNvuz9j5W1S7jeOfEVGpF7w+MjaHUIMULfAoLbBTbPE58Yu1G0SY5e00Fs6WW2vESCpQq8/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473537; c=relaxed/simple;
	bh=yx2IM/yL7ryYbbIybRQIN89bS3vtR1R2dpJBnCS8F6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=afrgXiMqmNHvBeZbwgHIclvR7PRZf+pZyKL+0iDrzmsq5Y1/08PFJ9iELqeQzWfCefZ1Yab3ZsgnMWFHlNtnEF8GbJN9KBlwgD2VQlBotEYMyIH29nnPkAXs/XD4a9EjHkNRUSofBm7rWLzYGUcmHpYcoPsnqDm6EL/TtYmsbgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=3ZF/nRpS; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7qIWK025335;
	Tue, 25 Feb 2025 09:52:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PoNUkbtMyBQo7qulpQlZywD2O/n9xiN+esl2pnpD4vg=; b=3ZF/nRpStXZOGnf2
	vM4VyTdNSt9jGqT0xjc2XyKN7YoEZhDHDTV02qeF0soWaLqQ8ujLTx8QiOdvDqHB
	ckgK87sTTrqMyvRZCjlDXc2qmgQtonZrqlEBk6ua3tw2p3ONPDRg4NTK6gc7soVj
	g+m+Txsh5gIah26Y3V4UwAxupbqgI0WQMO4c5aE0ViY26xihskl7HHG31pHpnFn9
	3ALjP4rakPFCAQY0WEJJU7IpJPA8c3zdVkRKnSujiOi08DNJr64JWJ052fllBYN6
	1FKZM7PB7UixJNlUzdK05BiCoAEnXMyOrvt0hJU8Ij2okKUzE4hbKPkQlqoLi8CF
	ZrQMaA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512spstfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:52:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1BAE040057;
	Tue, 25 Feb 2025 09:50:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7698047A7A3;
	Tue, 25 Feb 2025 09:48:07 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:07 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:48:01 +0100
Subject: [PATCH 2/9] dt-bindings: pinctrl: stm32: Introduce HDP
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250225-hdp-upstream-v1-2-9d049c65330a@foss.st.com>
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

Introduce dt-bindings for HDP driver.

'HDP' stands for Hardware Debug Port, it is an hardware block in
STMicrolectronics' MPUs that let the user decide which internal SoC's
signal to observe.
It provides 8 ports and for each port there is up to 16 different
signals that can be output.
Signals are different for each MPU.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
new file mode 100644
index 000000000000..b6787162faaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) STMicroelectronics 2025.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/st,stm32-pinctrl-hdp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Hardware Debug Port Mux/Config
+
+maintainers:
+  - Clément LE GOFFIC <clement.legoffic@foss.st.com>
+
+description: |
+  STMicroelectronics's STM32 MPUs integrate a Hardware Debug Port (HDP).
+  It allows to output internal signals on SoC's GPIO.
+
+properties:
+  compatible:
+    const: st,stm32mp-hdp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+
+    properties:
+      function:
+        enum: [ "0", "1", "2", "3", "4", "5", "6", "7",
+                "8", "9", "10", "11", "12", "13", "14",
+                "15" ]
+
+      pins:
+        enum: [ hdp0, hdp1, hdp2, hdp3, hdp4, hdp5, hdp6, hdp7 ]
+
+    required:
+      - function
+      - pins
+
+    additionalProperties: false
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/pinctrl/stm32mp15-hdp.h>
+    //Example 1
+    pinctrl@54090000 {
+      compatible = "st,stm32mp-hdp";
+      reg = <0x54090000 0x400>;
+      clocks = <&rcc HDP>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&hdp2>;
+      hdp2-pins {
+        function = HDP2_GPOVAL_2;
+        pins = "hdp2";
+      };
+    };

-- 
2.43.0


