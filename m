Return-Path: <linux-gpio+bounces-7641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FF59146FE
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 12:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CDAF1F21468
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 10:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE43136E17;
	Mon, 24 Jun 2024 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CXnYMfoK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0861136649;
	Mon, 24 Jun 2024 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223534; cv=none; b=dK8dkzsm0nTQEXtGKIZ9hVLOv1m/YPC/Fy1RM76Y0Iw5ojGxREyih59pHzxsMTzDiC5KLBwTpVIa/90RS028AW2wapvX8JGLY/AwqeKmy0awCys+HUn1b13pkUymJ7SDpoJJhFt6Cdy7qvjcX7XKmUVOmsXSz4tSAChvgjZp2Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223534; c=relaxed/simple;
	bh=NrhQe7Ne47K5jyrTaH8U/Zc5bpaLZvP3p4urJqapRuY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ca9g8GPZFdg/4VIq8etonRlnd8BqTOVP2EIrnCZ30Z0nPdUla/1b++dOQHLElMsWuYbdXdq9P2lmXv/YGlCRLUNxKZhas8fFnuSK/KZm+NyH2wPvtBS3yjCaXjx53l/R29/2werWtdVs5bDXhaT4RsCKPGb97XIdqFGqJm99riw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=CXnYMfoK; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719223532; x=1750759532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NrhQe7Ne47K5jyrTaH8U/Zc5bpaLZvP3p4urJqapRuY=;
  b=CXnYMfoK4KSwJg7GCiZthfq7TImvs2oLiqeJaAB/pdz10TaH0tLeAVjd
   OY0ubtM12AeFJzm19g71BGN9mZGpy4ZIMyQAz3W51eNpAs8/rO64ohKzE
   OCywmNhLHa7nOv+gmyAgHcBBxhk0dlVcS672gPK/MZglR2OWoKfasPKjY
   lMLYJWP1QiCimBLlm1PT0NjPA8lCWZ1WyTTXFXTM4mUGgSkavD3iH05U6
   Ce5ESou3+xbnl+JFMCZz67ApyM/5vdKRiRqadZASQxoMztlZsRRjGRb/D
   MPQF7LsQf85Vq2iK9PUZIr2atKP52dpGWrzLxw8Alj4VfgbYbJbHrnJ70
   w==;
X-CSE-ConnectionGUID: 3dTUNmvLQy2rS/y02F+uOA==
X-CSE-MsgGUID: dPUpYaAKQCKSsH/pCdMRxg==
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="259283597"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 03:05:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 03:04:55 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Jun 2024 03:04:47 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<durai.manickamkr@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>,
	<Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
	<Dharma.B@microchip.com>, <Varshini.Rajendran@microchip.com>,
	<Balakrishnan.S@microchip.com>, <Charan.Pedumuru@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>
Subject: [PATCH 1/5] ARM: dts: microchip: change to simple-mfd from simple-bus for PIO3 pinumux controller
Date: Mon, 24 Jun 2024 15:34:27 +0530
Message-ID: <20240624100431.191172-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240624100431.191172-1-manikandan.m@microchip.com>
References: <20240624100431.191172-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The pinctrl subnodes that define the pin configuration of other devices
under PIO3 pinmux controller are not simple memory mapped nodes.Ergo,
change simple-bus to simple-mfd.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/boot/dts/microchip/at91rm9200.dtsi  | 2 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi | 2 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi | 2 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi | 2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi | 2 +-
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi | 2 +-
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi  | 2 +-
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi  | 2 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi     | 2 +-
 arch/arm/boot/dts/microchip/sama5d3.dtsi     | 2 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi     | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91rm9200.dtsi b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
index 16c675e3a890..02a838541dc3 100644
--- a/arch/arm/boot/dts/microchip/at91rm9200.dtsi
+++ b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
@@ -225,7 +225,7 @@ macb0: ethernet@fffbc000 {
 			pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
 				ranges = <0xfffff400 0xfffff400 0x800>;
 
 				atmel,mux-mask = <
diff --git a/arch/arm/boot/dts/microchip/at91sam9260.dtsi b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
index e56d5546554c..0038183e9a53 100644
--- a/arch/arm/boot/dts/microchip/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
@@ -170,7 +170,7 @@ tcb1: timer@fffdc000 {
 			pinctrl: pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
 				ranges = <0xfffff400 0xfffff400 0x600>;
 
 				atmel,mux-mask = <
diff --git a/arch/arm/boot/dts/microchip/at91sam9261.dtsi b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
index 307b60658014..b57a7fd67197 100644
--- a/arch/arm/boot/dts/microchip/at91sam9261.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
@@ -317,7 +317,7 @@ dbgu: serial@fffff200 {
 			pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
 				ranges = <0xfffff400 0xfffff400 0x600>;
 
 				atmel,mux-mask =
diff --git a/arch/arm/boot/dts/microchip/at91sam9263.dtsi b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
index 75d8ff2d12c8..b95d4016ae9f 100644
--- a/arch/arm/boot/dts/microchip/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
@@ -167,7 +167,7 @@ poweroff@fffffd10 {
 			pinctrl@fffff200 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
 				ranges = <0xfffff200 0xfffff200 0xa00>;
 
 				atmel,mux-mask = <
diff --git a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
index 325c63a53118..c54eb21d5cba 100644
--- a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
@@ -190,7 +190,7 @@ dma: dma-controller@ffffec00 {
 			pinctrl@fffff200 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
 				ranges = <0xfffff200 0xfffff200 0xa00>;
 
 				atmel,mux-mask = <
diff --git a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
index 8dc04e9031a6..9aa22195051d 100644
--- a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
@@ -226,7 +226,7 @@ dma: dma-controller@ffffec00 {
 			pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinctrl", "simple-bus";
+				compatible = "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinctrl", "simple-mfd";
 				ranges = <0xfffff400 0xfffff400 0x800>;
 
 				atmel,mux-mask = <
diff --git a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
index 7436b5c862b1..1fec9fcc7cd1 100644
--- a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
@@ -339,7 +339,7 @@ dbgu: serial@fffff200 {
 			pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
 				ranges = <0xfffff400 0xfffff400 0x800>;
 
 				atmel,mux-mask =
diff --git a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
index a7456c2191fa..d41d7c844200 100644
--- a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
@@ -202,7 +202,7 @@ dma1: dma-controller@ffffee00 {
 			pinctrl: pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinctrl", "simple-bus";
+				compatible = "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinctrl", "simple-mfd";
 				ranges = <0xfffff400 0xfffff400 0x800>;
 
 				/* shared pinctrl settings */
diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index 291540e5d81e..4e71ae63edf1 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -1223,7 +1223,7 @@ AT91_XDMAC_DT_PERID(28))>,
 			pinctrl: pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "microchip,sam9x60-pinctrl", "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinctrl", "simple-bus";
+				compatible = "microchip,sam9x60-pinctrl", "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinctrl", "simple-mfd";
 				ranges = <0xfffff400 0xfffff400 0x800>;
 
 				/* mux-mask corresponding to sam9x60 SoC in TFBGA228L package */
diff --git a/arch/arm/boot/dts/microchip/sama5d3.dtsi b/arch/arm/boot/dts/microchip/sama5d3.dtsi
index d4fc0c1dfc10..f1614dcd7d28 100644
--- a/arch/arm/boot/dts/microchip/sama5d3.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3.dtsi
@@ -493,7 +493,7 @@ aic: interrupt-controller@fffff000 {
 			pinctrl: pinctrl@fffff200 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,sama5d3-pinctrl", "atmel,at91sam9x5-pinctrl", "simple-bus";
+				compatible = "atmel,sama5d3-pinctrl", "atmel,at91sam9x5-pinctrl", "simple-mfd";
 				ranges = <0xfffff200 0xfffff200 0xa00>;
 				atmel,mux-mask = <
 					/*   A          B          C  */
diff --git a/arch/arm/boot/dts/microchip/sama5d4.dtsi b/arch/arm/boot/dts/microchip/sama5d4.dtsi
index 58ceed997889..69dd4e7b4c14 100644
--- a/arch/arm/boot/dts/microchip/sama5d4.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d4.dtsi
@@ -791,7 +791,7 @@ dbgu: serial@fc069000 {
 			pinctrl: pinctrl@fc06a000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,sama5d3-pinctrl", "atmel,at91sam9x5-pinctrl", "simple-bus";
+				compatible = "atmel,sama5d3-pinctrl", "atmel,at91sam9x5-pinctrl", "simple-mfd";
 				ranges = <0xfc068000 0xfc068000 0x100
 					  0xfc06a000 0xfc06a000 0x4000>;
 				/* WARNING: revisit as pin spec has changed */
-- 
2.25.1


