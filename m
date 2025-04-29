Return-Path: <linux-gpio+bounces-19453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8A0AA0E33
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 16:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 920A71B63293
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 14:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07032D29A8;
	Tue, 29 Apr 2025 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c5d2yTg+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76C52C17AE;
	Tue, 29 Apr 2025 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935713; cv=none; b=b6cgBhLdoMN+YvTsYekpj7I7dDSnXs+Jkkm3IbBlbizpU2pqFpQl+AC7ZtsUeASOJ8+WXLYoJfSp0h40n8He2NCt5p94wWgymz4hTz1PaEi95ayweW3gvvsmgKW2evhRMMMwseNqEtuJLOyN/kIYc0Qe6sX9ctlX6s/fl8rhfYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935713; c=relaxed/simple;
	bh=a/KaADWjzPD1n6XSIisEkuXyI9Rpb5lCP8//NIJqlZw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OuKiWI3Ll3OLX4liyc4h5E1lpnQqBxu1dp+eirFWaGNkuY4N2w1AeITrBiH590LiRC++ylJq1eM5hHlARHvUmS/fO1o8K7StZA23V8Zd3BKZGbmvXWpaTlHoS0yjt86H1h2CayAZ7aK+K056KfzOiky1s1JKCx0lUGOAs5JGI/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c5d2yTg+; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D3F5438C6;
	Tue, 29 Apr 2025 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745935708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ATsPUSdXr60F20JAZF5BOD3B44pL6Xwbcrn3rluDAJA=;
	b=c5d2yTg+LJwLH26q4ShU3GUXiRLNl6PLZemPbA5pqVpL0f5XSmdHf7Lb80A5VjVHLykEio
	qbIOwwtDaSODRVlaTCaYUXQHdEMwO857sshqdG9GSwx/KtaXVtSUFEi4AKrBnOOw7jAvV6
	1g/RBnFn2jQ6As5ZWZoXEH7s+YvZIKjqbdvSfgxCpsEuXOd0guAtERieP6vdB6vOgD+nga
	GiHaYQhcfqLjVuWLZdgH62qqZ4uZfphVBFKfJHyx5Ii6vi5eWQm/SO22FTvW/8GAGDuvPl
	YKSmQbZ62lO8PzuU6JA0j9XFpsTX+rrQAGm94vXaQ46NQQ9gIqHKWjC8ysa/5A==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v4 00/12] Add pinctrl support for the AAEON UP board FPGA
Date: Tue, 29 Apr 2025 16:08:14 +0200
Message-Id: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7dEGgC/4XOQU7DMBAF0KtEXjPVjO3apCvugVg4yYRaamNjO
 xGoyt1xUyGEWGT5R6P3/01kTp6zODU3kXjx2YepBv3UiP7spncGP9QsJEqNrUJwjsMEc4QuuDR
 A9FNf0gXyHGNIBdrn0WmHCnWLoiIx8eg/t4LXt0dO/DHXnvI4is5lhj5cr76cmsUc6Aipl+L+f
 Pa5hPS1jVto+77vIEm0t2MhQJDaUtuxtEbRSxdCufjpUKs2fJE/4BEV2V1QVlAZkoYVOmfkf1D
 9gprMLqgqOGq01nQDGua/4Lqu3wDao+OdAQAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 linux-hardening@vger.kernel.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieegtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteeijeduffelvdevuedvieeuvdeugfekgeehjedufefgkedtueduvdffhffggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehlihhnuhigqdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhto
 heprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.richard@bootlin.com

This is the fourth version of this series.

The main change is the way the forwarder type is exported, now gpiochip_fwd
is an opaque structure.
In the forwarder, a valid_mask was added to track registered GPIO
descriptors, and it is now possible to remove a GPIO at runtime using the new
gpio_fwd_gpio_free() helper.

Two new patches were added, the first one to remove extern specifier in
machine.h, the second one to define new helpers str_input_output() and
str_output_input().

Other minor changes address Andy's comments, see below for more details in the
changelog.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v4:
- gpiolib: use positive conditonal in gpiochip_add_pin_range_with_pins().
- pinctrl: fix warning reported by kernel robot in
  include/linux/pinctrl/machine.h.
- pinctrl: add a patch to remove the extern specifier in machine.h.
- pinctrl: use devm_add_action_or_reset() in
  devm_pinctrl_register_mappings().
- string_choices: add a patch to define str_input_output() and
  str_output_input() helpers.
- gpio: aggregator: set gpiochip_fwd as opaque and define getters
  gpio_fwd_get_gpiochip() and gpio_fwd_get_data().
- gpio: aggregator: add valid_mask in gpiochip_fwd struct to track already
  registered gpio descs.
- gpio: aggregator: add gpio_fwd_gpio_free() helper.
- gpio: aggregator: add kdoc sections for exported functions.
- gpio: aggregator: fix some nitpicks.
- pinctrl-upboard: use str_input_output() helper.
- pinctrl-upboard: fix some nitpicks.
- pinctrl-upboard: add missing headers stddef.h and types.h.
- pinctrl-upboard: add intermediate cast (unsigned long) for dmi_id->driver_data.
- pinctrl-upboard: use getter gpio_fwd_get_gpiochip() and
  gpio_fwd_get_data().
- pinctrl-upboard: fix kernel robot warning 'unmet direct dependencies detected
  for GPIO_AGGREGATOR when selected by PINCTRL_UPBOARD'.
- pinctrl-upboard: use gpio_fwd_gpio_free() helper.
- Link to v3: https://lore.kernel.org/r/20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com

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
Thomas Richard (12):
      gpiolib: add support to register sparse pin range
      pinctrl: remove extern specifier for functions in machine.h
      pinctrl: core: add devm_pinctrl_register_mappings()
      gpio: aggregator: move GPIO forwarder allocation in a dedicated function
      gpio: aggregator: refactor the code to add GPIO desc in the forwarder
      gpio: aggregator: refactor the forwarder registration part
      gpio: aggregator: update gpiochip_fwd_setup_delay_line() parameters
      gpio: aggregator: export symbols of the GPIO forwarder library
      gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd
      gpio: aggregator: add possibility to attach data to the forwarder
      lib/string_choices: Add str_input_output() helper
      pinctrl: Add pin controller driver for AAEON UP boards

 drivers/gpio/gpio-aggregator.c    |  344 +++++++++---
 drivers/gpio/gpiolib.c            |   29 +-
 drivers/pinctrl/Kconfig           |   19 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/core.c            |   27 +
 drivers/pinctrl/pinctrl-upboard.c | 1068 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h       |   51 +-
 include/linux/gpio/forwarder.h    |   51 ++
 include/linux/pinctrl/machine.h   |   20 +-
 include/linux/string_choices.h    |    6 +
 10 files changed, 1538 insertions(+), 78 deletions(-)
---
base-commit: 8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd
change-id: 20240930-aaeon-up-board-pinctrl-support-98fa4a030490

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


