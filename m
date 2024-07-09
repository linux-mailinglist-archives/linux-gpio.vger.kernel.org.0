Return-Path: <linux-gpio+bounces-8116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF89292B3B3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 11:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A674B22B74
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 09:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7719E156231;
	Tue,  9 Jul 2024 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RjcKIeuj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97007155305;
	Tue,  9 Jul 2024 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517082; cv=none; b=RUPPT6ng8TLghrnKvJvkI7DP1ha6jbwavnZiONJMDzj8wYyFpPlFQFj8aQTz5cGKvmJ0t5ftXNB7NRWqv+tgq43VVnbO/T6FobHWn0dShR85PJH+5XZ4xgMs8JXmCRRhL2TLl6zV57s2UNnNkyqKilklBT64hyodyLn8ZcXAEfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517082; c=relaxed/simple;
	bh=7/oMBMe3WJm2lH8hOUkEMplXazC0q29ndkO8VzocJz4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RK/dQYGDV6OyzhxZkPvZ2p4ykheo056Gi4Bri3Zh5slOWtVrsNszHHL0Bc44VYacKt4myhJewSKrkmYXF0iVJf3cy5hD6C1t2gPpzReiFiy5GA5C4q4K7tb0r6KXMsyWBT6i1JIb6uWfGOgAijhoH0SNhryFxYNyOWRY0CliphE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=RjcKIeuj; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720517081; x=1752053081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7/oMBMe3WJm2lH8hOUkEMplXazC0q29ndkO8VzocJz4=;
  b=RjcKIeujtmZaCVqN4k2tLevotO3xgRppZdCX20pxiSvJgmUnLSyo9Ppw
   0Uz6R+jhvQ9Ui9lqkC4+rpVsTTAqR6pkhhqMyV7dCHYkc48gFAGC1GuSe
   be3t7Rw/2lnnBE3CJZgzxIOUKKhxEdEXkgvn2p9kiAvVDhAon+NFxn27h
   PV1zEBMEHH8OlCwdgTuZWGud/dHzCYigZWrCp8cmezN8TrxVazCDv4qF4
   yxUGiQ9RmTp6SnRFWcUEpbf/3elPEBoYVU48sJDjSdj32QKEeh3AArKqo
   fOpMUz+FGNYkzUVwavuQK8NoPVD3oab5A+S+QYkYENfbb8ae+kvvJzsLG
   g==;
X-CSE-ConnectionGUID: hKARKFWhRsyvyIcXqyvjOg==
X-CSE-MsgGUID: RLFS0jl1QdWlxiTye/sMnA==
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="259885715"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 02:24:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jul 2024 02:24:24 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jul 2024 02:24:18 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<durai.manickamkr@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 3/5] ARM: dts: microchip: sam9x60: Remove additional compatible string from GPIO node
Date: Tue, 9 Jul 2024 14:53:52 +0530
Message-ID: <20240709092354.191643-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709092354.191643-1-manikandan.m@microchip.com>
References: <20240709092354.191643-1-manikandan.m@microchip.com>
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


