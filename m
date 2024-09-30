Return-Path: <linux-gpio+bounces-10587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8439298AC9C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 21:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398731F21A86
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 19:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C02199234;
	Mon, 30 Sep 2024 19:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jXwISgMJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA291E49F
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 19:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727723735; cv=none; b=JVLamCKA4ez4TAUca/r9ol6LH0hdAiQTBnQmT/xL6gFWUgELIOOTk69HTsGATWuHdDDtSx8lEvGv4GmlLcXK9Ykz0p5X1NzGtc1BTrZLQquXEpXR2OEb22UNDB6BhR1mbGpS252IeK3TzDIer3DhMn1/CDGLR5jRTNPJpBKje7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727723735; c=relaxed/simple;
	bh=fnKkSM2+e5ZimgCIf0VifgU6U6mMhsEfwRXVZmYrfQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n7FlDYVA4ofqzL066ceU5QClPAcV+HTONo+pvhNBOvtYO1OjHjyVzM8WS3TDlvvEQlIj6B/7BwzMQIYTyLWhJywwQNnHDLYUmPTbSmIiB/PElGj7XQ7wo9Zqd1GHkr2DDoXrmfkcr5wg+3/tQbXGUW2sNjjy7Oj9M/tbW+W6j38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jXwISgMJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=6JZXkG3oA6HJJC
	FwHQYV9mot3fwWTf57nlAkjits37E=; b=jXwISgMJVX4nhdhAw9sgsucYJPi4hy
	EFnMNyg/4Lw16IT3cngT2PHLeW/ul6dMpveJrbjokLWovxQP79ENDXl5Qgq1Rm1+
	zf1fe4z2MfrUJjA73zTqIbRVm4OOU01E07uwGksT9iHhaV/zmO8B22SolleGfy7o
	/aQW6Ay/Euo8RBAW6uAZwBJwVQx22ALZLXvwDcSPO8YE0vvKaMzB4KnBZx70GTUb
	AwC0iEI2JEFIFvhjJbtJbLx/xMufU4GYlJ5h7TeuXZ/HGxrIcIKi2WdhxkxerIf5
	JWqhqE8gGm6lD8NUY7M9emgEWNLUrvd5jgWXTIpiWZZHua0vj6Lj56aQ==
Received: (qmail 2280566 invoked from network); 30 Sep 2024 21:15:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2024 21:15:27 +0200
X-UD-Smtp-Session: l3s3148p1@rJoIB1sjspEgAQnoAH/eAHsKVyf407fR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2] pinctrl: renesas: rza1: mark GPIOs as used
Date: Mon, 30 Sep 2024 21:14:43 +0200
Message-ID: <20240930191523.7030-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIOs showed up as unclaimed, so they could be muxed to something else
even though they were in use. Mark GPIOs as claimed to avoid that.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1: * free the gpio as well (Thanks, Geert!)

 drivers/pinctrl/renesas/pinctrl-rza1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 6527872813dc..b1058504e0bb 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -19,6 +19,7 @@
 #include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
@@ -750,6 +751,11 @@ static int rza1_pin_mux_single(struct rza1_pinctrl *rza1_pctl,
 static int rza1_gpio_request(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct rza1_port *port = gpiochip_get_data(chip);
+	int ret;
+
+	ret = pinctrl_gpio_request(chip, gpio);
+	if (ret)
+		return ret;
 
 	rza1_pin_reset(port, gpio);
 
@@ -771,6 +777,7 @@ static void rza1_gpio_free(struct gpio_chip *chip, unsigned int gpio)
 	struct rza1_port *port = gpiochip_get_data(chip);
 
 	rza1_pin_reset(port, gpio);
+	pinctrl_gpio_free(chip, gpio);
 }
 
 static int rza1_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
-- 
2.45.2


