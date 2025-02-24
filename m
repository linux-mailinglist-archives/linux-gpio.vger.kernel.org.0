Return-Path: <linux-gpio+bounces-16475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D7A41A28
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 11:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1BA47A3A57
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 10:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC922566EC;
	Mon, 24 Feb 2025 10:03:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC79254AED
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391422; cv=none; b=g8cFah45JR/ST+5gCcKizFZJRrmhwsPuMq4c2g77mDWZMrVcYl3wiij8SUJyc6xySkosI4uf4OsxlNNZzIU+E8khovJTS4JEXdq0QvW3NiwZw0VsiET63g/rTtwnhPTsOpxqE7rXBbrY1PNbUYjtYWdjYK/R5KE7SSQUNcDImr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391422; c=relaxed/simple;
	bh=JgJx6ba4RBBDAzbaug5ppV+ryDAhgLpVi1FzyzvSEOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lm54Sxo/P/55F6+iJwfKUyWYyOgF6bNPqIPXtzujHxqoHVhFjzdAu+lMLiRGpl6YvxAnqeHop/Y3LO2UHKwn5XI3CWxFJ/tX7uVTXz86y9oIWKhYgAFQcxoIFIZhUfbgH/WaAfkzG8hjTapdxQhmLoHTKly4zH5TsWlN+Zjef/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Z1bsc6LHrzK33;
	Mon, 24 Feb 2025 11:03:32 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Z1bsc1f14zVwx;
	Mon, 24 Feb 2025 11:03:32 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 24 Feb 2025 11:03:22 +0100
Subject: [PATCH v3 2/2] gpio: pcf857x: add support for reset-gpios on
 (most) PCA967x
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-pca976x-reset-driver-v3-2-58370ef405be@cherry.de>
References: <20250224-pca976x-reset-driver-v3-0-58370ef405be@cherry.de>
In-Reply-To: <20250224-pca976x-reset-driver-v3-0-58370ef405be@cherry.de>
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

Tested-by: Heiko Stuebner <heiko@sntech.de> # RK3588 Tiger Haikou Video Demo
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/gpio/gpio-pcf857x.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 7c57eaeb0afeba8953d998d8eec60a65b40efb6d..2e5f5d7f886598318b753304e7e0efca54ff8b69 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2007 David Brownell
  */
 
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -272,12 +274,11 @@ static const struct irq_chip pcf857x_irq_chip = {
 
 static int pcf857x_probe(struct i2c_client *client)
 {
+	struct gpio_desc *reset_gpio;
 	struct pcf857x *gpio;
 	unsigned int n_latch = 0;
 	int status;
 
-	device_property_read_u32(&client->dev, "lines-initial-states", &n_latch);
-
 	/* Allocate, initialize, and register this gpio_chip. */
 	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -297,6 +298,30 @@ static int pcf857x_probe(struct i2c_client *client)
 	gpio->chip.direction_output	= pcf857x_output;
 	gpio->chip.ngpio		= (uintptr_t)i2c_get_match_data(client);
 
+	reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	if (reset_gpio) {
+		/* Reset already held with devm_gpiod_get_optional with GPIOD_OUT_HIGH */
+		fsleep(4); /* tw(rst) > 4us */
+		gpiod_set_value_cansleep(reset_gpio, 0);
+		fsleep(100); /* trst > 100uS */
+
+		/*
+		 * Performing a reset means "The PCA9670 registers and I2C-bus
+		 * state machine will be held in their default state until the
+		 * RESET input is once again HIGH".
+		 *
+		 * This is the same as writing 1 for all pins, which is the same
+		 * as n_latch=0, the default value of the variable.
+		 */
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


