Return-Path: <linux-gpio+bounces-17691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B20A655E8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 16:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84F913BA0EF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 15:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99D5248195;
	Mon, 17 Mar 2025 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="P6svpqRI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D972904;
	Mon, 17 Mar 2025 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225902; cv=none; b=BPjIIksLxGOB3dgGix0KdpOamoUTdztAaw5NjKWInau8yOTydxtALSxOvRrh8Ga+eodSg6JK05bk/JbXuSAY+DeJCNnlmlwJTHCQsuyM0aanj9TkMRpSjGexLlpzXHm1wMgMOxxE3Bz6dn1ete+gyJ6dYrL04WrKmtg1HuweFH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225902; c=relaxed/simple;
	bh=s12ge09d1GlLMEJ2ngfua0Z1fx1J6y8gIiscmDzcxUQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IKOjTeh0YJAxGI8NNBabQt3LhA32A4s86rx2WdJ5bro5EMT8dA8v9CCWl59vJKjqLNqvzi7lRrae7mouEbKJi3MEcFByTrWd/enkhNLKQ6QCtV4zY9jZivehvXwS6gWq/33Aj+AAw9XwJ03WVguFNu9vJbs8b2fp0YKHF/J4CWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=P6svpqRI; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BCB42057D;
	Mon, 17 Mar 2025 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742225898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O8ft0GzGbPttRTS0T7zPtvsUAiS1QtVQEO1PfLmOTOc=;
	b=P6svpqRI05SbFtU4t9IGyZuFZ+akkOGyQjMlbk7+aWZUNV6PTdfkucMip1sA7GrIdSMPj6
	0NGQcKHquUe55XVQdtp7wcHWpbwtjzyN95RJT7y3yKaF6KreMZsU0TILOYna/zzGPr4jkG
	KAZq01uhjNVhEhwKd7oI53sSN9CqsKeHMzsY/BIU7/8EDKw8h1c9wym6j6hA653/r54uk5
	+2oszxakdwNltnFkyKcxt9hkI0fVORdeU0QxiB35YuCAzu9P7SzfPunKsECMQEsrMRfrR9
	2UNxbIamt9GjGiRVrE0Hs7jJQAs22TwjrsuVec0fU+zd+Jr3REM2Y6mM18NECg==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH RFC v2 0/6] Add pinctrl support for the AAEON UP board FPGA
Date: Mon, 17 Mar 2025 16:37:58 +0100
Message-Id: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANZB2GcC/4WOQY7CMAxFr1J5jVGSRpSyGmkkDsAWsUiLAUuQB
 CetQKh3J3Rmz/LbX/+9FyQSpgSb6gVCIycOvgSzqKC/OH8m5GPJYJSxqq0VOkfB4xCxC06OGNn
 3Wa6YhhiDZGzXJ2edqpVtFZSRKHTixwzYw277C4e/o9B9KLD8/+lcIuzD7cZ5U42rpbYofTOXL
 5xykOdsOOq5/ZHRRutvMqNGhcY2uu3INKta/3Qh5Cv7ZUHBYZqmN8JsC7AAAQAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtfeejjeehjeetgffhffdttddvffelffejgfeuhfehgeekteefffefleevuddtgeenucffohhmrghinheprggrvghonhdrtghomhenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 heplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsiigvfihskhhisehlihhnrghrohdrohhrghdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghu
X-GND-Sasl: thomas.richard@bootlin.com

Second version of this series. I removed MFD and LED drivers as they were
already merged. It is in RFC state as I would like some feedback before to
add support for more boards, and to do some cleanup.

After some discussions with Andy, the preferred solution is to set the
pinctrl upboard driver as a consumer of SoC pins. Each supported has its
pinctrl mappings, the right mappings are registered and enabled (board is
identified using DMI table).

The hog mappings were removed because by default the FPGA is configured
correctly (thanks to the BIOS) for its board.

As requested by Linus, the GPIO part was reworked. The gpio-aggregator
driver was refactored to create a new library (gpio-fwd) which allows other
drivers to create gpiochip forwarder. The upboard pinctrl driver registers
a gpiochip forwarder, then requests and registers SoC GPIOs at runtime, and
forwards all GPIO accesses to the right gpiochip.

Linus, I know you were not ok with the gpiochip_add_pinlist_range()
function, but as we did not understood each other I kept it, so we can
continue the discussion.

The pinctrl drivers supports FPGA for two types of boards, UP and UP2 (UP
Squared). For now I only added pinctrl mappings for the "UP Squared" board
[1] (I selected this board as the pinctrl-broxton drivers had already all
functions and groups needed). More boards will be supported later (missing
groups and funtions should be added in Intel pinctrl drivers at the same
time).

[1] https://www.aaeon.com/en/product/detail/iot-gateway-maker-boards-up-squared

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v2:
- mfd: removed driver (already merged)
- led: removed driver (already merged)
- gpio-aggregator: refactor code to create a gpio-fwd library
- pinctrl: refactor gpio part to use the gpio-fwd library
- pinctrl: add pinctrl mappings for each board

---
Thomas Richard (6):
      gpiolib: add gpiochip_add_pin_range_sparse() function
      gpio: aggregator: refactor the forwarder part.
      gpio: aggregator: export symbols of the gpio-fwd library
      gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd
      gpio: aggregator: add possibility to attach data to the forwarder
      pinctrl: Add pin controller driver for AAEON UP boards

 drivers/gpio/gpio-aggregator.c    |  232 +++++---
 drivers/gpio/gpiolib.c            |   74 ++-
 drivers/pinctrl/Kconfig           |   15 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/pinctrl-upboard.c | 1094 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h       |   12 +
 include/linux/gpio/gpio-fwd.h     |   56 ++
 7 files changed, 1379 insertions(+), 105 deletions(-)
---
base-commit: 12b58398bffc23db89e715414399b0533255da51
change-id: 20240930-aaeon-up-board-pinctrl-support-98fa4a030490

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


