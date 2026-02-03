Return-Path: <linux-gpio+bounces-31395-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPK6IkwjgmnPPgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31395-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:33:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 275EDDC03C
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6A69319A02D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 16:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A993C1992;
	Tue,  3 Feb 2026 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LVqrzIAB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862613C1989
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135697; cv=none; b=JFHF89hxcYA6rHT78d0ww2rbJ3xqEPqcKUUwf+ZlUm6ysMj9Jy/fMrUjLB8+OaKulyIODlzHpmgspZool/Y4EAKYn0l+Zmrc6rq82Owtm/vvRCfLRltui5YT8QBN9sbdW9X40IDZREWG3xUAyCdc/OGXZz8kDwD9pj6BWFwzxe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135697; c=relaxed/simple;
	bh=pYZrOZ6Yy5u23dVF0oWwYvp55KhzdGxhsfGau41DMmg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SWTN9HP1wVbO831Dj/QPRF8UMQKz8Z04Kzzzz+U+6EnHcnI7MmSK4MVzGgu0nzM3csnNlvb8qrlZjMqlKCTf1zYff6GXNK6MH3QuItk8cq/Ypegwh2EdenYZkMWnwmss+bLLvLNa4LOIEGhE7pDIOEvt6jGuzNeXqUGcxKSxNco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LVqrzIAB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0D9774E423B6;
	Tue,  3 Feb 2026 16:21:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3FC360728;
	Tue,  3 Feb 2026 16:21:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85147119A88EE;
	Tue,  3 Feb 2026 17:21:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770135692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8LJqS/2E0H9PKwMlKUB8AnsR++v79Cw7Lva3b/sVBPY=;
	b=LVqrzIABq/k69eNJmTs3oIfAlK+JcA+GwZEts50A6W5/DmPONpeiMmgnx8CTDMX+cVGP0h
	U8Yasx5mGplOhWaxgQ6gnsX0E3dYWnIHHlKKnSVjHLHOFsfnI7hUCfCrhWDc8R5DKPawxK
	c1ugX0GBjHsLz9BaLEqZF6epJRqUjTWtPB6NhasngpirjlGuRpGbjeIpRr1IHSkTM0URKI
	UY1qw+9+aKepe6eY6hz0nBHYJU5TefGal5L8OUfql132+Wtm5D+y+NYLuuvCK8HwTv3vum
	jDpQWyti0qnbtatwCLllRB2q6X1ERyTzzD/WkQ025ZeoOg5QkW7g/vcY03rHRQ==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Subject: [PATCH v3 0/5] Add support for AAEON SRG-IMX8P MCU
Date: Tue, 03 Feb 2026 17:21:09 +0100
Message-Id: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHUggmkC/4XOTQ6CMBAF4KuQrh3Tlp+AK+9hXHTKVJoINS02G
 sLdLUQXLNTlm2S+9yYWyFsK7JBNzFO0wbohhXyXMd2p4UJg25SZ5LIUUghoKQIWoBS5AXp9h9b
 bSB6IU90QmkIZZOn75snYxyqfzil3NozOP9eiKJbrfzMK4FA2aJRApXOTH9G58WqHvXb9UvIW5
 G+hwrYqUddkhNwIy64oP1sqLmT+XZJJakyhOUeDpcatNM/zC9QQI99MAQAA
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=pYZrOZ6Yy5u23dVF0oWwYvp55KhzdGxhsfGau41DMmg=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpgiCGPe5CMYR5qidOEqsNGGdA2MNMNCsbzP/1a
 tNtrbLBb86JAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaYIghgAKCRCfwAsFcf4K
 7WQlC/9H4YMZCeeoow2g7nj6e1fWHqHSwTUmjGfl//AZxWMlAMBbZC5gomsAAFEUsAMIfMcQWNr
 CrIXzc3ce/WsTc6paEy46BCqU6VmgSOGLrmyHvj7zd1XKe15FkzaxQ0Y2Jyqkzwe7JHKYWV7Cw2
 xmqRYMcRqAOK+W44ZpSxSnM78ExWozgjeo+dYHWTasitImJRQhsSQ1XI+tyBuJKg6lurMwhkYdC
 BCMNR5d/zy33XpiDLqnayw4ag11NKSrWbACVx1LwjcdNDg3KZS2UIg5X5oyK0cJVnjfMmcdtQPT
 rupXTXkjiFCysnONNGDk4AMQ6N+mLUSCJL602Z4Nrr9iYVy0IVEoc7RsEHflbeVI+AAPRd3Nf0A
 h/WgGg6Fc5K9g4shyYDNPqVX70Qqes1GnfkORzcqiuNQ8Sj/M1GZuWeBbr3W/pkr9XkxB1TvJNy
 EQ+97xHe1sK92PhFNQl1IV8+FOxyaNg9DyaeZEsfkCWi25gsAXOLf7tmYc7dj7tXxY0DY=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31395-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 275EDDC03C
X-Rspamd-Action: no action

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
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-aaeon-mcu.c                      | 237 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |  10 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/aaeon-mcu.c                            | 137 ++++++++++++
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c                   | 136 ++++++++++++
 include/linux/mfd/aaeon-mcu.h                      |  20 ++
 13 files changed, 643 insertions(+)
---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251211-dev-b4-aaeon-mcu-driver-e0e89ebf4afb

Best regards,
-- 
Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>


