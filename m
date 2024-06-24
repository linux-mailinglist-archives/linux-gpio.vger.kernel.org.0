Return-Path: <linux-gpio+bounces-7639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373E9146F8
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 12:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A211AB23B26
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 10:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C280813665F;
	Mon, 24 Jun 2024 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="OlX1y/UX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D086F134410;
	Mon, 24 Jun 2024 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223531; cv=none; b=D3vrKZtNqWSJaRk21LvTwwxfgzu9xfjkfanMA++uM1zI9GYIXTLJj7wA5tTir6ICkc0J1y84yj1MN7BdxT4wb29pWzPmo9jJfBbXQB2caJRNwmsTszWKlCXMXW6LIKXYmw3X7P93IBnNvfA3oDkYfW2otJ0yiVo5tz8u+iJD87M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223531; c=relaxed/simple;
	bh=9OBXqXej2eo/ECybGZRzr+GyjPbUTDTKV+S2IMIaRsk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iVPMMInRBezyhFreYzxl6nsYNB7jh+wEAf67ScbzTh7SoUcoaj6wVrW26Nu7PtkQ0Oz8je+3xefU/35bK8XlzmiVW6zVz9az9gffSseYQ4YupVi1lQrIcrvebRItMcpMpbtVgHXyCfLvAQ0xC/Qp11IxegUl776kxaNkiVsoTVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=OlX1y/UX; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719223530; x=1750759530;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9OBXqXej2eo/ECybGZRzr+GyjPbUTDTKV+S2IMIaRsk=;
  b=OlX1y/UXPfAEqCtktSE0Zvzkx/AJRORyxhj1HKVhHQBIgfMybepC8CF0
   bI5CFBvKS88QsLVwMjUwhos7+w5j8kESc4pgglTG9oapDewNcNDMfm9wN
   9ew6ARxjLU2VUXfjg4U4VreHLHN49WC5Vqk/AUg21mxi6nFmjzYnz8gUK
   Bl+hPi/wknYNqKPN9Dk73xOQpE2ih4ObltHP8dLv7mvOMIgS7dYRvXld7
   m8Ssc6JkuLY4Agt0rBUrwD6CXQsr5CHuuNPy/k+sQys0/cTwhOqq64XyT
   XR0JfyvSR2xDdF9PxYF1MKgutB5Rzs1nq5PPRIaxpb3IpH0ZCZHDwAjNz
   w==;
X-CSE-ConnectionGUID: 3dTUNmvLQy2rS/y02F+uOA==
X-CSE-MsgGUID: wFd8GrMXQ9Sy/unGB633Gw==
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="259283588"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 03:05:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 03:04:42 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Jun 2024 03:04:34 -0700
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
Subject: [PATCH 0/5] Convert Atmel PIO3 Pinctrl and GPIO bindings to yaml
Date: Mon, 24 Jun 2024 15:34:26 +0530
Message-ID: <20240624100431.191172-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series cleans-up the compatible property of PIO3 Pinctrl
and GPIO bank nodes in DT and includes the text to yaml conversion of
Atmel PIO3 Pinctrl and GPIO bindings.

yaml files are validated using the following commands

make dt_binding_check DT_SCHEMA_FILES=<converted_yaml_file>

make CHECK_DTBS=y DT_SCHEMA_FILES=<converted_yaml_file>

Manikandan Muralidharan (5):
  ARM: dts: microchip: change to simple-mfd from simple-bus for PIO3
    pinumux controller
  ARM: dts: microchip: Remove additional compatible string from PIO3
    pinctrl nodes
  ARM: dts: microchip: sam9x60: Remove additional compatible string from
    GPIO node
  dt-bindings: gpio: convert Atmel GPIO to json-schema
  dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl to json-schema

 .../bindings/gpio/atmel,at91rm9200-gpio.yaml  |  78 +++++++
 .../devicetree/bindings/gpio/gpio_atmel.txt   |  31 ---
 .../bindings/pinctrl/atmel,at91-pinctrl.txt   | 178 ----------------
 .../pinctrl/atmel,at91rm9200-pinctrl.yaml     | 194 ++++++++++++++++++
 arch/arm/boot/dts/microchip/at91rm9200.dtsi   |   2 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi  |   2 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi  |   2 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi  |   2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi  |   2 +-
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi  |   2 +-
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi   |   2 +-
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi   |   2 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi      |  10 +-
 arch/arm/boot/dts/microchip/sama5d3.dtsi      |   2 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi      |   2 +-
 15 files changed, 287 insertions(+), 224 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_atmel.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml

-- 
2.25.1


