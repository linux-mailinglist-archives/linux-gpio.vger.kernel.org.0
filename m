Return-Path: <linux-gpio+bounces-7668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F8915DB1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 06:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56323B20DAF
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 04:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FA113D24C;
	Tue, 25 Jun 2024 04:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="a/94KkEx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC413C823;
	Tue, 25 Jun 2024 04:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719290196; cv=none; b=oEvg09M0bkZQz4kb5+2Y+SiH74vt1NMRbOGYqixo2rNUmJ/vyawX9vT7ogap5M9IR+R3Vrt8aTIDIDHj+qEar/R62p8ICO2yo9OUf17bbgmIusVvTWOWxvSUN0h55vh65bqi10JsOLCiXwo/oYnHHuKax7z7sUX/KdvuAj7ykew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719290196; c=relaxed/simple;
	bh=l+dYmLiqhuozHzyRlaJiji1zGldmLiP1ian4oklPuSk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JDVm6P39/6mUgcqzmFm+v+/7Jb2J6a7o1ON2tvzGnLbXjScAIG63jgIkErVUfsuI2Nb+E0Nj3X5/Bv8QIXMPdyNVTaAArd6fZqp3iPlgOZa50s0apX15BeGO4R+Bwv8TUxxjEBZR9MyJ9hqJG42v8idZGnt+YmLMLU2hk54A1vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=a/94KkEx; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719290196; x=1750826196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l+dYmLiqhuozHzyRlaJiji1zGldmLiP1ian4oklPuSk=;
  b=a/94KkEx0r3eqlcH2LCyGpNMMc++H866k0j0f3/gUAO1ruIigZmlRbUS
   pAMWXpyStK6qdaZUZPj9KOzBePwgFc7G8muV3PjaKJK+ITvSTrw/XBv9o
   +Oij9T3aYON2QwMU5yAkgmKKPjzoPu5zpbc9jQpfGk4FWoZyyqSZtFlAO
   ney45zyZxpHLxGZFtXByGCbUukLude45At6/GsrjJUJ4/v2VDZT7AvJu9
   LD3B0FuSg+WoFRsu9kUk47vI3KOgCZfCQz9ljzqjGAaAWY/ZUiFF6kYr9
   7/66LXCdZrzqv5Sqo11Ts/bYvyeMRQyRzOp4xjYgGYtb34FNLQSya04Sx
   Q==;
X-CSE-ConnectionGUID: /xqBe/RbRRKZkasvmOnxAQ==
X-CSE-MsgGUID: ARn+En3KSLG2h99N+knsKg==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="259328234"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 21:36:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 21:35:54 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Jun 2024 21:35:47 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<durai.manickamkr@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 3/5] ARM: dts: microchip: sam9x60: Remove additional compatible string from GPIO node
Date: Tue, 25 Jun 2024 10:05:23 +0530
Message-ID: <20240625043525.279711-4-manikandan.m@microchip.com>
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
specific purpose, hence, removing the "atmel,at91sam9x5-gpio" compatible from
sam9x60 SoC DT.

Note: The at91 pinctrl driver uses "atmel,at91rm9200-gpio" compatible string
to find the number of active GPIO banks and identify the pinmux nodes.It
should used as a constant across all DT for GPIO node banks that uses PIO3
based pinctrl driver

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index 797855e78058..db2ddff872d2 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -1236,7 +1236,7 @@ pinctrl: pinctrl@fffff400 {
 						 >;
 
 				pioA: gpio@fffff400 {
-					compatible = "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					compatible = "microchip,sam9x60-gpio", "atmel,at91rm9200-gpio";
 					reg = <0xfffff400 0x200>;
 					interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
 					#gpio-cells = <2>;
@@ -1247,7 +1247,7 @@ pioA: gpio@fffff400 {
 				};
 
 				pioB: gpio@fffff600 {
-					compatible = "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					compatible = "microchip,sam9x60-gpio", "atmel,at91rm9200-gpio";
 					reg = <0xfffff600 0x200>;
 					interrupts = <3 IRQ_TYPE_LEVEL_HIGH 1>;
 					#gpio-cells = <2>;
@@ -1259,7 +1259,7 @@ pioB: gpio@fffff600 {
 				};
 
 				pioC: gpio@fffff800 {
-					compatible = "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					compatible = "microchip,sam9x60-gpio", "atmel,at91rm9200-gpio";
 					reg = <0xfffff800 0x200>;
 					interrupts = <4 IRQ_TYPE_LEVEL_HIGH 1>;
 					#gpio-cells = <2>;
@@ -1270,7 +1270,7 @@ pioC: gpio@fffff800 {
 				};
 
 				pioD: gpio@fffffa00 {
-					compatible = "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					compatible = "microchip,sam9x60-gpio", "atmel,at91rm9200-gpio";
 					reg = <0xfffffa00 0x200>;
 					interrupts = <44 IRQ_TYPE_LEVEL_HIGH 1>;
 					#gpio-cells = <2>;
-- 
2.25.1


