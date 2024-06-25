Return-Path: <linux-gpio+bounces-7664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3C5915DA5
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 06:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBD74283741
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 04:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D52313C691;
	Tue, 25 Jun 2024 04:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RoZjOQrC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6155D21A0C;
	Tue, 25 Jun 2024 04:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719290144; cv=none; b=f2IkXrNYWh7qtBb6UeQ1UoSusZ/JD8YuPc9RxeCIcpRkuCtnIBAm9XhpkW2fUIPQRaI1H+nn1y2zgjaMD9jOxhS8MsyW6G1kQUBmprqB+3xEe/StsTmyNnDj5tNqI+slybtHHmwfsCGcoqJABkzvtAWznMdy2tlR2DLvDiq+/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719290144; c=relaxed/simple;
	bh=8Y7d6sHBbzxwKJt+k76Jh4Ttm28v+pz4136Pz8yErI8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cp/WvDXnm20eK9xO9CEw2eLdnCEVDr3KzoBLzRe2vhzRwGCRTIspHdujGGB4bXKN3MWZV0erB6eziCrL5F16YTa2NttG4eRSZKTqzCzXd05/eqdMpOkmuHuysl9F7X7pvyenEDv3H9NaTp6SVhxo23wM/raAKh3+tO6ukciRX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=RoZjOQrC; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719290142; x=1750826142;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8Y7d6sHBbzxwKJt+k76Jh4Ttm28v+pz4136Pz8yErI8=;
  b=RoZjOQrCKdhSrXZgbHQYjPvvDmosvvaVkE4MMhLpedd4RqIRBEobhVt7
   nJIW7fZQH3n0/O5JuwJeEwcIifp9dRXMv74+YUj2nxxT5YiK8kMz8djbl
   tSMBpLMGwhrWBx5ArulnrUBMi/nFnRc6A/323TqG05Yb5c3YstAV+Ja1l
   VBPLPKzprQZRTMx9RZ6K87t5Utd2ImurVeb87F9Ia/gX2bGkWblSHLGvU
   S6KYdpzX6kU48uMH9hQ5AjuPukfmGnCNSqBNYy8YTtyhRkJphf/zup16X
   tEFNvAMVim40F03XaWFGDC1LJ3RBB3IEQ2v7RvUIS4qfAts65c7MMLjV2
   A==;
X-CSE-ConnectionGUID: ycDQqlNeQn6TW5mMuCU+LA==
X-CSE-MsgGUID: zOt8NC73Rfq9wcfBunbWrQ==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="259328199"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2024 21:35:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Jun 2024 21:35:29 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Jun 2024 21:35:22 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<durai.manickamkr@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 0/5] Convert Atmel PIO3 Pinctrl and GPIO bindings to yaml
Date: Tue, 25 Jun 2024 10:05:20 +0530
Message-ID: <20240625043525.279711-1-manikandan.m@microchip.com>
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
 15 files changed, 290 insertions(+), 224 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_atmel.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml

-- 
2.25.1


