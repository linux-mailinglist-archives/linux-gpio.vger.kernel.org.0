Return-Path: <linux-gpio+bounces-590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC597FBE34
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 16:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B6E81C20DD5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693411E48B;
	Tue, 28 Nov 2023 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dkbEz2Xl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21A010DF;
	Tue, 28 Nov 2023 07:35:50 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC9A4FF809;
	Tue, 28 Nov 2023 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701185749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AK7buiuy0q5EunPjqa6ZrKOj1AxDsj+flUHv5iXiG+8=;
	b=dkbEz2Xlnwkggz7DP873fWB6cd5xhXD1PI85tlh6MLqoXIgtmLm8rSw51HUJb2VsTA2BXu
	YCJ2uhrPEszpFKe8GKZ7vQCtyiY9eIFTtI0uj+QwgJ5w92IEdWpRxzkXaRaATnTSCWtOZw
	XITvo/fEo0dsnPlCggGr725hLIKoXAGXRnAy2ZaoyrsY0GhEtJXK9U0/fietxDaa4aMZNY
	zxkC/QrT2WgJSNz+KZDkmzB1hlA3Jg3tWpRjLXtGStP/2Lix5Up1vYK3PfLXk1zCeXiMkn
	TA5IMH3mYFwy953jzdwfEcvO+NWMhxYcgj/s9nfBxZ2uDQkFfttmru/ixt6bBA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 28 Nov 2023 16:35:01 +0100
Subject: [PATCH 3/3] arm64: dts: ti: k3-j7200: use ti,j7200-padconf
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-j7200-pinctrl-s2r-v1-3-704e7dc24460@bootlin.com>
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
In-Reply-To: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

For suspend to ram on j7200, use ti,j7200-padconf compatible to save and
restore pinctrl contexts.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi       |  8 ++++----
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
index 1ea809e41500..709081cd1e7f 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
@@ -395,7 +395,7 @@ cpts@3d000 {
 
 	/* TIMERIO pad input CTRLMMR_TIMER*_CTRL registers */
 	main_timerio_input: pinctrl@104200 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x0 0x104200 0x0 0x50>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
@@ -404,7 +404,7 @@ main_timerio_input: pinctrl@104200 {
 
 	/* TIMERIO pad output CTCTRLMMR_TIMERIO*_CTRL registers */
 	main_timerio_output: pinctrl@104280 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x0 0x104280 0x0 0x20>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
@@ -412,7 +412,7 @@ main_timerio_output: pinctrl@104280 {
 	};
 
 	main_pmx0: pinctrl@11c000 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x11c000 0x00 0x10c>;
 		#pinctrl-cells = <1>;
@@ -421,7 +421,7 @@ main_pmx0: pinctrl@11c000 {
 	};
 
 	main_pmx1: pinctrl@11c11c {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x11c11c 0x00 0xc>;
 		#pinctrl-cells = <1>;
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
index 3fc588b848c6..467970fab3a0 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
@@ -185,7 +185,7 @@ chipid@43000014 {
 
 	/* MCU_TIMERIO pad input CTRLMMR_MCU_TIMER*_CTRL registers */
 	mcu_timerio_input: pinctrl@40f04200 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x0 0x40f04200 0x0 0x28>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
@@ -195,7 +195,7 @@ mcu_timerio_input: pinctrl@40f04200 {
 
 	/* MCU_TIMERIO pad output CTRLMMR_MCU_TIMERIO*_CTRL registers */
 	mcu_timerio_output: pinctrl@40f04280 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		reg = <0x0 0x40f04280 0x0 0x28>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
@@ -204,7 +204,7 @@ mcu_timerio_output: pinctrl@40f04280 {
 	};
 
 	wkup_pmx0: pinctrl@4301c000 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x4301c000 0x00 0x34>;
 		#pinctrl-cells = <1>;
@@ -213,7 +213,7 @@ wkup_pmx0: pinctrl@4301c000 {
 	};
 
 	wkup_pmx1: pinctrl@4301c038 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x4301c038 0x00 0x8>;
 		#pinctrl-cells = <1>;
@@ -222,7 +222,7 @@ wkup_pmx1: pinctrl@4301c038 {
 	};
 
 	wkup_pmx2: pinctrl@4301c068 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x4301c068 0x00 0xec>;
 		#pinctrl-cells = <1>;
@@ -231,7 +231,7 @@ wkup_pmx2: pinctrl@4301c068 {
 	};
 
 	wkup_pmx3: pinctrl@4301c174 {
-		compatible = "pinctrl-single";
+		compatible = "ti,j7200-padconf", "pinctrl-single";
 		/* Proxy 0 addressing */
 		reg = <0x00 0x4301c174 0x00 0x20>;
 		#pinctrl-cells = <1>;

-- 
2.39.2


