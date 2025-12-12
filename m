Return-Path: <linux-gpio+bounces-29470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2A6CB820F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 08:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 456CB303753A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 07:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A03130DEDD;
	Fri, 12 Dec 2025 07:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A49GT3jX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5C2E8DE2;
	Fri, 12 Dec 2025 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765525289; cv=none; b=iU5qZpAIMv51uFwzS4C7LUZvX+dvSo48+NSLR9fCPCcEHy4hnEQrDZSY7sv6eViCyD/hBX6sWMzFkt7r105n+QjItLK+m8ZIE6AIboJ5WUi5jBAB9qiQ2Jf/qplzrIbjznAyc0JfZg4QFVKuNo/xAwHBuHLYR3STGNU0ZB9skIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765525289; c=relaxed/simple;
	bh=wWFNlpjkT3FBfyV8+CvWxjN2dGiHa7fN96GpHrrxKt4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IGMXVHjSvvG5bg97JRuS0+A6gdS4QZeKTGtQs5/mxFHQhlfGDhmwbhr9Y32Q1U1M0Loje0sG577wJ4hOHG1wXVAhYioY9vex2LdBFF1o3GJSCT09M0nkfd8/YFX1eoSy2j4K4WE23F6ND6CdlzpoEmzc4SAhi4Ml+3sDZyzSQag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A49GT3jX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 05A034E41BA4;
	Fri, 12 Dec 2025 07:41:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCB20606DF;
	Fri, 12 Dec 2025 07:41:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62CF3103C8DF7;
	Fri, 12 Dec 2025 08:41:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=g7M2WmltjUcmzGj5/uGfZjuBIODG+CdCH6JXQJ7UeoE=;
	b=A49GT3jXx/SFk0ctKOl5iKWY9Gs+U6CHsEBr3l0l6v0llXIjVcQHCeElGP4RMklkYwpahn
	Hegr5yxiML7pPlaqGJURI7ELg/U3yL+cULpeErrVUyMTLUSTRiPtyqYdY4wcbk3+VhiLMN
	53c+OTW1KX9MinSzSc0OT2KqYL15UXNrTY08ZGawhyB9CR9doQwR5KQN1RZM+eDPIOorlr
	U+t2n9xHxpO2e8SHRgM/ZXxfzAB0b045GjMk2SjMO+pyjo7LKLNF2zjXPI8h6ffF55FKfR
	FCY/8E89qbg+0boG50b9kLi+vxlEtZjB3dF/MFdbB9p6Tys/5nrCwweFrCCMPw==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Subject: [PATCH 0/8] Add support for AAEON SRG-IMX8PL MCU
Date: Fri, 12 Dec 2025 08:41:03 +0100
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/HO2kC/4WNQQ6CMBBFr0Jm7RimQCKuvAdh0ZapTCKtabHRE
 O5u5QIu30v++xskjsIJrtUGkbMkCb4AnSqws/Z3RpkKg6pVR4oIJ85oWtSag8fFvnCKkjki13z
 p2bhWOwNl/Yzs5H2Uh7HwLGkN8XMcZfrZ/81MWGPXG6fJaNu45mZCWB/izzYsMO77/gWo28kLw
 AAAAA==
X-Change-ID: 20251211-dev-b4-aaeon-mcu-driver-e0e89ebf4afb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

This patch series introduces support for the AAEON SRG-IMX8PL embedded
controller (MCU). The MCU is connected via I2C and provides GPIO and
watchdog functionality for the SRG-IMX8PL board.

The series includes:
- Device tree bindings for the MFD, GPIO, and watchdog subsystems
- MFD driver that serves as the core driver for the MCU
- GPIO driver implementing the GPIO functionality
- Watchdog driver for system monitoring
- MAINTAINERS entry for the new drivers

The drivers follow the standard Linux kernel subsystem patterns, with
the MFD driver registering the sub-devices (GPIO and watchdog) which
are then handled by their respective subsystem drivers.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
Thomas Perrot (Schneider Electric) (8):
      dt-bindings: vendor-prefixes: Add AAEON vendor prefix
      dt-bindings: gpio: Add AAEON embedded controller GPIO binding
      dt-bindings: watchdog: Add AAEON embedded controller watchdog binding
      dt-bindings: mfd: Add AAEON embedded controller binding
      mfd: aaeon: Add SRG-IMX8PL MCU driver
      gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
      watchdog: aaeon: Add watchdog driver for SRG-IMX8PL MCU
      MAINTAINERS: Add entry for AAEON SRG-IMX8PL MCU driver

 .../bindings/gpio/aaeon,srg-imx8pl-gpio.yaml       |  54 +++++
 .../bindings/mfd/aaeon,srg-imx8pl-mcu.yaml         |  58 +++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 .../bindings/watchdog/aaeon,srg-imx8pl-wdt.yaml    |  38 ++++
 MAINTAINERS                                        |   9 +
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-aaeon-mcu.c                      | 248 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |  10 +
 drivers/mfd/aaeon-mcu.c                            | 133 +++++++++++
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c                   | 140 ++++++++++++
 include/linux/mfd/aaeon-mcu.h                      |  30 +++
 14 files changed, 744 insertions(+)
---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251211-dev-b4-aaeon-mcu-driver-e0e89ebf4afb

Best regards,
-- 
Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>


