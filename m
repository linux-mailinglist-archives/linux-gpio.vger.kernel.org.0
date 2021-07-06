Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8BE03BDD83
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jul 2021 20:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhGFSuU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jul 2021 14:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhGFSuU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jul 2021 14:50:20 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FE0C061574;
        Tue,  6 Jul 2021 11:47:40 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id q2so11191604iot.11;
        Tue, 06 Jul 2021 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qw53PpKvTHHYFgRL4ikMm5dijf8wi4j4l6mqLH9Qzvs=;
        b=ImUKrNqep9RMFy2ANLDJFB8CJJG//0cEbOChsk4ZDyMi+YvSxohMxYephLp2pkxTiR
         OosdKiZ3FqP+2pt69MIXzqKZyJou3e62qOl1+ccn8HZlvkgu9rHp747+cD6UatVL7wn/
         1Fc7CYKHEivZ5ZeXAV1SB0Pm8x9o4M4DxSFFhmWV5gP4zkT6WOReD1IOhGeVUmhhuBQF
         iKjmRUErC7pmK/jybiOZrE8/yBSuLoolZJnE0oJHtFYy9gwQ6mH968onmZHbjt6Xzk3U
         VcsXpMBL1Jrc3Ulkef7Xn3qgGgh9Sej5W1IEFpOmYKsn+xqFMXqUB6tc5xgGPWjF3bcH
         d8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qw53PpKvTHHYFgRL4ikMm5dijf8wi4j4l6mqLH9Qzvs=;
        b=S6pYevSLUpoALHRY7tvbVv6P9hM5916Q4RAcanywSsZa2gOPb8JhgoV5shfBSndPkv
         Fx8ivPFtSJ3tCNNlTm2pbCaDd6t5e80abofuKS/gxoGIIvUKGw5KhkR7ZkPRUIiec3Nf
         Q1j6z3WNaL/YiFviLXU8a7qIuIo3ZPod0r2ErLCxYFXiXdnV266733aNgXunBS88ysPF
         52UNm6x3Wq/QU2GIUnyT6jKF7AnwNPBI7L/lgjs3usXgZeZzutlkX0IpiOZVwMNcosVs
         shbXLOuhOjK1xxOcT2KJLHM8AHlyzrC8NraUC1TQSllKHVqHtkpLh0sQl1C44hw4WCdy
         x0TQ==
X-Gm-Message-State: AOAM533Cd6E1A12vuiG2cw8c5d0JXvHEx02YeXVqJQMVR8mo00iBRIP7
        fmJfWdPs86r80Xpu5QlRMXtZnRG6wurnJw==
X-Google-Smtp-Source: ABdhPJyqV3ntOgM5PjHiVtrC3iiUuZYVlk5IFnA+bqn+e5XjjmYvlJP53ZZ3Ah7p6iT1Pk48ja0Iqg==
X-Received: by 2002:a05:6602:2205:: with SMTP id n5mr16594080ion.92.1625597259946;
        Tue, 06 Jul 2021 11:47:39 -0700 (PDT)
Received: from Crosshair-VIII-Hero.lan (047-012-004-136.res.spectrum.com. [47.12.4.136])
        by smtp.gmail.com with ESMTPSA id b24sm9524823iob.4.2021.07.06.11.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 11:47:39 -0700 (PDT)
From:   Chris Blake <chrisrblake93@gmail.com>
To:     platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        chunkeey@gmail.com
Cc:     Chris Blake <chrisrblake93@gmail.com>
Subject: [PATCH] platform/x86: add meraki-mx100 platform driver
Date:   Tue,  6 Jul 2021 13:47:30 -0500
Message-Id: <20210706184730.14951-1-chrisrblake93@gmail.com>
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
 drivers/platform/x86/Kconfig        |  13 ++
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/meraki-mx100.c | 185 ++++++++++++++++++++++++++++
 3 files changed, 201 insertions(+)
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
index 000000000000..12b17ef06d14
--- /dev/null
+++ b/drivers/platform/x86/meraki-mx100.c
@@ -0,0 +1,185 @@
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
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define TINK_GPIO_OFFSET	436
+
+/* LEDs */
+static const struct gpio_led tink_leds[] = {
+	{
+		.name = "mx100:green:internet", 
+		.gpio = TINK_GPIO_OFFSET + 11,
+		.active_low = 1,
+		.default_trigger = "default-on",
+	},
+	{
+		.name = "mx100:green:lan2",
+		.gpio = TINK_GPIO_OFFSET + 18,
+	},
+	{
+		.name = "mx100:green:lan3",
+		.gpio = TINK_GPIO_OFFSET + 20,
+	},
+	{
+		.name = "mx100:green:lan4",
+		.gpio = TINK_GPIO_OFFSET + 22,
+	},
+	{
+		.name = "mx100:green:lan5",
+		.gpio = TINK_GPIO_OFFSET + 23,
+	},
+	{
+		.name = "mx100:green:lan6",
+		.gpio = TINK_GPIO_OFFSET + 32,
+	},
+	{
+		.name = "mx100:green:lan7",
+		.gpio = TINK_GPIO_OFFSET + 34,
+	},
+	{
+		.name = "mx100:green:lan8",
+		.gpio = TINK_GPIO_OFFSET + 35,
+	},
+	{
+		.name = "mx100:green:lan9",
+		.gpio = TINK_GPIO_OFFSET + 36,
+	},
+	{
+		.name = "mx100:green:lan10",
+		.gpio = TINK_GPIO_OFFSET + 37,
+	},
+	{
+		.name = "mx100:green:lan11",
+		.gpio = TINK_GPIO_OFFSET + 48,
+	},
+	{
+		.name = "mx100:green:ha",
+		.gpio = TINK_GPIO_OFFSET + 16,
+		.active_low = 1,
+	},
+	{
+		.name = "mx100:orange:ha",
+		.gpio = TINK_GPIO_OFFSET + 7,
+		.active_low = 1,
+	},
+	{
+		.name = "mx100:green:usb",
+		.gpio = TINK_GPIO_OFFSET + 21,
+		.active_low = 1,
+	},
+	{
+		.name = "mx100:orange:usb",
+		.gpio = TINK_GPIO_OFFSET + 19,
+		.active_low = 1,
+	},
+};
+
+static const struct gpio_led_platform_data tink_leds_pdata = {
+	.num_leds	= ARRAY_SIZE(tink_leds),
+	.leds		= tink_leds,
+};
+
+/* Reset Button */
+static struct gpio_keys_button tink_buttons[] = {
+	{
+		.desc			= "Reset",
+		.type			= EV_KEY,
+		.code			= KEY_RESTART,
+		.gpio			= TINK_GPIO_OFFSET + 60,
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
+/* Board setup */
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
+	if (!dmi_match(DMI_SYS_VENDOR, "Cisco") || !dmi_match(DMI_PRODUCT_NAME, "MX100-HW")) {
+		return -ENODEV;
+	}
+
+	/* We need to make sure that GPIO60 isn't set to native mode as is default since it's our 
+	 * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
+	 * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
+	 */
+	outl(inl(0x530) | BIT(28), 0x530);
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
+}
+
+module_init(tink_board_init);
+module_exit(tink_board_exit);
+
+MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>");
+MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:meraki-mx100");
+MODULE_SOFTDEP("pre: platform:gpio_ich platform:leds-gpio platform:gpio_keys_polled");
-- 
2.25.1

