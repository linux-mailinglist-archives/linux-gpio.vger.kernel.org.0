Return-Path: <linux-gpio+bounces-30985-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNu3LepGc2mHuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30985-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:01:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4173D54
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8C71303D386
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC62137F0FA;
	Fri, 23 Jan 2026 09:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xgUXQqIK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638B337E303;
	Fri, 23 Jan 2026 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162111; cv=none; b=FvaXj73xY9jLJsGn2X6jynxKnaCu6czm1DTAfh2LObCLIxtW2cimRVSp89eAhu9HlNI8212imU0VnoliXPaN1Jv5OWTjtTKeNjfpuM+e5OiimsUJ7PoymzQlV2EEYYuqc3pUU8qPTw0z4t83+QYBXzJ43vCH/yaE6JvRdO615HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162111; c=relaxed/simple;
	bh=I+86nw5ss1UyVYYj+1JjJmbO7AEei5pGYiM5ZmQb++w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BP4O0qFOsKdW+uNh8DsDP28Z8y2K9Bt8dqFdjseRTAgNKJbOKYs84aaTeco5qvQPtM2PW7w5MbW6to8RpAihnPL4bJLyFolv+bV0aQqz95zaH2WK+4uWq6h7aDIo7hdDed0QfFdkcMX5dvzVhCVou4iK7odhzH57qp96CLmeuKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xgUXQqIK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 55DC8C21AB9;
	Fri, 23 Jan 2026 09:54:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 105426070A;
	Fri, 23 Jan 2026 09:54:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE8A3119A879B;
	Fri, 23 Jan 2026 10:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769162087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GtOq1m+WD2HMLvMMLoom6Vbvmzr8+b8ZqOjynGdUdKA=;
	b=xgUXQqIKuJKbnfQU+glvqxQ0lC7iQX/b8KXT8yFWPgP9HuVjX7OT+AdxPf89EvPiRPjWCr
	wNh/NarbahLItvR6Yv5sRBQKz1Qn3CAm8M/oYdJJmHl6bd3J1g7LakaxlC20KFNMEqAkbq
	WTKEmCzsHFjAOk7t6JTNs3jO/cT6Ozba6+SphqYh0iWqlfjPwPET58Bt/QGgPFSNCnCxNU
	Te+N0qI3tgpXWFnKbIbKTxSGLUW6CwBF4+j8JyyRtJQH3RtnkfGpZcYelqFmfgWwcVVJHM
	pxD3ulyWYRKIByBosyCAIhRIPBN1buX9MkSr7iGL5iuyl+OgJacq3oCf5iuA7w==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Subject: [PATCH v2 0/5] Add support for AAEON SRG-IMX8PL MCU
Date: Fri, 23 Jan 2026 10:54:29 +0100
Message-Id: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVFc2kC/4XNTQ7CIBCG4as0rB1T6E9aV97DdMHAYEksGKhE0
 /Tu0saNG12+k8zzLSxSsBTZqVhYoGSj9S6HOBRMjdJdCazOzUQpGi44B00JsAYpyTuY1AN0sIk
 CUEldT2hqaZDl73sgY5+7fBlyjzbOPrz2ocS3638zcSih6dFIjlJVpjqj9/PNuqPy0zbyEcRvo
 UXdNqg6Mlx8CcO6rm8eeTeVAgEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=I+86nw5ss1UyVYYj+1JjJmbO7AEei5pGYiM5ZmQb++w=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpc0VjaDn3S4LIcnCwDpkh3Vnz0ZFtExIlW6SNM
 WlJw+WkwRuJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaXNFYwAKCRCfwAsFcf4K
 7bErC/9iYV0mVU/N8PkYfbeQlsjzMkmEC3KULGJ2eUV7cxH8hxTOZh8jNjmeJi6iR0b6yPh/ku1
 K0Huat/GPWckP5kQ1kqZmOviPNWg9XxOEVJKCcUCaCjZetkxjCBzB+ofssV32vOJ8fRBPWsKpMs
 cQbfuCNwkrBO1UnYQe0Em7Kt1hSx0pc5BOal6bZF+BsKwfw6f0dnz594gq2gIYdLRdXhwBT6/7M
 RWx1AMhE+Jvk50aaQj2Gf0qEchRpePJPLDgoFq1H151UufKBmILwRiSBUivtTDIC6KjieNOTtOl
 rTnB8EK8+zaDmN5wQu+EbmoRZF/CKhLQuD+VVWJNZhzafA8eGLpdKyIIyOalBseyj16w00I7M+Q
 7zBQKBHsW+2LFjlwk8GpPNl33jt3wTRqZlpoKZ6Uy4XpXXkcDvgZecQXDYo1mWYs2jg3XAp9Vq2
 ogNRxKs16GvP2B6GWYOJuEhDecPY79+EKQ85gzFzoC4fK1dRtKOBuPoYhN5NlUJ2m5GjY=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-30985-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31C4173D54
X-Rspamd-Action: no action

This patch series introduces support for the AAEON SRG-IMX8PL embedded
controller (MCU). The MCU is connected via I2C and provides GPIO and
watchdog functionality for the SRG-IMX8PL board.

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
      mfd: aaeon: Add SRG-IMX8PL MCU driver
      gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
      watchdog: aaeon: Add watchdog driver for SRG-IMX8PL MCU

 .../bindings/mfd/aaeon,srg-imx8pl-mcu.yaml         |  56 +++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  10 +
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-aaeon-mcu.c                      | 238 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |   9 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/aaeon-mcu.c                            | 129 +++++++++++
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c                   | 110 ++++++++++
 include/linux/mfd/aaeon-mcu.h                      |  31 +++
 13 files changed, 609 insertions(+)
---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251211-dev-b4-aaeon-mcu-driver-e0e89ebf4afb

Best regards,
-- 
Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>


