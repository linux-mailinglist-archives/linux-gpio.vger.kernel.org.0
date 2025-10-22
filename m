Return-Path: <linux-gpio+bounces-27442-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F329BFC2B8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE8CA621426
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB332348863;
	Wed, 22 Oct 2025 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AWnORM18"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0552348462
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138669; cv=none; b=U6EZyGdkOGh2bLlJYijPgaeSEfT/nYlwqU+yHyqGzfKbrxAnunsQB+wkOFJMyO/N2RPvVyuqIoPxFAUlSMdFZbvVf0Jqle4U9hMlS9hlOrIqXiawLb+E0FEhKN2MpaG1+SIVvZ+t26gtuXuIC3wdL/E9Hqsm/8QbAbSlM69sLVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138669; c=relaxed/simple;
	bh=U+v8rHFdpElBX+FsUua3A0fwfFkZzlCaNmxO+JH8iSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fza5OPvwLP2adDoE8SEDNjjl58PzuT0u2Tzk59GZBK1muaX5FIui0UjUPTDpOKSm86jHCjGXbNf5WP/FK3KUE2Lh0aayoEUWsnoxLKkBtJwtAiGI703JyrrN/08OZMp6WxpkzuOBRtWcgV6UkAn/0bfKpN2DnzltwL6F5g403ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AWnORM18; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so5897805e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138665; x=1761743465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yS98cTTrltSx4xeBUzNedH9UHkLLMppps/rwiTN9nqw=;
        b=AWnORM188UlRHUMlN06qcnogPH5JHViIwN8sdK1EmiuADcQrhoFWhHUnTMUTbtchY8
         6nAekO3IsviEYw/BC8GeSlHBHbrmoQgXFiySnpVDWJNJCYh23Wi8IMFXQ3hEzC4cNrz3
         isiXkBdjf1m0sKniu+BmmZUZ+pilrX+Fl1gKjvp41dnHJAZhYadBsVB7ZX+qJUdrAzjx
         u3AxBUb+f++TPCkz8uf49ZfXOFDrNbxk4kSFm+pZxdi9xehwbTv/DJSSq249+a8xRJq/
         r7YAWZOt5zaaTGpXxZE9M1UORUwYaEj56vvPDF3pEC66lsGD+iSktd1oInLBm07hr6Uv
         GXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138665; x=1761743465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS98cTTrltSx4xeBUzNedH9UHkLLMppps/rwiTN9nqw=;
        b=wfTcvkoF4muYdG0/FxCkX7dthcWQN1bXdbJv6aZIncLgfwODstj0LI2g3RAIHsABgL
         VQgq6uQhHhNS4JS4XjF7JVWDN8yNHNkTpwvNlcyAPvV4AVst/0tSv7jA6E15hK/+eHa3
         TLg/9UeExmSxzPape9vGCuyDHSFSJT93HhDyg64T4ZmVfkXhETu+uDJp6/Ca6u5QguoC
         KP6DhIOSbWtwR8SZ/2BzzWIkjFuIiL++P1NtwHwxdF/D1hfzVu1w7g2IujN23lDjj5bM
         Q4kBEF7wv/xXWkXQn9tg2fryA7mhWB8vn20CCJe5YNOEG676t5XnTynpHlFbz1Lrhbmk
         uuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLpXiSWTzKlFLBIKphG7wAQBv371ZjegTp7PCyjmH93YYmxFnhyJMPzdmMHNbbDJYBbwkhsn/AWd/X@vger.kernel.org
X-Gm-Message-State: AOJu0YxQeBH1dbEBZROEhs2zxTGaBIakdQM4klsIRfs4GE02q1Tiz/H4
	KcHjEzWjxJ+67eDy9MowMNhwH1tFaHBhCm561fhDA+95vM9AmAQaqb0oktaZPk6dmJI=
X-Gm-Gg: ASbGncuSNwuCD+b4IloOLeoV+Ps8Kp2dXDAEo9LjDjgsVA7IfWnVwQvKlJd6td9hYCl
	m3cAcMvS6ynQyNKJMkRaVWmVv6DcOAHFMXttQ3gzITluGhDHPa2MUA4tKomlzm2GbqsjBp9uIWw
	MrY+Gf30LERh8QcGIGwEW+jbkY5JS9wEWCW5Yt6oEk15EbHPfWF3c5Dis1L+AwM3Dgg7DSxDHix
	sTd3egSZzePj+XKUKTEntH6clw08q/wvOXYbhrzjluMywsxhPgPbWa+W3qSDucgXQxBiR2rEz4L
	+pyGRQz5oPJD0oZdDZBaUukdkWIsMNeQRaMN6wdXK8OhaF1K3Sc/rDKQpmTMJ0Udk/gMl1KCT0N
	pmUGaXgebWY773pzC/vrEy9UXwfYLEMEkePQX5QDfg1U6GwQQ5cePC7EQ7wVdKJ3uMazv3Sc=
X-Google-Smtp-Source: AGHT+IHJKMgjdXmEICa9FW8jE7a3dMwnSy9oZ8XuxS/+CLTwvv+lfyO/RjCxmhSYVJxOnr+0xKYENw==
X-Received: by 2002:a05:600c:55d6:b0:46f:b42e:e362 with SMTP id 5b1f17b1804b1-475c6f7076cmr9796545e9.19.1761138664904;
        Wed, 22 Oct 2025 06:11:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:42 +0200
Subject: [PATCH v2 03/10] gpiolib: implement low-level, shared GPIO support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-3-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18315;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=miECWIP/1gqHMCXzhWhe14uF2CJsdYWMJpRYtwx+SRs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfdAvowADLFNPkidna6nLbNkf2EaeNe3+cFz
 l/7fbdVeWqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3QAKCRARpy6gFHHX
 chzzD/9hjtZx0RBd2PIKEfMDQNKwtdmyvS5gfg9+ViyDv7gSSam3ZIlT0xMAeJnNpcfvrLd22Gy
 E/csnJldgxSYCbIic+bH4KX8i4gdm8G1XG9nR8NjoXJ38c+wwyNOrTqzOXheaoQMLrxnO4Czzhn
 UCV9xGIRSbxVu6JOhbr84btBOF3boLd+4UKKVbfZqDb8bKoyWAnRIydOgHGnPnyQF/BIBK8GFp1
 h8i7rh25AkmHagVk8zd1unihZSrsGVF/BjDFJppMp7f1KoC16Wddzp4z3jrDNmrZEf+q0kXJhcy
 hL/zv5ANuNjGFajWVeK9QvlWcrZ1+vEAns9DP6ZXq/1ES+jLm1oQGX779Bx6IpCLq9ehgX/SORy
 64ekFtbR38ZvERcDWMEomFViZAVJxCP2XF+0iJVK99ExX8jYUkt00M2hUqRSt06WBinQDX7eAfO
 JfdQnXeSWJE5zEAA9779WH5dXwM8ifb448j0FrH/we8oCDbu3/3SMjD37gL7tQ0pdFQNMSZaFPF
 m45u+ZHqKG9lztZ2FqIOpPNERwFKntcWNZ+G+UPIsfBk3w3w5LG1R2ap3oHTHWHajjBtGG0kKZn
 XAdTm35wA0TxlxbaupYegMPR1U3OX7X0u9kgsUq0GV7w1+WLtMRO3pwZ/zg3nvoTNl1dmMFu31+
 CJRNJApM2afEtFw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This module scans the device tree (for now only OF nodes are supported
but care is taken to make other fwnode implementations easy to
integrate) and determines which GPIO lines are shared by multiple users.
It stores that information in memory. When the GPIO chip exposing shared
lines is registered, the shared GPIO descriptors it exposes are marked
as shared and virtual "proxy" devices that mediate access to the shared
lines are created. When a consumer of a shared GPIO looks it up, its
fwnode lookup is redirected to a just-in-time machine lookup that points
to this proxy device.

This code can be compiled out on platforms which don't use shared GPIOs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig          |   8 +
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpiolib-shared.c | 512 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h |  71 ++++++
 4 files changed, 592 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 7ee3afbc2b05da4d7470e609a0311ecc38727b00..679a7385a9776eef96a86ca4f429ee83ac939362 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -6,6 +6,9 @@
 config GPIOLIB_LEGACY
 	def_bool y
 
+config HAVE_SHARED_GPIOS
+	bool
+
 menuconfig GPIOLIB
 	bool "GPIO Support"
 	help
@@ -42,6 +45,11 @@ config GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN
 	bool
 
+config GPIO_SHARED
+	def_bool y
+	depends on HAVE_SHARED_GPIOS || COMPILE_TEST
+	select AUXILIARY_BUS
+
 config OF_GPIO_MM_GPIOCHIP
 	bool
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ec296fa14bfdb360c27b4578826354762f01f074..f702f7e27e5b4017e7eab3019dae4ec912d534f8 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 gpiolib-acpi-y			:= gpiolib-acpi-core.o gpiolib-acpi-quirks.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-swnode.o
+obj-$(CONFIG_GPIO_SHARED)	+= gpiolib-shared.o
 
 # Device drivers. Generally keep list sorted alphabetically
 obj-$(CONFIG_GPIO_REGMAP)	+= gpio-regmap.o
diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
new file mode 100644
index 0000000000000000000000000000000000000000..d2087d0df4ab7bcd23d3736e341c0f57cd748af4
--- /dev/null
+++ b/drivers/gpio/gpiolib-shared.c
@@ -0,0 +1,512 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Linaro Ltd.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/fwnode.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/idr.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/lockdep.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/overflow.h>
+#include <linux/printk.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "gpiolib.h"
+#include "gpiolib-shared.h"
+
+/* Represents a single reference to a GPIO pin. */
+struct gpio_shared_ref {
+	struct list_head list;
+	/* Firmware node associated with this GPIO's consumer. */
+	struct fwnode_handle *fwnode;
+	/* GPIO flags this consumer uses for the request. */
+	enum gpiod_flags flags;
+	char *con_id;
+	int dev_id;
+	struct auxiliary_device adev;
+	struct gpiod_lookup_table *lookup;
+};
+
+/* Represents a single GPIO pin. */
+struct gpio_shared_entry {
+	struct list_head list;
+	/* Firmware node associated with the GPIO controller. */
+	struct fwnode_handle *fwnode;
+	/* Hardware offset of the GPIO within its chip. */
+	unsigned int offset;
+	/* Index in the property value array. */
+	size_t index;
+	struct gpio_shared_desc *shared_desc;
+	struct kref ref;
+	struct list_head refs;
+};
+
+static LIST_HEAD(gpio_shared_list);
+static DEFINE_MUTEX(gpio_shared_lock);
+static DEFINE_IDA(gpio_shared_ida);
+
+static struct gpio_shared_entry *
+gpio_shared_find_entry(struct fwnode_handle *controller_node,
+		       unsigned int offset)
+{
+	struct gpio_shared_entry *entry;
+
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		if (entry->fwnode == controller_node && entry->offset == offset)
+			return entry;
+	}
+
+	return NULL;
+}
+
+#if IS_ENABLED(CONFIG_OF)
+static int gpio_shared_of_traverse(struct device_node *curr)
+{
+	struct gpio_shared_entry *entry;
+	size_t con_id_len, suffix_len;
+	struct fwnode_handle *fwnode;
+	struct of_phandle_args args;
+	struct property *prop;
+	unsigned int offset;
+	const char *suffix;
+	int ret, count, i;
+
+	for_each_property_of_node(curr, prop) {
+		/*
+		 * The standard name for a GPIO property is "foo-gpios"
+		 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
+		 * There are some legacy device-trees which have a different
+		 * naming convention and for which we have rename quirks in
+		 * place in gpiolib-of.c. I don't think any of them require
+		 * support for shared GPIOs so for now let's just ignore
+		 * them. We can always just export the quirk list and
+		 * iterate over it here.
+		 */
+		if (!strends(prop->name, "-gpios") &&
+		    !strends(prop->name, "-gpio") &&
+		    strcmp(prop->name, "gpios") != 0 &&
+		    strcmp(prop->name, "gpio") != 0)
+			continue;
+
+		count = of_count_phandle_with_args(curr, prop->name,
+						   "#gpio-cells");
+		if (count <= 0)
+			continue;
+
+		for (i = 0; i < count; i++) {
+			struct device_node *np __free(device_node) = NULL;
+
+			ret = of_parse_phandle_with_args(curr, prop->name,
+							 "#gpio-cells", i,
+							 &args);
+			if (ret)
+				continue;
+
+			np = args.np;
+
+			if (!of_property_present(np, "gpio-controller"))
+				continue;
+
+			/*
+			 * We support 1, 2 and 3 cell GPIO bindings in the
+			 * kernel currently. There's only one old MIPS dts that
+			 * has a one-cell binding but there's no associated
+			 * consumer so it may as well be an error. There don't
+			 * seem to be any 3-cell users of non-exclusive GPIOs,
+			 * so we can skip this as well. Let's occupy ourselves
+			 * with the predominant 2-cell binding with the first
+			 * cell indicating the hardware offset of the GPIO and
+			 * the second defining the GPIO flags of the request.
+			 */
+			if (args.args_count != 2)
+				continue;
+
+			fwnode = of_fwnode_handle(args.np);
+			offset = args.args[0];
+
+			entry = gpio_shared_find_entry(fwnode, offset);
+			if (!entry) {
+				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+				if (!entry)
+					return -ENOMEM;
+
+				entry->fwnode = fwnode_handle_get(fwnode);
+				entry->offset = offset;
+				entry->index = count;
+				INIT_LIST_HEAD(&entry->refs);
+
+				list_add_tail(&entry->list, &gpio_shared_list);
+			}
+
+			struct gpio_shared_ref *ref __free(kfree) =
+					kzalloc(sizeof(*ref), GFP_KERNEL);
+			if (!ref)
+				return -ENOMEM;
+
+			ref->fwnode = fwnode_handle_get(of_fwnode_handle(curr));
+			ref->flags = args.args[1];
+
+			if (strends(prop->name, "gpios"))
+				suffix = "-gpios";
+			else if (strends(prop->name, "gpio"))
+				suffix = "-gpio";
+			else
+				suffix = NULL;
+			if (!suffix)
+				continue;
+
+			/* We only set con_id if there's actually one. */
+			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
+				ref->con_id = kstrdup(prop->name, GFP_KERNEL);
+				if (!ref->con_id)
+					return -ENOMEM;
+
+				con_id_len = strlen(ref->con_id);
+				suffix_len = strlen(suffix);
+
+				ref->con_id[con_id_len - suffix_len] = '\0';
+			}
+
+			ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
+			if (ref->dev_id < 0) {
+				kfree(ref->con_id);
+				return -ENOMEM;
+			}
+
+			if (!list_empty(&entry->refs))
+				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
+					 entry->offset, fwnode_get_name(entry->fwnode));
+
+			list_add_tail(&no_free_ptr(ref)->list, &entry->refs);
+		}
+	}
+
+	for_each_child_of_node_scoped(curr, child) {
+		ret = gpio_shared_of_traverse(child);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int gpio_shared_of_scan(void)
+{
+	return gpio_shared_of_traverse(of_root);
+}
+#else
+static int gpio_shared_of_scan(void)
+{
+	return 0;
+}
+#endif /* CONFIG_OF */
+
+static int gpio_shared_make_adev(struct gpio_device *gdev,
+				 struct gpio_shared_ref *ref)
+{
+	struct auxiliary_device *adev = &ref->adev;
+	int ret;
+
+	lockdep_assert_held(&gpio_shared_lock);
+
+	memset(adev, 0, sizeof(*adev));
+
+	adev->id = ref->dev_id;
+	adev->name = "proxy";
+	adev->dev.parent = gdev->dev.parent;
+	/* No need to dev->release() anything. */
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
+		 dev_name(&adev->dev), gpio_device_get_label(gdev));
+
+	return 0;
+}
+
+int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
+{
+	const char *dev_id = dev_name(consumer);
+	struct gpio_shared_entry *entry;
+	struct gpio_shared_ref *ref;
+
+	struct gpiod_lookup_table *lookup __free(kfree) =
+			kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
+	if (!lookup)
+		return -ENOMEM;
+
+	guard(mutex)(&gpio_shared_lock);
+
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		list_for_each_entry(ref, &entry->refs, list) {
+			if (!device_match_fwnode(consumer, ref->fwnode))
+				continue;
+
+			/* We've already done that on a previous request. */
+			if (ref->lookup)
+				return 0;
+
+			char *key __free(kfree) =
+				kasprintf(GFP_KERNEL,
+					  KBUILD_MODNAME ".proxy.%u",
+					  ref->adev.id);
+			if (!key)
+				return -ENOMEM;
+
+			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
+				 dev_id, key, ref->con_id ?: "none");
+
+			lookup->dev_id = dev_id;
+			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
+						       ref->con_id, lflags);
+
+			gpiod_add_lookup_table(no_free_ptr(lookup));
+
+			return 0;
+		}
+	}
+
+	/* We warn here because this can only happen if the programmer borked. */
+	WARN_ON(1);
+	return -ENOENT;
+}
+
+static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+{
+	lockdep_assert_held(&gpio_shared_lock);
+
+	auxiliary_device_uninit(adev);
+	auxiliary_device_delete(adev);
+}
+
+int gpio_device_setup_shared(struct gpio_device *gdev)
+{
+	struct gpio_shared_entry *entry;
+	struct gpio_shared_ref *ref;
+	unsigned long *flags;
+	int ret;
+
+	guard(mutex)(&gpio_shared_lock);
+
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
+			continue;
+
+		if (list_count_nodes(&entry->refs) <= 1)
+			continue;
+
+		flags = &gdev->descs[entry->offset].flags;
+
+		set_bit(GPIOD_FLAG_SHARED, flags);
+		/*
+		 * Shared GPIOs are not requested via the normal path. Make
+		 * them inaccessible to anyone even before we register the
+		 * chip.
+		 */
+		set_bit(GPIOD_FLAG_REQUESTED, flags);
+
+		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
+			 entry->offset, gpio_device_get_label(gdev));
+
+		list_for_each_entry(ref, &entry->refs, list) {
+			pr_debug("Setting up a shared GPIO entry for %s\n",
+				 fwnode_get_name(ref->fwnode));
+
+			ret = gpio_shared_make_adev(gdev, ref);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+void gpio_device_teardown_shared(struct gpio_device *gdev)
+{
+	struct gpio_shared_entry *entry;
+	struct gpio_shared_ref *ref;
+
+	guard(mutex)(&gpio_shared_lock);
+
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
+			continue;
+
+		list_for_each_entry(ref, &entry->refs, list) {
+			gpiod_remove_lookup_table(ref->lookup);
+			kfree(ref->lookup->table[0].key);
+			kfree(ref->lookup);
+			ref->lookup = NULL;
+			gpio_shared_remove_adev(&ref->adev);
+		}
+	}
+}
+
+static void gpio_shared_release(struct kref *kref)
+{
+	struct gpio_shared_entry *entry =
+		container_of(kref, struct gpio_shared_entry, ref);
+	struct gpio_shared_desc *shared_desc = entry->shared_desc;
+
+	guard(mutex)(&gpio_shared_lock);
+
+	gpio_device_put(shared_desc->desc->gdev);
+	if (shared_desc->can_sleep)
+		mutex_destroy(&shared_desc->mutex);
+	kfree(shared_desc);
+	entry->shared_desc = NULL;
+}
+
+static void gpiod_shared_put(void *data)
+{
+	struct gpio_shared_entry *entry = data;
+
+	lockdep_assert_not_held(&gpio_shared_lock);
+
+	kref_put(&entry->ref, gpio_shared_release);
+}
+
+struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct gpio_shared_desc *shared_desc;
+	struct gpio_shared_entry *entry;
+	struct gpio_shared_ref *ref;
+	struct gpio_device *gdev;
+	int ret;
+
+	scoped_guard(mutex, &gpio_shared_lock) {
+		list_for_each_entry(entry, &gpio_shared_list, list) {
+			list_for_each_entry(ref, &entry->refs, list) {
+				if (adev != &ref->adev)
+					continue;
+
+				if (entry->shared_desc) {
+					kref_get(&entry->ref);
+					shared_desc = entry->shared_desc;
+					break;
+				}
+
+				shared_desc = kzalloc(sizeof(*shared_desc), GFP_KERNEL);
+				if (!shared_desc)
+					return ERR_PTR(-ENOMEM);
+
+				gdev = gpio_device_find_by_fwnode(entry->fwnode);
+				if (!gdev) {
+					kfree(shared_desc);
+					return ERR_PTR(-EPROBE_DEFER);
+				}
+
+				shared_desc->desc = &gdev->descs[entry->offset];
+				shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
+				if (shared_desc->can_sleep)
+					mutex_init(&shared_desc->mutex);
+				else
+					spin_lock_init(&shared_desc->spinlock);
+
+				kref_init(&entry->ref);
+				entry->shared_desc = shared_desc;
+
+				pr_debug("Device %s acquired a reference to the shared GPIO %u owned by %s\n",
+					 dev_name(dev), desc_to_gpio(shared_desc->desc),
+					 gpio_device_get_label(gdev));
+				break;
+			}
+		}
+	}
+
+	ret = devm_add_action_or_reset(dev, gpiod_shared_put, entry);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return shared_desc;
+}
+EXPORT_SYMBOL_GPL(devm_gpiod_shared_get);
+
+static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
+{
+	list_del(&ref->list);
+	kfree(ref->con_id);
+	ida_free(&gpio_shared_ida, ref->dev_id);
+	fwnode_handle_put(ref->fwnode);
+	kfree(ref);
+}
+
+static void gpio_shared_drop_entry(struct gpio_shared_entry *entry)
+{
+	list_del(&entry->list);
+	fwnode_handle_put(entry->fwnode);
+	kfree(entry);
+}
+
+/*
+ * This is only called if gpio_shared_init() fails so it's in fact __init and
+ * not __exit.
+ */
+static void __init gpio_shared_teardown(void)
+{
+	struct gpio_shared_entry *entry, *epos;
+	struct gpio_shared_ref *ref, *rpos;
+
+	list_for_each_entry_safe(entry, epos, &gpio_shared_list, list) {
+		list_for_each_entry_safe(ref, rpos, &entry->refs, list)
+			gpio_shared_drop_ref(ref);
+
+		gpio_shared_drop_entry(entry);
+	}
+}
+
+static void gpio_shared_free_exclusive(void)
+{
+	struct gpio_shared_entry *entry, *epos;
+
+	list_for_each_entry_safe(entry, epos, &gpio_shared_list, list) {
+		if (list_count_nodes(&entry->refs) > 1)
+			continue;
+
+		gpio_shared_drop_ref(list_first_entry(&entry->refs,
+						      struct gpio_shared_ref,
+						      list));
+		gpio_shared_drop_entry(entry);
+	}
+}
+
+static int __init gpio_shared_init(void)
+{
+	int ret;
+
+	/* Right now, we only support OF-based systems. */
+	ret = gpio_shared_of_scan();
+	if (ret) {
+		gpio_shared_teardown();
+		pr_err("Failed to scan OF nodes for shared GPIOs: %d\n", ret);
+		return ret;
+	}
+
+	gpio_shared_free_exclusive();
+
+	pr_debug("Finished scanning firmware nodes for shared GPIOs\n");
+	return 0;
+}
+postcore_initcall(gpio_shared_init);
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
new file mode 100644
index 0000000000000000000000000000000000000000..667dbdff3585066b7cbe2ebe476725fe7d683d84
--- /dev/null
+++ b/drivers/gpio/gpiolib-shared.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_GPIO_SHARED_H
+#define __LINUX_GPIO_SHARED_H
+
+#include <linux/cleanup.h>
+#include <linux/lockdep.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+
+struct gpio_device;
+struct gpio_desc;
+struct device;
+
+#if IS_ENABLED(CONFIG_GPIO_SHARED)
+
+int gpio_device_setup_shared(struct gpio_device *gdev);
+void gpio_device_teardown_shared(struct gpio_device *gdev);
+int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags);
+
+#else
+
+static inline int gpio_device_setup_shared(struct gpio_device *gdev)
+{
+	return 0;
+}
+
+static inline void gpio_device_teardown_shared(struct gpio_device *gdev) { }
+
+static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
+					       unsigned long lflags)
+{
+	return 0;
+}
+
+#endif /* CONFIG_GPIO_SHARED */
+
+struct gpio_shared_desc {
+	struct gpio_desc *desc;
+	bool can_sleep;
+	unsigned long cfg;
+	unsigned int usecnt;
+	unsigned int highcnt;
+	union {
+		struct mutex mutex;
+		spinlock_t spinlock;
+	};
+};
+
+struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev);
+
+DEFINE_LOCK_GUARD_1(gpio_shared_desc_lock, struct gpio_shared_desc,
+	if (_T->lock->can_sleep)
+		mutex_lock(&_T->lock->mutex);
+	else
+		spin_lock_irqsave(&_T->lock->spinlock, _T->flags),
+	if (_T->lock->can_sleep)
+		mutex_unlock(&_T->lock->mutex);
+	else
+		spin_unlock_irqrestore(&_T->lock->spinlock, _T->flags),
+	unsigned long flags)
+
+static inline void gpio_shared_lockdep_assert(struct gpio_shared_desc *shared_desc)
+{
+	if (shared_desc->can_sleep)
+		lockdep_assert_held(&shared_desc->mutex);
+	else
+		lockdep_assert_held(&shared_desc->spinlock);
+}
+
+#endif /* __LINUX_GPIO_SHARED_H */

-- 
2.48.1


