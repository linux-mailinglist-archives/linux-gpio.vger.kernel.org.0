Return-Path: <linux-gpio+bounces-19107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D05A95731
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Apr 2025 22:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18DD7164E51
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Apr 2025 20:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4DA1F09A3;
	Mon, 21 Apr 2025 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RJWme6g/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E81372;
	Mon, 21 Apr 2025 20:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745266714; cv=none; b=nCNnsJouZrdyXKZgUPx8z23pX7iDICJ5cKqzm6dKPaeiW6aNKeRNjona4ymZlPtSQ+eQtAdskXBfL0paZ7B58apYC2M1Ev8ovFTgiljFn5xSZKe7wq3uvxxz3bWRenvGpdLHXeejetDrLVzKLrVfgOeE778mbXLgrKnJw9siG2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745266714; c=relaxed/simple;
	bh=xPcOTaF34k1pSWgeGCmDQmpR+i2HKeWikVYCxBeiHb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d1Av9XuZiQOmaNWr8YITheG90Mge2iNDtmpPEfpgFnCDKJJSRByjFtO6YoVGlZe/fJEz6OsM1zEe/YD0ZIUT0iiv7JswK0oTerfc0mnQjyqo2b0spFO2A1votLIYejY03zujzTrAy4ZzRVWY5+nDePCtB2Vbu4utaM4dwKuUqXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RJWme6g/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C2769.nat.pool.telekom.hu [37.76.39.105])
	by mail.mainlining.org (Postfix) with ESMTPSA id 4CCEABBAD3;
	Mon, 21 Apr 2025 20:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745266710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9vn0oT4MCTxsGpfl3A/lv7Lt2A9dT6CTXieIeGzSeQ=;
	b=RJWme6g/zf+O5vZH6ynrdl0tln/YCurm1DyQ93WLotVP78pgc5+7dru6wpueQ/+x27Dgw5
	zuyf0nUj+31Do1A0Vtz+V//DNttCukvWw3RS5Vsj0K8QtRBeYykNe96ltCafPK3o27C09m
	eDHX7h2KNZ7+H/k0ygjhcPcxe6DQU8aqdc7kkWbkPzM0+R+rM4oJHtRYiC+Ue89ojQPMHI
	U8VC9JB0cmTmgu8ne/8hpsRU5LdnVRkul4JZwSZ7cVTJTYtgUuKlfIwIotbC/szKKcKZXC
	8z529kvZAP5fdIsYuwAWS1DwapXEj8WXuXyOiFAY3LetPRuXN/72fHQ5PYO1tw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 21 Apr 2025 22:18:23 +0200
Subject: [PATCH v5 1/5] dt-bindings: clock: qcom: Add MSM8937 Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-msm8937-v5-1-bf9879ef14d9@mainlining.org>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
In-Reply-To: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745266705; l=2959;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=xPcOTaF34k1pSWgeGCmDQmpR+i2HKeWikVYCxBeiHb8=;
 b=SjAi9QDbtjlkdoKqhakTIU42hQ/GQhgmISvj75YPEL0Ak6lKlPfO/+EuZUKYe+AQem22ABxv7
 gPH1I0jLMABBrMffM+vubSWHhfUQtTvHCBS2wrrOumpl4CtDBXeRoee
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add device tree bindings for the global clock controller on Qualcomm
MSM8937 platform.

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
2.49.0


