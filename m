Return-Path: <linux-gpio+bounces-8742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B2395143D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 08:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EADE2821FE
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 06:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2861577F11;
	Wed, 14 Aug 2024 06:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="FXy6JkN7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78481746E;
	Wed, 14 Aug 2024 06:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723616027; cv=none; b=q4LRMZV/uKJ3XezNDmBM8Svc01PqB/ikMrMBSzAJnAbLDRRpmlvwJ3ZOQFRPo/QvVHL2RzXQhjtfhaDnTKPOd/1Rx1Ej0gYbZWtu74b4x6uWmO4eZzGhBNirWhK6pi9SpdDxBQJTEKBlmDUf5FIEEkBb63otjY9NFAsxnFNFqzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723616027; c=relaxed/simple;
	bh=MFc07a7qDFLWvBfKP3p3SXSxGEayoTWHYZRN+ciE6XE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQU6pGK8u/yZOH7hOSkGqIKcnEAtdENjaw4HyJvXAaMQRpOJOfErxguS2EWnODIU+3vYrk7WpuDBX9guy4et4//XfAVN68p+nlWDeXouWwo8ZGLE/tv0j3JQcxNo7vBTMwRIG7pquAW+vXphTvNxQtceNDpMCSc/L4mhYu+BCOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=FXy6JkN7; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1723616025; x=1755152025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MFc07a7qDFLWvBfKP3p3SXSxGEayoTWHYZRN+ciE6XE=;
  b=FXy6JkN78Ccyi6qs8fPShwLUNGd5x06bJbjucaBD626P4kdC5woo9Xsc
   evDg7IRTiMJwl0uXsLESlSs+vu5dH4ESHIWCUbumJV62qAankK6qzd0tK
   MFY3gZB+vheSEa4Op75/sSGByVTOYNKY0GGygNZ18bDgMq2BDWTgRRcfx
   a72uRIJORvt4oMPPf0Zk7YZ1gj8LqfE7dVqQkGbsV3usGzNwJqPBRyU3q
   d06Bzkbdcn59txnfzQffj2O9cEdPSYf6p6Lwd4zn8ZXu39YoT7YWwDlGM
   WFqDGRUp4PisWWK9XWTHU0UO/Ius6g2UlorHpT6A9rmFgqyJT9dJo9u48
   g==;
X-CSE-ConnectionGUID: /IfnQ+z+Sza5leyL0Yr/gg==
X-CSE-MsgGUID: /9kTFHpASuCu6CxRDQnusA==
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="33398206"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2024 23:13:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Aug 2024 23:13:34 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 13 Aug 2024 23:13:29 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v4 2/4] ARM: dts: microchip: Remove additional compatible string from PIO3 pinctrl nodes
Date: Wed, 14 Aug 2024 11:43:13 +0530
Message-ID: <20240814061315.112564-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814061315.112564-1-manikandan.m@microchip.com>
References: <20240814061315.112564-1-manikandan.m@microchip.com>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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


