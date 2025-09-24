Return-Path: <linux-gpio+bounces-26547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E108B9A682
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 16:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DF707B2E19
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 14:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE5531985E;
	Wed, 24 Sep 2025 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YR9oMQfo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816B830F556
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725525; cv=none; b=VH85nxqpyIlpjVhyofTcviDUyBq6s3CtoGMZCiKXAMryUkbv9CvM1sPH8xqUXnfxCe4I9VVaDHtjbeZReghhaVE8ZGYWyDAfhC+kVrI19lPzwWcjpiL75CnYd3WXqV/wG6BhlkXfcCWLTKFXMq39NPwFMpP69eF2c0mwHgkM5YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725525; c=relaxed/simple;
	bh=4za0Ya7S++NLiJanWlCxBlaG3wVI9v7d0CmK8ibmrDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBmNLEbuGN3Sy9E5z9p8QFxlfb2lYDdyMQFVTdQMdJ29b52X+AAUEb7QUDEceTkYYyLJtf0hmUm2L2srX1QUfaW7lSIEt7kDgr8LftISIgaRH1eOUZNBsr+tnqJu64mjrp6s9z+yv3Buobe8zeNXRRKHloSFTOz9KmfK/tLVakQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YR9oMQfo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so5210476f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725521; x=1759330321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFgRf86YKrXkrP+wDE43FjexKvyhBWcztrfITVEs86o=;
        b=YR9oMQfoeyWXRi2rIaK/tyQyEvnTLoPkhiTBGAbrgFDugI6prDZVTIxmllEFHmedJm
         Ae+ii7GvloJzRE5hKUo/r4ZN8NXA9c9FMQXrqvsdD/SPooEIPEs9rbUHsmEgebKX7Q4f
         fMfWd1QCF0E+KaKX5hr7QLRqa+mEdlRl2losmF6iURNy2TeYpsRdQ74pXlYyWIvbdima
         ZAhPXEkrhEKPguvla9+rRUF/FO51tJxw79tgbFca/PyfVAFk/jXe++wqmXioZZgdBwFQ
         8EHvEhgKNXkqBzeYhwOE0dt5xO5ibzcSgzMeorCcyjqHfuCx4Iyxu50IL9/GfqequAEc
         89iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725521; x=1759330321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFgRf86YKrXkrP+wDE43FjexKvyhBWcztrfITVEs86o=;
        b=AUeGm0K97h7t+o3jH010wr1F3kyWAk9OlmO2XPFSO4sr7hUaJB2/EyPpGE4w/+I0wJ
         l/r66C0TuQkqO/ndDHEpYp01goset407WMsfm7kyHn2cI4tc2ugsNnNdDvH4rtH7bBT7
         lHOnx5B5N5iahyOV66DBooo+DDrc+Utghv+bvHyqmd4GwIPGLxdnfW7pV6SAuG4uuMsL
         EvY9PJRUa+HS+TwibxNy4RFS3r9sVXPMZMsJsEH+deUf/JuRN7qPRwTQ/mSbiSTwXmUU
         Rqaw2nsRgkGMXTQE2Aeu4g5U4jYbmV3B23kheDV8g3YdNaigLYWKFgs6c4UG12zfYLJY
         ud/w==
X-Forwarded-Encrypted: i=1; AJvYcCU0vPXtLoHgPkKzVhY7LiJPkBJfSLfCXHpyj9xaPPGniAWq5Ds6Ejngm2aMuoZuVtuYonfO7BZyoPPW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/1t7pOjkN8nq5kh4xLLg7N1iMVmQM8gVEkHhMQsSc9394wRMY
	lkK0Q8Ipj1/0dlEbUSccNSoRoBfX/zGd+N7P+EzLEqee0h++z3IFTDVSd+Y9Sadygwc=
X-Gm-Gg: ASbGncsxSUk4e0TfRJFSU6NrnTkdf6dCiThhbf1Ds7VM3q01JLZrOTmHynAxN/PzU4K
	vgmoFSoAeetpsu0w8lWJYV/Qmf6h9IJzNEgrVK8wkfGvLypabKx9H4tN+SEch91/jCf6TzKpL+K
	GYT66CNV/5C8m5vJ5z4hIHrHSLuTDd8DgJOFN513syZAYofZ2GkVNN/Ejn0UkPqhpFYiF7ErAs6
	d/MPaPWZJwBUdXyT9TY+rbdDuKKYby4XQN8/RMXqioP1/rU9zKNISDinuSfukU3X5IBXhyZPFrN
	5nP69vr9HKxqU+NH7l6sw+QAP8pUL5BalXQPP8Wl2dq46UsEAdTVUNtaDLqnqAcJqXXpiiHQSHu
	FV1sOmpnqIJvGZywXMw==
X-Google-Smtp-Source: AGHT+IGv2HXUkbE/sLaSIzRqiTyAPKTJcchAXbsyOlvbPTIxZpQoQsCdK0sQG1mCkOaBbD29+ycKLw==
X-Received: by 2002:a05:6000:40c8:b0:3f2:b86a:5356 with SMTP id ffacd0b85a97d-40e468e7286mr258911f8f.15.1758725520672;
        Wed, 24 Sep 2025 07:52:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:51:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:32 +0200
Subject: [PATCH RFC 4/9] gpiolib: implement low-level, shared GPIO support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-4-775e7efeb1a3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17525;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vCkuB+L8OAyt85xbWNm/rEUGTyXD5rscBTub35QBrYA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWFW9Z9P5QM7D+nS/nByTaAgcvUAL6Om2GZw
 QXX3EVZ8S+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhQAKCRARpy6gFHHX
 ctP6EACV7Q9voSBIDBzO6tdwHCt/iaaMMeNweJy96jWMS4qc3/y8A3Bs0unygX0yqt6H6RXJ/EM
 vYotNRotrQQ1HTBtrU8KEdhX97Ft+XL/wVgMubC5VqPJjCJ4jMXn8WkAXXiaKdgnMFKM2pwZWrx
 gddUtjfMemct5dp1o7iudLJz/PB8bwKPhVjHim3xjsG0NJmcCE4vzBfF/B2PGHt45s0hStEc/8d
 tKcJkE/e6pZHybQM9/j38GmEAxkKY3fm1sKWTZSVgDi+MEgneFRh6o0pE+hiG+CiYnvRgGF2HAT
 gaEHisjB8TvIAWX8Kof7Ryeze7KJqIq/L1OYmQ3jLPqulB4oTY4KEKCFyTSW7oVnvXWEqfe2v/L
 sXCdXr0IAtxsHQ3ibjcEeeFbhNs7FUNzmB48ErAsEalFBTmIkqTEkpp27O7RvqPmaHx3HQywrJf
 l4lR1+X/J6hfZ6Mlw35VYvuiw3Kmulz+D/rsFAjfTHS0pqL48rkXAI8BjFZf4/ZlTkoR9AFUAcu
 VUQsEn+i4U5aw4oNi5RocsSxVmH77JtwBFGMts89IwZzYwRTmQHnPYVA9v5U2j2gYQ6pjQym+pG
 WAcqART8Vl5lF/h+Cfm+xsVt8A5Y4FRt4sTMfH7d+z0YN7w8HGBxXIzbb8RXkiPsVyfkoSV2Xv3
 IDJ4bnznrSBHlOg==
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
 drivers/gpio/gpiolib-shared.c | 481 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h |  71 +++++++
 4 files changed, 561 insertions(+)

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
index 0000000000000000000000000000000000000000..97c16a73bb207bdf1728adda87161c1522415a67
--- /dev/null
+++ b/drivers/gpio/gpiolib-shared.c
@@ -0,0 +1,481 @@
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
+	static const char *const suffixes[] = { "-gpios", "-gpio", NULL };
+
+	struct gpio_shared_entry *entry;
+	size_t con_id_len, suffix_len;
+	struct fwnode_handle *fwnode;
+	struct gpio_shared_ref *ref;
+	struct of_phandle_args args;
+	const char *const *suffix;
+	struct property *prop;
+	unsigned int offset;
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
+			ref = kzalloc(sizeof(*ref), GFP_KERNEL);
+			if (!ref)
+				return -ENOMEM;
+
+			ref->fwnode = fwnode_handle_get(of_fwnode_handle(curr));
+			ref->flags = args.args[1];
+
+			for (suffix = suffixes; *suffix; suffix++) {
+				if (!strends(prop->name, *suffix))
+					continue;
+
+				ref->con_id = kstrdup(prop->name, GFP_KERNEL);
+				if (!ref->con_id)
+					return -ENOMEM;
+
+				ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
+				if (ref->dev_id < 0) {
+					kfree(ref->con_id);
+					return -ENOMEM;
+				}
+
+				con_id_len = strlen(ref->con_id);
+				suffix_len = strlen(*suffix);
+
+				ref->con_id[con_id_len - suffix_len] = '\0';
+			}
+
+			if (!list_empty(&entry->refs))
+				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
+					 entry->offset, fwnode_get_name(entry->fwnode));
+
+			list_add_tail(&ref->list, &entry->refs);
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
+				 dev_id, key, ref->con_id);
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
+		list_for_each_entry_safe(ref, rpos, &entry->refs, list) {
+			list_del(&ref->list);
+			kfree(ref->con_id);
+			ida_free(&gpio_shared_ida, ref->dev_id);
+			fwnode_handle_put(ref->fwnode);
+			kfree(ref);
+		}
+
+		list_del(&entry->list);
+		fwnode_handle_put(entry->fwnode);
+		kfree(entry);
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


