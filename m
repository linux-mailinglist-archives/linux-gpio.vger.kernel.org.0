Return-Path: <linux-gpio+bounces-24088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 220A2B1EBB0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A23E4E4981
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE3C283FC8;
	Fri,  8 Aug 2025 15:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gs8U69l6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FFE2836AF;
	Fri,  8 Aug 2025 15:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666530; cv=none; b=V39h8uFPolKtJXpgMPXrjXjjMAZJoIs7IzZVe0bMwBWMM2xKXT++q7DdwPVxOCBP4w+CE+5/P7saYjxQxYWOw7O7Kow+J5cCRMiZZzIgC7GkMbDWRI/4eLwPjwR675OKcWMId+sG+sca6evJYJQ46cBgjgSiiHq+0dgwqjsBCj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666530; c=relaxed/simple;
	bh=NWPfkLvSzYXpOS3JkL5/KajBbmF4O88cmr615YX9oHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XKn9Jt1HhbTNxl2BFWl2ASijj/VFEqfUImgaKzpiN5DPIdpPn2VK8l7NWm1AtCsaXcgRd+DhRDcgRPf2i/MG+ZFwoa4w22pCdAuBlZU+qgPLnMY0Ilm4w8rANrfhz8V1dWCpolDRVFjefZZexgBzDCnh7XM4DvdVA1Xo/+F6Tf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gs8U69l6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D141C4CEED;
	Fri,  8 Aug 2025 15:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666529;
	bh=NWPfkLvSzYXpOS3JkL5/KajBbmF4O88cmr615YX9oHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gs8U69l6pTkBtbfrmTTcI1PVHkTpEocW8j7r53jtN+EIn8TwLb8RplwrfHIeFYG7V
	 apMn0EbVyq9TKwD5X6kEwlsDRmB86149cDLTAjAF6rVZlZDjLTldLe+YgZ3rUlr0EW
	 fbKNlG9g8VRyzbtDJHykKlhy4euYr48FsGOZfanSbBOmblz8XNedNjByLSnjyeiuJi
	 7KB0797CXA0MtwqJfOQ9+2rTVWSAMMZ4bxoQ8WckZt/TPGadYtnm5OuiDqQZWx/blk
	 8OL0ACb+7vkR7GJkzuSi8CNqMB5zsGVYAeDQ7TqMVZR1tUHLM6WzvJb6R5j5SSFT8O
	 C6eEOZPvCJrwg==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/21] input: gpio-keys: make legacy gpiolib optional
Date: Fri,  8 Aug 2025 17:17:53 +0200
Message-Id: <20250808151822.536879-10-arnd@kernel.org>
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

Most users of gpio-keys and gpio-keys-polled use modern gpiolib
interfaces, but there are still number of ancient sh, arm32 and x86
machines that have never been converted.

Add an #ifdef block for the parts of the driver that are only
used on those legacy machines.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/keyboard/gpio_keys.c        | 5 +++--
 drivers/input/keyboard/gpio_keys_polled.c | 2 ++
 drivers/mfd/rohm-bd71828.c                | 2 ++
 drivers/mfd/rohm-bd718x7.c                | 2 ++
 include/linux/gpio_keys.h                 | 2 ++
 5 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index f9db86da0818..984b20f773ed 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -528,6 +528,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 			 */
 			bdata->gpiod = NULL;
 		}
+#ifdef CONFIG_GPIOLIB_LEGACY
 	} else if (gpio_is_valid(button->gpio)) {
 		/*
 		 * Legacy GPIO number, so request the GPIO here and
@@ -546,6 +547,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 
 		if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
 			gpiod_toggle_active_low(bdata->gpiod);
+#endif
 	}
 
 	if (bdata->gpiod) {
@@ -583,8 +585,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 			if (irq < 0) {
 				error = irq;
 				dev_err_probe(dev, error,
-					      "Unable to get irq number for GPIO %d\n",
-					      button->gpio);
+					      "Unable to get irq number for GPIO\n");
 				return error;
 			}
 			bdata->irq = irq;
diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index e6707d72210e..0ae0e53910ea 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -301,6 +301,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 				return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
 						     "failed to get gpio\n");
 			}
+#ifdef CONFIG_GPIOLIB_LEGACY
 		} else if (gpio_is_valid(button->gpio)) {
 			/*
 			 * Legacy GPIO number so request the GPIO here and
@@ -323,6 +324,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
 			if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
 				gpiod_toggle_active_low(bdata->gpiod);
+#endif
 		}
 
 		bdata->last_state = -1;
diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index a14b7aa69c3c..fb68694fadca 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -21,7 +21,9 @@
 
 static struct gpio_keys_button button = {
 	.code = KEY_POWER,
+#ifdef CONFIG_GPIOLIB_LEGACY
 	.gpio = -1,
+#endif
 	.type = EV_KEY,
 };
 
diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index 25e494a93d48..6c99ab62e31b 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -20,7 +20,9 @@
 
 static struct gpio_keys_button button = {
 	.code = KEY_POWER,
+#ifdef CONFIG_GPIOLIB_LEGACY
 	.gpio = -1,
+#endif
 	.type = EV_KEY,
 };
 
diff --git a/include/linux/gpio_keys.h b/include/linux/gpio_keys.h
index 80fa930b04c6..e8d6dc290efb 100644
--- a/include/linux/gpio_keys.h
+++ b/include/linux/gpio_keys.h
@@ -25,7 +25,9 @@ struct device;
  */
 struct gpio_keys_button {
 	unsigned int code;
+#ifdef CONFIG_GPIOLIB_LEGACY
 	int gpio;
+#endif
 	int active_low;
 	const char *desc;
 	unsigned int type;
-- 
2.39.5


