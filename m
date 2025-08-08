Return-Path: <linux-gpio+bounces-24089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12301B1EBB5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 12B8E4E49C2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933C7285073;
	Fri,  8 Aug 2025 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rlmv0my5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2EC285063;
	Fri,  8 Aug 2025 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666542; cv=none; b=mGSQmI7KzOmc1k2wzOBOHwTvfpR4AbWX44qGGgZXxxyolpRbppt1+vEbiYvaaOqYpy8iF68YffGsrDnIiG5pfexMj1Ote6w4YDtjMHO7ut40NerkAuWDvfOMog4Gz2rMEhMtjC/E4sSWbPnKluCwpwtd3JdGvPhUC7Uwy1FoUHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666542; c=relaxed/simple;
	bh=Rsa80nsfI+kc8HXUdwAuqZOmhTLHnOi2TSgx9oPYmQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m+c47gtYppYdiSHSltJlOcZri0DoNCwBZm7CzjX4W+yHpuL+qhARn/sPf/ZQrzq69e9PpNdGloGDo5Nn7sAeWYHpQ7z+3hS4fsrLhVhXJas5CUIDTFnZfU1pVj3WIDyh0edrK0fDMYZgVCBl6ZQp19Z63y+ElRi0Zn/QcD9eVj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rlmv0my5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C554BC4CEF7;
	Fri,  8 Aug 2025 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666541;
	bh=Rsa80nsfI+kc8HXUdwAuqZOmhTLHnOi2TSgx9oPYmQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rlmv0my5qzqgX2Dt8yivi4jZu/nHvszgWyaeVbBRGBTr0eqIA5nuoLeSuRdZlN5Zf
	 WZu/1ajnwGxRqV/Aa2bQqsw+SFC+okyPb1kICwr3izRgLSJxOTPO9n+ra1xRbWN9+R
	 a1DM99RimFyRZpecAXbLPY2VD+6az4zJ+O56mgmBsHTDDvAkKKYBc6zQV9+KBu7jjX
	 +8jIwwmwXmnGsu38qAvishI8usebT6AOtnhtd4thmFPTw1sSMYwpX5oQYOBGkw3IK4
	 4z9z8czhyZk+Tyi0Q9cWPMnp6dzispnTyvsF2y3Tt6LhUsSo3ZgL0L/F/5azbsa3xg
	 zjfTJxeEeYsgA==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Anish Kumar <yesanishhere@gmail.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/21] leds: gpio: make legacy gpiolib interface optional
Date: Fri,  8 Aug 2025 17:17:54 +0200
Message-Id: <20250808151822.536879-11-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

There are still a handful of ancient mips/armv5/sh boards that use the
gpio_led:gpio member to pass an old-style gpio number, but all modern
users have been converted to gpio descriptors.

Make the code that deals with this optional so the legacy interfaces
can be left out for all normal builds.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/leds-gpio.c | 8 ++++++--
 include/linux/leds.h     | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index a3428b22de3a..e43accfa78e9 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -212,7 +212,9 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 					    const struct gpio_led *template)
 {
 	struct gpio_desc *gpiod;
+#ifdef CONFIG_GPIOLIB_LEGACY
 	int ret;
+#endif
 
 	/*
 	 * This means the LED does not come from the device tree
@@ -228,6 +230,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 		return gpiod;
 	}
 
+#ifdef CONFIG_GPIOLIB_LEGACY
 	/*
 	 * This is the legacy code path for platform code that
 	 * still uses GPIO numbers. Ultimately we would like to get
@@ -244,6 +247,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 		return ERR_PTR(ret);
 
 	gpiod = gpio_to_desc(template->gpio);
+#endif
 	if (!gpiod)
 		return ERR_PTR(-EINVAL);
 
@@ -276,8 +280,8 @@ static int gpio_led_probe(struct platform_device *pdev)
 				led_dat->gpiod =
 					gpio_led_get_gpiod(dev, i, template);
 			if (IS_ERR(led_dat->gpiod)) {
-				dev_info(dev, "Skipping unavailable LED gpio %d (%s)\n",
-					 template->gpio, template->name);
+				dev_info(dev, "Skipping unavailable LED gpio %s\n",
+					 template->name);
 				continue;
 			}
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b16b803cc1ac..034643f40152 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -676,7 +676,9 @@ typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
 struct gpio_led {
 	const char *name;
 	const char *default_trigger;
+#ifdef CONFIG_GPIOLIB_LEGACY
 	unsigned 	gpio;
+#endif
 	unsigned	active_low : 1;
 	unsigned	retain_state_suspended : 1;
 	unsigned	panic_indicator : 1;
-- 
2.39.5


