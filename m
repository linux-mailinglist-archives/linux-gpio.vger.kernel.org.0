Return-Path: <linux-gpio+bounces-3462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253185B202
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 05:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B624CB211A9
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 04:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A7D5677D;
	Tue, 20 Feb 2024 04:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mIylj/W+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387AE56B98
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 04:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708404789; cv=none; b=jNoAjNq1VqnHktbdAJE74v2nTePJYCDaVda2kAXFFXrMSxxuBK+MnTLg9mMJ0FUm7+7eOdhE97ZItaBpTaV6j3jrewR0QD0EAXS+9UaNy7qJhi3dDg8x5xp9h/tm3VebC59Xbhz6dDtuV3h/2qA/2DteTKW+ts8dhJmhClNBcpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708404789; c=relaxed/simple;
	bh=ADCAk1mIgKohl/Q0QHjOnasOarQxELrz69enL6WnCtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=apaLo6ZvZadSCP3ebyE74OU/TkCFJjhIko9s3TiX6qXvrDWZUlar7A9Oz2RHYuwdQkzQRO7nsIxi8xv0VvEK1HTF+HiEEn20kl6GDAJbbTORpi+vWtOm961L076FrOYVFC/o93Jg7nJvePqm3BzCGRvH2RcIFCozWhYv1jMtCmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mIylj/W+; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c15bef14c3so1103999b6e.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 20:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708404752; x=1709009552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEnWFvpVwL0bdWz+IBfoCYMDbYA8+qUk/22nOyu5FrY=;
        b=mIylj/W+Ogy/0dNN0f0AfU1yb9+7dIh0EIprtjHx+1aZPb+a3XfU7AzjlbkDAdiR8x
         6RAUDfCrSOcs7vdhWsjZJ+Fm2q6PBvHmk9itkHTiJMSsQ+pP4ZpYSfeq3CeNm76A+kjn
         o2ubSCKjIIVK+FCY+6NIaMgD8jpi/GGCgRs7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708404752; x=1709009552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEnWFvpVwL0bdWz+IBfoCYMDbYA8+qUk/22nOyu5FrY=;
        b=itKo4uvG4UGaCFrSvD8bp7rYzOhKJqv3tBdGk5rwi+c7ebv8JSa7XMoD5D7pp9WQAX
         SlYs4L6zp45GioDx7H0UmcMQbrcXzbKQOLOrzJD4DAkhwnBlFrUs8gAudhdSnZ8tQf/o
         p44tyWzfl1qqVXLfiKuDBhBxqEKo4euHyRmCa5EcU4E6kqsQ6JiPJav0b87MyVb86yYr
         nVuXUH4cMSKUOYRmoFXlDjkUuDWap3LVzLAmyoOaPA3wiJaZGgKH0Fxad/wzII6hPWV+
         VTD32d842iht0GMmnm94OZDA9dn/PBnNGMFq+wnF8xbUPe5zeiBxpNJdnSSj+ZOtrwip
         p3dA==
X-Forwarded-Encrypted: i=1; AJvYcCV2TmO+5ApnjO9rycDfJdomAuXWu2X4davS1B1LFx40cgoG9hpH2oIXN40mbCQGf7Tz268yRegBdaFtm4hExuXb+F5NJiEZcUqW3g==
X-Gm-Message-State: AOJu0YwX1SP0koS90NnCQGCklbbVQeEWTy4wShLROivh7nf7YGqxRG5l
	UYIALBi1j67rw+EPfH+D9T9tM9vupIORt+GGww+9mumyE691hoGFYNPAGTFs0A==
X-Google-Smtp-Source: AGHT+IFX35Pxh2gV06oKGBT3gRp2DPUqRIZN6FqPB3FFoylV6KErBkkKsREubooXeFlW0B/hlkJPxg==
X-Received: by 2002:a05:6358:881:b0:17a:d84e:c106 with SMTP id m1-20020a056358088100b0017ad84ec106mr14365647rwj.5.1708404752252;
        Mon, 19 Feb 2024 20:52:32 -0800 (PST)
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id qn11-20020a17090b3d4b00b00298f88c3e48sm6176611pjb.11.2024.02.19.20.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 20:52:31 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2] gpio: Add ChromeOS EC GPIO driver
Date: Mon, 19 Feb 2024 20:52:27 -0800
Message-ID: <20240220045230.2852640-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ChromeOS embedded controller (EC) supports setting the state of
GPIOs when the system is unlocked, and getting the state of GPIOs in all
cases. The GPIOs are on the EC itself, so the EC acts similar to a GPIO
expander. Add a driver to get and set the GPIOs on the EC through the
host command interface.

Cc: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: <linux-gpio@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1 (https://lore.kernel.org/r/20240210070934.2549994-3-swboyd@chromium.org):
 * Remove headers that aren't used or necessary
 * Make the device an mfd_cell instead of child node in DT
 * Remove the devicetable because there's no compatible anymore
 * Prefix line names with "EC:" to avoid conflicts

 drivers/gpio/Kconfig        |  10 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-cros-ec.c | 209 ++++++++++++++++++++++++++++++++++++
 3 files changed, 220 insertions(+)
 create mode 100644 drivers/gpio/gpio-cros-ec.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1301cec94f12..f6792c814e84 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1240,6 +1240,16 @@ config GPIO_BD9571MWV
 	  This driver can also be built as a module. If so, the module
 	  will be called gpio-bd9571mwv.
 
+config GPIO_CROS_EC
+	tristate "ChromeOS EC GPIO support"
+	depends on CROS_EC
+	help
+	  GPIO driver for the ChromeOS Embedded Controller (EC). GPIOs
+	  cannot be set unless the system is unlocked.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio-cros-ec.
+
 config GPIO_CRYSTAL_COVE
 	tristate "GPIO support for Crystal Cove PMIC"
 	depends on (X86 || COMPILE_TEST) && INTEL_SOC_PMIC
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 9e40af196aae..7ae4d81de1df 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
 obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
 obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
+obj-$(CONFIG_GPIO_CROS_EC)		+= gpio-cros-ec.o
 obj-$(CONFIG_GPIO_CRYSTAL_COVE)		+= gpio-crystalcove.o
 obj-$(CONFIG_GPIO_CS5535)		+= gpio-cs5535.o
 obj-$(CONFIG_GPIO_DA9052)		+= gpio-da9052.o
diff --git a/drivers/gpio/gpio-cros-ec.c b/drivers/gpio/gpio-cros-ec.c
new file mode 100644
index 000000000000..842e1c060414
--- /dev/null
+++ b/drivers/gpio/gpio-cros-ec.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2024 Google LLC
+ *
+ * This driver provides the ability to control GPIOs on the Chrome OS EC.
+ * There isn't any direction control, and setting values on GPIOs is only
+ * possible when the system is unlocked.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_data/cros_ec_commands.h>
+#include <linux/platform_data/cros_ec_proto.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+/* Prefix all names to avoid collisions with EC <-> AP nets */
+static const char cros_ec_gpio_prefix[] = "EC:";
+
+/* Setting gpios is only supported when the system is unlocked */
+static void cros_ec_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	const char *name = gc->names[gpio] + strlen(cros_ec_gpio_prefix);
+	struct cros_ec_device *cros_ec = gpiochip_get_data(gc);
+	struct ec_params_gpio_set params = {
+		.val = val,
+	};
+	int ret;
+	ssize_t copied;
+
+	copied = strscpy(params.name, name, sizeof(params.name));
+	if (copied < 0)
+		return;
+
+	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_GPIO_SET, &params,
+			  sizeof(params), NULL, 0);
+	if (ret < 0)
+		dev_err(gc->parent, "error setting gpio%d (%s) on EC: %d\n", gpio, name, ret);
+}
+
+static int cros_ec_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	const char *name = gc->names[gpio] + strlen(cros_ec_gpio_prefix);
+	struct cros_ec_device *cros_ec = gpiochip_get_data(gc);
+	struct ec_params_gpio_get params;
+	struct ec_response_gpio_get response;
+	int ret;
+	ssize_t copied;
+
+	copied = strscpy(params.name, name, sizeof(params.name));
+	if (copied < 0)
+		return -EINVAL;
+
+	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_GPIO_GET, &params,
+			  sizeof(params), &response, sizeof(response));
+	if (ret < 0) {
+		dev_err(gc->parent, "error getting gpio%d (%s) on EC: %d\n", gpio, name, ret);
+		return ret;
+	}
+
+	return response.val;
+}
+
+#define CROS_EC_GPIO_INPUT         BIT(8)
+#define CROS_EC_GPIO_OUTPUT        BIT(9)
+
+static int cros_ec_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	const char *name = gc->names[gpio] + strlen(cros_ec_gpio_prefix);
+	struct cros_ec_device *cros_ec = gpiochip_get_data(gc);
+	struct ec_params_gpio_get_v1 params = {
+		.subcmd = EC_GPIO_GET_INFO,
+		.get_info.index = gpio,
+	};
+	struct ec_response_gpio_get_v1 response;
+	int ret;
+
+	ret = cros_ec_cmd(cros_ec, 1, EC_CMD_GPIO_GET, &params,
+			  sizeof(params), &response, sizeof(response));
+	if (ret < 0) {
+		dev_err(gc->parent, "error getting direction of gpio%d (%s) on EC: %d\n", gpio, name, ret);
+		return ret;
+	}
+
+	if (response.get_info.flags & CROS_EC_GPIO_INPUT)
+		return GPIO_LINE_DIRECTION_IN;
+
+	if (response.get_info.flags & CROS_EC_GPIO_OUTPUT)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return -EINVAL;
+}
+
+/* Query EC for all gpio line names */
+static int cros_ec_gpio_init_names(struct cros_ec_device *cros_ec, struct gpio_chip *gc)
+{
+	struct ec_params_gpio_get_v1 params = {
+		.subcmd = EC_GPIO_GET_INFO,
+	};
+	struct ec_response_gpio_get_v1 response;
+	int ret, i;
+	/* EC may not NUL terminate */
+	size_t name_len = strlen(cros_ec_gpio_prefix) + sizeof(response.get_info.name) + 1;
+	ssize_t copied;
+	const char **names;
+	char *str;
+
+	names = devm_kcalloc(gc->parent, gc->ngpio, sizeof(*names), GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+	gc->names = names;
+
+	str = devm_kcalloc(gc->parent, gc->ngpio, name_len, GFP_KERNEL);
+	if (!str)
+		return -ENOMEM;
+
+	/* Get gpio line names one at a time */
+	for (i = 0; i < gc->ngpio; i++) {
+		params.get_info.index = i;
+		ret = cros_ec_cmd(cros_ec, 1, EC_CMD_GPIO_GET, &params,
+				  sizeof(params), &response, sizeof(response));
+		if (ret < 0) {
+			dev_err_probe(gc->parent, ret, "error getting gpio%d info\n", i);
+			return ret;
+		}
+
+		names[i] = str;
+		copied = scnprintf(str, name_len, "%s%s", cros_ec_gpio_prefix,
+				   response.get_info.name);
+		if (copied < 0)
+			return copied;
+
+		str += copied + 1;
+	}
+
+	return 0;
+}
+
+/* Query EC for number of gpios */
+static int cros_ec_gpio_ngpios(struct cros_ec_device *cros_ec)
+{
+	struct ec_params_gpio_get_v1 params = {
+		.subcmd = EC_GPIO_GET_COUNT,
+	};
+	struct ec_response_gpio_get_v1 response;
+	int ret;
+
+	ret = cros_ec_cmd(cros_ec, 1, EC_CMD_GPIO_GET, &params,
+			  sizeof(params), &response, sizeof(response));
+	if (ret < 0)
+		return ret;
+
+	return response.get_count.val;
+}
+
+static int cros_ec_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	struct cros_ec_dev *ec_dev = dev_get_drvdata(parent);
+	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
+	struct gpio_chip *gc;
+	int ngpios;
+	int ret;
+
+	/* Use the fwnode from the protocol device, e.g. cros-ec-spi */
+	device_set_node(dev, dev_fwnode(cros_ec->dev));
+
+	ngpios = cros_ec_gpio_ngpios(cros_ec);
+	if (ngpios < 0) {
+		dev_err_probe(dev, ngpios, "error getting gpio count\n");
+		return ngpios;
+	}
+
+	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	gc->ngpio = ngpios;
+	gc->parent = dev;
+	ret = cros_ec_gpio_init_names(cros_ec, gc);
+	if (ret)
+		return ret;
+
+	gc->can_sleep = true;
+	gc->label = dev_name(dev);
+	gc->base = -1;
+	gc->set = cros_ec_gpio_set;
+	gc->get = cros_ec_gpio_get;
+	gc->get_direction = cros_ec_gpio_get_direction;
+
+	return devm_gpiochip_add_data(dev, gc, cros_ec);
+}
+
+static struct platform_driver cros_ec_gpio_driver = {
+	.probe = cros_ec_gpio_probe,
+	.driver = {
+		.name = "cros-ec-gpio",
+	},
+};
+module_platform_driver(cros_ec_gpio_driver);
+
+MODULE_DESCRIPTION("ChromeOS EC GPIO Driver");
+MODULE_LICENSE("GPL");

base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
https://chromeos.dev


