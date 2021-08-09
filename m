Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8153E4570
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 14:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbhHIMOV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 08:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234645AbhHIMOM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 08:14:12 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80AD9C0613D3;
        Mon,  9 Aug 2021 05:13:52 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id f8so11156034ilr.4;
        Mon, 09 Aug 2021 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PQACd5GWebR2qRbsmRwc5hEdO7V8PUPVaRknhZhjXJw=;
        b=VadWKszYdfnW6JFMRIbZuXZly14NrB9m2a4O5+hSJXGyFegCCxx1uVghyOniEk+nym
         a7M1iTgcnwLOhzb+HmwUABwpaSVvkOMun85pis83HvdCFEWNafUn0fsUMeBW7fM/07jt
         vn5LJ2jZTHZ7K+ymORSCrih2CvxQfkO7yvWzFKPk7YbT+MpyqbKTnNo+5/Q2lz/tkflm
         uAvl6vOHoThD9HK0c+P1NXvXf30wH9LgI2K74PJZsdnljA9o1vaJ6zpXCfk9ViF4b9j2
         Gk/SZOzS2Xa3utrgiq04xP6nW3BeWJpiB+IdK/d4wcx0J44h7+gRWV8zOCDFXRIcIHWD
         w14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PQACd5GWebR2qRbsmRwc5hEdO7V8PUPVaRknhZhjXJw=;
        b=IoX5Tm1W+Yh/I/NiVj8qnX6KraWEA8MfcMblPbXcR+dHCdmtPQgmZu4eSfa5Hk3hDO
         ymi15xJF9foUwqojMRz8lo3ON6BZBiLhroYvxa7kY/Xqut13agseLm+/BAkntlBL3Ena
         Mpuio9gXq/xYDSoQ8HH6+A2V+vzrMQ9Sg6mEjQ6ANajIxeLGDT5TplD6miQpnZBTLeyn
         yiMdMCgVkEFkmH1d8jvlX1bRSQahHYP1jdVs/XHKcVY3nKHxflH5/b03P6bMWRFu9tSY
         YA6Bl9IxeO9Eq01aBCp/r9HpmU3RWfxANPDzulMDhcyJTvlRdwWOvJCc234E3gGAJGtr
         kaiA==
X-Gm-Message-State: AOAM530DtP/P3zyzDnm/w86IyGDNNvogJHCPnNZYYjaop/bgUhczNFKv
        0SyyCtbJJ3wyVuvLowc03zdxglZ6jKQwuvIj
X-Google-Smtp-Source: ABdhPJxzDZwTtPvYu6bOl+0pSkoNfw13DoVIalI5hTjSxXuaPcSVd2eIGmm5KQTM7n1SSD7QCnXfmg==
X-Received: by 2002:a92:7f03:: with SMTP id a3mr193811ild.254.1628511231582;
        Mon, 09 Aug 2021 05:13:51 -0700 (PDT)
Received: from Crosshair-VIII-Hero.lan ([2600:6c46:7d7f:ec00::a11])
        by smtp.gmail.com with ESMTPSA id w10sm2013736ioc.55.2021.08.09.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 05:13:51 -0700 (PDT)
From:   Chris Blake <chrisrblake93@gmail.com>
To:     platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        chunkeey@gmail.com, hdegoede@redhat.com, andy.shevchenko@gmail.com
Cc:     Chris Blake <chrisrblake93@gmail.com>
Subject: [PATCH v3] platform/x86: add meraki-mx100 platform driver
Date:   Mon,  9 Aug 2021 07:13:45 -0500
Message-Id: <20210809121345.967597-1-chrisrblake93@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
network appliance. This sets up the network LEDs and Reset
button.

Depends-on: ef0eea5b151ae ("mfd: lpc_ich: Enable GPIO driver for DH89xxCC")
Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
---

Changelog:
V3: Additional cleanups, formatting changes
V2: Move to using gpiod lookup tables, misc cleanups
V1: Initial Patch

 drivers/platform/x86/Kconfig        |  13 ++
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/meraki-mx100.c | 202 ++++++++++++++++++++++++++++
 3 files changed, 218 insertions(+)
 create mode 100644 drivers/platform/x86/meraki-mx100.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7d385c3b2239..8d70176e335f 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -302,6 +302,19 @@ config ASUS_NB_WMI
 	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
 	  here.
 
+config MERAKI_MX100
+	tristate "Cisco Meraki MX100 Platform Driver"
+	depends on GPIOLIB
+	depends on GPIO_ICH
+	depends on LEDS_CLASS
+	select LEDS_GPIO
+	help
+	  This driver provides support for the front button and LEDs on
+	  the Cisco Meraki MX100 (Tinkerbell) 1U appliance.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called meraki-mx100.
+
 config EEEPC_LAPTOP
 	tristate "Eee PC Hotkey Driver"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 7ee369aab10d..25c5aee1cde7 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -39,6 +39,9 @@ obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
 obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
 obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
 
+# Cisco/Meraki
+obj-$(CONFIG_MERAKI_MX100)	+= meraki-mx100.o
+
 # Dell
 obj-$(CONFIG_X86_PLATFORM_DRIVERS_DELL)		+= dell/
 
diff --git a/drivers/platform/x86/meraki-mx100.c b/drivers/platform/x86/meraki-mx100.c
new file mode 100644
index 000000000000..eebbd0a3d806
--- /dev/null
+++ b/drivers/platform/x86/meraki-mx100.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Cisco Meraki MX100 (Tinkerbell) board platform driver
+ *
+ * Based off of arch/x86/platform/meraki/tink.c from the
+ * Meraki GPL release meraki-firmware-sources-r23-20150601
+ *
+ * Format inspired by platform/x86/pcengines-apuv2.c
+ *
+ * Copyright (C) 2021 Chris Blake <chrisrblake93@gmail.com>
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
+#include <linux/input.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define TINK_GPIO_DRIVER_NAME "gpio_ich"
+
+/* LEDs */
+static const struct gpio_led tink_leds[] = {
+	{
+		.name = "mx100:green:internet",
+		.default_trigger = "default-on",
+	},
+	{
+		.name = "mx100:green:lan2",
+	},
+	{
+		.name = "mx100:green:lan3",
+	},
+	{
+		.name = "mx100:green:lan4",
+	},
+	{
+		.name = "mx100:green:lan5",
+	},
+	{
+		.name = "mx100:green:lan6",
+	},
+	{
+		.name = "mx100:green:lan7",
+	},
+	{
+		.name = "mx100:green:lan8",
+	},
+	{
+		.name = "mx100:green:lan9",
+	},
+	{
+		.name = "mx100:green:lan10",
+	},
+	{
+		.name = "mx100:green:lan11",
+	},
+};
+
+static const struct gpio_led_platform_data tink_leds_pdata = {
+	.num_leds	= ARRAY_SIZE(tink_leds),
+	.leds		= tink_leds,
+};
+
+static struct gpiod_lookup_table tink_leds_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 11,
+				NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 18,
+				NULL, 1, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 20,
+				NULL, 2, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 22,
+				NULL, 3, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 23,
+				NULL, 4, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 32,
+				NULL, 5, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 34,
+				NULL, 6, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 35,
+				NULL, 7, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 36,
+				NULL, 8, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 37,
+				NULL, 9, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 48,
+				NULL, 10, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 16,
+				NULL, 11, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 7,
+				NULL, 12, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 21,
+				NULL, 13, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 19,
+				NULL, 14, GPIO_ACTIVE_LOW),
+		{} /* Terminating entry */
+	}
+};
+
+/* Reset Button */
+static struct gpio_keys_button tink_buttons[] = {
+	{
+		.desc			= "Reset",
+		.type			= EV_KEY,
+		.code			= KEY_RESTART,
+		.active_low             = 1,
+		.debounce_interval      = 100,
+	},
+};
+
+static const struct gpio_keys_platform_data tink_buttons_pdata = {
+	.buttons	= tink_buttons,
+	.nbuttons	= ARRAY_SIZE(tink_buttons),
+	.poll_interval  = 20,
+	.rep		= 0,
+	.name		= "mx100-keys",
+};
+
+static struct gpiod_lookup_table tink_keys_table = {
+	.dev_id = "gpio-keys-polled",
+	.table = {
+		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 60,
+				NULL, 0, GPIO_ACTIVE_LOW),
+		{} /* Terminating entry */
+	}
+};
+
+/* Board setup */
+static const struct dmi_system_id tink_systems[] __initconst = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Cisco"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MX100-HW"),
+		},
+	},
+	{} /* Terminating entry */
+};
+MODULE_DEVICE_TABLE(dmi, tink_systems);
+
+static struct platform_device *tink_leds_pdev;
+static struct platform_device *tink_keys_pdev;
+
+static struct platform_device * __init tink_create_dev(
+	const char *name, const void *pdata, size_t sz)
+{
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(NULL,
+		name, PLATFORM_DEVID_NONE, pdata, sz);
+	if (IS_ERR(pdev))
+		pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
+
+	return pdev;
+}
+
+static int __init tink_board_init(void)
+{
+	if (!dmi_first_match(tink_systems))
+		return -ENODEV;
+
+	/*
+	 * We need to make sure that GPIO60 isn't set to native mode as is default since it's our
+	 * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
+	 * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
+	 */
+	outl(inl(0x530) | BIT(28), 0x530);
+
+	gpiod_add_lookup_table(&tink_leds_table);
+	gpiod_add_lookup_table(&tink_keys_table);
+
+	tink_leds_pdev = tink_create_dev("leds-gpio",
+		&tink_leds_pdata, sizeof(tink_leds_pdata));
+
+	tink_keys_pdev = tink_create_dev("gpio-keys-polled",
+		&tink_buttons_pdata, sizeof(tink_buttons_pdata));
+
+	return 0;
+}
+module_init(tink_board_init);
+
+static void __exit tink_board_exit(void)
+{
+	platform_device_unregister(tink_keys_pdev);
+	platform_device_unregister(tink_leds_pdev);
+	gpiod_remove_lookup_table(&tink_keys_table);
+	gpiod_remove_lookup_table(&tink_leds_table);
+}
+module_exit(tink_board_exit);
+
+MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>");
+MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:meraki-mx100");
-- 
2.25.1

