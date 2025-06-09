Return-Path: <linux-gpio+bounces-21113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D09AD1AFB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 11:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA7063ACB6B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 09:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C0D24E00F;
	Mon,  9 Jun 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jSxbRWXy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFEF210F5D;
	Mon,  9 Jun 2025 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462673; cv=none; b=hVqCFETPccSsbZdGUN4JtMdg4WpbdXFPSRmw2hY/PBqOXV8VU5r5SsJ/cpA1VayCgqK58dbz09kUsFKAYQUu+o5IyJo+BcUml2lrn5KlJ4WoucEw0KvnboKomp2fEKxhSxRPdM0mLNTRAl+5h6Sy1pGLqBupCA6m2nZNZBGg5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462673; c=relaxed/simple;
	bh=nImgE5CVNdDvo4EEeogaBIjJpE9opcUwm4OxUrLp1pg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JuE461qPkbcSJoc7+pOG9upfpAu+8jjkA0vy7T4SnGe6JiI9MmlUQ1kmDQ5RvwpgAgK4GM86Qu3/jdn4693MOhCag1jCbIsFzEuku1BrWjsUn9igY9WNh/Xjv1JXh2ae3lp4Vg9yicl22hm7t7Al7RhDunIgRvZi+tfd01+s56s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jSxbRWXy; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E427742E77;
	Mon,  9 Jun 2025 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749462668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/T28OVZPTHMvqRCESA94RIK10vkX72oC12nNQbbmmNw=;
	b=jSxbRWXyhziA3DKekrdmy+cPbITzBYnVU/mfWGT2plg/wlGdMOXHXmfJC6zliIe7O/ieEK
	dOTNVHYmPsGS22hWvGRAZZSyihIw2gqHnmqg4VjNUiH2oD2rfGK2VPiEp2YgVTQR6cJDZJ
	0i0F0F6tDJcpsIoUWUCrJH2GeBRbYoYg6LDmD/qmF8SKBJxA7UwDYBJeRp5oGGyxftsxOJ
	8vXL6YlkuRgtVXO8d/b8xwhL+fcJFYn8+8fjGEmgBO+48KKxxp9+N3EqyhhDL02S41Xqm6
	U08JqZU566byPTM/lQqC3wA2nUtfy1qYEAl2zjnxL4jMhhXOKsoICXwSAANZJw==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v7 00/10] Add pinctrl support for the AAEON UP board FPGA
Date: Mon, 09 Jun 2025 11:50:58 +0200
Message-Id: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKuRmgC/4XS22oDIRAG4FcJXtcw42Gsuep7lF6o6zZCsm7cA
 y0h716zoSQlhb38ZfjmH/DMhlhSHNhuc2YlzmlIuavBvGxY2LvuM/LU1MwECAVWAncu5o5PPff
 ZlYb3qQtjOfBh6vtcRm5fW6ccSFAWWEX6Etv0tSx4/7jlEk9T3TPeHpl3Q+QhH49p3G1m2iLxE
 pBdh/dpGHP5XsrNuExfe6BAXOsxIwculEHrozAk8c3nPB5St62rFnwWv6AGiWYVFBWUhIKiBOd
 IPIPyDqp6xRooK9gqMIZ8AxTjM6geQGFXQVVBL9u2DYgKTfMM6juoYb2hvp5sgbSwRpvmn5PpA
 RSrn2OmCjbBS6PJRxnoL3i5XH4A2+OS5ZACAAA=
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeludegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteeijeduffelvdevuedvieeuvdeugfekgeehjedufefgkedtueduvdffhffggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepffgrnhhivghlvgevlhgvrhhisegrrggvohhnrdgvuhdprhgtphhtthhopehlihhnuhigqdhhrghruggvnhhinhhgsehvghgvr
 hdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

This is the seventh version of this series. Only few changes, the series has
been rebased on v6.16-rc1, the pinctrl patches were dropped as they were
already merged and a fix was added in upboard_pinctrl_dbg_show() to handle
the case upboard_pinctrl_pin_get_mode() returns an error.

Best Regards,

Thomas

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v7:
- all: rebase on v6.16-rc1.
- pinctrl: take Reviewed-by tag
- pinctrl: handle negative error code returned by
  upboard_pinctrl_pin_get_mode() in upboard_pinctrl_dbg_show().
- Link to v6: https://lore.kernel.org/r/20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com

Changes in v6:
- all: take Reviewed-by tags.
- all: fix some nitpicks.
- gpiolib: fix error reported by kernel test robot.
- gpio: aggregator: handle correctly err_ptr returned by
  devm_gpiochip_fwd_alloc().
- gpio: aggregator: rework naming of GPIO fowarder API.
- gpio: aggregator: all functions of GPIO fowarder API now take a gpiochip_fwd ptr as
  parameter.
- gpio: aggregator: fix some typos in kernel-doc and comments.
- gpio: aggregator: in forwarder.h, remove unused linux/gpio/consumer.h and
  linux/gpio/driver.h header files.
- gpio: aggregator: add missing forward declaration in forwarder.h (struct
  gpio_desc and struct gpio_chip).
- gpio: aggregator: get_direction() operation now returns -ENODEV if there is no
  GPIO descriptor for the line.
- gpio: aggregator: handle correctly ptr returned by devm_gpiochip_fwd_alloc().
- gpio: aggregator: free GPIO desc array after gpiochip_fwd_create().
- pinctrl-upboard: remove useless cast in UPBOARD_UP_PIN_MUX() UPBOARD_UP_PIN_FUNC() macros.
- pinctrl-upboard: rework the pinctrl mapping part (new struct upboard_pinctrl_map).
- Link to v5: https://lore.kernel.org/r/20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com

Changes in v5:
- all: improve commit messages, fix some typos and nitpicks.
- pinctrl: machine.h: add "Suggested-by: Andy Shevchenko <andy@kernel.org>"
  and "Reviewed-by: Andy Shevchenko <andy@kernel.org>" tags.
- pinctrl: core: fix kernel doc for devm_pinctrl_register_mappings().
- pinctrl: core: do not cast pointer in devm_pinctrl_unregister_mappings().
- gpio: aggregator: remove a useless check in patch 5/12.
- gpio: aggregator: fix condition to identify if the gpiochip forwarder can
  sleep or not.
- gpio: aggregator: add "Reviewed-by: Andy Shevchenko <andy@kernel.org>" tag
  in patch 10/12
- string_choices: add "Suggested-by: Andy Shevchenko <andy@kernel.org>" and
  "Reviewed-by: Andy Shevchenko <andy@kernel.org>" tags.
- string_choices: add missing parameter for str_output_input() macro.
- Link to v4: https://lore.kernel.org/r/20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com

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
Thomas Richard (10):
      gpiolib: add support to register sparse pin range
      gpio: aggregator: move GPIO forwarder allocation in a dedicated function
      gpio: aggregator: refactor the code to add GPIO desc in the forwarder
      gpio: aggregator: refactor the forwarder registration part
      gpio: aggregator: update gpiochip_fwd_setup_delay_line() parameters
      gpio: aggregator: export symbols of the GPIO forwarder library
      gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd
      gpio: aggregator: add possibility to attach data to the forwarder
      lib/string_choices: Add str_input_output() helper
      pinctrl: Add pin controller driver for AAEON UP boards

 drivers/gpio/gpio-aggregator.c    |  387 ++++++++++++--
 drivers/gpio/gpiolib.c            |   29 +-
 drivers/pinctrl/Kconfig           |   19 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/pinctrl-upboard.c | 1070 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h       |   51 +-
 include/linux/gpio/forwarder.h    |   41 ++
 include/linux/string_choices.h    |    6 +
 8 files changed, 1546 insertions(+), 58 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20240930-aaeon-up-board-pinctrl-support-98fa4a030490

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


