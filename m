Return-Path: <linux-gpio+bounces-34894-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGAZINSO1mliGQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34894-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 19:22:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B673BF698
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 19:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF5BF301A7DD
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 17:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DCE3D47B3;
	Wed,  8 Apr 2026 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vcE6F9Bm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F7A32E13B;
	Wed,  8 Apr 2026 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668943; cv=none; b=qaQbbOoUM9Zbr3N9mmFD2Z7/bm7SlGhi8Q2KiPAbgk4JLdrEbLvXr9D9Is2hUTBkCgC2qQph0kjjHMPGgVych4AXKwFeRHDKJkky+Qk6V+BnWYY8cHF+SYtz2QWa7Xx6uPIKt/ds/wpCKyoMminRIpTV1yYNVyLhHTD0MqGwoyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668943; c=relaxed/simple;
	bh=ays/7jNwW83CF93SHZVFHVvuLfD/wIAAwD4jrcSavkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p9oeBKMUKVrEL87JG/2aQf/xb9J3IMJjoDZXhYjEtlcmoMhpE9hcypteeLJu800Dke6yFJuI1Iee4SO4ujzkosFfExh/X/VERufiyJkGPF7zz0qaQEOXbMj9yKTzuzDxxPibwZb6maOyu/dvRlJc2Ky+RSeJLWXgIqoy3Z2NUYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vcE6F9Bm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0335D1A31F1;
	Wed,  8 Apr 2026 17:22:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B83EE603CE;
	Wed,  8 Apr 2026 17:22:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D9A0104500F3;
	Wed,  8 Apr 2026 19:22:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775668937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=+Wz7EWR6PFtBNGIpnKG6zlh6pWOtrnWRejKbkJ7zGIY=;
	b=vcE6F9Bm0xLbMFqR4xIAs+2HhyfGZTh0nQ6D037ZgVz1u7nNb8yF1TAaZN33ANBEfkW6Ba
	P2doGxy3nCV/hxau4OL92CQcSNWoTKHWPrx95EhONQO0bTGPAGOkySAnxqsgkRYK1MIwbr
	IsGUuCY/zZ6uUOJ4cCalg5CBqZLEIwdUqtNPRVclzZ6jzH+IFcoTRNN1b+CfoQHJgfFTiQ
	oyrNiDChEJB6Yf7pM06krJIQuVxI6V2EEWJdjhCEyomF3Q0Iuy0fVVquwyjlcLvOgnZzS6
	8shZsf2HkgPfDlWQPGqdOmQoMAeuLaHgb7P4DykRwvaA3wsQaec9E8kXADexqg==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Subject: [PATCH v5 0/5] Add support for AAEON SRG-IMX8P MCU
Date: Wed, 08 Apr 2026 19:21:53 +0200
Message-Id: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XQwWoDIRAG4FcJnmtxRt3EnvoeoQdHx0Zo1uKmk
 hL23euGlhBC0uM/MN8/zElMXDNP4mV1EpVbnnIZe7BPKxF2fnxnmWPPAhVaQAAZuUky0nsuo9y
 HLxlrblwlK944pmR8ItG3PyunfDzL27eed3k6lPp9LmqwTP83G0glraPkgXzQSb9SKYePPD6Hs
 l9KfgV8LAwUB0thwwnwSljuavh3y6AA9X0Ju+SSCUpRIhvoVtIXCdUDSXdJeXBGo1oPPtxK5iJ
 pNPcl06X+bwUQk1k7cy3N8/wDZHlEAuABAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4278;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=ays/7jNwW83CF93SHZVFHVvuLfD/wIAAwD4jrcSavkE=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBp1o7Dcs3pGUCJVgH0wv4fifMTQ43eT7+gmyEq0
 GBStzGjCJiJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCadaOwwAKCRCfwAsFcf4K
 7X3/DACUMsrlamPpXwrcTDRZAlqDJTA3mvxlKDttCd4kyVBnt2mOkeicVC7GHSaC18Ng3kSmDe8
 Gzlcv6JPWdLit91T/pO4cs5+8wUWpeZTA+6bTEfxHYCUFfUZsKO7cnvKoV45hE7wxRcYkJbshk4
 cehXRpVYtj+RzWEN7UwucBpvxAoJmhTD9lntAugndNIqM+hPPvD2IORRdUDNuE4Y/Xq9V+sjK2r
 uP157fvYGxkOPsRtd4iQuFo6/aJiFSvPrSf9FErodYvOO6nXMTAT/hN6rbbubtItFhKU8Qx2OA1
 yHMTUkBNxYfMsEyw5czyyqr6zlxnUpGEICeM2cfUl4x9fHAlTQyFQODqaRRLGsoMe+eqxR4d0wp
 eI/VOYtboYNZVbhSNkIMd6qiirnwV0QxTAGySTJ6xkDbEx3+0bubDWq5nuF66WuZaZ5HSe2c9zi
 D1U4J3HHA21BopSPjfATaQiFahDUPmx/VWOU8YHgQI27ZOsFm0U3QozGc2s4u+8UPLJZY=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34894-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: E6B673BF698
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/gpio/gpio-aaeon-mcu.c                      | 229 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |  10 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/aaeon-mcu.c                            | 204 ++++++++++++++++++
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c                   | 132 ++++++++++++
 include/linux/mfd/aaeon-mcu.h                      |  40 ++++
 13 files changed, 716 insertions(+)
---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251211-dev-b4-aaeon-mcu-driver-e0e89ebf4afb

Best regards,
-- 
Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>


