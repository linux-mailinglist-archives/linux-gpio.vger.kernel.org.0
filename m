Return-Path: <linux-gpio+bounces-34609-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDIyFACrzmkgpQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34609-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 19:44:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC51138CAA1
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 19:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51B7E301980E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 17:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF45D3F23A1;
	Thu,  2 Apr 2026 17:44:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A93E3E51C5
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775151852; cv=none; b=II/osk4SZ9Y+2yzvdXmtP+yrqhsCIzdyDXJiiEJAc91paMIw/148IW8TxCQX1rdi5/5TS+G7U8AmnRWBd66QkACGrbuNnUr/TqYzN75awc92/sHJT635uBM7zwd33nI3SGodB+vUYhvv/z5IoiiNDUXtt2sEze5HLNwM3VoXmfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775151852; c=relaxed/simple;
	bh=injS5tQCZXVDTCGWVIa84riP79IKefj1CwX+qSDJL0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AjAGo1rsya656QPuq8U+QLVBXip4ljqxdhpnDpEznEYuK1KcZLPTkpbKfJktLge+d9gS+xcN+cvdxyFp3dkKxMKlkQqtGF+hGWIYRMH1huh+2H67/uOvfYj71UI8WDPYyw6fpQXSG5hD/s0m4O4EQjxsB5ihsetN1jie+p/fHbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w8M59-000534-3n; Thu, 02 Apr 2026 19:43:51 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w8M58-003PUk-0Y;
	Thu, 02 Apr 2026 19:43:50 +0200
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w8M58-0000000DVoz-0Of6;
	Thu, 02 Apr 2026 19:43:50 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v10 0/6] mfd: Add support for NXP MC33978/MC34978 MSDI
Date: Thu,  2 Apr 2026 19:43:43 +0200
Message-ID: <20260402174349.3220518-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34609-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC51138CAA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

changes v7:
- drop gpiolib irq fix and make pinctrl more robust against NULL point
  dereference.

This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
Interface (MSDI) via the MFD framework.

Architecture overview:
* mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
  linear irq_domain. Harvests status bits from SPI MISO MSB.
* pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
  the MFD domain.
* hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
  fault alarms.
* mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
  temperature, VBATP) to an external ADC.

Initial pinctrl implementation by David Jander, reworked into this MFD
architecture.

Best regards,
Oleksij

David Jander (1):
  pinctrl: add NXP MC33978/MC34978 pinctrl driver

Oleksij Rempel (5):
  dt-bindings: pinctrl: add NXP MC33978/MC34978 MSDI
  mfd: add NXP MC33978/MC34978 core driver
  pinctrl: core: Make pin group callbacks optional for pin-only drivers
  hwmon: add NXP MC33978/MC34978 driver
  mux: add NXP MC33978/MC34978 AMUX driver

 .../bindings/pinctrl/nxp,mc33978.yaml         |  158 +++
 drivers/hwmon/Kconfig                         |   10 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/mc33978-hwmon.c                 |  549 +++++++++
 drivers/mfd/Kconfig                           |   15 +
 drivers/mfd/Makefile                          |    2 +
 drivers/mfd/mc33978.c                         | 1088 +++++++++++++++++
 drivers/mux/Kconfig                           |   14 +
 drivers/mux/Makefile                          |    2 +
 drivers/mux/mc33978-mux.c                     |  141 +++
 drivers/pinctrl/Kconfig                       |   16 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/core.c                        |   41 +-
 drivers/pinctrl/pinconf.c                     |    9 +-
 drivers/pinctrl/pinctrl-mc33978.c             | 1008 +++++++++++++++
 include/linux/mfd/mc33978.h                   |   95 ++
 16 files changed, 3143 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
 create mode 100644 drivers/hwmon/mc33978-hwmon.c
 create mode 100644 drivers/mfd/mc33978.c
 create mode 100644 drivers/mux/mc33978-mux.c
 create mode 100644 drivers/pinctrl/pinctrl-mc33978.c
 create mode 100644 include/linux/mfd/mc33978.h

--
2.47.3


