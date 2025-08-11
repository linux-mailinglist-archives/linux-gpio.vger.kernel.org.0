Return-Path: <linux-gpio+bounces-24174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C42EB20A14
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 35FCF4E3342
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1922DE718;
	Mon, 11 Aug 2025 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LnIg0dnQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9283B23BCFD;
	Mon, 11 Aug 2025 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918762; cv=none; b=YEaWtPOdGAgi7ox/fKFtIctv1DqP3kniD3Y50f9ywtU6YgABjRtQf7HdqmkkM0WeHSJFCp2gZcLEZCX6nPC2/ttj498uQhbe3tGwik0cXeQVnvrIkgT6ozHpwBIU0GIrCO+xH8gu3T0tYfAbS3y2jQ9zTg9u83WTcL5wcD97NGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918762; c=relaxed/simple;
	bh=/gI2JxfbVbWk7tAn0cbN+JHXIFzyzOVYEhtl3mVOR3w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nP5fzO9ER2BG8HBGOdda2sYWlEAooslO4Vl1q46ghDpEmh9KMNpsthm7P+Y0dNOmaW6cT6Vp4NIMTzfvV1PmOJ8Zz3pWYEb2w3NqDYlaWzWXuWfh10TpgWRR4apf+HYNHaP7yPAqJ6qwYoHj4XGlUIECo1q4PT6sLtKQ8tHiHOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LnIg0dnQ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACF0643B28;
	Mon, 11 Aug 2025 13:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754918751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YtiWCv7MEt6DrdhtkW8sAluwU3+rc+LIxmBXifc7Ess=;
	b=LnIg0dnQAuMuKHwLqWgtq+Ygs1/ivlPaG+Eyn+LtfX+fTlm/6ohK9C+SFbHRvIXFOjGrgo
	pApE8H1Ht03ewMiWVhanSewWhYXP/uaLBEYd4lTkJwQGfYbMXXv1/8G5RFAVi6vyIx4KW+
	Jf8p2bnU451gLmKGBm2YbeOL2gR5OY7oiRColmNQ+YFhFrlciwB7bgC4W2WWjpK0Ts1w7Y
	KqbehSErTfp7rA8S7kQWu5QE6w/+8JTNN4IK20/a52YVMMynUOAVVR9ipVVKtTcowkyuvv
	asEbRFODYreV0joz4TF1q6lkBghvVrs2kwDCgSTc7bC7yXvejA1IZSxQB/r6Rw==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v9 00/10] Add pinctrl support for the AAEON UP board FPGA
Date: Mon, 11 Aug 2025 15:25:43 +0200
Message-Id: <20250811-aaeon-up-board-pinctrl-support-v9-0-29f0cbbdfb30@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfvmWgC/43SzWrDMAwH8FcpPs9F8mfc095j7GA79mpo49RJw
 0bpu89NGS3LIDvKmN9fQrqQIZQUBrLbXEgJUxpS7mphXjbE7233EWhqa00YMAGGA7U25I6ee+q
 yLS3tU+fHcqDDue9zGalpohUWOAgDpCJ9CTF9zgFv7/e6hNO55oz3R+LsEKjPx2Mad5tJbVHT4
 pHcPu/TMObyNTc34fz71gcyxLU+JqRAmdBoXGBacXx1OY+H1G1r1IxP7AeUwGvoGsgqyBUyFTh
 Yq9gS5A9QoFoFeQWjAK2Va0GFsATFE8jMKigq6HiM0SMK1O0SlA9QwnqH8jayASWZ0VK3f4ysn
 kC2ehyTqmDrHddSucC9WoL6ASpYH1lXEK3TPHjwzjRLsHkC/3E2zbxlwxGlNCb+Wsr1ev0GrUt
 GljIDAAA=
X-Change-ID: 20240930-aaeon-up-board-pinctrl-support-98fa4a030490
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 linux-hardening@vger.kernel.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedvheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteeijeduffelvdevuedvieeuvdeugfekgeehjedufefgkedtueduvdffhffggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrtghpthhtohepffgrnhhivghlvgevlhgvrhhisegrrggvohhnrdgvuhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsr
 ghssehglhhiuggvrhdrsggvpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

This is the nineth version of this series. I rebased it on v6.17-rc1 (the
only one conflict was in gpio-aggregator due to set() callback migration)
and added AB from Linus.

Best Regards,

Thomas

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v9:
- all: rebase on v6.17-rc1.
- all: take "Acked-by: Linus Walleij <linus.walleij@linaro.org>".
- Link to v8: https://lore.kernel.org/r/20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com

Changes in v8:
- gpio: aggregator: add missing export.h header file.
- Link to v7: https://lore.kernel.org/r/20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com

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

 drivers/gpio/gpio-aggregator.c    |  388 ++++++++++++--
 drivers/gpio/gpiolib.c            |   29 +-
 drivers/pinctrl/Kconfig           |   19 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/pinctrl-upboard.c | 1070 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h       |   51 +-
 include/linux/gpio/forwarder.h    |   41 ++
 include/linux/string_choices.h    |    6 +
 8 files changed, 1547 insertions(+), 58 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20240930-aaeon-up-board-pinctrl-support-98fa4a030490

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


