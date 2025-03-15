Return-Path: <linux-gpio+bounces-17641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 834BFA62EA8
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 15:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6054D189B42C
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 14:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C452045B9;
	Sat, 15 Mar 2025 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qCyZypvF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1E2202F6D;
	Sat, 15 Mar 2025 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742050699; cv=none; b=okHIeo6nX177UHPnphapn3QtDyAS1VN1KGy5hECKB+mPCpiT/NYdlQ5ydD1XfmohNOadAGeZ9ji9YhTBrI0frGjWiUXGOClB6nNCPGMZx0lVSN697zLpKU0gsOUQLv8Wbo1BoHcad8x+s9Punc0i6HXZsfCjrFZht/bTeGqhDP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742050699; c=relaxed/simple;
	bh=Iy4LfonCZ8Bil8oPollx8SwfEi//WgGtHuyNsraSOwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHEGB4UFy5iPUXBYqYJ9skgwXqw/ldxl58u77O3rK5BTHEgUZieAQHA53MLuVdnR1RHzQgkinD5A6/fNxtzjI3y08LAnBj9n55qOpNELouwWa1jeAK3rfRtVyg++ml0MsZyaJ1kVH39MO/Gw+SVk0dv0Wi+ycNuB/XeMuvgaNbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qCyZypvF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C339A.nat.pool.telekom.hu [37.76.51.154])
	by mail.mainlining.org (Postfix) with ESMTPSA id E043DBBAF0;
	Sat, 15 Mar 2025 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1742050689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDYes/eelRNjHKCNQotm5jchwJmThV0kbYjQHGK0FXs=;
	b=qCyZypvFN2K5JHLzzUZQRpAilmObMA/ree4n0qcHuDF6G93guxeu1746gu4sIbOG4HR070
	vsG7S8L7NtfVTGJSvGI/PUkIIOGvXLsGpdjnb1be2EDtUoV1T8HtfYLDI6Xplg6qvmJcgV
	mYwbn9SAgRym9Kg8DzZ7R6ni0s+2y4DMIL9YNuTdI66mxkYp7Kaa9CFayQb/Mv5qR8ammu
	bIvgfUusIA28ThPRhpkbulAk9zgT1JkhhUCPqCKnRrsGC/A4xKae6pqO7sG/qsT4d7jW31
	dmBc28IH04QL1EBTsRgmeXQ+oTxyr56G6dG6PogBXI/ByTdJW2gGiXMSMNGmsQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 15 Mar 2025 15:57:35 +0100
Subject: [PATCH v4 1/6] dt-bindings: clock: qcom: Add MSM8937 Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250315-msm8937-v4-1-1f132e870a49@mainlining.org>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
In-Reply-To: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
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
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742050684; l=3908;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Iy4LfonCZ8Bil8oPollx8SwfEi//WgGtHuyNsraSOwI=;
 b=11bbrDv/OFBHJltDJ7vrAxMnCNKrBzLkgHaDb3i7vrqHmI4Gl7mmGmtd3TjdQr0Rrr4mr5g8M
 FYZd/mDm5B7DDmQwDQAnQtwbbGCOHksyKZDeeZyS7eIBxRr95H5iTFd
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add device tree bindings for the global clock controller on Qualcomm
MSM8937 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/clock/qcom,gcc-msm8937.yaml           | 75 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8917.h       | 17 +++++
 2 files changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3c3f6756048e195671f542b3a6cd09057558eafa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
@@ -0,0 +1,75 @@
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
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+
+    clock-controller@1800000 {
+      compatible = "qcom,gcc-msm8937";
+      reg = <0x01800000 0x80000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&dsi0_phy 1>,
+               <&dsi0_phy 0>,
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


