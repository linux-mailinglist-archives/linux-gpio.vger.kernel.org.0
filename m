Return-Path: <linux-gpio+bounces-25227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CE4B3CFED
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 00:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE59B7AA4E7
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 22:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6A925CC74;
	Sat, 30 Aug 2025 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="We2pdkut";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="vRSfIWUQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE11F91C8;
	Sat, 30 Aug 2025 22:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756593624; cv=none; b=ezrUDXqgwg8U1BZp66MXEB5Vzez8XJ0JwFVGizTZjK8g9ZyzlfC8OovwvRbxow+BFf8bPDEVFlHHZnEIlIlpEsYG0YE+DeLJVYvW8b9KgK1YihRmSc99t6v5ruB+ByWoLbta8abcMGWlcxMvWoEpgvnShg8fvt/kPJQe+wRr+xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756593624; c=relaxed/simple;
	bh=wtKe9H6U+LhS2f603AlELwNS+homIUhNUwT6Z3ZM8hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IijS5l/vzVq8uRpvFfx26Om9jX/od7S+6IdQhbccQdYFCHym7vCIxUDqhOaNTZXKJReBUs/PR37ExpbAqRH802oIqgtB4w9O4nOieNEYucR2g7dpNA5Jt6Li2800/GAGle12/mXJW4fb9RkI/E8z1hpIjwHXrQSTbmYmJEXvaBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=We2pdkut; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=vRSfIWUQ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756593502; bh=75jbWC6rzZi0qzMwWHXrcn6
	GuZQp+Mi+3zTPjxiaEug=; b=We2pdkutSDpgFO7ThJOWkr3Xh14gRYQXsBK0m1jvmWS9dwQ/1Q
	5ZakAQoratAmfIYsjadVJ4RTLt9onK0FMmzWV2yVCAss9bYLseeEg1IvtBZVJJ4pjCDZnkwp7Ry
	fz3oKuQSPtepCSY2UuEQ20Ib+Vox5gSnrFvRoUesfTMHWfcZqyLREjYttozsXknjTfwPRlNP9gw
	R1R31qmsx74qmFXkR1/mkonqm1xRyaEA7Ly59HLAI3mSt+7SQlcC2HeYC8ODYNPprx6i2+agdFA
	Dv/U2xoiChdoaxVqhq8wmunHVhg7VxnVI0qDJnEHlh1PeGRVCBduF8BMwANf4qcYWXg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756593502; bh=75jbWC6rzZi0qzMwWHXrcn6
	GuZQp+Mi+3zTPjxiaEug=; b=vRSfIWUQfdh4cTR5f/jxKink47sa7Uyi8W49AjGwzAoy8aqGO2
	3INo66qUtCJKVjqCAPjYpQ+VqmxCg6ApFOCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 31 Aug 2025 00:38:13 +0200
Subject: [PATCH v7 1/6] dt-bindings: clock: qcom: Add MSM8937 Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250831-msm8937-v7-1-232a9fb19ab7@mainlining.org>
References: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
In-Reply-To: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756593498; l=3026;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=wtKe9H6U+LhS2f603AlELwNS+homIUhNUwT6Z3ZM8hU=;
 b=MtLbUHknAvcy+vFuA6otWwb8o7X459E/zexNKP9F1CpXCqjsXcP7H3YKb2xpJPPv6Aq+6rMFS
 9gWqqueSuejCiusUz0FBHkAivQa2txPUkZiP0DZG2aCHu9AoIopaU2s
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add device tree bindings for the global clock controller on Qualcomm
MSM8937 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../devicetree/bindings/clock/qcom,gcc-msm8953.yaml   | 11 ++++++++---
 include/dt-bindings/clock/qcom,gcc-msm8917.h          | 19 +++++++++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index fe1f5f3ed992453a347062a556b1ddb2a011db6f..f2e37f439d28b3ec066f407927955b3b82b5c10a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -9,16 +9,21 @@ title: Qualcomm Global Clock & Reset Controller on MSM8953
 maintainers:
   - Adam Skladowski <a_skl39@protonmail.com>
   - Sireesh Kodali <sireeshkodali@protonmail.com>
+  - Barnabas Czeman <barnabas.czeman@mainlining.org>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on MSM8953.
+  domains on MSM8937 or MSM8953.
 
-  See also: include/dt-bindings/clock/qcom,gcc-msm8953.h
+  See also::
+    include/dt-bindings/clock/qcom,gcc-msm8917.h
+    include/dt-bindings/clock/qcom,gcc-msm8953.h
 
 properties:
   compatible:
-    const: qcom,gcc-msm8953
+    enum:
+      - qcom,gcc-msm8937
+      - qcom,gcc-msm8953
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bindings/clock/qcom,gcc-msm8917.h
index 4b421e7414b50bef2e2400f868ae5b7212a427bb..4e3897b3669d9149b61a6feec31ca35e2058dcb9 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -170,6 +170,23 @@
 #define VFE1_CLK_SRC				163
 #define VSYNC_CLK_SRC				164
 #define GPLL0_SLEEP_CLK_SRC			165
+/* Addtional MSM8937-specific clocks */
+#define MSM8937_BLSP1_QUP1_I2C_APPS_CLK_SRC		166
+#define MSM8937_BLSP1_QUP1_SPI_APPS_CLK_SRC		167
+#define MSM8937_BLSP2_QUP4_I2C_APPS_CLK_SRC		168
+#define MSM8937_BLSP2_QUP4_SPI_APPS_CLK_SRC		169
+#define MSM8937_BYTE1_CLK_SRC				170
+#define MSM8937_ESC1_CLK_SRC				171
+#define MSM8937_PCLK1_CLK_SRC				172
+#define MSM8937_GCC_BLSP1_QUP1_I2C_APPS_CLK		173
+#define MSM8937_GCC_BLSP1_QUP1_SPI_APPS_CLK		174
+#define MSM8937_GCC_BLSP2_QUP4_I2C_APPS_CLK		175
+#define MSM8937_GCC_BLSP2_QUP4_SPI_APPS_CLK		176
+#define MSM8937_GCC_MDSS_BYTE1_CLK			177
+#define MSM8937_GCC_MDSS_ESC1_CLK			178
+#define MSM8937_GCC_MDSS_PCLK1_CLK			179
+#define MSM8937_GCC_OXILI_AON_CLK			180
+#define MSM8937_GCC_OXILI_TIMER_CLK			181
 
 /* GCC block resets */
 #define GCC_CAMSS_MICRO_BCR			0
@@ -187,5 +204,7 @@
 #define VENUS_GDSC				5
 #define VFE0_GDSC				6
 #define VFE1_GDSC				7
+/* Additional MSM8937-specific GDSCs */
+#define MSM8937_OXILI_CX_GDSC				8
 
 #endif

-- 
2.51.0


