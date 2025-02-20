Return-Path: <linux-gpio+bounces-16260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B03EBA3D595
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF61D189D32D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 09:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BCA1F1515;
	Thu, 20 Feb 2025 09:57:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAE1F0E2E
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045443; cv=none; b=f90XY9nUZcXQAqAe64qVSMVYyTHCdeMxqhjWfG9J9H+HufdFqEEDJf2S7lPG3P9mWSfuJNavlOBopIAOSmVoBF8kot9MhJCoYh+OcQ2YyCc5xOxgwRjDSIZj4sTzwl+XkNJ6ZiuDycljurows2VYdFY3hUNaodljZGL/taR8tKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045443; c=relaxed/simple;
	bh=jq9amKY0ztDFzt6Npf8OLiholOZMh+/kBQFq46MKJTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+IgU3O+d3T7HqeDR9TD8IwXWMXeEtEGqBvnM9cZTqqU0VrXzpZQ4bDXoioonoc8b04ejsh9yBksOtmIGHXKCpGWTGySMi0fUdVrpoU5CfRXv+aJUYwlYcWDgqZsBmrfZhR7FftDYO2Z0LLuMMP8OSD8NMfJbyTknYeOQvjQ3sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yz7w937DtzXgN;
	Thu, 20 Feb 2025 10:57:13 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yz7w86HwQzZmv;
	Thu, 20 Feb 2025 10:57:12 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 20 Feb 2025 10:56:52 +0100
Subject: [PATCH 2/2] gpio: pcf857x: add support for reset-gpios on (most)
 PCA967x
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-pca976x-reset-driver-v1-2-6abbf043050e@cherry.de>
References: <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de>
In-Reply-To: <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The PCA9670, PCA9671, PCA9672 and PCA9673 all have a RESETN input pin
that is used to reset the I2C GPIO expander.

One needs to hold this pin low for at least 4us and the reset should be
finished after about 100us according to the datasheet[1]. Once the reset
is done, the "registers and I2C-bus state machine will be held in their
default state until the RESET input is once again HIGH.".

Because the logic is reset, the latch values eventually provided in the
Device Tree via lines-initial-states property are inapplicable so they
are simply ignored if a reset GPIO is provided.

[1] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf 8.5 and fig 22.
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/gpio/gpio-pcf857x.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 7c57eaeb0afeba8953d998d8eec60a65b40efb6d..94077208e24ae99a1e8762e783f0eabc580fa520 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2007 David Brownell
  */
 
+#include <linux/delay.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -272,12 +273,11 @@ static const struct irq_chip pcf857x_irq_chip = {
 
 static int pcf857x_probe(struct i2c_client *client)
 {
+	struct gpio_desc *rstn_gpio;
 	struct pcf857x *gpio;
-	unsigned int n_latch = 0;
+	unsigned int n_latch;
 	int status;
 
-	device_property_read_u32(&client->dev, "lines-initial-states", &n_latch);
-
 	/* Allocate, initialize, and register this gpio_chip. */
 	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -297,6 +297,29 @@ static int pcf857x_probe(struct i2c_client *client)
 	gpio->chip.direction_output	= pcf857x_output;
 	gpio->chip.ngpio		= (uintptr_t)i2c_get_match_data(client);
 
+	rstn_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(rstn_gpio)) {
+		return dev_err_probe(&client->dev, PTR_ERR(rstn_gpio),
+				     "failed to get reset GPIO\n");
+	}
+
+	if (rstn_gpio) {
+		/* Reset already held with devm_gpiod_get_optional with GPIOD_OUT_HIGH */
+		usleep_range(4, 8); /* tw(rst) > 4us */
+		gpiod_set_value(rstn_gpio, 0);
+		usleep_range(100, 200); /* trst > 100uS */
+
+		/*
+		 * Reset "will initialize to their default states of all I/Os to
+		 * inputs with weak current source to VDD", which is the same as
+		 * writing 1 for all I/Os which is 0 in n_latch.
+		 */
+		n_latch = 0;
+	} else {
+		device_property_read_u32(&client->dev, "lines-initial-states",
+					 &n_latch);
+	}
+
 	/* NOTE:  the OnSemi jlc1562b is also largely compatible with
 	 * these parts, notably for output.  It has a low-resolution
 	 * DAC instead of pin change IRQs; and its inputs can be the

-- 
2.48.1


