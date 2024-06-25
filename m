Return-Path: <linux-gpio+bounces-7666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 261AA915DAB
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 06:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3214283915
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 04:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB38A13C832;
	Tue, 25 Jun 2024 04:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JDpIW82A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EC213C691;
	Tue, 25 Jun 2024 04:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719290185; cv=none; b=PSiclxilh7QDHhW/G9oSRbVonzYW/n3owPJggau0QsB6RXBrHY0k9bFAnWQTLQsrpkEKPivkWd2XZoGXKD5HwLAvcUCWs3oavCBtXIqbUE+OkGJv+ODEf7i5f6VcO6Cds3xQPmIbhtcZsFiYz7II19zoAsbSFCJEMPn3VCZj4fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719290185; c=relaxed/simple;
	bh=vflnbH7npqoOpXbEC4oZYpiOh7nINA5cDaOQcY0TZeY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CkvtRHY0/SFOdmtksN2NgNHzYN05SJY8DDdjdKqFyT+OPkGGlle9mSf5ePFR/ZjN6rYkf29Q+I1GaAXqxJIygThk4W59Ore0e8I47pi6tZwqdx8o4xAPjFMp8rxqD9R9O5YcSQ7TgVBhlUQau+/4VPtuYDm5NSKcJscd4OOAzOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=JDpIW82A; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719290183; x=1750826183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vflnbH7npqoOpXbEC4oZYpiOh7nINA5cDaOQcY0TZeY=;
  b=JDpIW82A2mwaXnvG898W9n6sNvITtyxbSsdxZrDCUYkkeKPSbJAXgP1U
   U22gcMdumvq1NZCV5L/9vBBCJ6w5HO+JCzneJCOG6Rise8YhuzN+Y8hKy
   IIJm8yqhTePBfwgCU4jm3QrmcaXEj9oURyEYEw6xQF9zUA77SDSdo/6Oy
   cX9EEgGzyDinfkrmjY+n04OMEeyuSL96AWM/tG5phz3APhF+cHFwJZaEz
   1kHY8TV9sdvH9eVK89AtJcMIiW4Dp4M945cuTnb63YYhZK3Sii2pGHY3P
   ErWiODzkiz6iZktRzCJcZdTZrxo4foEnaMpTBtmlvD6rKjy+f7ocf/DTu
   Q==;
X-CSE-ConnectionGUID: 6lRzh98bSmSADYiwzrcknQ==
X-CSE-MsgGUID: VtD/iL2hRlmaXygdQIntrA==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="28429162"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 21:36:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 21:35:46 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Jun 2024 21:35:38 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<durai.manickamkr@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 2/5] ARM: dts: microchip: Remove additional compatible string from PIO3 pinctrl nodes
Date: Tue, 25 Jun 2024 10:05:22 +0530
Message-ID: <20240625043525.279711-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625043525.279711-1-manikandan.m@microchip.com>
References: <20240625043525.279711-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The driver data specific to each pinctrl GPIO bank compatible nodes are not
the same and declaring additional compatible string as fallback has no
specific purpose, hence, removing the additional compatible string from the
pinctrl nodes in DT to comply with atmel,at91-pinctrl.txt documentation.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi | 2 +-
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi  | 2 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi     | 2 +-
 arch/arm/boot/dts/microchip/sama5d3.dtsi     | 2 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
index 9aa22195051d..844bd50943fc 100644
--- a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
@@ -226,7 +226,7 @@ dma: dma-controller@ffffec00 {
 			pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinctrl", "simple-mfd";
+				compatible = "atmel,at91sam9x5-pinctrl", "simple-mfd";
 				ranges = <0xfffff400 0xfffff400 0x800>;
 
 				atmel,mux-mask = <
diff --git a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
index d41d7c844200..27c1f2861cc3 100644
--- a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
@@ -202,7 +202,7 @@ dma1: dma-controller@ffffee00 {
 			pinctrl: pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinctrl", "simple-mfd";
+				compatible = "atmel,at91sam9x5-pinctrl", "simple-mfd";
 				ranges = <0xfffff400 0xfffff400 0x800>;
 
 				/* shared pinctrl settings */
diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index 4e71ae63edf1..797855e78058 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -1223,7 +1223,7 @@ AT91_XDMAC_DT_PERID(28))>,
 			pinctrl: pinctrl@fffff400 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "microchip,sam9x60-pinctrl", "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinctrl", "simple-mfd";
+				compatible = "microchip,sam9x60-pinctrl", "simple-mfd";
 				ranges = <0xfffff400 0xfffff400 0x800>;
 
 				/* mux-mask corresponding to sam9x60 SoC in TFBGA228L package */
diff --git a/arch/arm/boot/dts/microchip/sama5d3.dtsi b/arch/arm/boot/dts/microchip/sama5d3.dtsi
index f1614dcd7d28..39865133aa56 100644
--- a/arch/arm/boot/dts/microchip/sama5d3.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3.dtsi
@@ -493,7 +493,7 @@ aic: interrupt-controller@fffff000 {
 			pinctrl: pinctrl@fffff200 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,sama5d3-pinctrl", "atmel,at91sam9x5-pinctrl", "simple-mfd";
+				compatible = "atmel,sama5d3-pinctrl", "simple-mfd";
 				ranges = <0xfffff200 0xfffff200 0xa00>;
 				atmel,mux-mask = <
 					/*   A          B          C  */
diff --git a/arch/arm/boot/dts/microchip/sama5d4.dtsi b/arch/arm/boot/dts/microchip/sama5d4.dtsi
index 69dd4e7b4c14..b253ba33fc38 100644
--- a/arch/arm/boot/dts/microchip/sama5d4.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d4.dtsi
@@ -791,7 +791,7 @@ dbgu: serial@fc069000 {
 			pinctrl: pinctrl@fc06a000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
-				compatible = "atmel,sama5d3-pinctrl", "atmel,at91sam9x5-pinctrl", "simple-mfd";
+				compatible = "atmel,sama5d3-pinctrl", "simple-mfd";
 				ranges = <0xfc068000 0xfc068000 0x100
 					  0xfc06a000 0xfc06a000 0x4000>;
 				/* WARNING: revisit as pin spec has changed */
-- 
2.25.1


