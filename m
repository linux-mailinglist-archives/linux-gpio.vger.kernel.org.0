Return-Path: <linux-gpio+bounces-18948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEF2A90586
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A49517A87DA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B281FF603;
	Wed, 16 Apr 2025 14:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DO/oro8q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0F21FF1C7;
	Wed, 16 Apr 2025 14:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812014; cv=none; b=jHotXxqGyx4HbAm7fHnt+fSOxfKxbd+6450wIKuQ4eOyXmAT1nWp4EWRga06agK2i9FyOVTYaOVl7X+GqTAp9XzvrIKh4ePu6OalLlyuAFB0pnuzSZ7xnUl1u962aHTPIBP6oFIxl/udrc4DpJmEkaCViRsAVcbo0fDaJXaR2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812014; c=relaxed/simple;
	bh=acZWUNUstLS3rcxH4jX04lLr8HXhvw5OT8YhEvhUs9c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YNbLGxFuDBzMm1GirmPJHYOG+ixTAc72V5xOFrAkQUv4nH27iEvGmfsLRqHjaxEmhQG4U9Z/XZzgkAP1buoDdpaysxAHketBrlxU5UFoduboMX8r6gaOAgi4e+C/CWKwmC4Qx6XsL3oXfczSWwFHtsG9l6anpD+gnGqRg5DotTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DO/oro8q; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B7DA43B6C;
	Wed, 16 Apr 2025 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GihNrT0PJupAbIaxTnEyKq6XRuBArLJG1GnDF686+ek=;
	b=DO/oro8q9D82axQbnYMZc1WBlTONx0l203BLicTA4xdjFKVjqqYNF1M0ScfRX0GDf9+TJ6
	ahsXCxLjMdVhwd1L1/z9caKW/wxTDIJdeKoPFerha0ZeRUcPMvtdsb06R3Mx9gfo7vCbWH
	B4ha2/fvQ6A59rEMbCgZQ/k1jfeKccxb2veQ1CrEjlppvBWjZId/inuvfpnNig0GhPGUFt
	53MNZJ1WwwIHi927k3noZIwdX0i/6fUGino01HQaj/K6qWYKBx+gg1FCALfBrHmPhLYR99
	4lHbCDZfU5QMEGvXyaSz3l/Ug0k1N2EM4g57w2YRg+WVhuAk2b29FGhtNw6K9A==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v3 00/10] Add pinctrl support for the AAEON UP board FPGA
Date: Wed, 16 Apr 2025 15:59:52 +0200
Message-Id: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANi3/2cC/4WOwW7DIBBEf8Xi3I3YxcF1Tv2PqgfsbBqkBOiCU
 avI/17iqIeecnyj0Zu5qcziOatDd1PC1WcfQwPz0qn57MIngz82VqSp16PR4BzHAEuCKTo5QvJ
 hLnKBvKQUpcD4enK900b3o1ZNkoRP/nsbeP94sPDX0nbKI1STywxzvF59OXTV7nAPMpO6l88+l
 yg/27mKW/v+Awnx2Y+KoIH6AceJabAG36YYy8WHXZva5JX+hHttcHgqpCY0Fsmy0c5Z+i9c1/U
 XeZgoA0wBAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteeijeduffelvdevuedvieeuvdeugfekgeehjedufefgkedtueduvdffhffggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggstdelmegutdegjeemleeifegrmedvvghfudemudejieemjegsgedumedufhhfkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggstdelmegutdegjeemleeifegrmedvvghfudemudejieemjegsgedumedufhhfkedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhrt
 ghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

This is the third version of this series (rebased on v6.15-rc2).

The gpiolib part has been reworked, the gpiochip_add_pin_range() was
renamed to gpiochip_add_pin_range_with_pins() and a new pins parameter was
addded. Two stubs were created to add consecutive or sparse pin range.

For the forwarder library, a namespace was added and patches were splitted
to more simpler changes.

In the pinctrl core, the function devm_pinctrl_register_mappings() was
created.

No big changes in the upboard pinctrl driver, only few fixes and
improvements.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v3:
- pinctrl: add devm_pinctrl_register_mappings()
- gpiolib: rename gpiochip_add_pin_range() to
  gpiochip_add_pin_range_with_pins() and add pins parameter
- gpiolib: add stubs gpiochip_add_pin_range() and 
  gpiochip_add_sparse_pin_range()
- aggregator: split to more simpler patches
- aggregator: add a namespace for the forwarder library
- aggregator: rename header file to forwarder.h
- aggregator: add some missing headers and declaration in forwarder.h
- aggregator: forwarder.h provides consumer.h and driver.h
- aggregator: fix error code returned by gpio_fwd_request()
- pinctrl-upboard: fix order of header files
- pinctrl-upboard: fix some nitpicks
- pinctrl-upboard: rework macros to define pin groups
- pinctrl-upboard: add missing container_of.h and err.h header files
- pinctrl-upboard: handle correctly pointer returned by dmi_first_match()
- pinctrl-upboard: use devm_pinctrl_register_mappings()
- pinctrl-upboard: import GPIO_FORWARDER namespace
- Link to v2: https://lore.kernel.org/r/20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com

Changes in v2:
- mfd: removed driver (already merged)
- led: removed driver (already merged)
- gpio-aggregator: refactor code to create a gpio-fwd library
- pinctrl: refactor gpio part to use the gpio-fwd library
- pinctrl: add pinctrl mappings for each board

---
Thomas Richard (10):
      gpiolib: add support to register sparse pin range
      pinctrl: core: add devm_pinctrl_register_mappings()
      gpio: aggregator: move GPIO forwarder allocation in a dedicated function
      gpio: aggregator: refactor the code to add GPIO desc in the forwarder
      gpio: aggregator: refactor the forwarder registration part
      gpio: aggregator: update gpiochip_fwd_setup_delay_line() parameters
      gpio: aggregator: export symbols of the GPIO forwarder library
      gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd
      gpio: aggregator: add possibility to attach data to the forwarder
      pinctrl: Add pin controller driver for AAEON UP boards

 drivers/gpio/gpio-aggregator.c    |  221 +++++---
 drivers/gpio/gpiolib.c            |   29 +-
 drivers/pinctrl/Kconfig           |   18 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/core.c            |   37 ++
 drivers/pinctrl/pinctrl-upboard.c | 1071 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h       |   51 +-
 include/linux/gpio/forwarder.h    |   63 +++
 include/linux/pinctrl/machine.h   |   10 +
 9 files changed, 1408 insertions(+), 93 deletions(-)
---
base-commit: 8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd
change-id: 20240930-aaeon-up-board-pinctrl-support-98fa4a030490

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


