Return-Path: <linux-gpio+bounces-39564-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QTCUOB61TGr5oQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39564-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:13:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12678718F54
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 10:13:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=djyZTscM;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39564-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39564-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4EA78300602D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 08:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F66A2D0C84;
	Tue,  7 Jul 2026 08:01:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89265285CBC;
	Tue,  7 Jul 2026 08:01:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411312; cv=none; b=SCA4pzKPeg+sX6lmi8oKLS9S8ibLKiSU9tJK9Cr39Z6eTWzADCH2TxHIQtP5n5HFCUJzx/2bKntTZli9M01MuWI3/eh4u5td8mp6/Vl96hlB9ItmItn08G9v0PxaWs2Ohdh5Sk+XEP3Ojxotl9mL+7X6FQB2+/34xbastsT7GBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411312; c=relaxed/simple;
	bh=8ySEEwi81kOZufCiC5ultcK08MD9cSK76uN/1+yll34=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HxuyBEI/AfXq6A+x0nk6OAgpZ5cjuJTNnjV1aIOAwSgs9n01OQIL7Svnv94yJjz/2CRm3KETH6o4QtixhEsb9e8Zu0X6pvC8+H1+PcmZ+XeTxSJxO5HMnDZgIetAWVwZCxeOI1I14t5sP3EBWowSGobGfX2+UVNRSZjcBn/EAJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=djyZTscM; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E5B904E40CCA;
	Tue,  7 Jul 2026 08:01:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ADBFF601A3;
	Tue,  7 Jul 2026 08:01:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8164B11BC0E9B;
	Tue,  7 Jul 2026 10:01:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783411306; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=B0T3hPUpr7DquND+SiXKVEhca1w7AN4kb1iXd6bq9Ek=;
	b=djyZTscMury51Vz7wD0PkkXfigYbRnl57R3Toe+oJWhgW1BFzMF1KwsNGWvTMPsOhlJr7c
	IpiAJ7FtWZqow7bm4I/E8Dmia/glnXsgxzrA16EwHNf00VN9l7BiIG8ERNTJ9KRw2XPora
	lbxK9ZliBz3VmxxmUX10MSmXzywcpS3d8frrjysRd4xkNBDQwxjwo3JKkklO0y3kOtpbxT
	Zkmz0s3Mw9hc0uQ0/4mir2lw4wORwoVT6dBVRP9FK9fXe39iBKomOuPNVDAetmrbGo2Hpk
	gpqj/bI9UKxnPlfuOFDJahVRq6OWJx6E2Tgd0XJOfhOg5fpf5NmhrIuG9G0bdQ==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Subject: [PATCH v7 0/5] Add support for AAEON SRG-IMX8P MCU
Date: Tue, 07 Jul 2026 10:01:26 +0200
Message-Id: <20260707-dev-b4-aaeon-mcu-driver-v7-0-ca6c59abd672@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XQ20rEMBAG4FdZcm1kcmzile8hXmRycANuI+kal
 KXvbrooZSldL/+B+f5hLmSKNceJPB0upMaWp1zGHoaHA/FHN75FmkPPhANXjDNGQ2wUJXUulpG
 e/CcNNbdYaYRobMQkXULStz9qTPnrKr+89nzM07nU72tRY8v0f7MxClRZTI6h8yKJZyzl/J7HR
 19OS8mvwO8LGoNW6E1MjN8Iy12N/92igXGxL/Eu2SQ9ACZUHreSWCUOdyTRJXDMSsFh0M5vJbl
 Kgst9SXap/xsYC0kOVm4ltUoSzL6kFilYg0EaprXZSnqVtIB9SXcpaI0qeQw8wa00z/MPeLtzV
 nQCAAA=
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39564-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jeremie.dautheribes@bootlin.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:lee@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-watchdog@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:miquel.raynal@bootlin.com,m:thomas.perrot@bootlin.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor.dooley@microchip.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12678718F54

This patch series introduces support for the AAEON SRG-IMX8P embedded
controller (MCU). The MCU is connected via I2C and provides GPIO and
watchdog functionality for the SRG-IMX8P board.

The series includes:
- Device tree binding for the MFD driver
- MFD driver that serves as the core driver for the MCU
- GPIO driver implementing the GPIO functionality
- Watchdog driver for system monitoring
- MAINTAINERS entry for the new drivers

The drivers follow the standard Linux kernel subsystem patterns, with
the MFD driver registering the sub-devices (GPIO and watchdog) which
are then handled by their respective subsystem drivers.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
Changes in v7:
- mfd: fix select REGMAP Kconfig entry indented with spaces instead of a tab
- mfd: use devm_kcalloc() instead of devm_kzalloc() for the cmd buffer allocation
- mfd: add .use_single_write = true to the regmap config to prevent regcache sync
or debugfs from issuing multi-register writes that would overflow the fixed 3-byte
cmd buffer
- watchdog: remove max_timeout; it is documented as irrelevant when
max_hw_heartbeat_ms is set and is silently ignored by the watchdog core
- watchdog: pass dev->parent to watchdog_init_timeout() so that the timeout-sec
DT property is correctly read from the MCU I2C node; the MFD child platform device
has no of_node of its own
- watchdog: add suspend/resume PM hooks to stop the watchdog before entering sleep
and restart it on resume, preventing spurious resets if suspend lasts longer than
the 25-second hardware heartbeat
- Link to v6: https://lore.kernel.org/r/20260630-dev-b4-aaeon-mcu-driver-v6-0-d66b5fcbd2f0@bootlin.com

Changes in v6:
- mfd: rename local variable to ddata in probe
- mfd: fix driver name from "aaeon_mcu" to "aaeon-mcu"
- mfd: set I2C_M_DMA_SAFE on all i2c_msg flags so the host driver
  skips bounce-buffering the heap-allocated DMA-safe buffers
- mfd: drop COMPILE_TEST
- gpio: replace __set/__clear/__assign_bit with atomic set_bit/
  clear_bit/assign_bit to fix potential races on shared bitmaps
- gpio: write output value before switching pin to output mode to
  avoid a potential glitch on direction_output
- gpio: add MODULE_ALIAS("platform:aaeon-mcu-gpio")
- watchdog: add WDIOF_SETTIMEOUT and watchdog_init_timeout() so the
  software timeout is configurable via ioctl, DT timeout-sec or
  the watchdog_timeout boot parameter
- watchdog: add watchdog_stop_on_reboot() to prevent a spurious
  reset from the external MCU during system shutdown
- watchdog: add MODULE_ALIAS("platform:aaeon-mcu-wdt")
- Link to v5: https://lore.kernel.org/r/20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com

Changes in v5:
- mfd: use heap-allocated DMA-safe buffers for I2C transfers, replacing
  stack-allocated buffers in the regmap bus callbacks
- mfd: switch from REGCACHE_NONE to REGCACHE_MAPLE; add volatile_reg
  callback marking GPIO input read registers (opcode 0x72) as volatile;
  add max_register
- mfd: use PLATFORM_DEVID_AUTO instead of PLATFORM_DEVID_NONE
- mfd: use MFD_CELL_BASIC() macro for cell definitions
- mfd: use dev_err_probe() for regmap initialization error
- Link to v4: https://lore.kernel.org/r/20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com

Changes in v4:
- mfd: switch to a custom regmap bus; remove aaeon_mcu_i2c_xfer() and the aaeon_mcu_dev struct
- mfd: locking delegated to regmap's built-in mutex; drop explicit mutex
- mfd: remove firmware version reading at probe time
- gpio, watchdog: use regmap_read()/regmap_write() via dev_get_regmap()
- include: replace aaeon_mcu_i2c_xfer() declaration with AAEON_MCU_REG() macro
- dt-bindings: remove unused label from example node
- Link to v3: https://lore.kernel.org/r/20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com

Changes in v3:
- Renamed SRG-IMX8PL to SRG-IMX8P
- dt-bindings: add gpio-controller properties as required
- mfd: move struct aaeon_mcu_dev from header to .c file (private)
- mfd: use guard(mutex) and devm_mutex_init() for cleanup
- mfd: firmware version log changed to dev_dbg()
- mfd: add select MFD_CORE to Kconfig
- Kconfig: add || COMPILE_TEST to all three drivers
- watchdog: add comments explaining hardware timeout and WDOG_HW_RUNNING
- watchdog: remove unused platform_set_drvdata()
- watchdog: add a function to query the status
- Link to v2: https://lore.kernel.org/r/20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com

Changes in v2:
- Fold GPIO and watchdog bindings into MFD binding
- Drop OF_GPIO dependency in GPIO Kconfig
- Use __set_bit/__clear_bit/__assign_bit instead of atomic variants
- Various driver cleanups and improvements
- Link to v1: https://lore.kernel.org/r/20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com

---
Thomas Perrot (Schneider Electric) (5):
      dt-bindings: vendor-prefixes: Add AAEON vendor prefix
      dt-bindings: mfd: Add AAEON embedded controller
      mfd: aaeon: Add SRG-IMX8P MCU driver
      gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
      watchdog: aaeon: Add watchdog driver for SRG-IMX8P MCU

 .../bindings/mfd/aaeon,srg-imx8p-mcu.yaml          |  67 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  10 +
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-aaeon-mcu.c                      | 230 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |  11 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/aaeon-mcu.c                            | 206 ++++++++++++++++++
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c                   | 167 +++++++++++++++
 include/linux/mfd/aaeon-mcu.h                      |  40 ++++
 13 files changed, 755 insertions(+)
---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251211-dev-b4-aaeon-mcu-driver-e0e89ebf4afb

Best regards,
-- 
Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>


