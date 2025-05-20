Return-Path: <linux-gpio+bounces-20334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D83CFABD955
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A3633BB423
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 13:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D8E242923;
	Tue, 20 May 2025 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ic7Xe/ms"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3FFDDAB;
	Tue, 20 May 2025 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747732; cv=none; b=J4mgci6Jh8xL7w21AahOMVr7iEjUby8d4uOvSDHltmvn1kqZS1z7M5rRyZ1uRSE6880it2GEyY03RY58K1c6k4VDOK+5EXRDh1ED5BVUMvStykrTQ1s36PJf+7ERxXOXL8QRNAaUnytdXaLCWcAVyX92ZZSj5jG2xNrYfDm0E1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747732; c=relaxed/simple;
	bh=IK8/ts1xVxaVfdy8B1KewsHXLlv8M26E/kz/1qUPEBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fa9j5y8NDyLaEeHc7+WgmoBMwnlqRKUe8fxNGIbHmTr1DOSkF7rXCyQSDlWJjDp1L87B3G4ilmDLBFXyeKzktctJcWedhT9Vr+wQ9nT4S7NzbLILAmTeXThwUB2OeUv61tqVoiR6VqCJX+NTuwCTPTDDpQcur+KmqvW/TV6OVHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ic7Xe/ms; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 044EF43AF9;
	Tue, 20 May 2025 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747747723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U5+ddWY+IAjr33UpPNdZYDm+GxijJ/BwA+uhRUf/vYE=;
	b=ic7Xe/ms6Pv1dOym5LkF75O5Z6sb4VWwnBNb+yM+bfhpuzduH8rnpnvFLvB/AaqKUr43Pt
	KFFMYgvdG9bL1XA7pPO3Cqr7TpNY9jPV/k1f39wC3uEQPB0qI6E2y/TTACTT84/Vs+WV7X
	5P57TndBhc0wNIW/2zCBWoMzPGhsFXnEce132G+Dk3vXCANNnY72xSwQpHXOcrKevlTVGl
	OBZwslBFxumsVLEy8710fWiBMajbvP7XLUxLaXPTeooZS/CHrO0dj0ws+kAJ23ZGqVI038
	F2fEsb6SlbunUlmluCflvBb8ki8wtJeUM16iis794hSyuAGeX4sSptBwd67F5w==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v6 00/12] Add pinctrl support for the AAEON UP board FPGA
Date: Tue, 20 May 2025 15:28:24 +0200
Message-Id: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHiDLGgC/4XPTWrDMBAF4KsEraswo98qq96jdCHZUiNILEeWT
 Uvw3Ss7lJR64eUMw/fe3Mngc/QDOR3uJPspDjF1dVAvB9KcbffpaWzrTBgwAYYDtdanjo49dcn
 mlvaxa0q+0GHs+5QLNa/BCgschAFSkT77EL/WgPePx5z9baw55bEkzg6eNul6jeV0mNQRJc0NI
 8vxOQ4l5e+13ITr9dIDGeJejwkpUCY0GueZVhzfXErlErtjjVrxif2CEjjqXZBVkCtkynOwVrE
 tyJ+gQLUL8goGAVor14LyfguKPyAzu6CooOMhhAZRoG63oHyCEvYbyuVlA0oyo6Vu/708z/MPp
 qBBvj8CAAA=
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeetieejudffledvveeuvdeiuedvuefgkeegheejudefgfektdeuuddvfffhgffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepffgrnhhivghlvgevlhgvrhhisegrrggvohhnrdgvuhdprhgtphhtthhopehlihhnuhhsrdifrghll
 hgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepifgrrhihhggrnhhgsegrrggvohhnrdgtohhmrdhtfidprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

This is the sixth version of this series. The main change is the rework of
the GPIO forwarder API as requested by Geert to have more consistent naming
and parameters.

More details in changelog.

Best Regards,

Thomas

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
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

 drivers/gpio/gpio-aggregator.c    |  387 ++++++++++++--
 drivers/gpio/gpiolib.c            |   29 +-
 drivers/pinctrl/Kconfig           |   19 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/core.c            |   29 +
 drivers/pinctrl/pinctrl-upboard.c | 1068 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h       |   51 +-
 include/linux/gpio/forwarder.h    |   41 ++
 include/linux/pinctrl/machine.h   |   19 +-
 include/linux/string_choices.h    |    6 +
 10 files changed, 1588 insertions(+), 62 deletions(-)
---
base-commit: 8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd
change-id: 20240930-aaeon-up-board-pinctrl-support-98fa4a030490

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


