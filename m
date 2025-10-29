Return-Path: <linux-gpio+bounces-27797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1AC19F94
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7C33D357B7B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 11:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060E23314C1;
	Wed, 29 Oct 2025 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RVsVFQYL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7153314B8
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736869; cv=none; b=reMEpmFPbwkquyTceLTU//wGY6kMICyC6nYQ+kmDMKVc09jCx4CduD0I8fEwz/0TkTnNrjFgIQl0SCJcg5TgO4FULO4xMDcoi8htXf40JehlcuU2mg7gEJUTVnaeIhlMTKFIbAZ8msAJUJ3pxllePDmKMsWlS8JQnVeCWP1mFHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736869; c=relaxed/simple;
	bh=wEklMGXUGhiw9zk0F9lYR7DBwNDYJUEBreqBM3YOjR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhElfLS+CmBYvb+QVN9RDlohqT/qm1NFDxorwYCFtqfrAQUzcLydwlp2xkRyD3JAgapWf3HMrFbkLUdie1Y/3gljDnae/vkXo8yhcuJe4mr6nzE9F5gQuatkBBubmBHL1NiZS+9E9nM13/54/RCdkMnhQvNaW25nPhnyDZX3nAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RVsVFQYL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475d9de970eso38201475e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 04:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736864; x=1762341664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzAD0cYTYlmz/0N8KICWQ9Nbs5w1QtlOIL1Twm9Y/FE=;
        b=RVsVFQYLre8CTY/AEnh9wL226XgIAyGU5KoCOCOTXy0i0udMyhj+Q6Xt2wd06XKfC1
         tbtMi0d2mX2M8U66A4ndXs7UBZ2lT8a/LsAKLWy+if0gkEnoe5gut8rB/2PgSCS1QOUi
         IwTnNJqpitE8PZLO58OZ1yAvki5mBMHdZMC22BFaLKu6zCjM36cXAnKpZKdHfnZlAW/3
         bNGBlbX3Qn2Ff15PJkgjbA4DDvDmwRjrKaIaKZEnvWyZi6k4A7gh5SMNoy+A6Jt204y8
         eMs7QYcvE049NT4Dw22UJLFqu4ioeFx6lzParpjGqPeHR79+DsYzPssalUNu9Q8i8QPh
         v25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736864; x=1762341664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzAD0cYTYlmz/0N8KICWQ9Nbs5w1QtlOIL1Twm9Y/FE=;
        b=pdDx8dtk6wlTr6xio64gQ/nZd/tviS7b3Y1nWgzLCdwwevb5q5Jw02ch0RKEDvoWRa
         7pdaGP9P1s9GMs7WKEpoIKU7TlsJru6q2WXX5ioyOfcf6Y/B5YDHwY9svmTcdnW3iM0m
         kjRDkh3GMac/vKgnnkNLTv9Xe5N/sQoZGJ58FwXWnvzV/VCvR4jEHo/aNKS5mof4xOh4
         UUhUqNyN7QoSW5G39pY9ZzFpy+cc5GH6TopAZ73HMrU0GzA32RIispfyhQ/hh6sTVMJ8
         3h1CrzL/AaQ2LLQaVGCHuC9A4KJ22GKNvhTLXn7pZW2ct9qFZN+7NF6TFwbG0UB2p6FJ
         UWHg==
X-Forwarded-Encrypted: i=1; AJvYcCXsiZ+o9XSrV9SK269kZJyvB4Ol7Kce8edhjShKyWpoZKOw5m+R7f7YwUgm62PXWdqUnj/ABZogMZ+l@vger.kernel.org
X-Gm-Message-State: AOJu0YyVytSR1urMUctBUdI/Bg/V+BuERhZsnkTGE8vrfvHDIafd6S8Q
	qYX+LPcueUUGLAPzCX38bd11Fk7igNeGxSwG7i3Ka43l/VKf7sbyOt9ULPzCvr6Q3BE=
X-Gm-Gg: ASbGnctKJErhfGCrUmZVEf03G0EeYUhJ8/abCxhfbe18Yla0CEuNTAy6aU0sEijWWUx
	ArE2uhsv38n5KWV9YyoOP4R2oGeAMx/zmLONGTdxLuQPGTAIIIDb9H45b1dxZQw1qUZA1aXOUJK
	XiLbaJ397UxRILjfPthMgfYHSuCnF3JDuSfcxbwSARXBBNZ7xiNIC0XK+4DzO0rNtzm94IQuMbP
	l6MkFVHaC5ociIyEn9yqbULFRTlORcdIFwuGhG3g9YGf5pyDYkApVW4XImpndBrkITiTX8MGsAl
	kbKN+ufpMvsHJ9R8nD/2BGa8YF0GI84tFs8JfWPYN4GskvHwgENhVqJypqSoHrNinhmxlaJ09oC
	TvOow7HOnEZPEQtLFHuZAAF7ODiYk7KjRnrISJ09+2LNDHcMox+iYMbImSXXIw/TYEFLgQA==
X-Google-Smtp-Source: AGHT+IFepT/g0mGDDZu27qox151T4Ope3H6XWzZKOv8YtbmF843M3u2gByG79k7r47GrguQ+Zcr7oA==
X-Received: by 2002:a05:600c:64c4:b0:471:15df:9fc7 with SMTP id 5b1f17b1804b1-4771e1e008dmr21333525e9.26.1761736864339;
        Wed, 29 Oct 2025 04:21:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:40 +0100
Subject: [PATCH v3 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-4-71c568acf47c@linaro.org>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12071;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nMwEBRFh4XOPjHIiaJPyL/IGQRbGQ5r+fPXFOtJIq4M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiWkyxmed080sYivuvosfShdCG2eUvNdzlvu
 35d2InUDMeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lgAKCRARpy6gFHHX
 cixfD/9jv6RbhPw0wFQ1c1KsGtJnSyyUFcV2FyPivD/wcVtheWR8AE0GIB/Ojrhp2XRqFxYYPd6
 ESdFp8m2TALnvNpPIzFIyqJmp7qxmAHfATffBPy1EFbm7p9ZgSMIlpdXQSVgHsvgfF/PyhNNwT/
 g3umY2WWtU909Zg9zQgTEfsvqzTEolxe/DC+tTot5v1CNZ+tWzxOCHm8GSqPKggzMG9BWc93HLe
 gM9kLf6MxqjLrSXvRG1t5j5XcC8TyVWVS3+2w9pFTxW5vbfROLkZJPsJRXoO7tccdjONaUQcMWt
 LbXbFzXVa0ddSnJcwyn5HNFgc0vHpRMKMMMNbvmTSOtnyhJYU96p2lI7xGTyuiTscYgRLz6MW8y
 BO+vTg62YhPfvYRSDuHqePUWwnVDmlOyvaACmR7Q476J4t+g+/tlo/VbY8I0bThsn3rpZH/tRJ+
 ElW3PS72DXaBWDzrZEJtQCYq+bc/PfyH662mHQeL4ym+Jm+jHZj3ULcPKny2xBRvcnehhm7+n1e
 lptOeSil+3LvecWpU87kIdcApGalrHQfqpNKZ72rBjWJhKYasfZgBqu3L5roeQmt+xAwaE2BpYD
 2JVvjmWxwZJ/66LJn7rkiCdgFMQ8d+sl+84g3p3TOuMop4xQkyaDLrLsmY0y+DNHW39zYNZYI6+
 WzgOPqxRKhq1rcg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a virtual GPIO proxy driver which arbitrates access to a single
shared GPIO by multiple users. It works together with the core shared
GPIO support from GPIOLIB and functions by acquiring a reference to a
shared GPIO descriptor exposed by gpiolib-shared and making sure that
the state of the GPIO stays consistent.

In general: if there's only one user at the moment: allow it to do
anything as if this was a normal GPIO (in essence: just propagate calls
to the underlying real hardware driver). If there are more users: don't
allow to change the direction set by the initial user, allow to change
configuration options but warn about possible conflicts and finally:
treat the output-high value as a reference counted, logical "GPIO
enabled" setting, meaning: the GPIO value is set to high when the first
user requests it to be high and back to low once the last user stops
"voting" for high.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig             |   9 ++
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-shared-proxy.c | 333 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 343 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f90b4d3e77f7cab46525b7adfcf114a21d276678..f910c20f0d5d7771f7f8f3d52ced7bce413d24f1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -2025,6 +2025,15 @@ config GPIO_SIM
 	  This enables the GPIO simulator - a configfs-based GPIO testing
 	  driver.
 
+config GPIO_SHARED_PROXY
+	tristate "Proxy driver for non-exclusive GPIOs"
+	default m
+	depends on GPIO_SHARED || COMPILE_TEST
+	select AUXILIARY_BUS
+	help
+	  This enables the GPIO shared proxy driver - an abstraction layer
+	  for GPIO pins that are shared by multiple devices.
+
 endmenu
 
 menu "GPIO Debugging utilities"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 48f309c764e3286c23dbe604be933f7180f0b89a..2421a8fd3733e0b06c2581262aaa9cd629f66c7d 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -161,6 +161,7 @@ obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
+obj-$(CONFIG_GPIO_SHARED_PROXY)		+= gpio-shared-proxy.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
new file mode 100644
index 0000000000000000000000000000000000000000..3ef2c40ed15229074052eda93b6ee56f0a2bfb72
--- /dev/null
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Linaro Ltd.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/string_choices.h>
+#include <linux/types.h>
+
+#include "gpiolib-shared.h"
+
+struct gpio_shared_proxy_data {
+	struct gpio_chip gc;
+	struct gpio_shared_desc *shared_desc;
+	struct device *dev;
+	bool voted_high;
+};
+
+static int
+gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
+			       int (*set_func)(struct gpio_desc *desc, int value),
+			       int value)
+{
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+	struct gpio_desc *desc = shared_desc->desc;
+	int ret = 0;
+
+	gpio_shared_lockdep_assert(shared_desc);
+
+	if (value) {
+	       /* User wants to set value to high. */
+		if (proxy->voted_high)
+			/* Already voted for high, nothing to do. */
+			goto out;
+
+		/* Haven't voted for high yet. */
+		if (!shared_desc->highcnt) {
+			/*
+			 * Current value is low, need to actually set value
+			 * to high.
+			 */
+			ret = set_func(desc, 1);
+			if (ret)
+				goto out;
+		}
+
+		shared_desc->highcnt++;
+		proxy->voted_high = true;
+
+		goto out;
+	}
+
+	/* Desired value is low. */
+	if (!proxy->voted_high)
+		/* We didn't vote for high, nothing to do. */
+		goto out;
+
+	/* We previously voted for high. */
+	if (shared_desc->highcnt == 1) {
+		/* This is the last remaining vote for high, set value  to low. */
+		ret = set_func(desc, 0);
+		if (ret)
+			goto out;
+	}
+
+	shared_desc->highcnt--;
+	proxy->voted_high = false;
+
+out:
+	if (shared_desc->highcnt)
+		dev_dbg(proxy->dev,
+			"Voted for value '%s', effective value is 'high', number of votes for 'high': %u\n",
+			str_high_low(value), shared_desc->highcnt);
+	else
+		dev_dbg(proxy->dev, "Voted for value 'low', effective value is 'low'\n");
+
+	return ret;
+}
+
+static int gpio_shared_proxy_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+
+	guard(gpio_shared_desc_lock)(shared_desc);
+
+	proxy->shared_desc->usecnt++;
+
+	dev_dbg(proxy->dev, "Shared GPIO requested, number of users: %u\n",
+		proxy->shared_desc->usecnt);
+
+	return 0;
+}
+
+static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+
+	guard(gpio_shared_desc_lock)(shared_desc);
+
+	proxy->shared_desc->usecnt--;
+
+	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
+		proxy->shared_desc->usecnt);
+}
+
+static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
+					unsigned int offset, unsigned long cfg)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+	struct gpio_desc *desc = shared_desc->desc;
+	int ret;
+
+	guard(gpio_shared_desc_lock)(shared_desc);
+
+	if (shared_desc->usecnt > 1) {
+		if (shared_desc->cfg != cfg) {
+			dev_dbg(proxy->dev,
+				"Shared GPIO's configuration already set, accepting changes but users may conflict!!\n");
+		} else {
+			dev_dbg(proxy->dev, "Equal config requested, nothing to do\n");
+			return 0;
+		}
+	}
+
+	ret = gpiod_set_config(desc, cfg);
+	if (ret && ret != -ENOTSUPP)
+		return ret;
+
+	shared_desc->cfg = cfg;
+	return 0;
+}
+
+static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
+					     unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+	struct gpio_desc *desc = shared_desc->desc;
+	int dir;
+
+	guard(gpio_shared_desc_lock)(shared_desc);
+
+	if (shared_desc->usecnt == 1) {
+		dev_dbg(proxy->dev,
+			"Only one user of this shared GPIO, allowing to set direction to input\n");
+
+		return gpiod_direction_input(desc);
+	}
+
+	dir = gpiod_get_direction(desc);
+	if (dir < 0)
+		return dir;
+
+	if (dir == GPIO_LINE_DIRECTION_OUT) {
+		dev_dbg(proxy->dev,
+			"Shared GPIO's direction already set to output, refusing to change\n");
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
+					      unsigned int offset, int value)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
+	struct gpio_desc *desc = shared_desc->desc;
+	int ret, dir;
+
+	guard(gpio_shared_desc_lock)(shared_desc);
+
+	if (shared_desc->usecnt == 1) {
+		dev_dbg(proxy->dev,
+			"Only one user of this shared GPIO, allowing to set direction to output with value '%s'\n",
+			str_high_low(value));
+
+		ret = gpiod_direction_output(desc, value);
+		if (ret)
+			return ret;
+
+		if (value) {
+			proxy->voted_high = true;
+			shared_desc->highcnt = 1;
+		} else {
+			proxy->voted_high = false;
+			shared_desc->highcnt = 0;
+		}
+
+		return 0;
+	}
+
+	dir = gpiod_get_direction(desc);
+	if (dir < 0)
+		return dir;
+
+	if (dir == GPIO_LINE_DIRECTION_IN) {
+		dev_dbg(proxy->dev,
+			"Shared GPIO's direction already set to input, refusing to change\n");
+		return -EPERM;
+	}
+
+	return gpio_shared_proxy_set_unlocked(proxy, gpiod_direction_output, value);
+}
+
+static int gpio_shared_proxy_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpiod_get_value(proxy->shared_desc->desc);
+}
+
+static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
+					  unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpiod_get_value_cansleep(proxy->shared_desc->desc);
+}
+
+static int gpio_shared_proxy_do_set(struct gpio_shared_proxy_data *proxy,
+				    int (*set_func)(struct gpio_desc *desc, int value),
+				    int value)
+{
+	guard(gpio_shared_desc_lock)(proxy->shared_desc);
+
+	return gpio_shared_proxy_set_unlocked(proxy, set_func, value);
+}
+
+static int gpio_shared_proxy_set(struct gpio_chip *gc, unsigned int offset,
+				 int value)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpio_shared_proxy_do_set(proxy, gpiod_set_value, value);
+}
+
+static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
+					  unsigned int offset, int value)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpio_shared_proxy_do_set(proxy, gpiod_set_value_cansleep, value);
+}
+
+static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
+					   unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpiod_get_direction(proxy->shared_desc->desc);
+}
+
+static int gpio_shared_proxy_to_irq(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+
+	return gpiod_to_irq(proxy->shared_desc->desc);
+}
+
+static int gpio_shared_proxy_probe(struct auxiliary_device *adev,
+				   const struct auxiliary_device_id *id)
+{
+	struct gpio_shared_proxy_data *proxy;
+	struct gpio_shared_desc *shared_desc;
+	struct device *dev = &adev->dev;
+	struct gpio_chip *gc;
+
+	shared_desc = devm_gpiod_shared_get(dev);
+	if (IS_ERR(shared_desc))
+		return PTR_ERR(shared_desc);
+
+	proxy = devm_kzalloc(dev, sizeof(*proxy), GFP_KERNEL);
+	if (!proxy)
+		return -ENOMEM;
+
+	proxy->shared_desc = shared_desc;
+	proxy->dev = dev;
+
+	gc = &proxy->gc;
+	gc->base = -1;
+	gc->ngpio = 1;
+	gc->label = dev_name(dev);
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->can_sleep = shared_desc->can_sleep;
+
+	gc->request = gpio_shared_proxy_request;
+	gc->free = gpio_shared_proxy_free;
+	gc->set_config = gpio_shared_proxy_set_config;
+	gc->direction_input = gpio_shared_proxy_direction_input;
+	gc->direction_output = gpio_shared_proxy_direction_output;
+	if (gc->can_sleep) {
+		gc->set = gpio_shared_proxy_set_cansleep;
+		gc->get = gpio_shared_proxy_get_cansleep;
+	} else {
+		gc->set = gpio_shared_proxy_set;
+		gc->get = gpio_shared_proxy_get;
+	}
+	gc->get_direction = gpio_shared_proxy_get_direction;
+	gc->to_irq = gpio_shared_proxy_to_irq;
+
+	return devm_gpiochip_add_data(dev, &proxy->gc, proxy);
+}
+
+static const struct auxiliary_device_id gpio_shared_proxy_id_table[] = {
+	{ .name = "gpiolib_shared.proxy" },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, gpio_shared_proxy_id_table);
+
+static struct auxiliary_driver gpio_shared_proxy_driver = {
+	.driver = {
+		.name = "gpio-shared-proxy",
+	},
+	.probe = gpio_shared_proxy_probe,
+	.id_table = gpio_shared_proxy_id_table,
+};
+module_auxiliary_driver(gpio_shared_proxy_driver);
+
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
+MODULE_DESCRIPTION("Shared GPIO mux driver.");
+MODULE_LICENSE("GPL");

-- 
2.48.1


