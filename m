Return-Path: <linux-gpio+bounces-8114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1714192B3AA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 11:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A1A41C2148F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 09:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759B3155739;
	Tue,  9 Jul 2024 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JEGHJKtS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779E11553BB;
	Tue,  9 Jul 2024 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517074; cv=none; b=RaogZicTlV4/lllC0YQu3DeMrIGlYvptreQ2f3CNPxD+H2GBogHccgUyUhVzQpzIkQN+QmjVP/b6rIbevQU8rtuin7eniDj7kSf0m2qh0VFO+uhn7OFSnBccWNj2KMGwQm1oiVEMRodebm/nlpNBX4z9nX5AGyo4TQMAEvcgV80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517074; c=relaxed/simple;
	bh=QCwPMr8eE1DsJ82JWIs07dID3YaIXFEtC7arCB4PNwY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QUzUt4O+bEicmhJQZJsiflWpzxSc/8HbLVpJIxrgSpWUKSk06s5yGjFEHnDVgg6SoaDhEq+tFcQCqV4C91hCaOP/o3cRzT3wYbpCcOkr3E0HCV16g85MmnxhYZwyOZRF2L1RSnds3L98g+M2X1orme9YDBx9dNBgOoSNvm1Ngk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=JEGHJKtS; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720517072; x=1752053072;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QCwPMr8eE1DsJ82JWIs07dID3YaIXFEtC7arCB4PNwY=;
  b=JEGHJKtSkzcPnCmrp2n3RlBU0lFF+3KHYkNaBdfiU1ANykHlbAPK5U+J
   /n2UoTijrQrbM9+uA3N29dIA3Erh72PYvpJy2iabAwCTbsaLLQFuOuNKK
   TJmI64rpnkdxpZgkaSCBHFt7K8o29v1hKm4g0kB5IdODZqdfXFcjVK2FU
   4BkaP62PHMS42gVTTdR3zh4t9AQ4a6r9gvKA9dzEGR+Lb6pBGIdV/aCUN
   Pmbdm/iCW34fQuEZPH/pnRNjjA8TtMPK592yCQhKtOlH3JZrQRAVixjst
   NaGBxGNStjwTlGu3vQdz6Up6HfFdPk7Z6NYizDaQbho3l+6FsaMd5SUAB
   w==;
X-CSE-ConnectionGUID: xQeYMFNNSJOpfPWTFyqi0w==
X-CSE-MsgGUID: D2iXWSl+R5i0SSTKjSoWLQ==
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="31649740"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 02:24:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jul 2024 02:24:05 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jul 2024 02:23:59 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<durai.manickamkr@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 0/5] Convert Atmel PIO3 Pinctrl and GPIO bindings to yaml
Date: Tue, 9 Jul 2024 14:53:49 +0530
Message-ID: <20240709092354.191643-1-manikandan.m@microchip.com>
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

changelogs are available in respective patches.

Manikandan Muralidharan (5):
  ARM: dts: microchip: change to simple-mfd from simple-bus for PIO3
    pinumux controller
  ARM: dts: microchip: Remove additional compatible string from PIO3
    pinctrl nodes
  ARM: dts: microchip: sam9x60: Remove additional compatible string from
    GPIO node
  dt-bindings: gpio: convert Atmel GPIO to json-schema
  dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl to json-schema

 .../bindings/gpio/atmel,at91rm9200-gpio.yaml  |  81 ++++++++
 .../devicetree/bindings/gpio/gpio_atmel.txt   |  31 ---
 .../bindings/pinctrl/atmel,at91-pinctrl.txt   | 178 -----------------
 .../pinctrl/atmel,at91rm9200-pinctrl.yaml     | 184 ++++++++++++++++++
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
 15 files changed, 280 insertions(+), 224 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_atmel.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml

-- 
2.25.1


