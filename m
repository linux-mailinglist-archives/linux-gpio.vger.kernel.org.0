Return-Path: <linux-gpio+bounces-27390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A8BF70C9
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3DC71899094
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03DB3385A2;
	Tue, 21 Oct 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="Wy6RUOp6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E765D22FDFF
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056676; cv=none; b=JNI4ORi0F9dhBciBN1icpqrO996ejZJKAcjKZ03guM0o4UA0a0ZnBUbCzMYfEk4FAWZSC4aGkU8hdnNaGKPIl7eEhOMxDzSrkJji6/YEBBP1IFZL3qADiw3DvD5Y1ASobA9N8K8g/yDdfmWBg0ebXmtQOHhXznmV20lFuJwCNv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056676; c=relaxed/simple;
	bh=ohQxc9QRortHfyjylGhHg5pwqrzIoB+7Amrx3g6gjTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mkLYV2ghbr0zdPwS/POjIprKRRvOcYE7T3qriCd6PQgyO1xpz4rCSxj8vpVcNv+YHcWtFs83qy7uY0XADFRGquyBPie4BLCuh28DkylgzXTpauppVHZUaaJ3zUNiQMUjtI86ag98G9WV+vMMgIWIFTWFitoyx7lwpD3IoBkfHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=Wy6RUOp6; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id CA54D68A1CB;
	Tue, 21 Oct 2025 16:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761056671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eDBcuRTLNpGudD5KeS5Seips/GXVRZi09VXovBDipw4=;
	b=Wy6RUOp61nyTt1Csv+GVjrswLkebZvZq+WUqh2RdKiHDS4AL36zEc/vvSAuh70QZFP/dxf
	Cs8KPg75TZ0rbYQV0VtINTX5qevEghXH9sBzl9Rjby37MIdESARee7Th8Q8m8pOJWPe0cH
	HNGA/ZvzFAR5jJ0vtah6IH9fEeRbNuWSHrtSTshtijR27sEstdcDvtfMRR+OR02e1P1yaz
	LMiIzVjAl+5bwBDS5hBfj0nuXfdqemvm6jtttznB5aEt/XHYbULm2YGjmrMKrDvksxKdO+
	54iZr/oALFLgVmLHMbcylyZ2KydktBrS9iPY3zwBwir87r63BfW8Nx2wCp2xQg==
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v6 0/8] RTL8231 GPIO expander support
Date: Tue, 21 Oct 2025 16:23:55 +0200
Message-ID: <20251021142407.307753-1-sander@svanheule.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The RTL8231 GPIO and LED expander can be configured for use as an MDIO
or SMI bus device. Currently only the MDIO mode is supported, although
SMI mode support should be fairly straightforward, once an SMI bus
driver is available.

Provided features by the RTL8231:
  - Up to 37 GPIOs
    - Configurable drive strength: 8mA or 4mA (currently unsupported)
    - Input debouncing on GPIOs 31-36
  - Up to 88 LEDs in multiple scan matrix groups
    - On, off, or one of six toggling intervals
    - "single-color mode": 2×36 single color LEDs + 8 bi-color LEDs
    - "bi-color mode": (12 + 2×6) bi-color LEDs + 24 single color LEDs
  - Up to one PWM output (currently unsupported)
    - Fixed duty cycle, 8 selectable frequencies (1.2kHz - 4.8kHz)

The patches have been in use downstream by OpenWrt for some months. As
the original patches are already a few years old, I would like to request
all patches to be reviewed again (and I've dropped all provided tags and
changelogs).
---
RFC for gpio-regmap changes:
Link: https://lore.kernel.org/lkml/20251020115636.55417-1-sander@svanheule.net/

Patch series v5 (June 2021):
Link: https://lore.kernel.org/lkml/cover.1623532208.git.sander@svanheule.net/

Sander Vanheule (8):
  gpio: regmap: Force writes for aliased data regs
  gpio: regmap: Bypass cache for aliased inputs
  dt-bindings: leds: Binding for RTL8231 scan matrix
  dt-bindings: mfd: Binding for RTL8231
  mfd: Add RTL8231 core device
  pinctrl: Add RTL8231 pin control and GPIO support
  leds: Add support for RTL8231 LED scan matrix
  MAINTAINERS: Add RTL8231 MFD driver

 .../bindings/leds/realtek,rtl8231-leds.yaml   | 167 ++++++
 .../bindings/mfd/realtek,rtl8231.yaml         | 189 ++++++
 MAINTAINERS                                   |  10 +
 drivers/gpio/gpio-regmap.c                    |  18 +-
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-rtl8231.c                   | 285 ++++++++++
 drivers/mfd/Kconfig                           |   9 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rtl8231.c                         | 193 +++++++
 drivers/pinctrl/Kconfig                       |  11 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c             | 538 ++++++++++++++++++
 include/linux/mfd/rtl8231.h                   |  71 +++
 14 files changed, 1500 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
 create mode 100644 drivers/leds/leds-rtl8231.c
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

-- 
2.51.0


