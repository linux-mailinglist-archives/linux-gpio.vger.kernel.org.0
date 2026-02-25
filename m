Return-Path: <linux-gpio+bounces-32180-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF3IIHoun2lXZQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32180-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 18:16:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE019B5CB
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 18:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 948BC3048ECA
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 17:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201482288D5;
	Wed, 25 Feb 2026 17:16:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5053D6474
	for <linux-gpio@vger.kernel.org>; Wed, 25 Feb 2026 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039766; cv=none; b=DT32ZqRLZNasYOvohN8gFc3/uRE2AMS8YxEN3dA6Xn4Y76+vFaoAo3o0lnru++NoNKdpedp6Zs83MlOvzvVR8Q66QRZh4lsKBxVtccFysBKNsmjKdSm2qFykAAKZLEPTc/X4vRVFMc9R20x/5+Rd0ZSvdbRxpnOr5YBW4N1Z04s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039766; c=relaxed/simple;
	bh=39U+Pxh8y6kHEC+tAqrkluqCNI10d2YEeBwl00DQQww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFk2a4uVjDPcH/O7IIQcuu5O6UX0McuTd2nrPjJhgFL36YGqtvcrBF3OH6E6NdejGBYXc68CPsTp0zGdYGd33a1eXpF6JAtu36obFUKBebk7kQmqx6YuX7k47fr6+9a5v1xPLxzRZF5SxPjhSlMdwbKFdG0ANR2gjXfmdZMeKDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUF-0003C5-S2; Wed, 25 Feb 2026 18:15:47 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUD-002b7u-21;
	Wed, 25 Feb 2026 18:15:46 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUE-00000008JDQ-3kxo;
	Wed, 25 Feb 2026 18:15:46 +0100
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
Subject: [PATCH v1 0/8] mfd: Add support for NXP MC33978/MC34978 MSDI
Date: Wed, 25 Feb 2026 18:15:33 +0100
Message-ID: <20260225171545.1980385-1-o.rempel@pengutronix.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32180-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:mid]
X-Rspamd-Queue-Id: 02BE019B5CB
X-Rspamd-Action: no action

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

Oleksij Rempel (7):
  dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
  mfd: add NXP MC33978/MC34978 core driver
  dt-bindings: pinctrl: add NXP MC33978/MC34978 pinctrl
  dt-bindings: hwmon: add NXP MC33978/MC34978 hwmon
  hwmon: add NXP MC33978/MC34978 driver
  dt-bindings: mux: add NXP MC33978/MC34978 AMUX
  mux: add NXP MC33978/MC34978 AMUX driver

 .../bindings/hwmon/nxp,mc33978-hwmon.yaml     |  34 +
 .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 119 +++
 .../bindings/mux/nxp,mc33978-mux.yaml         |  55 ++
 .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  66 ++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/mc33978-hwmon.c                 | 439 ++++++++++
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/mc33978.c                         | 749 ++++++++++++++++++
 drivers/mux/Kconfig                           |  14 +
 drivers/mux/Makefile                          |   2 +
 drivers/mux/mc33978-mux.c                     | 119 +++
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-mc33978.c             | 709 +++++++++++++++++
 include/linux/mfd/mc33978.h                   |  97 +++
 17 files changed, 2444 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nxp,mc33978-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
 create mode 100644 Documentation/devicetree/bindings/mux/nxp,mc33978-mux.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
 create mode 100644 drivers/hwmon/mc33978-hwmon.c
 create mode 100644 drivers/mfd/mc33978.c
 create mode 100644 drivers/mux/mc33978-mux.c
 create mode 100644 drivers/pinctrl/pinctrl-mc33978.c
 create mode 100644 include/linux/mfd/mc33978.h

--
2.47.3


