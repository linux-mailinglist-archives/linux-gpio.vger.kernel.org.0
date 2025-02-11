Return-Path: <linux-gpio+bounces-15775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61943A318C7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 23:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 091B3164CC2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 22:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB9126A0E7;
	Tue, 11 Feb 2025 22:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lkDcU1R1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F6326A08B;
	Tue, 11 Feb 2025 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313499; cv=none; b=XvmABXRMbnbk1CbSAuV979E64BQ7++KPTFjpsoi7qNMuxXOjcjb2SnpbB1F01XKGiaqVVYyPwywmtrTwr0TlZpScKwpar1zLD5NBfj/KgJNwBfv5W5nr0XrscUVgWCZ6WiPhFB722JSQt15jBM6SHKpk6cMLstBxCENBBoS8aIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313499; c=relaxed/simple;
	bh=kTovJs3a0UNCe/c9EpjLatpkIpZCGVIT/AOKQ3UWCOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnxYud/auEWOsGNge3yhCRvpSCWWEPogv+D8n8pAyScRySGHZqqkwVxgE7OZwSuFABaYRvG/6b0sXAc54jVPRjnb+hCAo2/FNOJ/9aU2WYOKxSMMNpA51K5KrUsZk+6hnndrKSrJ98Ks24tbVjLWcAXkBQsrqZ1RO/s4jHUucmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lkDcU1R1; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C21CD.nat.pool.telekom.hu [37.76.33.205])
	by mail.mainlining.org (Postfix) with ESMTPSA id 82AE1E453B;
	Tue, 11 Feb 2025 22:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739313489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8/ajVjMHyCO8T9Hq+plvxZcT5GFd9UYD9UL7qcPwfY=;
	b=lkDcU1R1RPH4LwvEF6jTh8oYqu7Qyz6OGPXB++1vsuPu5EYmWq4Yfx8u4B3PnNYpwOy0HW
	yia94aZPYIexLjMdEumPwiwf7mn5/EHvKI/DnS5v3If0JByPC4rbPKBZX85Uu8xksKSOEa
	eZTxePgiL3XHHe2McCjYvGpFbdDO4ujjsyA0fHZ/YiYLydA7Pk/Bqpw/EwKZl3wYN7O2kh
	xAqqF3eMi7OUROinXNzaclhgOi3ekZDDLvz7cpe4UXoxFcjtkITGm8zVkPU/4OUA52SwCV
	A5B+p7+pTcOm22ZJ+Xxsb2JDCXV+8/fbmgmCoFAP0yKYNaLaaDrUy2lojUGYBQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 11 Feb 2025 23:37:46 +0100
Subject: [PATCH 02/10] dt-bindings: clock: Add MSM8937 Global Clock
 controller compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250211-msm8937-v1-2-7d27ed67f708@mainlining.org>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739313484; l=3960;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=tMkGJGxDIeGByyVrfX+6woLjEpGaWkEndc230QD+arY=;
 b=zMBOHa8FKmVRlT19Kzal0uTME3fxFcs0Xg3Bq2yUqSMhiKgHfDxxV+glaclJ8qdY3h4GFDSei
 tyOlHv2S2TSDagd6GEL8gaPRr4Y7mRoKCxvM6QjL5USij3QwnsnyGM4
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Daniil Titov <daniilt971@gmail.com>

Document the qcom,gcc-msm8937 compatible and add new input clocks.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/clock/qcom,gcc-msm8917.yaml           | 23 ++++++++++++++++++----
 include/dt-bindings/clock/qcom,gcc-msm8917.h       | 17 ++++++++++++++++
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yaml
index 6e567b2a5153af9bb32958154633d6da5fd1cd50..689c5760d9cd1fc96d97e5705cd1fcd48324433a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8917.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on MSM8917 and QM215
+title: Qualcomm Global Clock & Reset Controller on MSM8917, MSM8937 and QM215
 
 maintainers:
   - Otto Pflüger <otto.pflueger@abscue.de>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on MSM8917 or QM215.
+  domains on MSM8917, MSM8937 or QM215.
 
   See also:: include/dt-bindings/clock/qcom,gcc-msm8917.h
 
@@ -20,6 +20,7 @@ properties:
     enum:
       - qcom,gcc-msm8917
       - qcom,gcc-qm215
+      - qcom,gcc-msm8937
 
   clocks:
     items:
@@ -27,6 +28,8 @@ properties:
       - description: Sleep clock source
       - description: DSI phy instance 0 dsi clock
       - description: DSI phy instance 0 byte clock
+      - description: DSI phy instance 1 dsi clock
+      - description: DSI phy instance 1 byte clock
 
   clock-names:
     items:
@@ -34,6 +37,8 @@ properties:
       - const: sleep_clk
       - const: dsi0pll
       - const: dsi0pllbyte
+      - const: dsi1pll
+      - const: dsi1pllbyte
 
 required:
   - compatible
@@ -53,7 +58,17 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-      clocks = <&xo_board>, <&sleep_clk>, <&dsi0_phy 1>, <&dsi0_phy 0>;
-      clock-names = "xo", "sleep_clk", "dsi0pll", "dsi0pllbyte";
+      clocks = <&xo_board>,
+               <&sleep_clk>,
+               <&dsi0_phy 1>,
+               <&dsi0_phy 0>,
+               <&dsi1_phy 1>,
+               <&dsi1_phy 0>;
+      clock-names = "xo",
+                    "sleep",
+                    "dsi0pll",
+                    "dsi0pllbyte",
+                    "dsi1pll",
+                    "dsi1pllbyte";
     };
 ...
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


