Return-Path: <linux-gpio+bounces-849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC0800F23
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 17:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81BD91C20E9B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 16:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC1F4C3C8;
	Fri,  1 Dec 2023 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cMkK0z5L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4731E171C
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 08:10:53 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b552deba0so23862735e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 08:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447052; x=1702051852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Th/I+eOVl2O2Hm1eMtxpmML7DCYHpYhkjACUgTnadbU=;
        b=cMkK0z5Lw8DXrthFMVpVx47rI+7KldzhB3KpI+Ch7DzY9KnN3PJNiRu7ovgWjy72sv
         ggTkH4fKmDho/lMlDajleX9PnUM85tMUCLk086DLy8G1vCGoUfv7V4hrY/mxVfglnFci
         v00fuJgH8Zk1H4AP+URgwjmwLVD00BKc9RvGhGm2P2d7E6rF1SaPnbU5tCfXQQe3O7ki
         zG3sqpY44QLFsfjBF6ljMx0VKFSATu75uNYCW0XVkp+o2vGD5yPnSZmIUgGx6fDZufn2
         reh618iy6pT6dBCh2SXarYLxk+kFRizlRAR1pNAcpYs28jNLSuHv+b/vzxUi34JmZi+D
         xMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447052; x=1702051852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Th/I+eOVl2O2Hm1eMtxpmML7DCYHpYhkjACUgTnadbU=;
        b=Tq5D+M0ev1/z/3o2CCqtxN4RvhMZFmGOv2g6XV7NYFisqx3SzFJcmOm1DTyQdA4i+P
         d5ReEECnjviU3F8ihPB9vYzZRiFhjufbrtltjGvR9+OhCx+D3ygd3wn8iCIzsTxz7onT
         ROo+n32GWTmxAxRl6O/ol/hxDIwaKe5JZ3ykRse9+QEPM3W4dU8tCekZM+TQ5GzbgCu6
         6C/JJxcSqKtytyigWKXyhQAMLlzdVTbZoJNBye/gFh5pe0w8fi1tvxbZuNJqgMbhrILM
         RDyoHa4zchjb+PUTFCc4R8cfKfyBepGilGy+mop61a1sdc09PfIouyn3zwOr9U2LKft4
         0ekQ==
X-Gm-Message-State: AOJu0YzCchxdVAt6AFCM2kKmBVE1eHOlVae1O4PNE/WLfa8EM4z3ccdT
	7SM23iCntCr43vYyHWqY84/ZrQ==
X-Google-Smtp-Source: AGHT+IEQBKo7d+m1jh+WwDO1n/FthAO7LUhPBtFw9L+DAMeU2Lxc80HnWl3G4jVLvJJjPs7136vjCg==
X-Received: by 2002:adf:a38c:0:b0:333:2fd2:5d58 with SMTP id l12-20020adfa38c000000b003332fd25d58mr927136wrb.138.1701447051617;
        Fri, 01 Dec 2023 08:10:51 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:51 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 02/20] dt-bindings: clock: Add Google gs101 clock management unit bindings
Date: Fri,  1 Dec 2023 16:09:07 +0000
Message-ID: <20231201160925.3136868-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide dt-schema documentation for Google gs101 SoC clock controller.
Currently this adds support for cmu_top, cmu_misc and cmu_apm.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml    | 110 +++++
 include/dt-bindings/clock/google,gs101.h      | 392 ++++++++++++++++++
 2 files changed, 502 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 create mode 100644 include/dt-bindings/clock/google,gs101.h

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
new file mode 100644
index 000000000000..4612886fcc15
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 SoC clock controller
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description: |
+  Google GS101 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. The root clock in that clock tree
+  is OSCCLK (24.576 MHz). That external clock must be defined as a fixed-rate
+  clock in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'dt-bindings/clock/gs101.h' header.
+
+properties:
+  compatible:
+    enum:
+      - google,gs101-cmu-top
+      - google,gs101-cmu-apm
+      - google,gs101-cmu-misc
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-cmu-top
+              - google,gs101-cmu-apm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-misc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: Misc bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_misc_bus
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_TOP
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        cmu_top: clock-controller@1e080000 {
+            compatible = "google,gs101-cmu-top";
+            reg = <0x0 0x1e080000 0x8000>;
+            #clock-cells = <1>;
+            clocks = <&ext_24_5m>;
+            clock-names = "oscclk";
+        };
+    };
+
+...
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
new file mode 100644
index 000000000000..9f280f74578a
--- /dev/null
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -0,0 +1,392 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2023 Linaro Ltd.
+ * Author: Peter Griffin <peter.griffin@linaro.org>
+ *
+ * Device Tree binding constants for Google gs101 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_GOOGLE_GS101_H
+#define _DT_BINDINGS_CLOCK_GOOGLE_GS101_H
+
+/* CMU_TOP PLL */
+#define CLK_FOUT_SHARED0_PLL		1
+#define CLK_FOUT_SHARED1_PLL		2
+#define CLK_FOUT_SHARED2_PLL		3
+#define CLK_FOUT_SHARED3_PLL		4
+#define CLK_FOUT_SPARE_PLL		5
+
+/* CMU_TOP MUX */
+#define CLK_MOUT_SHARED0_PLL		6
+#define CLK_MOUT_SHARED1_PLL		7
+#define CLK_MOUT_SHARED2_PLL		8
+#define CLK_MOUT_SHARED3_PLL		9
+#define CLK_MOUT_SPARE_PLL		10
+#define CLK_MOUT_BO_BUS			11
+#define CLK_MOUT_BUS0_BUS		12
+#define CLK_MOUT_BUS1_BUS		13
+#define CLK_MOUT_BUS2_BUS		14
+#define CLK_MOUT_CIS_CLK0		15
+#define CLK_MOUT_CIS_CLK1		16
+#define CLK_MOUT_CIS_CLK2		17
+#define CLK_MOUT_CIS_CLK3		18
+#define CLK_MOUT_CIS_CLK4		19
+#define CLK_MOUT_CIS_CLK5		20
+#define CLK_MOUT_CIS_CLK6		21
+#define CLK_MOUT_CIS_CLK7		22
+#define CLK_MOUT_CMU_BOOST		23
+#define CLK_MOUT_BOOST_OPTION1		24
+#define CLK_MOUT_CORE_BUS		25
+#define CLK_MOUT_CPUCL0_DBG		26
+#define CLK_MOUT_CPUCL0_SWITCH		27
+#define CLK_MOUT_CPUCL1_SWITCH		28
+#define CLK_MOUT_CPUCL2_SWITCH		29
+#define CLK_MOUT_CSIS_BUS		30
+#define CLK_MOUT_DISP_BUS		31
+#define CLK_MOUT_DNS_BUS		32
+#define CLK_MOUT_DPU_BUS		33
+#define CLK_MOUT_EH_BUS			34
+#define CLK_MOUT_G2D_G2D		35
+#define CLK_MOUT_G2D_MSCL		36
+#define CLK_MOUT_G3AA_G3AA		37
+#define CLK_MOUT_G3D_BUSD		38
+#define CLK_MOUT_G3D_GLB		39
+#define CLK_MOUT_G3D_SWITCH		40
+#define CLK_MOUT_GDC_GDC0		41
+#define CLK_MOUT_GDC_GDC1		42
+#define CLK_MOUT_GDC_SCSC		43
+#define CLK_MOUT_CMU_HPM		44
+#define CLK_MOUT_HSI0_BUS		45
+#define CLK_MOUT_HSI0_DPGTC		46
+#define CLK_MOUT_HSI0_USB31DRD		47
+#define CLK_MOUT_HSI0_USBDPDGB		48
+#define CLK_MOUT_HSI1_BUS		49
+#define CLK_MOUT_HSI1_PCIE		50
+#define CLK_MOUT_HSI2_BUS		51
+#define CLK_MOUT_HSI2_MMC_CARD		52
+#define CLK_MOUT_HSI2_PCIE		53
+#define CLK_MOUT_HSI2_UFS_EMBD		54
+#define CLK_MOUT_IPP_BUS		55
+#define CLK_MOUT_ITP_BUS		56
+#define CLK_MOUT_MCSC_ITSC		57
+#define CLK_MOUT_MCSC_MCSC		58
+#define CLK_MOUT_MFC_MFC		59
+#define CLK_MOUT_MIF_BUSP		60
+#define CLK_MOUT_MIF_SWITCH		61
+#define CLK_MOUT_MISC_BUS		62
+#define CLK_MOUT_MISC_SSS		63
+#define CLK_MOUT_PDP_BUS		64
+#define CLK_MOUT_PDP_VRA		65
+#define CLK_MOUT_PERIC0_BUS		66
+#define CLK_MOUT_PERIC0_IP		67
+#define CLK_MOUT_PERIC1_BUS		68
+#define CLK_MOUT_PERIC1_IP		69
+#define CLK_MOUT_TNR_BUS		70
+#define CLK_MOUT_TOP_BOOST_OPTION1	71
+#define CLK_MOUT_TOP_CMUREF		72
+#define CLK_MOUT_TPU_BUS		73
+#define CLK_MOUT_TPU_TPU		74
+#define CLK_MOUT_TPU_TPUCTL		75
+#define CLK_MOUT_TPU_UART		76
+#define CLK_MOUT_CMU_CMUREF		77
+
+/* CMU_TOP Dividers */
+#define CLK_DOUT_BO_BUS			78
+#define CLK_DOUT_BUS0_BUS		79
+#define CLK_DOUT_BUS1_BUS		80
+#define CLK_DOUT_BUS2_BUS		81
+#define CLK_DOUT_CIS_CLK0		82
+#define CLK_DOUT_CIS_CLK1		83
+#define CLK_DOUT_CIS_CLK2		84
+#define CLK_DOUT_CIS_CLK3		85
+#define CLK_DOUT_CIS_CLK4		86
+#define CLK_DOUT_CIS_CLK5		87
+#define CLK_DOUT_CIS_CLK6		88
+#define CLK_DOUT_CIS_CLK7		89
+#define CLK_DOUT_CORE_BUS		90
+#define CLK_DOUT_CPUCL0_DBG		91
+#define CLK_DOUT_CPUCL0_SWITCH		92
+#define CLK_DOUT_CPUCL1_SWITCH		93
+#define CLK_DOUT_CPUCL2_SWITCH		94
+#define CLK_DOUT_CSIS_BUS		95
+#define CLK_DOUT_DISP_BUS		96
+#define CLK_DOUT_DNS_BUS		97
+#define CLK_DOUT_DPU_BUS		98
+#define CLK_DOUT_EH_BUS			99
+#define CLK_DOUT_G2D_G2D		100
+#define CLK_DOUT_G2D_MSCL		101
+#define CLK_DOUT_G3AA_G3AA		102
+#define CLK_DOUT_G3D_BUSD		103
+#define CLK_DOUT_G3D_GLB		104
+#define CLK_DOUT_G3D_SWITCH		105
+#define CLK_DOUT_GDC_GDC0		106
+#define CLK_DOUT_GDC_GDC1		107
+#define CLK_DOUT_GDC_SCSC		108
+#define CLK_DOUT_CMU_HPM		109
+#define CLK_DOUT_HSI0_BUS		110
+#define CLK_DOUT_HSI0_DPGTC		111
+#define CLK_DOUT_HSI0_USB31DRD		112
+#define CLK_DOUT_HSI0_USBDPDGB		113
+#define CLK_DOUT_HSI1_BUS		114
+#define CLK_DOUT_HSI1_PCIE		115
+#define CLK_DOUT_HSI2_BUS		116
+#define CLK_DOUT_HSI2_MMC_CARD		117
+#define CLK_DOUT_HSI2_PCIE		118
+#define CLK_DOUT_HSI2_UFS_EMBD		119
+#define CLK_DOUT_IPP_BUS		107
+#define CLK_DOUT_ITP_BUS		108
+#define CLK_DOUT_MCSC_ITSC		109
+#define CLK_DOUT_MCSC_MCSC		110
+#define CLK_DOUT_MFC_MFC		111
+#define CLK_DOUT_MIF_BUSP		112
+#define CLK_DOUT_MISC_BUS		113
+#define CLK_DOUT_MISC_SSS		114
+#define CLK_DOUT_PDP_BUS		115
+#define CLK_DOUT_PDP_VRA		116
+#define CLK_DOUT_PERIC0_BUS		117
+#define CLK_DOUT_PERIC0_IP		118
+#define CLK_DOUT_PERIC1_BUS		119
+#define CLK_DOUT_PERIC1_IP		120
+#define CLK_DOUT_TNR_BUS		121
+#define CLK_DOUT_TPU_BUS		122
+#define CLK_DOUT_TPU_TPU		123
+#define CLK_DOUT_TPU_TPUCTL		124
+#define CLK_DOUT_TPU_UART		125
+#define CLK_DOUT_CMU_BOOST		126
+#define CLK_DOUT_CMU_CMUREF		127
+#define CLK_DOUT_SHARED0_DIV2		128
+#define CLK_DOUT_SHARED0_DIV3		129
+#define CLK_DOUT_SHARED0_DIV4		130
+#define CLK_DOUT_SHARED0_DIV5		131
+#define CLK_DOUT_SHARED1_DIV2		132
+#define CLK_DOUT_SHARED1_DIV3		133
+#define CLK_DOUT_SHARED1_DIV4		134
+#define CLK_DOUT_SHARED2_DIV2		135
+#define CLK_DOUT_SHARED3_DIV2		136
+
+/* CMU_TOP Gates */
+#define CLK_GOUT_BUS0_BOOST		137
+#define CLK_GOUT_BUS1_BOOST		138
+#define CLK_GOUT_BUS2_BOOST		139
+#define CLK_GOUT_CORE_BOOST		140
+#define CLK_GOUT_CPUCL0_BOOST		141
+#define CLK_GOUT_CPUCL1_BOOST		142
+#define CLK_GOUT_CPUCL2_BOOST		143
+#define CLK_GOUT_MIF_BOOST		144
+#define CLK_GOUT_MIF_SWITCH		145
+#define CLK_GOUT_BO_BUS			146
+#define CLK_GOUT_BUS0_BUS		147
+#define CLK_GOUT_BUS1_BUS		148
+#define CLK_GOUT_BUS2_BUS		149
+#define CLK_GOUT_CIS_CLK0		150
+#define CLK_GOUT_CIS_CLK1		151
+#define CLK_GOUT_CIS_CLK2		152
+#define CLK_GOUT_CIS_CLK3		153
+#define CLK_GOUT_CIS_CLK4		154
+#define CLK_GOUT_CIS_CLK5		155
+#define CLK_GOUT_CIS_CLK6		156
+#define CLK_GOUT_CIS_CLK7		157
+#define CLK_GOUT_CMU_BOOST		158
+#define CLK_GOUT_CORE_BUS		159
+#define CLK_GOUT_CPUCL0_DBG		160
+#define CLK_GOUT_CPUCL0_SWITCH		161
+#define CLK_GOUT_CPUCL1_SWITCH		162
+#define CLK_GOUT_CPUCL2_SWITCH		163
+#define CLK_GOUT_CSIS_BUS		164
+#define CLK_GOUT_DISP_BUS		165
+#define CLK_GOUT_DNS_BUS		166
+#define CLK_GOUT_DPU_BUS		167
+#define CLK_GOUT_EH_BUS			168
+#define CLK_GOUT_G2D_G2D		169
+#define CLK_GOUT_G2D_MSCL		170
+#define CLK_GOUT_G3AA_G3AA		171
+#define CLK_GOUT_G3D_BUSD		172
+#define CLK_GOUT_G3D_GLB		173
+#define CLK_GOUT_G3D_SWITCH		174
+#define CLK_GOUT_GDC_GDC0		175
+#define CLK_GOUT_GDC_GDC1		176
+#define CLK_GOUT_GDC_SCSC		177
+#define CLK_GOUT_CMU_HPM		178
+#define CLK_GOUT_HSI0_BUS		179
+#define CLK_GOUT_HSI0_DPGTC		180
+#define CLK_GOUT_HSI0_USB31DRD		181
+#define CLK_GOUT_HSI0_USBDPDGB		182
+#define CLK_GOUT_HSI1_BUS		183
+#define CLK_GOUT_HSI1_PCIE		184
+#define CLK_GOUT_HSI2_BUS		185
+#define CLK_GOUT_HSI2_MMC_CARD		186
+#define CLK_GOUT_HSI2_PCIE		187
+#define CLK_GOUT_HSI2_UFS_EMBD		188
+#define CLK_GOUT_IPP_BUS		189
+#define CLK_GOUT_ITP_BUS		190
+#define CLK_GOUT_MCSC_ITSC		191
+#define CLK_GOUT_MCSC_MCSC		192
+#define CLK_GOUT_MFC_MFC		193
+#define CLK_GOUT_MIF_BUSP		194
+#define CLK_GOUT_MISC_BUS		195
+#define CLK_GOUT_MISC_SSS		196
+#define CLK_GOUT_PDP_BUS		197
+#define CLK_GOUT_PDP_VRA		298
+#define CLK_GOUT_G3AA			299
+#define CLK_GOUT_PERIC0_BUS		200
+#define CLK_GOUT_PERIC0_IP		201
+#define CLK_GOUT_PERIC1_BUS		202
+#define CLK_GOUT_PERIC1_IP		203
+#define CLK_GOUT_TNR_BUS		204
+#define CLK_GOUT_TOP_CMUREF		205
+#define CLK_GOUT_TPU_BUS		206
+#define CLK_GOUT_TPU_TPU		207
+#define CLK_GOUT_TPU_TPUCTL		208
+#define CLK_GOUT_TPU_UART		209
+
+/* CMU_APM */
+#define CLK_MOUT_APM_FUNC						1
+#define CLK_MOUT_APM_FUNCSRC						2
+#define CLK_DOUT_APM_BOOST						3
+#define CLK_DOUT_APM_USI0_UART						4
+#define CLK_DOUT_APM_USI0_USI						5
+#define CLK_DOUT_APM_USI1_UART						6
+#define CLK_GOUT_APM_APM_CMU_APM_IPCLKPORT_PCLK				7
+#define CLK_GOUT_BUS0_BOOST_OPTION1					8
+#define CLK_GOUT_CMU_BOOST_OPTION1					9
+#define CLK_GOUT_CORE_BOOST_OPTION1					10
+#define CLK_GOUT_APM_FUNC						11
+#define CLK_GOUT_APM_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK			12
+#define CLK_GOUT_APM_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK		13
+#define CLK_GOUT_APM_APBIF_PMU_ALIVE_IPCLKPORT_PCLK			14
+#define CLK_GOUT_APM_APBIF_RTC_IPCLKPORT_PCLK				15
+#define CLK_GOUT_APM_APBIF_TRTC_IPCLKPORT_PCLK				16
+#define CLK_GOUT_APM_APM_USI0_UART_IPCLKPORT_IPCLK			17
+#define CLK_GOUT_APM_APM_USI0_UART_IPCLKPORT_PCLK			18
+#define CLK_GOUT_APM_APM_USI0_USI_IPCLKPORT_IPCLK			19
+#define CLK_GOUT_APM_APM_USI0_USI_IPCLKPORT_PCLK			20
+#define CLK_GOUT_APM_APM_USI1_UART_IPCLKPORT_IPCLK			21
+#define CLK_GOUT_APM_APM_USI1_UART_IPCLKPORT_PCLK			22
+#define CLK_GOUT_APM_D_TZPC_APM_IPCLKPORT_PCLK				23
+#define CLK_GOUT_APM_GPC_APM_IPCLKPORT_PCLK				24
+#define CLK_GOUT_APM_GREBEINTEGRATION_IPCLKPORT_HCLK			25
+#define CLK_GOUT_APM_INTMEM_IPCLKPORT_ACLK				26
+#define CLK_GOUT_APM_INTMEM_IPCLKPORT_PCLK				27
+#define CLK_GOUT_APM_LHM_AXI_G_SWD_IPCLKPORT_I_CLK			28
+#define CLK_GOUT_APM_LHM_AXI_P_AOCAPM_IPCLKPORT_I_CLK			29
+#define CLK_GOUT_APM_LHM_AXI_P_APM_IPCLKPORT_I_CLK			30
+#define CLK_GOUT_APM_LHS_AXI_D_APM_IPCLKPORT_I_CLK			31
+#define CLK_GOUT_APM_LHS_AXI_G_DBGCORE_IPCLKPORT_I_CLK			32
+#define CLK_GOUT_APM_LHS_AXI_G_SCAN2DRAM_IPCLKPORT_I_CLK		33
+#define CLK_GOUT_APM_MAILBOX_APM_AOC_IPCLKPORT_PCLK			34
+#define CLK_GOUT_APM_MAILBOX_APM_AP_IPCLKPORT_PCLK			35
+#define CLK_GOUT_APM_MAILBOX_APM_GSA_IPCLKPORT_PCLK			36
+#define CLK_GOUT_APM_MAILBOX_APM_SWD_IPCLKPORT_PCLK			37
+#define CLK_GOUT_APM_MAILBOX_APM_TPU_IPCLKPORT_PCLK			38
+#define CLK_GOUT_APM_MAILBOX_AP_AOC_IPCLKPORT_PCLK			39
+#define CLK_GOUT_APM_MAILBOX_AP_DBGCORE_IPCLKPORT_PCLK		40
+#define CLK_GOUT_APM_PMU_INTR_GEN_IPCLKPORT_PCLK			41
+#define CLK_GOUT_APM_ROM_CRC32_HOST_IPCLKPORT_ACLK			42
+#define CLK_GOUT_APM_ROM_CRC32_HOST_IPCLKPORT_PCLK			43
+#define CLK_GOUT_APM_RSTNSYNC_CLK_APM_BUS_IPCLKPORT_CLK			44
+#define CLK_GOUT_APM_RSTNSYNC_CLK_APM_USI0_UART_IPCLKPORT_CLK		45
+#define CLK_GOUT_APM_RSTNSYNC_CLK_APM_USI0_USI_IPCLKPORT_CLK		46
+#define CLK_GOUT_APM_RSTNSYNC_CLK_APM_USI1_UART_IPCLKPORT_CLK		47
+#define CLK_GOUT_APM_SPEEDY_APM_IPCLKPORT_PCLK				48
+#define CLK_GOUT_APM_SPEEDY_SUB_APM_IPCLKPORT_PCLK			49
+#define CLK_GOUT_APM_SSMT_D_APM_IPCLKPORT_ACLK				50
+#define CLK_GOUT_APM_SSMT_D_APM_IPCLKPORT_PCLK				51
+#define CLK_GOUT_APM_SSMT_G_DBGCORE_IPCLKPORT_ACLK			52
+#define CLK_GOUT_APM_SSMT_G_DBGCORE_IPCLKPORT_PCLK			53
+#define CLK_GOUT_APM_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_IPCLKPORT_HCLK	54
+#define CLK_GOUT_APM_SYSMMU_D_APM_IPCLKPORT_CLK_S2			55
+#define CLK_GOUT_APM_SYSREG_APM_IPCLKPORT_PCLK				56
+#define CLK_GOUT_APM_UASC_APM_IPCLKPORT_ACLK				57
+#define CLK_GOUT_APM_UASC_APM_IPCLKPORT_PCLK				58
+#define CLK_GOUT_APM_UASC_DBGCORE_IPCLKPORT_ACLK			59
+#define CLK_GOUT_APM_UASC_DBGCORE_IPCLKPORT_PCLK			60
+#define CLK_GOUT_APM_UASC_G_SWD_IPCLKPORT_ACLK				61
+#define CLK_GOUT_APM_UASC_G_SWD_IPCLKPORT_PCLK				62
+#define CLK_GOUT_APM_UASC_P_AOCAPM_IPCLKPORT_ACLK			63
+#define CLK_GOUT_APM_UASC_P_AOCAPM_IPCLKPORT_PCLK			64
+#define CLK_GOUT_APM_UASC_P_APM_IPCLKPORT_ACLK				65
+#define CLK_GOUT_APM_UASC_P_APM_IPCLKPORT_PCLK				66
+#define CLK_GOUT_APM_WDT_APM_IPCLKPORT_PCLK				67
+#define CLK_GOUT_APM_XIU_DP_APM_IPCLKPORT_ACLK				68
+#define CLK_APM_PLL_DIV2_APM						69
+#define CLK_APM_PLL_DIV4_APM						70
+#define CLK_APM_PLL_DIV16_APM						71
+
+/* CMU_MISC */
+
+#define CLK_MOUT_MISC_BUS_USER					1
+#define CLK_MOUT_MISC_SSS_USER					2
+#define CLK_MOUT_MISC_GIC					3
+#define CLK_DOUT_MISC_BUSP					4
+#define CLK_DOUT_MISC_GIC					5
+#define CLK_GOUT_MISC_MISC_CMU_MISC_IPCLKPORT_PCLK		6
+#define CLK_GOUT_MISC_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK		7
+#define CLK_GOUT_MISC_OTP_CON_BISR_IPCLKPORT_I_OSCCLK		8
+#define CLK_GOUT_MISC_OTP_CON_TOP_IPCLKPORT_I_OSCCLK		9
+#define CLK_GOUT_MISC_RSTNSYNC_CLK_MISC_OSCCLK_IPCLKPORT_CLK	10
+#define CLK_GOUT_MISC_ADM_AHB_SSS_IPCLKPORT_HCLKM		11
+#define CLK_GOUT_MISC_AD_APB_DIT_IPCLKPORT_PCLKM		12
+#define CLK_GOUT_MISC_AD_APB_PUF_IPCLKPORT_PCLKM		13
+#define CLK_GOUT_MISC_DIT_IPCLKPORT_ICLKL2A			14
+#define CLK_GOUT_MISC_D_TZPC_MISC_IPCLKPORT_PCLK		15
+#define CLK_GOUT_MISC_GIC_IPCLKPORT_GICCLK			16
+#define CLK_GOUT_MISC_GPC_MISC_IPCLKPORT_PCLK			17
+#define CLK_GOUT_MISC_LHM_AST_ICC_CPUGIC_IPCLKPORT_I_CLK	18
+#define CLK_GOUT_MISC_LHM_AXI_D_SSS_IPCLKPORT_I_CLK		19
+#define CLK_GOUT_MISC_LHM_AXI_P_GIC_IPCLKPORT_I_CLK		20
+#define CLK_GOUT_MISC_LHM_AXI_P_MISC_IPCLKPORT_I_CLK		21
+#define CLK_GOUT_MISC_LHS_ACEL_D_MISC_IPCLKPORT_I_CLK		22
+#define CLK_GOUT_MISC_LHS_AST_IRI_GICCPU_IPCLKPORT_I_CLK	23
+#define CLK_GOUT_MISC_LHS_AXI_D_SSS_IPCLKPORT_I_CLK		24
+#define CLK_GOUT_MISC_MCT_IPCLKPORT_PCLK			25
+#define CLK_GOUT_MISC_OTP_CON_BIRA_IPCLKPORT_PCLK		26
+#define CLK_GOUT_MISC_OTP_CON_BISR_IPCLKPORT_PCLK		27
+#define CLK_GOUT_MISC_OTP_CON_TOP_IPCLKPORT_PCLK		28
+#define CLK_GOUT_MISC_PDMA_IPCLKPORT_ACLK			29
+#define CLK_GOUT_MISC_PPMU_DMA_IPCLKPORT_ACLK			30
+#define CLK_GOUT_MISC_PPMU_MISC_IPCLKPORT_ACLK			31
+#define CLK_GOUT_MISC_PPMU_MISC_IPCLKPORT_PCLK			32
+#define CLK_GOUT_MISC_PUF_IPCLKPORT_I_CLK			33
+#define CLK_GOUT_MISC_QE_DIT_IPCLKPORT_ACLK			34
+#define CLK_GOUT_MISC_QE_DIT_IPCLKPORT_PCLK			35
+#define CLK_GOUT_MISC_QE_PDMA_IPCLKPORT_ACLK			36
+#define CLK_GOUT_MISC_QE_PDMA_IPCLKPORT_PCLK			37
+#define CLK_GOUT_MISC_QE_PPMU_DMA_IPCLKPORT_ACLK		38
+#define CLK_GOUT_MISC_QE_PPMU_DMA_IPCLKPORT_PCLK		39
+#define CLK_GOUT_MISC_QE_RTIC_IPCLKPORT_ACLK			40
+#define CLK_GOUT_MISC_QE_RTIC_IPCLKPORT_PCLK			41
+#define CLK_GOUT_MISC_QE_SPDMA_IPCLKPORT_ACLK			42
+#define CLK_GOUT_MISC_QE_SPDMA_IPCLKPORT_PCLK			43
+#define CLK_GOUT_MISC_QE_SSS_IPCLKPORT_ACLK			44
+#define CLK_GOUT_MISC_QE_SSS_IPCLKPORT_PCLK			45
+#define CLK_GOUT_MISC_RSTNSYNC_CLK_MISC_BUSD_IPCLKPORT_CLK	46
+#define CLK_GOUT_MISC_RSTNSYNC_CLK_MISC_BUSP_IPCLKPORT_CLK	47
+#define CLK_GOUT_MISC_RSTNSYNC_CLK_MISC_GIC_IPCLKPORT_CLK	48
+#define CLK_GOUT_MISC_RSTNSYNC_CLK_MISC_SSS_IPCLKPORT_CLK	49
+#define CLK_GOUT_MISC_RTIC_IPCLKPORT_I_ACLK			50
+#define CLK_GOUT_MISC_RTIC_IPCLKPORT_I_PCLK			51
+#define CLK_GOUT_MISC_SPDMA_IPCLKPORT_ACLK			52
+#define CLK_GOUT_MISC_SSMT_DIT_IPCLKPORT_ACLK			53
+#define CLK_GOUT_MISC_SSMT_DIT_IPCLKPORT_PCLK			54
+#define CLK_GOUT_MISC_SSMT_PDMA_IPCLKPORT_ACLK			55
+#define CLK_GOUT_MISC_SSMT_PDMA_IPCLKPORT_PCLK			56
+#define CLK_GOUT_MISC_SSMT_PPMU_DMA_IPCLKPORT_ACLK		57
+#define CLK_GOUT_MISC_SSMT_PPMU_DMA_IPCLKPORT_PCLK		58
+#define CLK_GOUT_MISC_SSMT_RTIC_IPCLKPORT_ACLK			59
+#define CLK_GOUT_MISC_SSMT_RTIC_IPCLKPORT_PCLK			60
+#define CLK_GOUT_MISC_SSMT_SPDMA_IPCLKPORT_ACLK			61
+#define CLK_GOUT_MISC_SSMT_SPDMA_IPCLKPORT_PCLK			62
+#define CLK_GOUT_MISC_SSMT_SSS_IPCLKPORT_ACLK			63
+#define CLK_GOUT_MISC_SSMT_SSS_IPCLKPORT_PCLK			64
+#define CLK_GOUT_MISC_SSS_IPCLKPORT_I_ACLK			65
+#define CLK_GOUT_MISC_SSS_IPCLKPORT_I_PCLK			66
+#define CLK_GOUT_MISC_SYSMMU_MISC_IPCLKPORT_CLK_S2		67
+#define CLK_GOUT_MISC_SYSMMU_SSS_IPCLKPORT_CLK_S1		68
+#define CLK_GOUT_MISC_SYSREG_MISC_IPCLKPORT_PCLK		69
+#define CLK_GOUT_MISC_TMU_SUB_IPCLKPORT_PCLK			70
+#define CLK_GOUT_MISC_TMU_TOP_IPCLKPORT_PCLK			71
+#define CLK_GOUT_MISC_WDT_CLUSTER0_IPCLKPORT_PCLK		72
+#define CLK_GOUT_MISC_WDT_CLUSTER1_IPCLKPORT_PCLK		73
+#define CLK_GOUT_MISC_XIU_D_MISC_IPCLKPORT_ACLK			74
+
+#endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.43.0.rc2.451.g8631bc7472-goog


