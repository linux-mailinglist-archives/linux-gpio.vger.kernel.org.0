Return-Path: <linux-gpio+bounces-24918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D83B33EBB
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 14:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A966189B466
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 12:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF141287260;
	Mon, 25 Aug 2025 12:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="g3x1qb5R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91E02EBBA6
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123626; cv=none; b=Cu2sjxt5eEubblZon193Yd5o5lI5Fz2ML6l3SBifTWKrCa1wxzgokIoWxvp8wVIEquxlUJdJu6zsMuKi675Vu6Bbfu2hkvZJB8TMe6qpdhgyfSMykFkj6I7MfbTpgqf7x2yTlKY4XW5wasL7FBkr44Z+juR97VgF2vasBpIsTBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123626; c=relaxed/simple;
	bh=2V19rsSfH0fD2xrwbu2YX7ZYGnCoa6B8dWqg+PVUrQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=pKTTEmbCxd3CMwiD3/700mAiKJdTryL0tvNGRzzq6BsnLPoM/VboKlDQCarus+0uUZYEvt3WRelcfl/p9gLZxUK+fwzvbXhRltilT2GB6la/142vHGx8IMUBFokZ6C4FMDd+JbAN3KpaoF7ZgJP9Gm+N5++AKVx02oJrXcMWSWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=g3x1qb5R; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825120702epoutp04a920ca8c458f8aba50d882b91d201984~fASFNboih0999009990epoutp04O
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 12:07:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825120702epoutp04a920ca8c458f8aba50d882b91d201984~fASFNboih0999009990epoutp04O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123622;
	bh=QNbmPSt4rQKVzskKsK8+TaWphG/dFbNTNwXGWS2etjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g3x1qb5R6Iu4i9ognvK0fJra+WnHd3Wo9htCtXPNpthXbfO5RmQjot7/1qbXbNE7x
	 aD+VGI7nGsu4DzwRqiwg700k+nb74l9Lbwi0OX0W1L0W54vl/Qa2D/XpTKgJiDlum5
	 r60ojRkIoM93Nqsg92RH30r9cQp5NWOT95KjUMxA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250825120701epcas5p408cfbe1ddb990d2d8899917aba3c8d2e~fASEImj551478414784epcas5p4H;
	Mon, 25 Aug 2025 12:07:01 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c9V040hGQz3hhT7; Mon, 25 Aug
	2025 12:07:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250825120659epcas5p47ea3377840efb9ce3d5901a27c85e4ed~fASCf-9Bb1442314423epcas5p44;
	Mon, 25 Aug 2025 12:06:59 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120654epsmtip20327b343e4d5bad1e3decb7fe9c4f54a~fAR99yl210148701487epsmtip2s;
	Mon, 25 Aug 2025 12:06:54 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v3 01/10] dt-bindings: clock: Add ARTPEC-8 clock controller
Date: Mon, 25 Aug 2025 17:14:27 +0530
Message-Id: <20250825114436.46882-2-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250825114436.46882-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250825120659epcas5p47ea3377840efb9ce3d5901a27c85e4ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120659epcas5p47ea3377840efb9ce3d5901a27c85e4ed
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120659epcas5p47ea3377840efb9ce3d5901a27c85e4ed@epcas5p4.samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

From: Hakyeong Kim <hgkim05@coasia.com>

Add dt-schema for Axis ARTPEC-8 SoC clock controller.

The Clock Management Unit (CMU) has a top-level block CMU_CMU
which generates clocks for other blocks.

Add device-tree binding definitions for following CMU blocks:
- CMU_CMU
- CMU_BUS
- CMU_CORE
- CMU_CPUCL
- CMU_FSYS
- CMU_IMEM
- CMU_PERI

Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 .../bindings/clock/axis,artpec8-clock.yaml    | 213 ++++++++++++++++++
 include/dt-bindings/clock/axis,artpec8-clk.h  | 169 ++++++++++++++
 2 files changed, 382 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
 create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h

diff --git a/Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml b/Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
new file mode 100644
index 000000000000..277af48ac841
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
@@ -0,0 +1,213 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/axis,artpec8-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axis ARTPEC-8 SoC clock controller
+
+maintainers:
+  - Jesper Nilsson <jesper.nilsson@axis.com>
+
+description: |
+  ARTPEC-8 clock controller is comprised of several CMU (Clock Management Unit)
+  units, generating clocks for different domains. Those CMU units are modeled
+  as separate device tree nodes, and might depend on each other.
+  The root clock in that root tree is an external clock: OSCCLK (25 MHz).
+  This external clock must be defined as a fixed-rate clock in dts.
+
+  CMU_CMU is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_CMU.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/axis,artpec8-clk.h' header.
+
+properties:
+  compatible:
+    enum:
+      - axis,artpec8-cmu-cmu
+      - axis,artpec8-cmu-bus
+      - axis,artpec8-cmu-core
+      - axis,artpec8-cmu-cpucl
+      - axis,artpec8-cmu-fsys
+      - axis,artpec8-cmu-imem
+      - axis,artpec8-cmu-peri
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec8-cmu-cmu
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+
+        clock-names:
+          items:
+            - const: fin_pll
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec8-cmu-bus
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_BUS BUS clock (from CMU_CMU)
+            - description: CMU_BUS DLP clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: bus
+            - const: dlp
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec8-cmu-core
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_CORE main clock (from CMU_CMU)
+            - description: CMU_CORE DLP clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: main
+            - const: dlp
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec8-cmu-cpucl
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_CPUCL switch clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: switch
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec8-cmu-fsys
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_FSYS SCAN0 clock (from CMU_CMU)
+            - description: CMU_FSYS SCAN1 clock (from CMU_CMU)
+            - description: CMU_FSYS BUS clock (from CMU_CMU)
+            - description: CMU_FSYS IP clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: scan0
+            - const: scan1
+            - const: bus
+            - const: ip
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec8-cmu-imem
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_IMEM ACLK clock (from CMU_CMU)
+            - description: CMU_IMEM JPEG clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: aclk
+            - const: jpeg
+
+  - if:
+      properties:
+        compatible:
+          const: axis,artpec8-cmu-peri
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_PERI IP clock (from CMU_CMU)
+            - description: CMU_PERI AUDIO clock (from CMU_CMU)
+            - description: CMU_PERI DISP clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: ip
+            - const: audio
+            - const: disp
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_FSYS
+  - |
+    #include <dt-bindings/clock/axis,artpec8-clk.h>
+
+    cmu_fsys: clock-controller@16c10000 {
+        compatible = "axis,artpec8-cmu-fsys";
+        reg = <0x16c10000 0x4000>;
+        #clock-cells = <1>;
+        clocks = <&fin_pll>,
+                 <&cmu_cmu CLK_DOUT_CMU_FSYS_SCAN0>,
+                 <&cmu_cmu CLK_DOUT_CMU_FSYS_SCAN1>,
+                 <&cmu_cmu CLK_DOUT_CMU_FSYS_BUS>,
+                 <&cmu_cmu CLK_DOUT_CMU_FSYS_IP>;
+        clock-names = "fin_pll", "scan0", "scan1", "bus", "ip";
+    };
+
+...
diff --git a/include/dt-bindings/clock/axis,artpec8-clk.h b/include/dt-bindings/clock/axis,artpec8-clk.h
new file mode 100644
index 000000000000..1e6e1409dd94
--- /dev/null
+++ b/include/dt-bindings/clock/axis,artpec8-clk.h
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025 Axis Communications AB.
+ *             https://www.axis.com
+ *
+ * Device Tree binding constants for ARTPEC-8 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ARTPEC8_H
+#define _DT_BINDINGS_CLOCK_ARTPEC8_H
+
+/* CMU_CMU */
+#define CLK_FOUT_SHARED0_PLL					1
+#define CLK_DOUT_SHARED0_DIV2					2
+#define CLK_DOUT_SHARED0_DIV3					3
+#define CLK_DOUT_SHARED0_DIV4					4
+#define CLK_FOUT_SHARED1_PLL					5
+#define CLK_DOUT_SHARED1_DIV2					6
+#define CLK_DOUT_SHARED1_DIV3					7
+#define CLK_DOUT_SHARED1_DIV4					8
+#define CLK_FOUT_AUDIO_PLL					9
+#define CLK_DOUT_CMU_BUS					10
+#define CLK_DOUT_CMU_BUS_DLP					11
+#define CLK_DOUT_CMU_CDC_CORE					12
+#define CLK_DOUT_CMU_OTP					13
+#define CLK_DOUT_CMU_CORE_MAIN					14
+#define CLK_DOUT_CMU_CORE_DLP					15
+#define CLK_DOUT_CMU_CPUCL_SWITCH				16
+#define CLK_DOUT_CMU_DLP_CORE					17
+#define CLK_DOUT_CMU_FSYS_BUS					18
+#define CLK_DOUT_CMU_FSYS_IP					19
+#define CLK_DOUT_CMU_FSYS_SCAN0					20
+#define CLK_DOUT_CMU_FSYS_SCAN1					21
+#define CLK_DOUT_CMU_GPU_3D					22
+#define CLK_DOUT_CMU_GPU_2D					23
+#define CLK_DOUT_CMU_IMEM_ACLK					24
+#define CLK_DOUT_CMU_IMEM_JPEG					25
+#define CLK_DOUT_CMU_MIF_SWITCH					26
+#define CLK_DOUT_CMU_MIF_BUSP					27
+#define CLK_DOUT_CMU_PERI_DISP					28
+#define CLK_DOUT_CMU_PERI_IP					29
+#define CLK_DOUT_CMU_PERI_AUDIO					30
+#define CLK_DOUT_CMU_RSP_CORE					31
+#define CLK_DOUT_CMU_TRFM_CORE					32
+#define CLK_DOUT_CMU_VCA_ACE					33
+#define CLK_DOUT_CMU_VCA_OD					34
+#define CLK_DOUT_CMU_VIO_CORE					35
+#define CLK_DOUT_CMU_VIO_AUDIO					36
+#define CLK_DOUT_CMU_VIP0_CORE					37
+#define CLK_DOUT_CMU_VIP1_CORE					38
+#define CLK_DOUT_CMU_VPP_CORE					39
+
+/* CMU_BUS */
+#define CLK_MOUT_BUS_ACLK_USER					1
+#define CLK_MOUT_BUS_DLP_USER					2
+#define CLK_DOUT_BUS_PCLK					3
+
+/* CMU_CORE */
+#define CLK_MOUT_CORE_ACLK_USER					1
+#define CLK_MOUT_CORE_DLP_USER					2
+#define CLK_DOUT_CORE_PCLK					3
+
+/* CMU_CPUCL */
+#define CLK_FOUT_CPUCL_PLL					1
+#define CLK_MOUT_CPUCL_PLL					2
+#define CLK_MOUT_CPUCL_SWITCH_USER				3
+#define CLK_DOUT_CPUCL_CPU					4
+#define CLK_DOUT_CPUCL_CLUSTER_ACLK				5
+#define CLK_DOUT_CPUCL_CLUSTER_PCLKDBG				6
+#define CLK_DOUT_CPUCL_CLUSTER_CNTCLK				7
+#define CLK_DOUT_CPUCL_CLUSTER_ATCLK				8
+#define CLK_DOUT_CPUCL_PCLK					9
+#define CLK_DOUT_CPUCL_CMUREF					10
+#define CLK_DOUT_CPUCL_DBG					11
+#define CLK_DOUT_CPUCL_PCLKDBG					12
+#define CLK_GOUT_CPUCL_CLUSTER_CPU				13
+#define CLK_GOUT_CPUCL_SHORTSTOP				14
+#define CLK_GOUT_CPUCL_CSSYS_IPCLKPORT_PCLKDBG			15
+#define CLK_GOUT_CPUCL_CSSYS_IPCLKPORT_ATCLK			16
+
+/* CMU_FSYS */
+#define CLK_FOUT_FSYS_PLL					1
+#define CLK_MOUT_FSYS_SCAN0_USER				2
+#define CLK_MOUT_FSYS_SCAN1_USER				3
+#define CLK_MOUT_FSYS_BUS_USER					4
+#define CLK_MOUT_FSYS_MMC_USER					5
+#define CLK_DOUT_FSYS_PCIE_PIPE					6
+#define CLK_DOUT_FSYS_ADC					7
+#define CLK_DOUT_FSYS_PCIE_PHY_REFCLK_SYSPLL			8
+#define CLK_DOUT_FSYS_EQOS_INT125				9
+#define CLK_DOUT_FSYS_OTP_MEM					10
+#define CLK_DOUT_FSYS_SCLK_UART					11
+#define CLK_DOUT_FSYS_EQOS_25					12
+#define CLK_DOUT_FSYS_EQOS_2p5					13
+#define CLK_DOUT_FSYS_BUS300					14
+#define CLK_DOUT_FSYS_BUS_QSPI					15
+#define CLK_DOUT_FSYS_MMC_CARD0					16
+#define CLK_DOUT_FSYS_MMC_CARD1					17
+#define CLK_DOUT_SCAN_CLK_FSYS_125				18
+#define CLK_DOUT_FSYS_QSPI					19
+#define CLK_DOUT_FSYS_SFMC_NAND					20
+#define CLK_DOUT_FSYS_SCAN_CLK_MMC				21
+#define CLK_GOUT_FSYS_USB20DRD_IPCLKPORT_ACLK_PHYCTRL_20	22
+#define CLK_GOUT_FSYS_USB20DRD_IPCLKPORT_BUS_CLK_EARLY		23
+#define CLK_GOUT_FSYS_XHB_USB_IPCLKPORT_CLK			24
+#define CLK_GOUT_FSYS_XHB_AHBBR_IPCLKPORT_CLK			25
+#define CLK_GOUT_FSYS_I2C0_IPCLKPORT_I_PCLK			26
+#define CLK_GOUT_FSYS_I2C1_IPCLKPORT_I_PCLK			27
+#define CLK_GOUT_FSYS_PWM_IPCLKPORT_I_PCLK_S0			28
+#define CLK_GOUT_FSYS_DWC_PCIE_CTL_INST_0_MSTR_ACLK_UG		29
+#define CLK_GOUT_FSYS_DWC_PCIE_CTL_INXT_0_SLV_ACLK_UG		30
+#define CLK_GOUT_FSYS_DWC_PCIE_CTL_INST_0_DBI_ACLK_UG		31
+#define CLK_GOUT_FSYS_PIPE_PAL_INST_0_I_APB_PCLK		32
+#define CLK_GOUT_FSYS_EQOS_TOP_IPCLKPORT_ACLK_I			33
+#define CLK_GOUT_FSYS_EQOS_TOP_IPCLKPORT_CLK_CSR_I		34
+#define CLK_GOUT_FSYS_EQOS_TOP_IPCLKPORT_I_RGMII_TXCLK_2P5	35
+#define CLK_GOUT_FSYS_SFMC_IPCLKPORT_I_ACLK_NAND		36
+#define CLK_GOUT_FSYS_MMC0_IPCLKPORT_SDCLKIN			37
+#define CLK_GOUT_FSYS_MMC0_IPCLKPORT_I_ACLK			38
+#define CLK_GOUT_FSYS_MMC1_IPCLKPORT_SDCLKIN			39
+#define CLK_GOUT_FSYS_MMC1_IPCLKPORT_I_ACLK			40
+#define CLK_GOUT_FSYS_PCIE_PHY_REFCLK_IN			41
+#define CLK_GOUT_FSYS_UART0_PCLK				42
+#define CLK_GOUT_FSYS_UART0_SCLK_UART				43
+#define CLK_GOUT_FSYS_BUS_QSPI					44
+#define CLK_GOUT_FSYS_QSPI_IPCLKPORT_HCLK			45
+#define CLK_GOUT_FSYS_QSPI_IPCLKPORT_SSI_CLK			46
+
+/* CMU_IMEM */
+#define CLK_MOUT_IMEM_ACLK_USER					1
+#define CLK_MOUT_IMEM_GIC_CA53					2
+#define CLK_MOUT_IMEM_GIC_CA5					3
+#define CLK_MOUT_IMEM_JPEG_USER					4
+#define CLK_GOUT_IMEM_MCT_PCLK					5
+#define CLK_GOUT_IMEM_PCLK_TMU0_APBIF				6
+
+/* CMU_PERI */
+#define CLK_MOUT_PERI_IP_USER					1
+#define CLK_MOUT_PERI_AUDIO_USER				2
+#define CLK_MOUT_PERI_I2S0					3
+#define CLK_MOUT_PERI_I2S1					4
+#define CLK_MOUT_PERI_DISP_USER					5
+#define CLK_DOUT_PERI_SPI					6
+#define CLK_DOUT_PERI_UART1					7
+#define CLK_DOUT_PERI_UART2					8
+#define CLK_DOUT_PERI_PCLK					9
+#define CLK_DOUT_PERI_I2S0					10
+#define CLK_DOUT_PERI_I2S1					11
+#define CLK_DOUT_PERI_DSIM					12
+#define CLK_GOUT_PERI_UART1_PCLK				13
+#define CLK_GOUT_PERI_UART1_SCLK_UART				14
+#define CLK_GOUT_PERI_UART2_PCLK				15
+#define CLK_GOUT_PERI_UART2_SCLK_UART				16
+#define CLK_GOUT_PERI_I2C2_IPCLKPORT_I_PCLK			17
+#define CLK_GOUT_PERI_I2C3_IPCLKPORT_I_PCLK			18
+#define CLK_GOUT_PERI_SPI0_PCLK					19
+#define CLK_GOUT_PERI_SPI0_SCLK_SPI				20
+#define CLK_GOUT_PERI_APB_ASYNC_DSIM_IPCLKPORT_PCLKS		21
+#define CLK_GOUT_PERI_I2SSC0_IPCLKPORT_CLK_HST			22
+#define CLK_GOUT_PERI_I2SSC1_IPCLKPORT_CLK_HST			23
+#define CLK_GOUT_PERI_AUDIO_OUT_IPCLKPORT_CLK			24
+#define CLK_GOUT_PERI_I2SSC0_IPCLKPORT_CLK			25
+#define CLK_GOUT_PERI_I2SSC1_IPCLKPORT_CLK			26
+#define CLK_GOUT_PERI_DMA4DSIM_IPCLKPORT_CLK_APB_CLK		27
+#define CLK_GOUT_PERI_DMA4DSIM_IPCLKPORT_CLK_AXI_CLK		28
+
+#endif /* _DT_BINDINGS_CLOCK_ARTPEC8_H */
-- 
2.49.0


