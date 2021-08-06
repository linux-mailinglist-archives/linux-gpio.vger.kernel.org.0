Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57AE3E2052
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 02:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242631AbhHFA6T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 20:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232902AbhHFA6S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 20:58:18 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B38C0613D5;
        Thu,  5 Aug 2021 17:58:02 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id k3so7068308ilu.2;
        Thu, 05 Aug 2021 17:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZaFqxs2ibbd66JSfHZiGtBRKx+hbncn5lf2tbbdXTmw=;
        b=VFjiJ4eSRSRQbK7EXNw9PSj+Agjd7gN5JXgwx+bkZNRUHTQB16PWvBKCxSTo0YlwSc
         /5LPv+3EyeHo5/4nkpYmUXX6aFFc5Texa5vauSVgEtyrD0yUwJqOinKf4r9QE9Eeym1j
         2bUtp9fGsrpTW9NSGVcbpb8XF9tC8wKZXF8ghsrkPX86o1yHrXVp+xBoOR/uOGN2LaTy
         ogS1MlgKrmLgZG+20YTsNqyxJXMC8IeZnwnDx5Fzpav4kquqmU810N4yeaFn80w+Crqx
         sq6ELF1ZszPx/nt+uMdwo4z/hbXpiShR5USr43nhDhuY72NZBB2LP9BE7UQrFSF6qErg
         LbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZaFqxs2ibbd66JSfHZiGtBRKx+hbncn5lf2tbbdXTmw=;
        b=kM/PWELZWTcMD2BKlXe5sMCZlSeMKvZ3KgUJu+VYjz+t0R9Qy2RCjK0nPiWLbfAjY1
         +C7A4iiAInKUr62iqiD8bX50pcF4ZfZaNAiN5N8TvMOOyJjUZhCBV+PFZtYNpRIHosNX
         gkwYWVyWf8K8Fqvxc2GG+ZwAFW+fkaZTNWu6UQwBinzzQJtebJPM4Pjg97gN1sePkF95
         v6b53X3TMXX20REqLea5LpqvBpJ2lCHX2ZfApdTp9i+fknmfWT6Hwj4U2e5t3uLqmRaL
         nxjnQp+aK2BuXuatw/nBA4wWMlzZ1hMeboBjqbrjB/iDaeYRERrK0AuVQieczQGm0Uy7
         zHJA==
X-Gm-Message-State: AOAM533fQlCP/wUMbD729vXmIAYTlJ+bYeKJu0x4qYLfH1sQF/g+5knj
        wvZ8QMPVR0GhGsue3bjPGH8pdAEYNsfhmfcd
X-Google-Smtp-Source: ABdhPJzmGbgsIAiqwQhPT9J+aINMQXd/dXr93285q2Qowm2uZupWv9fvSBGIi5Jxx8RWGJGKu7hQ8Q==
X-Received: by 2002:a92:c746:: with SMTP id y6mr664489ilp.211.1628211481953;
        Thu, 05 Aug 2021 17:58:01 -0700 (PDT)
Received: from Crosshair-VIII-Hero.lan ([2600:6c46:7d7f:ec00::a11])
        by smtp.gmail.com with ESMTPSA id p131sm1359588iod.31.2021.08.05.17.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 17:58:01 -0700 (PDT)
From:   Chris Blake <chrisrblake93@gmail.com>
To:     platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        chunkeey@gmail.com, hdegoede@redhat.com
Cc:     Chris Blake <chrisrblake93@gmail.com>
Subject: [PATCH v2] platform/x86: add meraki-mx100 platform driver
Date:   Thu,  5 Aug 2021 19:57:55 -0500
Message-Id: <20210806005755.2295193-1-chrisrblake93@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
network appliance. This sets up the network LEDs and Reset
button. Note that this patch requires
mfd: lpc_ich: Enable GPIO driver for DH89xxCC which has been accepted
and is currently targeted for 5.15.

Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
---

Changelog:
V2: Move to using gpiod lookup tables, misc cleanups
V1: Initial Patch

 drivers/platform/x86/Kconfig        |  13 ++
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/meraki-mx100.c | 212 ++++++++++++++++++++++++++++
 3 files changed, 228 insertions(+)
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
index 000000000000..d64508aeb92c
--- /dev/null
+++ b/drivers/platform/x86/meraki-mx100.c
@@ -0,0 +1,212 @@
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
+#include <linux/gpio.h>
+#include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
+#include <linux/input.h>
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
+	}
+};
+
+/* Board setup */
+
+static const struct dmi_system_id tink_systems[] __initconst = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Cisco"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MX100-HW"),
+		},
+	},
+	{} /* Terminating entry */
+};
+
+static struct platform_device *tink_leds_pdev;
+static struct platform_device *tink_keys_pdev;
+
+static struct platform_device * __init tink_create_dev(
+	const char *name,
+	const void *pdata,
+	size_t sz)
+{
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(NULL,
+		name,
+		PLATFORM_DEVID_NONE,
+		pdata,
+		sz);
+
+	if (IS_ERR(pdev))
+		pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
+
+	return pdev;
+}
+
+static int __init tink_board_init(void)
+{
+	if (!dmi_first_match(tink_systems))
+                return -ENODEV;
+
+	/* We need to make sure that GPIO60 isn't set to native mode as is default since it's our 
+	 * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
+	 * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
+	 */
+	outl(inl(0x530) | BIT(28), 0x530);
+
+	gpiod_add_lookup_table(&tink_leds_table);
+	gpiod_add_lookup_table(&tink_keys_table);
+
+	tink_leds_pdev = tink_create_dev(
+		"leds-gpio",
+		&tink_leds_pdata,
+		sizeof(tink_leds_pdata));
+
+	tink_keys_pdev = tink_create_dev(
+		"gpio-keys-polled",
+		&tink_buttons_pdata,
+		sizeof(tink_buttons_pdata));
+
+	return 0;
+}
+
+static void __exit tink_board_exit(void)
+{
+	platform_device_unregister(tink_keys_pdev);
+	platform_device_unregister(tink_leds_pdev);
+	gpiod_remove_lookup_table(&tink_keys_table);
+	gpiod_remove_lookup_table(&tink_leds_table);
+}
+
+module_init(tink_board_init);
+module_exit(tink_board_exit);
+
+MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>");
+MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:meraki-mx100");
+MODULE_DEVICE_TABLE(dmi, tink_systems);
+MODULE_SOFTDEP("pre: platform:" TINK_GPIO_DRIVER_NAME);
-- 
2.25.1

