Return-Path: <linux-gpio+bounces-8743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6629E951441
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 08:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 029D6B249A6
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 06:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746F913A418;
	Wed, 14 Aug 2024 06:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZB8F/v4v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17F113A271;
	Wed, 14 Aug 2024 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723616037; cv=none; b=ODzhQ/TFShfbyCbdO2ZhEkmsP+Qpy43UhPQV+WlfB8Drx9VB+lY6xZL9zNls+FBQ1yEvzfcrAQHCvbLPWDjvkdz0+EjwXoLTi5k4bHfQTmxkMgyc+FPnhDL3cGM2tZzD0frknPFNxJehqwaKMWuLt06BNj+p7rd4IbSYVrEhwzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723616037; c=relaxed/simple;
	bh=4f9XytOOWu3gYYHKXQOT+GLrOo52/1xLLA4R83KDLvg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=thgZ0z7wepNT92gWyamH+kVZFfp46Aj4rDBRG1N05yqeBGyK6gnROIaaScNOSk3Nmy5pE+765cFdIeAO3QHmZV1Bj6Iqfh+bstHROYUoy8HwgifRFtXwlpp0FpBJU8EsgSdmJ3X1Kx/JrUvgTYh3H+R79w1wlZXUYymSyiLcHeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ZB8F/v4v; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1723616034; x=1755152034;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4f9XytOOWu3gYYHKXQOT+GLrOo52/1xLLA4R83KDLvg=;
  b=ZB8F/v4vT7R7/EvrJK8ob6+hQjaP0neIM34+ANW2tJGlIADQ9d00yYN7
   c0JBdKMvO8i3fKLoTwDWHfwYaQd5TdcMk1j2jfOHT7jKK07tyOcBwn3+1
   yPES3Q01CYWU1kpbzwKM9kju60nQwxtVs8KTYkk4H22hhdR2vWoajqyH5
   2TE5DXWehbPEjmutkCjUvdQyKAlbBduihPAa5au97nRpgMGN4SaE/3lAd
   JgpdEFq/Sk7UqSdzGNgm+gH0rJdoHD+AIKoMb7hd3M9K7T1d3nr9o+4Tq
   0ScOKrObO12X7IPhAN2J5arELf5wONVywIlQohL0xZryHE6NxnbbVizco
   w==;
X-CSE-ConnectionGUID: NkQy/Ju3T0eRCCfLlaY5PA==
X-CSE-MsgGUID: RxOqP28UTsmzBACbItKRKg==
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="33398215"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2024 23:13:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Aug 2024 23:13:24 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 13 Aug 2024 23:13:19 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v4 0/4] Convert Atmel PIO3 Pinctrl and GPIO bindings to yaml
Date: Wed, 14 Aug 2024 11:43:11 +0530
Message-ID: <20240814061315.112564-1-manikandan.m@microchip.com>
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

Dropped patches that are applied to latest kernel

Manikandan Muralidharan (4):
  ARM: dts: microchip: change to simple-mfd from simple-bus for PIO3
    pinumux controller
  ARM: dts: microchip: Remove additional compatible string from PIO3
    pinctrl nodes
  ARM: dts: microchip: sam9x60: Remove additional compatible string from
    GPIO node
  dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl to json-schema

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
 13 files changed, 199 insertions(+), 193 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml

-- 
2.25.1


