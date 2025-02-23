Return-Path: <linux-gpio+bounces-16441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A36DEA41103
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 19:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34BED188B35E
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 18:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEA1191F6A;
	Sun, 23 Feb 2025 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="S3gXPL4Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8979E155751;
	Sun, 23 Feb 2025 18:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337133; cv=none; b=u5dMCkBF0Xgy7zEC2W65IOPXaHVJWMIvm70ktJ5ADipDY1LaUe7Dai/z0ZgdChEjxaS14THsjLFC8BflA48XOf4d2zJcdrEA41kuvtX0zOieEV0nzdgxih0wKFpfXeYGin1yKPaTJXz6SRu+8fs294U0Ujy3ykCyvGOwwqWVmxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337133; c=relaxed/simple;
	bh=0V9CjYxXnrRBEUshRpcDmP3eMGTQc3zVHiqNZi7gAfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJPU8yWQwXzODTMaZQkDl/XHSDHbCPCQ4vUx35RTuWIhuepEkQmfuoHurOQe1HRvAiNt8cTF8otBZnavEsTZMmbXBDVJyDAlQTNTFrbT53rF9Rq521LBjzFj/BFc1UmsnGLryAwzQNtQ0qYLZc70UHXS+VwuRFbXg7ONP5mwpO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=S3gXPL4Z; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
	by mail.mainlining.org (Postfix) with ESMTPSA id 737BEBBAA9;
	Sun, 23 Feb 2025 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1740337124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9VcVl5gDRjTYO2Qp8w2oBbNAaPcpyo8+xli8CUCQTSU=;
	b=S3gXPL4Z4xx6HFQGTWeejTR4mdQAVDX9oTzJqlUdCDXwJLjPgZcrfZLAjm6VLieNy80sfz
	uWrYhjJ5tmenmscAKSSG0PqIxCE1a2PNRfoFlNxSRpvPKjP7mmEM4Qx1ywRqi8Kv98fPdl
	Rs/mNoBzQvbGiuRPvzeDv/cboGIWLlZ1myRts10NGcqb2BA1ZsQ3r4xOB+WiqhCWujpB9H
	0srWj+MP/nKbEPwWKLvy04E0XRzT4MGR+eTm1uOWq+6TaMp4kl/RVe0Vgti6cfLDlgJXzr
	fO/ClUnY6ig+Wg87umJ8SasPbCZ4G0+YDQ4p39/OcwH0yd4sVzfBM6ULqXJfkA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 23 Feb 2025 19:57:46 +0100
Subject: [PATCH v2 1/8] dt-bindings: clock: qcom: Add MSM8937 Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250223-msm8937-v2-1-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740337120; l=3862;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=0V9CjYxXnrRBEUshRpcDmP3eMGTQc3zVHiqNZi7gAfM=;
 b=o6lX4x1gXRTdusiAZwyGDZZZGrKFV+7MGeIEQm3MXpRtk1l/iy98tQSeDsK+f7AEId118M1CC
 hrBFuOpM8lPDtv0+q5/uk/8R5CQF6rLfQHUvSqM0T+zeM2EuGKIiXyg
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add device tree bindings for the global clock controller on Qualcomm
MSM8937 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/clock/qcom,gcc-msm8937.yaml           | 73 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8917.h       | 17 +++++
 2 files changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c169bc3e350da6da906d90e6632836ba7f591d49
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8937.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on MSM8937
+
+maintainers:
+  - Barnabas Czeman <barnabas.czeman@mainlining.org>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on MSM8937.
+
+  See also::
+    include/dt-bindings/clock/qcom,gcc-msm8917.h
+
+properties:
+  compatible:
+    const: qcom,gcc-msm8937
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: DSI phy instance 0 dsi clock
+      - description: DSI phy instance 0 byte clock
+      - description: DSI phy instance 1 dsi clock
+      - description: DSI phy instance 1 byte clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: dsi0pll
+      - const: dsi0pllbyte
+      - const: dsi1pll
+      - const: dsi1pllbyte
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gcc: clock-controller@1800000 {
+      compatible = "qcom,gcc-msm8937";
+      reg = <0x01800000 0x80000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&dsi0_phy 1>,
+               <&dsi0_phy 0>;
+               <&dsi1_phy 1>,
+               <&dsi1_phy 0>;
+      clock-names = "xo",
+                    "sleep_clk",
+                    "dsi0pll",
+                    "dsi0pllbyte",
+                    "dsi1pll",
+                    "dsi1pllbyte";
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bindings/clock/qcom,gcc-msm8917.h
index 4b421e7414b50bef2e2400f868ae5b7212a427bb..ec1f0b261dd5ccfe4896a00ffa9cf86de98b9cb3 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -170,6 +170,22 @@
 #define VFE1_CLK_SRC				163
 #define VSYNC_CLK_SRC				164
 #define GPLL0_SLEEP_CLK_SRC			165
+#define BLSP1_QUP1_I2C_APPS_CLK_SRC		166
+#define BLSP1_QUP1_SPI_APPS_CLK_SRC		167
+#define BLSP2_QUP4_I2C_APPS_CLK_SRC		168
+#define BLSP2_QUP4_SPI_APPS_CLK_SRC		169
+#define BYTE1_CLK_SRC				170
+#define ESC1_CLK_SRC				171
+#define PCLK1_CLK_SRC				172
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK		173
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK		174
+#define GCC_BLSP2_QUP4_I2C_APPS_CLK		175
+#define GCC_BLSP2_QUP4_SPI_APPS_CLK		176
+#define GCC_MDSS_BYTE1_CLK			177
+#define GCC_MDSS_ESC1_CLK			178
+#define GCC_MDSS_PCLK1_CLK			179
+#define GCC_OXILI_AON_CLK			180
+#define GCC_OXILI_TIMER_CLK			181
 
 /* GCC block resets */
 #define GCC_CAMSS_MICRO_BCR			0
@@ -187,5 +203,6 @@
 #define VENUS_GDSC				5
 #define VFE0_GDSC				6
 #define VFE1_GDSC				7
+#define OXILI_CX_GDSC				8
 
 #endif

-- 
2.48.1


