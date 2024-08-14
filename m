Return-Path: <linux-gpio+bounces-8745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C899951446
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 08:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA100282307
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 06:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9D113C67E;
	Wed, 14 Aug 2024 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kAPioUMK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FE813AA27;
	Wed, 14 Aug 2024 06:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723616039; cv=none; b=UBB8pq+zfMEX3YPKwTvByA5S7VeeOl5LkOj/hRK9va0UDSQ0fp/Vzo2n7eYpwgCLHgPGPnxJcF5f7Xxkp0r5ZljgAWZXzmPzZuYIvfimxPTZ5VgL64QGExoQPXbKClOZS0kmyWh/EIRIzVErnSgVTqQmkT/KzZNghUcFg+O+qX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723616039; c=relaxed/simple;
	bh=7/oMBMe3WJm2lH8hOUkEMplXazC0q29ndkO8VzocJz4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OhSVqxFCGOSP+GYeLR6cIz095TpD8FePwM69BplIqX14aO3/FljLwTW/vcWhW+25LvGpjA7EbDIlLf61CAl/rkT1GIm/GHOchBbbWXHIZVYYA2hPEst2L3y69LiQSN2LLCjMT+s2K1BknYR9XgVgzZD2Mg5+A6dxXgHqU7w0EkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=kAPioUMK; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1723616037; x=1755152037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7/oMBMe3WJm2lH8hOUkEMplXazC0q29ndkO8VzocJz4=;
  b=kAPioUMK+EKjpRJ+7JDvMFeVxQH5fS+ExC72COse7k+Jh2hiTXh/REeO
   tgjoupPv1pYOqkJg/NfkNnraRbiostRpWzbuD9yaZHVlaTJdoRgd4qDeH
   8tE/gEKd8VZsB/MDlzCs4cRmGBgqDw7TLpnZ8P23oesjdgwuNDtEf2jwj
   bHipB8WsF98g8/yeuZvAY7dpoVZg36nOZ56y7UXeaHayKKxyJjL/iKFMo
   h9Qo4Y2Fqacd8yb76B77EMYpo4Sl3ZuWEqhAF3ZQw6IqwTLudVTkM6M9C
   cafWrPi2S2TyN13lUsLnD/ISwbBf1uc07+ae2/xW8YkEvKyubjVQ2objm
   A==;
X-CSE-ConnectionGUID: NkQy/Ju3T0eRCCfLlaY5PA==
X-CSE-MsgGUID: XmBIjkZjQvWKSzfSle4+yQ==
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="33398218"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2024 23:13:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Aug 2024 23:13:39 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 13 Aug 2024 23:13:35 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v4 3/4] ARM: dts: microchip: sam9x60: Remove additional compatible string from GPIO node
Date: Wed, 14 Aug 2024 11:43:14 +0530
Message-ID: <20240814061315.112564-4-manikandan.m@microchip.com>
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
specific purpose, hence, removing the "atmel,at91sam9x5-gpio" compatible from
sam9x60 SoC DT.

Note: The at91 pinctrl driver uses "atmel,at91rm9200-gpio" compatible string
to find the number of active GPIO banks and identify the pinmux nodes.It
should used as a constant across all DT for GPIO node banks that uses PIO3
based pinctrl driver

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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


