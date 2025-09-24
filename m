Return-Path: <linux-gpio+bounces-26548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C6B9A661
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 16:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C06A418888C5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 14:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B9631A07B;
	Wed, 24 Sep 2025 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kHbg1+U1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7974C30FC0C
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725527; cv=none; b=Ua60ojMdwZiBRMqWpaUvPRl6Q449+cVuLPVAZ/ujk+YD9AmsoL+gtNeeGHpz7ImgUETTBswcTclyJixrMmVoLXAnab9paR/xrnw+o/1bA9G+uEWs/n6vcr8YOL7TFT+EjUFXBxSE9HGKC+RsSkNGvxdLqICaAhKdK4Ry82d5oXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725527; c=relaxed/simple;
	bh=+6bUkVVp8G03JbyHHR+HPFtY9U9Xkn8bXnrMLoG9W+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tk7nIIFhZHE5lwAF3EH+LgoudgpsuwnulgvmfYb+MQhg4DrUN8/akTlHU68PYTafR20c7rSSiY0xfQ+Uu+Ohe2aVvI12dEmcECK7nqKI2g7spGQ+JuVncZh0G+tcFhsDl/UhgthJrlfQ0pf9OlOXtKGtlSYZMDonRQkW7qwz7eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kHbg1+U1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3eebc513678so4883126f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725523; x=1759330323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSgowDlzhmLR7n/hdS2kMt37iKRjtkVmdn3+P096axs=;
        b=kHbg1+U1DcfqpkNcUG2nu/bu6svZ141ys68TQriNMYVNKtJYx0SpUQb7LcsdZeObcc
         FqELeQGq9kzd/ZfuWPGITEWa0whFxM0tYAUzCuScs95HZm/gf48X5ypgKmE5oBXFfpVX
         ZFdKR9GpIJAKTeftlDNReu6HqvSTzFufLFIdColBGw8xg7iZewboE8z90ayGST1r1zlM
         fihrvv/qW2+8XkW7ZV6SF597NYK3q4ctsspUqHYnvBbwdI4Czs5RWP9i0fEOLd1bM0cj
         Dpe+VIh85bQ6u5/OL+uEM4K/7E+OcePlkToMsQK7REj1r6IIrUIElk+MDKdL8ga1762i
         F+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725523; x=1759330323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MSgowDlzhmLR7n/hdS2kMt37iKRjtkVmdn3+P096axs=;
        b=a9MWTZPOTj/+//uPdIwS1uVBN2Nu4WT8MyKvRUjlcipnLU9B5DVUJHa/9Jm+QYtvT4
         QpS+qXxtZavzn06xMRXLHz4GRZyQ6QtKI+ifeKLfXXrbqCiQJ+8HbbqdywoTPXOZtSyl
         9ieyu71RmvrI4JBrO0m2QXgKVt0Y2q3grcuePU0V0wTh9P35/m7abtJM2Mw4sg6Vuba1
         LCGJ3CXbiU+gn2PVYpVpN2joum23KsOibW+imYleICIqPRWIOuOeh3/J0+M2SqW/dSSi
         P/Ltq3tQqnvVIwXj3vCU+e5MEeWY/gMvZJlGI3VmTQ8atG96GljqYbu8pqsuZIz1yB2h
         wAEg==
X-Forwarded-Encrypted: i=1; AJvYcCVPRNun+3oruwpPjXpBs2j9l0OHCuw7xEzpMUqJeZ3CrAwOryjQjy5/JBKuE59NHaJdW63sCC2rbNYl@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGepcoTY+SoCJlou2LXBFRz9S9tetXsjMShUBf1kpt38zqg5K
	O2DipSrQe1NxKLvXWBmiqQarJsfCmUwZsc4RIC49bC81+UI/0pJ9eQvHTqKSPAcmm+4=
X-Gm-Gg: ASbGnctzqqUYni6UvG2pI0HLt/gus5zrCgKd1V2+phqZzcGb+MnRjKjM974t8G70xN/
	Geoh7MrTT3DFcsujqOgFD4dY8hqq3HP4clZf+TZvkCSkOCq8GEI9vSfDGuMkC/D/un6bNawoFmA
	Pzqn0JcDv+oUrx/YnYrFeYcMyGE4Zz1Sl110WJ6ptuxhHJcYYARJsZ9aZHSVtsuxOnXvvmLrjJ4
	cFMBupHDNMPtE+S2oDorXupg3SWfMRMyG1/BNLGeVr8H2fuNEGgFdrCn/f0kRMoM6tDkfxGjCzN
	r3oSgfuz6az8oTZpvQqLCXliLwwnENFYhbDv+N1h0I/ixhOFWr+FIpkCQgeLZG9IuVibxvFIu0p
	tCYZ0aEksarODHgOaXxdwa9dR+C9L
X-Google-Smtp-Source: AGHT+IEyXrLx96T6QsIa8eF3uCo4FfQct7eHaeDlUb6PK1yPrstccT+eXxcbpNJurK4UN8hglLiDIQ==
X-Received: by 2002:a05:6000:2486:b0:3ed:e1d8:bd73 with SMTP id ffacd0b85a97d-40e4d9c9330mr205855f8f.57.1758725522647;
        Wed, 24 Sep 2025 07:52:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:52:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:33 +0200
Subject: [PATCH RFC 5/9] gpio: shared-proxy: implement the shared GPIO
 proxy driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-5-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11907;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sfRoEgGj7pFTcA+n5dZu5OkxqjXNqNa9C5JDXNfemak=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWGpmtkXlBA5OHbVuuWQ7dGjcVco9DBJIZ8K
 fP8ukS/waWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhgAKCRARpy6gFHHX
 ck0BD/98hcjOxep9HWr0VdKe/QouS7zxedAcWxWEJoMrhkgG1BLWJn535Te3HNz/Tynze+mRBL2
 k8OsfoyLfQ7kuvDsMiJJYTGDNeUZzjgvRbSqlukONXP+fAbFVer7RiIu6iOpVEkd0EIH1wx9FJw
 xnH3SFt+Tg7TbwCsf6q3xjOrZe7iXIGFCtOn6iz3EShqRdJ678/At4IGPnN5N+pWJEInqiTHehc
 c1de5mkBKXtKhAnKffUxNqNOBw177wIf+Mr/q87uJP5s3NIbhSkO1x7Wgfovssk42njcuuqigBp
 X0pSHMEjSzmOE4arnFD80o0Q+lVUezJXnRPAmtNYN8k3v9cBQE16+RPkImcnKUBfhlO085MnYJN
 G8MBI+Yyr7Lr0fIrlQbRe2WnbjTvp7scVRLBM81BMN/kuTSlqHcSRAivsBzDwr0AwCHuTDrXef9
 OqsEQPL9fGaOxVtNSXBiyE+yu7RdFvzvh3xWKKNDhMoOlLT0ZqQ65LwqdVDuKfibEB0d9O6ns55
 77wWwBf60k++C9fUYEUmXZydRs7RRVyb7CKCQqassR1f1YUY061diwTRhyOPGVLP5EsugEpxVfN
 eAhuOPTQHAC+8g3a6kveR0eW2FY9wLriKQM3f1I9YY3fSgcjNnA2Fttjlm0nT1dn4I7p4OxaQwg
 OUq+8Fe82eMv9iA==
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
 drivers/gpio/gpio-shared-proxy.c | 328 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 338 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 679a7385a9776eef96a86ca4f429ee83ac939362..de8e4febf344fc19a633cd7efe8412fe12166fb8 100644
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
index f702f7e27e5b4017e7eab3019dae4ec912d534f8..d0020bc70b84f6fb9949165070c21725a60f47e2 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -160,6 +160,7 @@ obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
+obj-$(CONFIG_GPIO_SHARED_PROXY)		+= gpio-shared-proxy.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
new file mode 100644
index 0000000000000000000000000000000000000000..804038d33a40e45c8577f278faea79145a91a5bd
--- /dev/null
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Linaro Ltd.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
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
+			value ? "high" : "low", shared_desc->highcnt);
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
+			"Only one user of this shared GPIO, allowing to set direction to output\n");
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


