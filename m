Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7732A38FA09
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 07:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhEYFnh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 01:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbhEYFng (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 01:43:36 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE020C061756
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 22:42:07 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id p39so6377483pfw.8
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 22:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Esg6LeOc6bJsT02jeXcj/gmvXiILRk/16j5XYfZ5mtE=;
        b=gQylkIWlXLdfodPQ7CQR10rmCNbRUYdXvOoa0HeSKw2ucoscK7zh0kOnnrCBGbmmGs
         guVt2BTHfWSwiieEZxNyPXrzh1vq1o/IkCw17fbMw8JWN32S58EdH2rzr50nR2u4F/nz
         KMHj6ObcN3tBPZeYbPyk94DKe52sV7ZGSv9L+DoIkOn+iFemBIUlGxeCUPKPvWpZ77nz
         eR1AsHOqRpsN0gE/fWIGf4m6fPkTW80NGTA4QSyZ9jhrX7kOy8PDIFqKdRK+EkbEMWwa
         f4TjD6H93CPEGjMCSmaPl8K9qQVwSliLLSmghjcngScxWLqvG7eHzScnGyN9ordzPf5b
         gnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Esg6LeOc6bJsT02jeXcj/gmvXiILRk/16j5XYfZ5mtE=;
        b=aVuNdU0tn/szxO+Q9tzxZeh5UFjlu+obtP8Sr6pIqwhmVmG27P3OAbnxYsWNtGf5o/
         C9WpHTqWgOxStMVL2nYuONGiYiOSgZ2a11MJe0M39PH+2RTRARDFsFXV3U9tyuus5AP0
         unvlVdwSVbEsI3ntPLphlEaSZEuKCpSN0/34MNIkShTb97LluOXQhRlndqdZTEgCgFzV
         Zm0MT6qxVX7HX9t+atIObtTPdJIYMzvp1+AGCuqCEBrqSMXJ6s4H2iODsB/Ct/IxNt1x
         qo2BmYqSjhBRvAOQ7UcpduBK7NGqboFNhrq0IRZCKDmO+ECZSJNLLNQVbU/Vpr3jmRE7
         x6NQ==
X-Gm-Message-State: AOAM531v3Uc45QEY5sC3oylaPBRkXXQHOsFl52CzdqueEet1Ts+kEN/g
        r0Hq/zfs/CDAZ7dp2sdlwq3Nt5CJScA=
X-Google-Smtp-Source: ABdhPJwuL8Id6mDOXgI7lpmhyDAWPiYAMFRMzV4NBJufLOM+fa1oDReFA0Rj0IrdaBUAkDFlCdg06g==
X-Received: by 2002:a63:e4a:: with SMTP id 10mr17604156pgo.67.1621921327222;
        Mon, 24 May 2021 22:42:07 -0700 (PDT)
Received: from asus-UPX-TGL01.hitronhub.home ([61.64.1.242])
        by smtp.gmail.com with ESMTPSA id m3sm13208256pfh.174.2021.05.24.22.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 22:42:07 -0700 (PDT)
From:   aaeon.asus@gmail.com
X-Google-Original-From: kunyang_fan@asus.com
To:     linux-gpio@vger.kernel.org
Cc:     acelan.kao@canonical.com, Kunyang_Fan <kunyang_fan@asus.com>
Subject: [PATCH 5/5] leds: add driver for AAEON devices
Date:   Tue, 25 May 2021 13:41:49 +0800
Message-Id: <20210525054149.1792-5-kunyang_fan@asus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525054149.1792-1-kunyang_fan@asus.com>
References: <20210525054149.1792-1-kunyang_fan@asus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Kunyang_Fan <kunyang_fan@asus.com>

This patch adds support for the led devices which can
be controlled from sysfs through ASUS WMI interface.

Signed-off-by: Kunyang_Fan <kunyang_fan@asus.com>
---
 drivers/leds/Kconfig      |  11 +++
 drivers/leds/Makefile     |   1 +
 drivers/leds/leds-aaeon.c | 142 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 drivers/leds/leds-aaeon.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index be4536eef1fe..34d1b80855af 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -49,6 +49,17 @@ config LEDS_88PM860X
 	  This option enables support for on-chip LED drivers found on Marvell
 	  Semiconductor 88PM8606 PMIC.
 
+config LEDS_AAEON
+	tristate "AAEON LED driver"
+	depends on X86
+	select MFD_AAEON
+	help
+	  This led driver adds support for LED brightness control on Single
+	  Board Computers produced by AAEON.
+
+	  This driver leverages the ASUS WMI interface to access device
+	  resources.
+
 config LEDS_AAT1290
 	tristate "LED support for the AAT1290"
 	depends on LEDS_CLASS_FLASH
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d6b8a792c936..a8a77acc5e11 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
 
 # LED Platform Drivers (keep this sorted, M-| sort)
 obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
+obj-$(CONFIG_LEDS_AAEON)		+= leds-aaeon.o
 obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
 obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
 obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
diff --git a/drivers/leds/leds-aaeon.c b/drivers/leds/leds-aaeon.c
new file mode 100644
index 000000000000..10090a4bff65
--- /dev/null
+++ b/drivers/leds/leds-aaeon.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AAEON LED driver
+ *
+ * Copyright (c) 2021, AAEON Ltd.
+ *
+ * Author: Kunyang Fan <kunyang_fan@aaeon.com.tw>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_data/x86/asus-wmi.h>
+#include <linux/platform_device.h>
+
+#define DRVNAME "led_aaeon"
+#define ASUS_NB_WMI_EVENT_GUID   "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
+#define AAEON_WMI_MGMT_GUID      "97845ED0-4E6D-11DE-8A39-0800200C9A66"
+
+#define GET_LED_NUMBER_ID        0x00060000
+#define GET_LED_METHOD_ID        0x00060001
+#define SET_LED_METHOD_ID        0x00060002
+#define GET_LED_NUMBER_METHOD_ID 0x10
+
+
+struct aaeon_led_data {
+	int id;
+	struct led_classdev cdev;
+};
+
+static int aaeon_led_get_number(void)
+{
+	int err, retval;
+
+	err = asus_wmi_evaluate_method(GET_LED_NUMBER_ID,
+				       GET_LED_NUMBER_METHOD_ID,
+				       0, &retval);
+	if (err)
+		return err;
+
+	return retval;
+}
+
+static enum led_brightness aaeon_led_brightness_get(struct led_classdev
+						      *cdev)
+{
+	int err, brightness;
+	struct aaeon_led_data *led =
+			container_of(cdev, struct aaeon_led_data, cdev);
+	u32 arg0;
+
+	arg0 = (u32)(led->id & 0xF);
+	err = asus_wmi_evaluate_method(GET_LED_METHOD_ID, arg0, 0, &brightness);
+	if (err)
+		return err;
+
+	return brightness;
+};
+
+static void aaeon_led_brightness_set(struct led_classdev *cdev,
+				       enum led_brightness brightness)
+{
+	int err, retval;
+	struct aaeon_led_data *led =
+			container_of(cdev, struct aaeon_led_data, cdev);
+	u32 arg0;
+
+	arg0 = (u32)(led->id & 0xF);
+	if (brightness != LED_OFF)
+		arg0 |= BIT(16);
+
+	err = asus_wmi_evaluate_method(SET_LED_METHOD_ID, arg0, 0, &retval);
+};
+
+static int __init aaeon_add_led_device(struct platform_device *pdev,
+					   int id)
+{
+	struct aaeon_led_data *led;
+
+	led = devm_kzalloc(&pdev->dev, sizeof(struct aaeon_led_data), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	led->id = id;
+	led->cdev.brightness_get = aaeon_led_brightness_get;
+	led->cdev.brightness_set = aaeon_led_brightness_set;
+	led->cdev.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "led:%d:", id);
+
+	if (!led->cdev.name)
+		return -ENOMEM;
+
+	return devm_led_classdev_register(&pdev->dev, &led->cdev);
+}
+
+static int aaeon_led_probe(struct platform_device *pdev)
+{
+	int err = -ENODEV, i;
+	int led_number = 0;
+
+	pr_debug("aaeon led device probe!\n");
+	/* Prevent other drivers adding this platfom device */
+	if (!wmi_has_guid(AAEON_WMI_MGMT_GUID)) {
+		pr_debug("AAEON Management GUID not found\n");
+		return -ENODEV;
+	}
+
+	/* Query the number of led devices board support */
+	led_number = aaeon_led_get_number();
+
+	/*
+	 * If the number is 0 or can't get the number of leds,
+	 * no need to register any led device node.
+	 */
+	if (led_number <= 0)
+		return -ENODEV;
+
+	for (i = 0; i < led_number; i++) {
+		err = aaeon_add_led_device(pdev, i);
+		if (err)
+			break;
+	}
+
+	return err;
+}
+
+static struct platform_driver aaeon_led_driver = {
+	.driver = {
+		.name = "leds-aaeon",
+	},
+};
+
+module_platform_driver_probe(aaeon_led_driver, aaeon_led_probe);
+
+MODULE_ALIAS("platform:leds-aaeon");
+MODULE_DESCRIPTION("AAEON LED Driver");
+MODULE_AUTHOR("Kunyang Fan <kunyang_fan@asus.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

