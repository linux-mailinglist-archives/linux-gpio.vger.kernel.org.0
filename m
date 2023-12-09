Return-Path: <linux-gpio+bounces-1155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97F80B7AB
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 00:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5FC6280F75
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Dec 2023 23:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4A51F945;
	Sat,  9 Dec 2023 23:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeSyoiV6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA1210C9
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 15:31:17 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c2d50bfbfso13824715e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 Dec 2023 15:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164676; x=1702769476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGPECbx6RgLlPqcpXJy3FkV1pQK2uZh5l73KQ77mA9s=;
        b=YeSyoiV6O6wjZZGC/F8/Hlip7Dm+/mPWotUkY7M4q4d/Am8n+98zXfn8L4o7x02+MZ
         Wf8cfhp93R2StyZh2RR9hpNSqHHHzaDwFhspjXNeWQ9GhUy4DwjZl7w6va6nD4RtYK3O
         H9k5lFGl13J9D6cBrN/Hi6QtX28xPrCDSu3wJauoA3SR8qgGrHJCT0W/iCFsl0FeK83f
         LUp9xbPWKebCSmO6Gy7fAdz0dVwFFfsDezaN+VupTovg7wFLJv4W4OKUrVmYF7R0Doyd
         yMHANzyhwr0UyLAffZatWazNf0BgkWofuldlOhEq8hS2eDUbWllBUgcW36hCZ3NPVh21
         6qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164676; x=1702769476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGPECbx6RgLlPqcpXJy3FkV1pQK2uZh5l73KQ77mA9s=;
        b=l7XzEQalCLf/d9lUBpaXH+mEa8Tvk/iWvAsbVpPkshdawMpdAZEtPdQ368BURRdB6K
         7kQBSKq6rymFTALcyXlZJbqMaQ9tvTGuAlOnbL2ZBzFlxFQ5+dOab9hS3HPgLabmFdn5
         DofINcIugHQ4jGzLUxKNZY4YSwhyLFdtI+FRSqvYVHmbV8E4B5zHauKFNdyn5KOLKUjE
         AStJQC+G9UgSpStT3poUMyaL8aileW7fcCA8HmxYj+ImjIPMA781p6Bxodql+qG6TUmI
         MXR2iEcqEVNZDKxf0Ogwo63acBSRtTwQccDrubXcOjWqsxVxxPsdChulJTzLvmfa5ruv
         StMw==
X-Gm-Message-State: AOJu0Yx66bvtmhig9SGRZgtSQeqV39DqcNL46zi88wIOIx2Iwqx3uOa9
	RWWQe0YucGtaSNRDWhDFEwWVnQ==
X-Google-Smtp-Source: AGHT+IGH3j+zXvZJLDAIykqrCdId9U8U1hAVmYFKKsEUTM1SQWTm5Xeb9daYWpG+Iou6AbykUfNDIg==
X-Received: by 2002:a05:600c:c0c:b0:40b:5e1f:c387 with SMTP id fm12-20020a05600c0c0c00b0040b5e1fc387mr1125088wmb.29.1702164676202;
        Sat, 09 Dec 2023 15:31:16 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:15 -0800 (PST)
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
Subject: [PATCH v6 02/20] dt-bindings: clock: Add Google gs101 clock management unit bindings
Date: Sat,  9 Dec 2023 23:30:48 +0000
Message-ID: <20231209233106.147416-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide dt-schema documentation for Google gs101 SoC clock controller.
Currently this adds support for cmu_top, cmu_misc and cmu_apm.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml    | 106 +++++
 include/dt-bindings/clock/google,gs101.h      | 392 ++++++++++++++++++
 2 files changed, 498 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 create mode 100644 include/dt-bindings/clock/google,gs101.h

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
new file mode 100644
index 000000000000..3eebc03a309b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -0,0 +1,106 @@
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
+            - description: Misc bus clock (from CMU_TOP)
+            - description: Misc sss clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: dout_cmu_misc_bus
+            - const: dout_cmu_misc_sss
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_TOP
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+
+    cmu_top: clock-controller@1e080000 {
+        compatible = "google,gs101-cmu-top";
+        reg = <0x1e080000 0x8000>;
+        #clock-cells = <1>;
+        clocks = <&ext_24_5m>;
+        clock-names = "oscclk";
+    };
+
+...
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
new file mode 100644
index 000000000000..5d2c2d907a7b
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
+#define CLK_MOUT_PLL_SHARED0		6
+#define CLK_MOUT_PLL_SHARED1		7
+#define CLK_MOUT_PLL_SHARED2		8
+#define CLK_MOUT_PLL_SHARED3		9
+#define CLK_MOUT_PLL_SPARE		10
+#define CLK_MOUT_CMU_BO_BUS		11
+#define CLK_MOUT_CMU_BUS0_BUS		12
+#define CLK_MOUT_CMU_BUS1_BUS		13
+#define CLK_MOUT_CMU_BUS2_BUS		14
+#define CLK_MOUT_CMU_CIS_CLK0		15
+#define CLK_MOUT_CMU_CIS_CLK1		16
+#define CLK_MOUT_CMU_CIS_CLK2		17
+#define CLK_MOUT_CMU_CIS_CLK3		18
+#define CLK_MOUT_CMU_CIS_CLK4		19
+#define CLK_MOUT_CMU_CIS_CLK5		20
+#define CLK_MOUT_CMU_CIS_CLK6		21
+#define CLK_MOUT_CMU_CIS_CLK7		22
+#define CLK_MOUT_CMU_CMU_BOOST		23
+#define CLK_MOUT_CMU_BOOST_OPTION1	24
+#define CLK_MOUT_CMU_CORE_BUS		25
+#define CLK_MOUT_CMU_CPUCL0_DBG		26
+#define CLK_MOUT_CMU_CPUCL0_SWITCH	27
+#define CLK_MOUT_CMU_CPUCL1_SWITCH	28
+#define CLK_MOUT_CMU_CPUCL2_SWITCH	29
+#define CLK_MOUT_CMU_CSIS_BUS		30
+#define CLK_MOUT_CMU_DISP_BUS		31
+#define CLK_MOUT_CMU_DNS_BUS		32
+#define CLK_MOUT_CMU_DPU_BUS		33
+#define CLK_MOUT_CMU_EH_BUS		34
+#define CLK_MOUT_CMU_G2D_G2D		35
+#define CLK_MOUT_CMU_G2D_MSCL		36
+#define CLK_MOUT_CMU_G3AA_G3AA		37
+#define CLK_MOUT_CMU_G3D_BUSD		38
+#define CLK_MOUT_CMU_G3D_GLB		39
+#define CLK_MOUT_CMU_G3D_SWITCH		40
+#define CLK_MOUT_CMU_GDC_GDC0		41
+#define CLK_MOUT_CMU_GDC_GDC1		42
+#define CLK_MOUT_CMU_GDC_SCSC		43
+#define CLK_MOUT_CMU_HPM		44
+#define CLK_MOUT_CMU_HSI0_BUS		45
+#define CLK_MOUT_CMU_HSI0_DPGTC		46
+#define CLK_MOUT_CMU_HSI0_USB31DRD	47
+#define CLK_MOUT_CMU_HSI0_USBDPDGB	48
+#define CLK_MOUT_CMU_HSI1_BUS		49
+#define CLK_MOUT_CMU_HSI1_PCIE		50
+#define CLK_MOUT_CMU_HSI2_BUS		51
+#define CLK_MOUT_CMU_HSI2_MMC_CARD	52
+#define CLK_MOUT_CMU_HSI2_PCIE		53
+#define CLK_MOUT_CMU_HSI2_UFS_EMBD	54
+#define CLK_MOUT_CMU_IPP_BUS		55
+#define CLK_MOUT_CMU_ITP_BUS		56
+#define CLK_MOUT_CMU_MCSC_ITSC		57
+#define CLK_MOUT_CMU_MCSC_MCSC		58
+#define CLK_MOUT_CMU_MFC_MFC		59
+#define CLK_MOUT_CMU_MIF_BUSP		60
+#define CLK_MOUT_CMU_MIF_SWITCH		61
+#define CLK_MOUT_CMU_MISC_BUS		62
+#define CLK_MOUT_CMU_MISC_SSS		63
+#define CLK_MOUT_CMU_PDP_BUS		64
+#define CLK_MOUT_CMU_PDP_VRA		65
+#define CLK_MOUT_CMU_PERIC0_BUS		66
+#define CLK_MOUT_CMU_PERIC0_IP		67
+#define CLK_MOUT_CMU_PERIC1_BUS		68
+#define CLK_MOUT_CMU_PERIC1_IP		69
+#define CLK_MOUT_CMU_TNR_BUS		70
+#define CLK_MOUT_CMU_TOP_BOOST_OPTION1	71
+#define CLK_MOUT_CMU_TOP_CMUREF		72
+#define CLK_MOUT_CMU_TPU_BUS		73
+#define CLK_MOUT_CMU_TPU_TPU		74
+#define CLK_MOUT_CMU_TPU_TPUCTL		75
+#define CLK_MOUT_CMU_TPU_UART		76
+#define CLK_MOUT_CMU_CMUREF		77
+
+/* CMU_TOP Dividers */
+#define CLK_DOUT_CMU_BO_BUS		78
+#define CLK_DOUT_CMU_BUS0_BUS		79
+#define CLK_DOUT_CMU_BUS1_BUS		80
+#define CLK_DOUT_CMU_BUS2_BUS		81
+#define CLK_DOUT_CMU_CIS_CLK0		82
+#define CLK_DOUT_CMU_CIS_CLK1		83
+#define CLK_DOUT_CMU_CIS_CLK2		84
+#define CLK_DOUT_CMU_CIS_CLK3		85
+#define CLK_DOUT_CMU_CIS_CLK4		86
+#define CLK_DOUT_CMU_CIS_CLK5		87
+#define CLK_DOUT_CMU_CIS_CLK6		88
+#define CLK_DOUT_CMU_CIS_CLK7		89
+#define CLK_DOUT_CMU_CORE_BUS		90
+#define CLK_DOUT_CMU_CPUCL0_DBG		91
+#define CLK_DOUT_CMU_CPUCL0_SWITCH	92
+#define CLK_DOUT_CMU_CPUCL1_SWITCH	93
+#define CLK_DOUT_CMU_CPUCL2_SWITCH	94
+#define CLK_DOUT_CMU_CSIS_BUS		95
+#define CLK_DOUT_CMU_DISP_BUS		96
+#define CLK_DOUT_CMU_DNS_BUS		97
+#define CLK_DOUT_CMU_DPU_BUS		98
+#define CLK_DOUT_CMU_EH_BUS		99
+#define CLK_DOUT_CMU_G2D_G2D		100
+#define CLK_DOUT_CMU_G2D_MSCL		101
+#define CLK_DOUT_CMU_G3AA_G3AA		102
+#define CLK_DOUT_CMU_G3D_BUSD		103
+#define CLK_DOUT_CMU_G3D_GLB		104
+#define CLK_DOUT_CMU_G3D_SWITCH		105
+#define CLK_DOUT_CMU_GDC_GDC0		106
+#define CLK_DOUT_CMU_GDC_GDC1		107
+#define CLK_DOUT_CMU_GDC_SCSC		108
+#define CLK_DOUT_CMU_CMU_HPM		109
+#define CLK_DOUT_CMU_HSI0_BUS		110
+#define CLK_DOUT_CMU_HSI0_DPGTC		111
+#define CLK_DOUT_CMU_HSI0_USB31DRD	112
+#define CLK_DOUT_CMU_HSI0_USBDPDBG	113
+#define CLK_DOUT_CMU_HSI1_BUS		114
+#define CLK_DOUT_CMU_HSI1_PCIE		115
+#define CLK_DOUT_CMU_HSI2_BUS		116
+#define CLK_DOUT_CMU_HSI2_MMC_CARD	117
+#define CLK_DOUT_CMU_HSI2_PCIE		118
+#define CLK_DOUT_CMU_HSI2_UFS_EMBD	119
+#define CLK_DOUT_CMU_IPP_BUS		120
+#define CLK_DOUT_CMU_ITP_BUS		121
+#define CLK_DOUT_CMU_MCSC_ITSC		122
+#define CLK_DOUT_CMU_MCSC_MCSC		123
+#define CLK_DOUT_CMU_MFC_MFC		124
+#define CLK_DOUT_CMU_MIF_BUSP		125
+#define CLK_DOUT_CMU_MISC_BUS		126
+#define CLK_DOUT_CMU_MISC_SSS		127
+#define CLK_DOUT_CMU_OTP		128
+#define CLK_DOUT_CMU_PDP_BUS		129
+#define CLK_DOUT_CMU_PDP_VRA		130
+#define CLK_DOUT_CMU_PERIC0_BUS		131
+#define CLK_DOUT_CMU_PERIC0_IP		132
+#define CLK_DOUT_CMU_PERIC1_BUS		133
+#define CLK_DOUT_CMU_PERIC1_IP		134
+#define CLK_DOUT_CMU_TNR_BUS		135
+#define CLK_DOUT_CMU_TPU_BUS		136
+#define CLK_DOUT_CMU_TPU_TPU		137
+#define CLK_DOUT_CMU_TPU_TPUCTL		138
+#define CLK_DOUT_CMU_TPU_UART		139
+#define CLK_DOUT_CMU_CMU_BOOST		140
+#define CLK_DOUT_CMU_CMU_CMUREF		141
+#define CLK_DOUT_CMU_SHARED0_DIV2	142
+#define CLK_DOUT_CMU_SHARED0_DIV3	143
+#define CLK_DOUT_CMU_SHARED0_DIV4	144
+#define CLK_DOUT_CMU_SHARED0_DIV5	145
+#define CLK_DOUT_CMU_SHARED1_DIV2	146
+#define CLK_DOUT_CMU_SHARED1_DIV3	147
+#define CLK_DOUT_CMU_SHARED1_DIV4	148
+#define CLK_DOUT_CMU_SHARED2_DIV2	149
+#define CLK_DOUT_CMU_SHARED3_DIV2	150
+
+/* CMU_TOP Gates */
+#define CLK_GOUT_BUS0_BOOST		151
+#define CLK_GOUT_BUS1_BOOST		152
+#define CLK_GOUT_BUS2_BOOST		153
+#define CLK_GOUT_CORE_BOOST		154
+#define CLK_GOUT_CPUCL0_BOOST		155
+#define CLK_GOUT_CPUCL1_BOOST		156
+#define CLK_GOUT_CPUCL2_BOOST		157
+#define CLK_GOUT_MIF_BOOST		158
+#define CLK_GOUT_MIF_SWITCH		159
+#define CLK_GOUT_BO_BUS			160
+#define CLK_GOUT_BUS0_BUS		161
+#define CLK_GOUT_BUS1_BUS		162
+#define CLK_GOUT_BUS2_BUS		163
+#define CLK_GOUT_CIS_CLK0		164
+#define CLK_GOUT_CIS_CLK1		165
+#define CLK_GOUT_CIS_CLK2		167
+#define CLK_GOUT_CIS_CLK3		168
+#define CLK_GOUT_CIS_CLK4		169
+#define CLK_GOUT_CIS_CLK5		170
+#define CLK_GOUT_CIS_CLK6		171
+#define CLK_GOUT_CIS_CLK7		172
+#define CLK_GOUT_CMU_BOOST		173
+#define CLK_GOUT_CORE_BUS		174
+#define CLK_GOUT_CPUCL0_DBG		175
+#define CLK_GOUT_CPUCL0_SWITCH		176
+#define CLK_GOUT_CPUCL1_SWITCH		177
+#define CLK_GOUT_CPUCL2_SWITCH		178
+#define CLK_GOUT_CSIS_BUS		179
+#define CLK_GOUT_DISP_BUS		180
+#define CLK_GOUT_DNS_BUS		181
+#define CLK_GOUT_DPU_BUS		182
+#define CLK_GOUT_EH_BUS			183
+#define CLK_GOUT_G2D_G2D		184
+#define CLK_GOUT_G2D_MSCL		185
+#define CLK_GOUT_G3AA_G3AA		186
+#define CLK_GOUT_G3D_BUSD		187
+#define CLK_GOUT_G3D_GLB		188
+#define CLK_GOUT_G3D_SWITCH		189
+#define CLK_GOUT_GDC_GDC0		190
+#define CLK_GOUT_GDC_GDC1		191
+#define CLK_GOUT_GDC_SCSC		192
+#define CLK_GOUT_CMU_HPM		193
+#define CLK_GOUT_HSI0_BUS		194
+#define CLK_GOUT_HSI0_DPGTC		195
+#define CLK_GOUT_HSI0_USB31DRD		196
+#define CLK_GOUT_HSI0_USBDPDGB		197
+#define CLK_GOUT_HSI1_BUS		198
+#define CLK_GOUT_HSI1_PCIE		199
+#define CLK_GOUT_HSI2_BUS		200
+#define CLK_GOUT_HSI2_MMC_CARD		201
+#define CLK_GOUT_HSI2_PCIE		202
+#define CLK_GOUT_HSI2_UFS_EMBD		203
+#define CLK_GOUT_IPP_BUS		204
+#define CLK_GOUT_ITP_BUS		205
+#define CLK_GOUT_MCSC_ITSC		206
+#define CLK_GOUT_MCSC_MCSC		207
+#define CLK_GOUT_MFC_MFC		208
+#define CLK_GOUT_MIF_BUSP		209
+#define CLK_GOUT_MISC_BUS		210
+#define CLK_GOUT_MISC_SSS		211
+#define CLK_GOUT_PDP_BUS		212
+#define CLK_GOUT_PDP_VRA		213
+#define CLK_GOUT_G3AA			214
+#define CLK_GOUT_PERIC0_BUS		215
+#define CLK_GOUT_PERIC0_IP		216
+#define CLK_GOUT_PERIC1_BUS		217
+#define CLK_GOUT_PERIC1_IP		218
+#define CLK_GOUT_TNR_BUS		219
+#define CLK_GOUT_TOP_CMUREF		220
+#define CLK_GOUT_TPU_BUS		221
+#define CLK_GOUT_TPU_TPU		222
+#define CLK_GOUT_TPU_TPUCTL		223
+#define CLK_GOUT_TPU_UART		224
+
+/* CMU_APM */
+#define CLK_MOUT_APM_FUNC				1
+#define CLK_MOUT_APM_FUNCSRC				2
+#define CLK_DOUT_APM_BOOST				3
+#define CLK_DOUT_APM_USI0_UART				4
+#define CLK_DOUT_APM_USI0_USI				5
+#define CLK_DOUT_APM_USI1_UART				6
+#define CLK_GOUT_APM_APM_CMU_APM_PCLK			7
+#define CLK_GOUT_BUS0_BOOST_OPTION1			8
+#define CLK_GOUT_CMU_BOOST_OPTION1			9
+#define CLK_GOUT_CORE_BOOST_OPTION1			10
+#define CLK_GOUT_APM_FUNC				11
+#define CLK_GOUT_APM_APBIF_GPIO_ALIVE_PCLK		12
+#define CLK_GOUT_APM_APBIF_GPIO_FAR_ALIVE_PCLK		13
+#define CLK_GOUT_APM_APBIF_PMU_ALIVE_PCLK		14
+#define CLK_GOUT_APM_APBIF_RTC_PCLK			15
+#define CLK_GOUT_APM_APBIF_TRTC_PCLK			16
+#define CLK_GOUT_APM_APM_USI0_UART_IPCLK		17
+#define CLK_GOUT_APM_APM_USI0_UART_PCLK			18
+#define CLK_GOUT_APM_APM_USI0_USI_IPCLK			19
+#define CLK_GOUT_APM_APM_USI0_USI_PCLK			20
+#define CLK_GOUT_APM_APM_USI1_UART_IPCLK		21
+#define CLK_GOUT_APM_APM_USI1_UART_PCLK			22
+#define CLK_GOUT_APM_D_TZPC_APM_PCLK			23
+#define CLK_GOUT_APM_GPC_APM_PCLK			24
+#define CLK_GOUT_APM_GREBEINTEGRATION_HCLK		25
+#define CLK_GOUT_APM_INTMEM_ACLK			26
+#define CLK_GOUT_APM_INTMEM_PCLK			27
+#define CLK_GOUT_APM_LHM_AXI_G_SWD_I_CLK		28
+#define CLK_GOUT_APM_LHM_AXI_P_AOCAPM_I_CLK		29
+#define CLK_GOUT_APM_LHM_AXI_P_APM_I_CLK		30
+#define CLK_GOUT_APM_LHS_AXI_D_APM_I_CLK		31
+#define CLK_GOUT_APM_LHS_AXI_G_DBGCORE_I_CLK		32
+#define CLK_GOUT_APM_LHS_AXI_G_SCAN2DRAM_I_CLK		33
+#define CLK_GOUT_APM_MAILBOX_APM_AOC_PCLK		34
+#define CLK_GOUT_APM_MAILBOX_APM_AP_PCLK		35
+#define CLK_GOUT_APM_MAILBOX_APM_GSA_PCLK		36
+#define CLK_GOUT_APM_MAILBOX_APM_SWD_PCLK		37
+#define CLK_GOUT_APM_MAILBOX_APM_TPU_PCLK		38
+#define CLK_GOUT_APM_MAILBOX_AP_AOC_PCLK		39
+#define CLK_GOUT_APM_MAILBOX_AP_DBGCORE_PCLK		40
+#define CLK_GOUT_APM_PMU_INTR_GEN_PCLK			41
+#define CLK_GOUT_APM_ROM_CRC32_HOST_ACLK		42
+#define CLK_GOUT_APM_ROM_CRC32_HOST_PCLK		43
+#define CLK_GOUT_APM_CLK_APM_BUS_CLK			44
+#define CLK_GOUT_APM_CLK_APM_USI0_UART_CLK		45
+#define CLK_GOUT_APM_CLK_APM_USI0_USI_CLK		46
+#define CLK_GOUT_APM_CLK_APM_USI1_UART_CLK		47
+#define CLK_GOUT_APM_SPEEDY_APM_PCLK			48
+#define CLK_GOUT_APM_SPEEDY_SUB_APM_PCLK		49
+#define CLK_GOUT_APM_SSMT_D_APM_ACLK			50
+#define CLK_GOUT_APM_SSMT_D_APM_PCLK			51
+#define CLK_GOUT_APM_SSMT_G_DBGCORE_ACLK		52
+#define CLK_GOUT_APM_SSMT_G_DBGCORE_PCLK		53
+#define CLK_GOUT_APM_SS_DBGCORE_SS_DBGCORE_HCLK		54
+#define CLK_GOUT_APM_SYSMMU_D_APM_CLK_S2		55
+#define CLK_GOUT_APM_SYSREG_APM_PCLK			56
+#define CLK_GOUT_APM_UASC_APM_ACLK			57
+#define CLK_GOUT_APM_UASC_APM_PCLK			58
+#define CLK_GOUT_APM_UASC_DBGCORE_ACLK			59
+#define CLK_GOUT_APM_UASC_DBGCORE_PCLK			60
+#define CLK_GOUT_APM_UASC_G_SWD_ACLK			61
+#define CLK_GOUT_APM_UASC_G_SWD_PCLK			62
+#define CLK_GOUT_APM_UASC_P_AOCAPM_ACLK			63
+#define CLK_GOUT_APM_UASC_P_AOCAPM_PCLK			64
+#define CLK_GOUT_APM_UASC_P_APM_ACLK			65
+#define CLK_GOUT_APM_UASC_P_APM_PCLK			66
+#define CLK_GOUT_APM_WDT_APM_PCLK			67
+#define CLK_GOUT_APM_XIU_DP_APM_ACLK			68
+#define CLK_APM_PLL_DIV2_APM				69
+#define CLK_APM_PLL_DIV4_APM				70
+#define CLK_APM_PLL_DIV16_APM				71
+
+/* CMU_MISC */
+#define CLK_MOUT_MISC_BUS_USER				1
+#define CLK_MOUT_MISC_SSS_USER				2
+#define CLK_MOUT_MISC_GIC				3
+#define CLK_DOUT_MISC_BUSP				4
+#define CLK_DOUT_MISC_GIC				5
+#define CLK_GOUT_MISC_MISC_CMU_MISC_PCLK		6
+#define CLK_GOUT_MISC_OTP_CON_BIRA_I_OSCCLK		7
+#define CLK_GOUT_MISC_OTP_CON_BISR_I_OSCCLK		8
+#define CLK_GOUT_MISC_OTP_CON_TOP_I_OSCCLK		9
+#define CLK_GOUT_MISC_CLK_MISC_OSCCLK_CLK		10
+#define CLK_GOUT_MISC_ADM_AHB_SSS_HCLKM			11
+#define CLK_GOUT_MISC_AD_APB_DIT_PCLKM			12
+#define CLK_GOUT_MISC_AD_APB_PUF_PCLKM			13
+#define CLK_GOUT_MISC_DIT_ICLKL2A			14
+#define CLK_GOUT_MISC_D_TZPC_MISC_PCLK			15
+#define CLK_GOUT_MISC_GIC_GICCLK			16
+#define CLK_GOUT_MISC_GPC_MISC_PCLK			17
+#define CLK_GOUT_MISC_LHM_AST_ICC_CPUGIC_I_CLK		18
+#define CLK_GOUT_MISC_LHM_AXI_D_SSS_I_CLK		19
+#define CLK_GOUT_MISC_LHM_AXI_P_GIC_I_CLK		20
+#define CLK_GOUT_MISC_LHM_AXI_P_MISC_I_CLK		21
+#define CLK_GOUT_MISC_LHS_ACEL_D_MISC_I_CLK		22
+#define CLK_GOUT_MISC_LHS_AST_IRI_GICCPU_I_CLK		23
+#define CLK_GOUT_MISC_LHS_AXI_D_SSS_I_CLK		24
+#define CLK_GOUT_MISC_MCT_PCLK				25
+#define CLK_GOUT_MISC_OTP_CON_BIRA_PCLK			26
+#define CLK_GOUT_MISC_OTP_CON_BISR_PCLK			27
+#define CLK_GOUT_MISC_OTP_CON_TOP_PCLK			28
+#define CLK_GOUT_MISC_PDMA_ACLK				29
+#define CLK_GOUT_MISC_PPMU_DMA_ACLK			30
+#define CLK_GOUT_MISC_PPMU_MISC_ACLK			31
+#define CLK_GOUT_MISC_PPMU_MISC_PCLK			32
+#define CLK_GOUT_MISC_PUF_I_CLK				33
+#define CLK_GOUT_MISC_QE_DIT_ACLK			34
+#define CLK_GOUT_MISC_QE_DIT_PCLK			35
+#define CLK_GOUT_MISC_QE_PDMA_ACLK			36
+#define CLK_GOUT_MISC_QE_PDMA_PCLK			37
+#define CLK_GOUT_MISC_QE_PPMU_DMA_ACLK			38
+#define CLK_GOUT_MISC_QE_PPMU_DMA_PCLK			39
+#define CLK_GOUT_MISC_QE_RTIC_ACLK			40
+#define CLK_GOUT_MISC_QE_RTIC_PCLK			41
+#define CLK_GOUT_MISC_QE_SPDMA_ACLK			42
+#define CLK_GOUT_MISC_QE_SPDMA_PCLK			43
+#define CLK_GOUT_MISC_QE_SSS_ACLK			44
+#define CLK_GOUT_MISC_QE_SSS_PCLK			45
+#define CLK_GOUT_MISC_CLK_MISC_BUSD_CLK			46
+#define CLK_GOUT_MISC_CLK_MISC_BUSP_CLK			47
+#define CLK_GOUT_MISC_CLK_MISC_GIC_CLK			48
+#define CLK_GOUT_MISC_CLK_MISC_SSS_CLK			49
+#define CLK_GOUT_MISC_RTIC_I_ACLK			50
+#define CLK_GOUT_MISC_RTIC_I_PCLK			51
+#define CLK_GOUT_MISC_SPDMA_ACLK			52
+#define CLK_GOUT_MISC_SSMT_DIT_ACLK			53
+#define CLK_GOUT_MISC_SSMT_DIT_PCLK			54
+#define CLK_GOUT_MISC_SSMT_PDMA_ACLK			55
+#define CLK_GOUT_MISC_SSMT_PDMA_PCLK			56
+#define CLK_GOUT_MISC_SSMT_PPMU_DMA_ACLK		57
+#define CLK_GOUT_MISC_SSMT_PPMU_DMA_PCLK		58
+#define CLK_GOUT_MISC_SSMT_RTIC_ACLK			59
+#define CLK_GOUT_MISC_SSMT_RTIC_PCLK			60
+#define CLK_GOUT_MISC_SSMT_SPDMA_ACLK			61
+#define CLK_GOUT_MISC_SSMT_SPDMA_PCLK			62
+#define CLK_GOUT_MISC_SSMT_SSS_ACLK			63
+#define CLK_GOUT_MISC_SSMT_SSS_PCLK			64
+#define CLK_GOUT_MISC_SSS_I_ACLK			65
+#define CLK_GOUT_MISC_SSS_I_PCLK			66
+#define CLK_GOUT_MISC_SYSMMU_MISC_CLK_S2		67
+#define CLK_GOUT_MISC_SYSMMU_SSS_CLK_S1			68
+#define CLK_GOUT_MISC_SYSREG_MISC_PCLK			69
+#define CLK_GOUT_MISC_TMU_SUB_PCLK			70
+#define CLK_GOUT_MISC_TMU_TOP_PCLK			71
+#define CLK_GOUT_MISC_WDT_CLUSTER0_PCLK			72
+#define CLK_GOUT_MISC_WDT_CLUSTER1_PCLK			73
+#define CLK_GOUT_MISC_XIU_D_MISC_ACLK			74
+
+#endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.43.0.472.g3155946c3a-goog


