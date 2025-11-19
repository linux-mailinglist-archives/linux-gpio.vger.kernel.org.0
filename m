Return-Path: <linux-gpio+bounces-28842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 815F3C7100E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 21:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3057D34580A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 20:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDAA33C19E;
	Wed, 19 Nov 2025 20:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="9U12hHwI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8F52F2916
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 20:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582601; cv=none; b=li5R17xUhPhByWr1KQrELw5ze7RxntEYrsB8LkmO26T+VO0SEZ//VM5pRwan3NTJ+HeC7/ZlmnsL2EL23vJZkZ36LKPdgisPduxUTinG5u88OC0jCpZVhLoNj3q0/X9PTNpf/xLvoNw15Z/yUiE0KeB4+pOmbnnc/IUZ0KHJwMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582601; c=relaxed/simple;
	bh=GCif+pKF/lsX6EjX8V714yeWZ7HYffEyJjgwmzBFFm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tgshXT01j690HQlf2y5x4c+x6Hp9Hnq7QB0LNIXJXx8pWufN4DKPVLB4eQbombJyA16K2RJHmJQezUu9NmwLna+wqOiCySjbv6BT1qhPn4S/h6jA/lwgBkrstdAiG+A2SrCdAjpIVZhvG/7owhB2+jVPm0W/Bd/Qv4BPuRcwL4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=9U12hHwI; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 6DF9B6A1E96;
	Wed, 19 Nov 2025 21:03:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763582594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mHCRlCQgVco9K9Myzqy8krKvkuBmOsAKoOiEI0pkqs8=;
	b=9U12hHwIJ04WrHQ70REUgyFM4oYndegIH1OJvG+sFlYrIX3lCBJJGOOU/Gg10g6nolP2uS
	Dax9jbS81eMoILi31kKLHV8lW+KJBtBUqBhanOKBjoXQ9GPZfK5hs+h6ryXzrAXPCSS2Zv
	Mh9PdgOKGkxbiPwUNM6Vkdh5aoCxyf14iYW51K1OrHpg1AEKRn8gbIiK4mb8uYLrlXfHph
	ZkIhmqJ2bYg4mXz5j4dqj1QTQI+FIyG8H8yKsEsGUsdvyAcBse3hO3mKzkXd/fvc0vV3Iq
	h8vV5dTgEIyh4ilTuaAr0lqh9aEpz7q6Shjp381hyPx/q5ypMG+OariU3EkVyw==
From: Sander Vanheule <sander@svanheule.net>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v8 0/6] RTL8231 GPIO expander support
Date: Wed, 19 Nov 2025 21:02:59 +0100
Message-ID: <20251119200306.60569-1-sander@svanheule.net>
X-Mailer: git-send-email 2.51.1
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
changelogs until v6).

---
Changes since v6:
Link: https://lore.kernel.org/lkml/20251021142407.307753-1-sander@svanheule.net/
- Drop already merged regmap_gpio changes
- Devicetree bindings:
  - Relax description formatting
  - Use absolute paths for schema references
  - Enforce address format for led node names
  - Add pinctrl properties to led-controller node in example
- mfd driver:
  - Small code refactors, variable renames
  - Header include sorting
  - regmap/regcache usage updates
- pinctrl driver:
  - Fixed build issue on 64b platforms
  - Simplify safe direction startup config
  - Add GPIOLIB dependency

RFC for gpio-regmap changes:
Link: https://lore.kernel.org/lkml/20251020115636.55417-1-sander@svanheule.net/

Patch series v5 (June 2021):
Link: https://lore.kernel.org/lkml/cover.1623532208.git.sander@svanheule.net/

Sander Vanheule (6):
  dt-bindings: leds: Binding for RTL8231 scan matrix
  dt-bindings: mfd: Binding for RTL8231
  mfd: Add RTL8231 core device
  pinctrl: Add RTL8231 pin control and GPIO support
  leds: Add support for RTL8231 LED scan matrix
  MAINTAINERS: Add RTL8231 MFD driver

 .../bindings/leds/realtek,rtl8231-leds.yaml   | 136 +++++
 .../bindings/mfd/realtek,rtl8231.yaml         | 199 +++++++
 MAINTAINERS                                   |  10 +
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-rtl8231.c                   | 285 ++++++++++
 drivers/mfd/Kconfig                           |   9 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rtl8231.c                         | 193 +++++++
 drivers/pinctrl/Kconfig                       |  12 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c             | 533 ++++++++++++++++++
 include/linux/mfd/rtl8231.h                   |  71 +++
 13 files changed, 1461 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
 create mode 100644 drivers/leds/leds-rtl8231.c
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

-- 
2.51.1


