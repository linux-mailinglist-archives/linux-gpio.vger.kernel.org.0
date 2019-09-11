Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92335AF73A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 09:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbfIKHwn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 03:52:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39423 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbfIKHwd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 03:52:33 -0400
Received: by mail-pf1-f196.google.com with SMTP id i1so4304148pfa.6;
        Wed, 11 Sep 2019 00:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKLtdokeOoRF3SRWNOq5UT1zY3ZXy0T2vFi4VcDT30o=;
        b=bwMX/jqDCuA3mgnugHD0og1w1xqERquBp3pjLXh9xr4ZtLEGTSDW+BphHSD2VintP4
         dmMbfwifJ7PGuRV5Kx8GiZwPQvrcHKuxW9KG0PFUlDW8d9VTRVSg8FT6fRXu0Mn/PTg5
         ruyxr1SYJDXMcdrlB8GjKKLW2oeqsKXe890uetXIvVpXUxArc7zPw+ViSkwZKkwxLowR
         kHu74qN8sHbhRgOFs3dDO78pwWpK5ADAkrGifbAYWYnk5ZmN7CV0+PMrYUv7gGCWKHxs
         V3ereFdZzMvw3W8001Da8RH4mDywWfQcA/jtpJdrAcgQCMyN3JZU7xVrpTl2MBAQ5J2J
         2V/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKLtdokeOoRF3SRWNOq5UT1zY3ZXy0T2vFi4VcDT30o=;
        b=Vwa8g31uuOD8uUH44L5DMllUE8Sxs5vbNFOw5F3viiaidyIEQF5i1nu19pwQPbtB19
         BNi3fHaNAb1GuQRZTtZnk65lLUUtRoguAe47NAkDTpJ95r1oKBOUfzst2LNJ4kRjKDAW
         39J4a9J9SVkpbTN6C4M+IIu/VuFhdDWw+/8LUDxiabQc1aw+1u1/xjt1CM39i0QoZqp+
         a2p4i6FcxLjFrFSLDywjMYxuAaUWkUm0xARuYBJ6NIyaSvsHRJV/+5r8cztq+nzX7yrW
         oxnyHK3CDb+M1Gr1NuZZ/u3dcpiVAw5Pq5Z1mNZtzpVeY3ODau61MYPcmBZkC3tNEaCS
         +tAw==
X-Gm-Message-State: APjAAAXZ+j3Ze6Mb/U0XWUOAJ0YyPEj57FQOMWe+NkFhkfZY1BqFd+vq
        6hnyLOhKc0GyPJc2r5CTBso=
X-Google-Smtp-Source: APXvYqw6at7dv7tZ/aC8L4GCiaU6acQ/RkIsI4G1MnS2IAJcx1wKj4CXMTmGu4N5sjAy34LaJybNhA==
X-Received: by 2002:a63:fc52:: with SMTP id r18mr31872839pgk.378.1568188352173;
        Wed, 11 Sep 2019 00:52:32 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u2sm8582445pgp.66.2019.09.11.00.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 00:52:31 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 11/11] gpiolib: add support for software nodes
Date:   Wed, 11 Sep 2019 00:52:15 -0700
Message-Id: <20190911075215.78047-12-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
In-Reply-To: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that static device properties understand notion of child nodes and
references, let's teach gpiolib to handle them:

- GPIOs are represented as a references to software nodes representing
  gpiochip
- references must have 2 arguments - GPIO number within the chip and
  GPIO flags (GPIO_ACTIVE_LOW/GPIO_ACTIVE_HIGH, etc).
- name of the software node representing gpiochip must match label of
  the gpiochip, as we use it to locate gpiochip structure at runtime.

const struct software_node gpio_bank_b_node = {
	.name = "B",
};

const struct property_entry simone_key_enter_props[] __initconst = {
	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
	PROPERTY_ENTRY_STRING("label", "enter"),
	PROPERTY_ENTRY_REF("gpios", &gpio_bank_b_node, 123, GPIO_ACTIVE_LOW),
	{ }
};

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---

 drivers/gpio/Makefile         |  1 +
 drivers/gpio/gpiolib-swnode.c | 92 +++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-swnode.h | 13 +++++
 drivers/gpio/gpiolib.c        | 31 ++++++++++--
 4 files changed, 133 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpio/gpiolib-swnode.c
 create mode 100644 drivers/gpio/gpiolib-swnode.h

diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d2fd19c15bae..41869ba725e2 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devres.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-legacy.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devprop.o
+obj-$(CONFIG_GPIOLIB)		+= gpiolib-swnode.o
 obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
 obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
new file mode 100644
index 000000000000..a20d73cc9a3f
--- /dev/null
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Software Node helpers for the GPIO API
+ *
+ * Copyright 2019 Google LLC
+ */
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gpio/consumer.h>
+
+#include "gpiolib.h"
+#include "gpiolib-swnode.h"
+
+static int swnode_gpiochip_match_name(struct gpio_chip *chip, void *data)
+{
+	return !strcmp(chip->label, data);
+}
+
+struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
+				   const char *con_id, unsigned int idx,
+				   unsigned long *flags)
+{
+	const struct software_node *chip_node;
+	const struct software_node *swnode;
+	struct fwnode_reference_args args;
+	struct gpio_chip *chip;
+	char prop_name[32]; /* 32 is max size of property name */
+	int error;
+
+	swnode = to_software_node(fwnode);
+	if (!swnode)
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * Note we do not need to try both -gpios and -gpio suffixes,
+	 * as, unlike OF and ACPI, we can fix software nodes to conform
+	 * to the proper binding.
+	 */
+	if (con_id)
+		snprintf(prop_name, sizeof(prop_name), "%s-gpios", con_id);
+	else
+		stracpy(prop_name, "gpios");
+
+	/*
+	 * We expect all swnode-described GPIOs have GPIO number and
+	 * polarity arguments, hence nargs is set to 2.
+	 */
+	error = fwnode_property_get_reference_args(fwnode, prop_name, NULL,
+						   2, idx, &args);
+	if (error) {
+		pr_debug("%s: can't parse '%s' property of node '%s[%d]'\n",
+			__func__, prop_name, swnode->name ?: "unnamed", idx);
+		return ERR_PTR(error);
+	}
+
+	chip_node = to_software_node(args.fwnode);
+	if (!chip_node || !chip_node->name)
+		return ERR_PTR(-EINVAL);
+
+	chip = gpiochip_find((void *)chip_node->name,
+			     swnode_gpiochip_match_name);
+	if (!chip)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	/* We expect native GPIO flags */
+	*flags = args.args[1];
+
+	return gpiochip_get_desc(chip, args.args[0]);
+}
+
+int swnode_gpio_count(struct fwnode_handle *fwnode, const char *con_id)
+{
+	struct fwnode_reference_args args;
+	char prop_name[32];
+	int count;
+
+	if (con_id)
+		snprintf(prop_name, sizeof(prop_name), "%s-gpios", con_id);
+	else
+		stracpy(prop_name, "gpios");
+
+	/*
+	 * This is not very efficient, but GPIO lists usually have only
+	 * 1 or 2 entries.
+	 */
+	count = 0;
+	while (fwnode_property_get_reference_args(fwnode, prop_name, NULL,
+						  0, count, &args) == 0)
+		count++;
+
+	return count ? count : -ENOENT;
+}
diff --git a/drivers/gpio/gpiolib-swnode.h b/drivers/gpio/gpiolib-swnode.h
new file mode 100644
index 000000000000..afd51c9b6e34
--- /dev/null
+++ b/drivers/gpio/gpiolib-swnode.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef GPIOLIB_SWNODE_H
+#define GPIOLIB_SWNODE_H
+
+struct fwnode_handle;
+
+struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
+				   const char *con_id, unsigned int idx,
+				   unsigned long *flags);
+int swnode_gpio_count(struct fwnode_handle *fwnode, const char *con_id);
+
+#endif /* GPIOLIB_SWNODE_H */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6534dcd6e406..0f41b4b9b8ba 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -31,6 +31,7 @@
 #include "gpiolib.h"
 #include "gpiolib-of.h"
 #include "gpiolib-acpi.h"
+#include "gpiolib-swnode.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/gpio.h>
@@ -4335,6 +4336,16 @@ static struct gpio_desc *fwnode_locate_gpiod(struct fwnode_handle *fwnode,
 			desc = acpi_find_gpio_fallback(ACPI_COMPANION(dev),
 						       con_id, idx,
 						       flags, lookupflags);
+	} else if (is_software_node(fwnode)) {
+		dev_dbg(dev, "using software node for GPIO lookup\n");
+		desc = swnode_find_gpio(fwnode, con_id, idx, lookupflags);
+	}
+
+	if (IS_ERR(desc) &&
+	    !IS_ERR_OR_NULL(fwnode) &&
+	    is_software_node(fwnode->secondary)) {
+		desc = swnode_find_gpio(fwnode->secondary,
+					con_id, idx, lookupflags);
 	}
 
 	return desc;
@@ -4397,12 +4408,24 @@ EXPORT_SYMBOL_GPL(fwnode_gpiod_get_index);
  */
 int gpiod_count(struct device *dev, const char *con_id)
 {
+	struct fwnode_handle *fwnode;
 	int count = -ENOENT;
 
-	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
-		count = of_gpio_get_count(dev, con_id);
-	else if (IS_ENABLED(CONFIG_ACPI) && dev && ACPI_HANDLE(dev))
-		count = acpi_gpio_count(dev, con_id);
+	if (dev) {
+		fwnode = dev_fwnode(dev);
+		if (is_of_node(fwnode))
+			count = of_gpio_get_count(dev, con_id);
+		else if (is_acpi_device_node(fwnode))
+			count = acpi_gpio_count(dev, con_id);
+		else if (is_software_node(fwnode))
+			count = swnode_gpio_count(fwnode, con_id);
+
+		if (count < 0 &&
+		    !IS_ERR_OR_NULL(fwnode) &&
+		    is_software_node(fwnode->secondary)) {
+			count = swnode_gpio_count(fwnode, con_id);
+		}
+	}
 
 	if (count < 0)
 		count = platform_gpio_count(dev, con_id);
-- 
2.23.0.162.g0b9fbb3734-goog

