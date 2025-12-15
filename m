Return-Path: <linux-gpio+bounces-29586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44085CBF4C4
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 18:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63F5F3000963
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 17:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D4D3242B4;
	Mon, 15 Dec 2025 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="P0uuvtuo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902272DCC13
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765821091; cv=none; b=sbTJih8vINfyniz7rlt09Tq7fuRY4mIJnt206xc2l5YdDGjiKJwFHvTA6mez9YF+zLmhdguMmUnmYL5B43HxlhKmLoWOIyjCbKMn9ljki5o4buxWI5g/kCaIV0uchrPzScN/17BEmt2taSFLymmvDA71nEj1TnxPt7oAX3FS+Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765821091; c=relaxed/simple;
	bh=hGESFDHN0cScS8HX+PUDAVWfBBgxxynfSPIQOpSViA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ItRTfruirL4IvqB/aS2VqGStX/hmsQax/Z2Jzttwno8wSMH8sEx06cIrsi5EuV/3y6cfJDfaR9pzV6hVzY49E88vk2U7aqaH9MWjlZ8jWO35LnbBni2jNSMhig+m0jAmE6Npj8J8XblG4MDyPNyrL/usJJm9oIt9dP/d6NNZshc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=P0uuvtuo; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 94F186B1FA2;
	Mon, 15 Dec 2025 18:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1765821082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PWl1EwvinAHVTukioGc0f8nDw4G1d0vgl+v+BhLtPtY=;
	b=P0uuvtuoGH9ZF+BF55NOtW8Fnw7NA2+uq808mfAvxGEjNGzo1owS/Wxj9K9F3DeBjesEy5
	BYVbVyJ1xPoRfw+iW/bV+UFrWdFi9zIGs73dkBAG1+IJtuiTsAVnbUo17cBVaDMdFY/LyM
	qcS13qUzACyjyo0sPNH6ac/BYQeQmq1h3DQgKrL7+JEalMspeJQ/FmkY/0FWVb4oVGA7bw
	kEch30x2SsYmZgtlpkamXIi1A6U95uldN2mDBv1/AysnvWv05qosQWqux95t2yhDTv1cTt
	q6YrzE5o0kwJLdCzDJhgKNQ1g+MwtwhaxlWRClsp9cNdJ6dF5H5CqtBntg0VCg==
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
Subject: [PATCH v9 0/6] RTL8231 GPIO expander support
Date: Mon, 15 Dec 2025 18:51:08 +0100
Message-ID: <20251215175115.135294-1-sander@svanheule.net>
X-Mailer: git-send-email 2.52.0
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
Changes since v8:
Link: https://lore.kernel.org/lkml/20251119200306.60569-1-sander@svanheule.net/
- Rebase on top of v6.19-rc1
- Drop no longer needed __maybe_unused for PM functions
- No abbreviations in user messages
- Replace {0,RTL8231_REG_COUNT-1} with RTL8231_REG_{START,END}
- Replace led_start regmap_field with direct regmap operations
- Replace SIMPLE_DEV_PM_OPS with DEFINE_SIMPLE_DEV_PM_OPS
- Switch to REGCACHE_FLAT_S for improved cache performance

Changes since v7:
Link: https://lore.kernel.org/lkml/20251117215138.4353-1-sander@svanheule.net/
- All drivers can now be built independently with COMPILE_TEST
- Fix storage size of pinfunction flags in a more compatible way
- Add missing OF dependency to pinctrl driver
- Improve referenced properties in bindings

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
 drivers/mfd/rtl8231.c                         | 188 ++++++
 drivers/pinctrl/Kconfig                       |  12 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c             | 533 ++++++++++++++++++
 include/linux/mfd/rtl8231.h                   |  73 +++
 13 files changed, 1458 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
 create mode 100644 drivers/leds/leds-rtl8231.c
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

-- 
2.52.0


