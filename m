Return-Path: <linux-gpio+bounces-26081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE8DB553E3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 17:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF2F7585708
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 15:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACFE31A045;
	Fri, 12 Sep 2025 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kO+Cqued"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFC413AA2F;
	Fri, 12 Sep 2025 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757691669; cv=none; b=grqPqAS4LlMro5TeINbMoEXY8aFe6krQF9wscKAO2dHRzIX3xEFqnM+ARJykDQX6x3OTdQT2mPJHuMFijDg9kpplSITv9yOgrF9wzZNsmAifgm2u0zb4/mRKt1+3MEzWBwVWSzkzwLZoPR4oxiUqhIE2YEjAm39tST0TAMa62nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757691669; c=relaxed/simple;
	bh=qnOs/FmozUPNapUQiKvYpUbzT/RH4SCZ4+Y9w20ANDo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=tDz3kzkmJqEZ7a3zFnmbAgndhQKUHHXIxQ3KvWeKwXtjqYRv3HZNoFMTTSeozbWfkuRq6WdYh6FRQ1mZvCpS2yILTpky69Xjrwxbl7CrpQ18D2X1pzF6y2rLGHcB/pDwYI6s1Mbx36rm4DaN7LWBu5eJaqy3iVq+cMBz3YrdCIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kO+Cqued; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CFeisk549112;
	Fri, 12 Sep 2025 10:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757691644;
	bh=T3iTHXFlDW6cQ5IsRNLb40CH2t3otavbSwxJAu4Q8Es=;
	h=From:Subject:Date:To:CC;
	b=kO+CquedIobzYQ4PJyUu9evtDlT3SWbqfHT2Wag/iQRhVjea4wzx0Fy87I2ACY+OJ
	 fPfzdk/QC6i0DW4bEoBEAzE5yTtGlUgpEzgrCoE0C1p/LpIc64jPqGbWk36i57YJVj
	 lxTJ92Y+j8cKcil74sGnxuc2g7EEGtGD3DDJqCOM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CFeh0R2870512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 10:40:43 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 10:40:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 10:40:43 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CFehrO4123675;
	Fri, 12 Sep 2025 10:40:43 -0500
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH v6 0/4] arm64: dts: ti: introduce basic support for the
 AM62L
Date: Fri, 12 Sep 2025 10:40:39 -0500
Message-ID: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPc+xGgC/1XMQY7CMAyF4augrAlK3Dh2ZjX3GLFIUxciAR21q
 AKh3n1SpGnp8ln+/pcapM8yqK/dS/Uy5iF3tzL8fqfSOd5OonNTtgIDzgIYHa8eLg+dYnCBpW2
 YRJXn317a/HiHfo5ln/Nw7/rnuzvCfJ0TaKzh/8QI2mhkC4yxoobb73s+pO6qZj9WnyYspipGW
 ktWiAMCbYxbjTO0GFdMkkDkQh0kysbgavDDYDGuRpLIxOJhY/xqgrWL8cVUGBiQk7M1Lmaapj9
 axpHFaQEAAA==
X-Change-ID: 20241220-am62lx-ca9498efd87e
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew
 Davis <afd@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony
 Lindgren <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4806; i=bb@ti.com;
 h=from:subject:message-id; bh=qnOs/FmozUPNapUQiKvYpUbzT/RH4SCZ4+Y9w20ANDo=;
 b=owNCWmg5MUFZJlNZTwkV3wAAYf////f/s33x7qnQPr9929u/sadr+DbPe9//fH/4rZt449+wA
 RsYGaoDQNA0BoAAaMgyDQABoADTR6gAADQA0A0AaMmg0GQDI02k8mp+U1EBpoaGmg00aANAAA00
 0000NB6gZGJoDygaAeoBoaGjBB6hiZDaJp6jaTQMhoNGiGhkyNBpo0wgZDQNBoyaABpowIGQZAG
 jTIxMmgBkaYRoxGhkGE0yaAyYTQAgYgUwC0rRSCDRtaZnCNNKXGqiL+KmYng8g8ATQ7zflOI7Sb
 999wAGxeUZPMqHykEB/glwGPS7O7z1A8QYY6J+5avAmjk3GNLV0MDmXBoiY0p6Wfa8HMuoDkEC1
 RzyMsYrxTrERTlLvoM+qIe/2Z4W7J7ZrAqoPbp0mdzm06dKt9TIo44aI0jvVu+IUTLy/dhEUpRq
 47DgAOKf8ZxdC+yxhBT54s2OLxhUwhBuwSO31jKRDYY+oPMVdcohXEtT3U51YSxNpP3mvRLw/jN
 UQ9VQCr5YajsYKHZ3W8MUqd5s6lMwHIRxceaCTz6YiTXMiHWsCioLhSwWj1Iy37TdOs9pXBgrI0
 uRszf2xcWPIhJNOgGoEA+PUFiK9/NAiAkJKlBCpgnM0b+q78xk0a+HkZSxM9GNxl4HlCZSGan0f
 rU/+LuSKcKEgnhIrvg=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Everyone,

This small series adds the initial support (currently just a UART) for
TI's AM62L SoC family.

The AM62L is a lite, low power and performance optimized family of
application processors that are built for Linux application development.
AM62L is well suited for a wide range of general-purpose applications
with scalable ARM Cortex-A53 core performance and embedded features such
as: Multimedia DSI/DPI support, integrated ADC on chip, advanced lower
power management modes, and extensive security options for IP protection
with the built-in security features.

Additionally, the AM62Lx devices includes an extensive set of
peripherals that make it a well-suited for a broad range of industrial
applications while offering intelligent features and optimized power
architecture as well. In addition, the extensive set of peripherals
included in AM62Lx enables system-level connectivity, such as: USB,
MMC/SD, OSPI, CAN-FD and an ADC.

AM62L is a general purpose processor, however some of the applications
well suited for it include: Human Machine Interfaces (HMI), Medical
patient monitoring , Building automation, Smart secure gateways, Smart
Thermostats, EV charging stations, Smart Metering, Solar energy and
more.

Some highlights of AM62L SoC are:
 - Single to Dual 64-bit Arm® Cortex®-A53 microprocessor subsystem up to
   1.25GHz Integrated Giga-bit Ethernet switch supporting up to a total
   of two external
 - 16-bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
 - Display support: 1x display support over MIPI DSI (4 lanes DPHY) or
   DPI (24-bit RGB LVCMOS)
 - Multiple low power modes support, ex: Deep sleep and Standby
 - Support for secure boot, Trusted Execution Environment (TEE) &
   Cryptographic Acceleration

For more information check out our Technical Reference Manual (TRM)
which is located here:

	https://www.ti.com/lit/pdf/sprujb4

Happy Hacking
~Bryan

Changes from v1:
 - switched to non-direct links so TRM updates are automatic
 - fixed indentation issues with a few nodes
 - separated bindings into a different patch
 - removed current-speed property from main_uart0{}
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected the main_uart0{} pinmux
 - Link: https://lore.kernel.org/all/20241117-am62lx-v1-0-4e71e42d781d@ti.com/

Changes from v2:
- alphabetized phandles
- corrected macro and node names for main_uart0 pinmux
- Link to v2: https://lore.kernel.org/r/20250108-am62lx-v2-0-581285a37d8f@ti.com

Changes from v3:
- added more nodes which have been validated
- added link to data sheet which is now public
- Link to v3: https://lore.kernel.org/r/20250109-am62lx-v3-0-ef171e789527@ti.com

Changes from v4:
- corrected copyright date
- used the ranges property for the fss{} node
- converted control MMR's space into a syscon{} node
- Link to v4: https://lore.kernel.org/r/20250407-am62lx-v4-0-ce97749b9eae@ti.com

Changes from v5:
- added new compatible for the am62l pinmux driver
- increased thermal trip point to 125C
- reduced size of &conf its correct size of 0x380000
- replaced dss with display: s/dss@/display@/
- expanded chipid to include the JTAG_USER_ID information
- removed nodes requiring parent clocks until sorted in firmware
- expanded &wkup_conf length to properly contain the &usb_phy_ctrl
- moved back to &wkup_conf as a simple bus and grouped both 
  &usb*_phy_ctrl into one syscon node rather than individual nodes
- Link to v5: https://lore.kernel.org/r/20250507-am62lx-v5-0-4b57ea878e62@ti.com

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (2):
      dt-bindings: arm: ti: Add binding for AM62L SoCs
      dt-bindings: pinctrl: pinctrl-single: add ti,am62l-padconf compatible

Vignesh Raghavendra (2):
      arm64: dts: ti: k3-am62l: add initial infrastructure
      arm64: dts: ti: k3-am62l: add initial reference board file

 Documentation/devicetree/bindings/arm/ti/k3.yaml   |   6 +
 .../bindings/pinctrl/pinctrl-single.yaml           |   1 +
 arch/arm64/boot/dts/ti/Makefile                    |   3 +
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi          | 603 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi       |  25 +
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi        | 141 +++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi               | 120 ++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts           | 345 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi              |  67 +++
 arch/arm64/boot/dts/ti/k3-pinctrl.h                |   2 +
 10 files changed, 1313 insertions(+)
---
base-commit: 76397d42e248335aa41acbf0af6d096220605202
change-id: 20241220-am62lx-ca9498efd87e

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


