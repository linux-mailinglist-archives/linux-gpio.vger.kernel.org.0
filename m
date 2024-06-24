Return-Path: <linux-gpio+bounces-7642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C29BF914700
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 12:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D367283D34
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 10:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A636E137745;
	Mon, 24 Jun 2024 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xexr/Mw2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE913664A;
	Mon, 24 Jun 2024 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223535; cv=none; b=hq6fSe9wdjypaP4FBGTc6sVSetQO5FserXAX9vmdnDr5YgfAH5mKizMRSv2Ibs9rP8AURb0CB9q6Rt1DVCJA/Bp1RcYqklXASWciZwVJtM/7ZH2tur/BL1Z6DTdyoeCQdq4kfXD+KeHxif0wJoTH7thd5d3qNB+j+YIpAkWjnf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223535; c=relaxed/simple;
	bh=l+dYmLiqhuozHzyRlaJiji1zGldmLiP1ian4oklPuSk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DuTptzoVjoqqBWZWo7PlnezSvsPcm4GrtNVGLRvH7tflBbaqmKTbrDeA0aIgUUhuYpQYXgLzZ1mSxjl7r/BYn//V3K8J3ppVXiR8uiRlrUWvsnG/+vac+iCWKzJHZTfM3BwMFv7kmHLVhSE/O01T4H9CObKLDjLL8MxOhcB0DIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xexr/Mw2; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719223534; x=1750759534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l+dYmLiqhuozHzyRlaJiji1zGldmLiP1ian4oklPuSk=;
  b=xexr/Mw2+FEiLA0iaUc719R9h3ZlhOmo6NsQZt9tjPLsSAy0C5aeEEH/
   1rmdwcVS6r6veaygcjm1/XebJmoz7ibcWY/J45ODEGPHZLGZexznkNf6K
   Mhqp///yVoeUdYdnAORtZocEuwhXK/w1ekfNDLJPfjds5GL5xvJD+GJYH
   dHiiHEvLf+Q6bcvAGpUIXuICwp4qOsWB7vuT+xKjUnNBUFI2bYVN4DDDI
   61Q2QSOXKeI3Ry5K9gj97RmxzyP7hO719Bk0bdkdJUAnxy/dEN+IVA3Pn
   +E57jSjFSZSpPYIH8HJr0y+LM873OVo5ze7hhUMYaPyRxhizvUI5JTQda
   A==;
X-CSE-ConnectionGUID: 3dTUNmvLQy2rS/y02F+uOA==
X-CSE-MsgGUID: Ojkg5uFIS5K1zQl13W0uRA==
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="259283600"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 03:05:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 03:05:12 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Jun 2024 03:05:04 -0700
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
Subject: [PATCH 3/5] ARM: dts: microchip: sam9x60: Remove additional compatible string from GPIO node
Date: Mon, 24 Jun 2024 15:34:29 +0530
Message-ID: <20240624100431.191172-4-manikandan.m@microchip.com>
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


