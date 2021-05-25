Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3040A38FA05
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 07:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbhEYFnd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 01:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhEYFnc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 01:43:32 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC90C061574
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 22:42:03 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id f22so20903346pgb.9
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 22:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m3jViPEXZqs1xUoIZMnEMnU7OR4mYl4h7j0v+N2r3nQ=;
        b=FdYxjfpMATGVI7+u/IhDhkYf8bTP2bc8jo87+v+DcPIs9zJpRkz9mJbZCjhjhbD9ab
         j8DA3ZZ1rLE2DXpbk41AVk0RL9Q+Me4TinU02n5l42W41BGI0BzeUSUyirPk9BTC8DvI
         8HpLLb0Aiq3TqgSy3KeMm+iRZVzXePvJNQgM218qF94ZI9UgxbV/D7ynVXnLYHChIbZR
         3k6TV1EMUhBqrF+uisq5AaavyggCu4tY4JM4Q/PtkMvJJezT9yZSW+6nUho8InvAsCN8
         IeDo30XcTI4e9r5WsbkSOOSQWC1DbRPSc1An9bMjqp2u2feUKWr/uHuR9Hzyg+r3MCaD
         XKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m3jViPEXZqs1xUoIZMnEMnU7OR4mYl4h7j0v+N2r3nQ=;
        b=erNNTypprZCpmkroGwF+RjgtrRuUEFKXML7NYrXIsE10WjNys0f0HNfntijjJU/JKO
         /82lM94TICaYyntiD3r4LcscPGWn5TZMk3z61idj+1Px4l61ZNDaiBPEOUmqCEG6JsTo
         wPc4szl6ziKzYKiJS8ny6QIuGhCaYW3nENFpwbU5aNK2jdt8UxvOXdRVlLMPHT1eR0U7
         SzfRz5jlIiaZwWI0xyrhZQuxlr+tnF4NUOJOfQokSsbYzRAFws1TqnWJgq9I4mD+86MI
         IFidQ5K2ZVEIzA3ulLjFqmr2B053w5Vc+SQhLSUs8i4vvdUHQsvNLbXA66cpaVUJFtj1
         LGnA==
X-Gm-Message-State: AOAM532FYiXG3T44cmriyVZoF42ISY8YsoB+Y+dG81AJZYWxRWzBXrmN
        GfOYM+uy2s94L1VuUbjfMOWRRsrOemM=
X-Google-Smtp-Source: ABdhPJwnPYvVigMLzF5UwSvKD8X5bqaJoM1NheZe0e36OwQrlx4L6qxobNmwSYWHda7BpkLQjjiB8g==
X-Received: by 2002:a05:6a00:23d0:b029:2de:c1a2:f1e with SMTP id g16-20020a056a0023d0b02902dec1a20f1emr28592465pfc.60.1621921322324;
        Mon, 24 May 2021 22:42:02 -0700 (PDT)
Received: from asus-UPX-TGL01.hitronhub.home ([61.64.1.242])
        by smtp.gmail.com with ESMTPSA id m3sm13208256pfh.174.2021.05.24.22.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 22:42:02 -0700 (PDT)
From:   aaeon.asus@gmail.com
X-Google-Original-From: kunyang_fan@asus.com
To:     linux-gpio@vger.kernel.org
Cc:     acelan.kao@canonical.com, Kunyang_Fan <kunyang_fan@asus.com>
Subject: [PATCH 1/5] mfd: Add support for IO functions of AAEON devices
Date:   Tue, 25 May 2021 13:41:45 +0800
Message-Id: <20210525054149.1792-1-kunyang_fan@asus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Kunyang_Fan <kunyang_fan@asus.com>

This adds the supports for multiple IO functions of the
AAEON x86 devices and makes use of the WMI interface to
control the these IO devices including:

- GPIO
- LED
- Watchdog
- HWMON

It also adds the mfd child device drivers to support
the above IO functions.

Signed-off-by: Kunyang_Fan <kunyang_fan@asus.com>
---
 MAINTAINERS             | 12 +++++++
 drivers/mfd/Kconfig     | 12 +++++++
 drivers/mfd/Makefile    |  1 +
 drivers/mfd/mfd-aaeon.c | 77 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)
 create mode 100644 drivers/mfd/mfd-aaeon.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c19c1e2c970..49783dd44367 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -257,6 +257,18 @@ W:	http://www.adaptec.com/
 F:	Documentation/scsi/aacraid.rst
 F:	drivers/scsi/aacraid/
 
+AAEON DEVICE DRIVER WITH WMI INTERFACE
+M:	Edward Lin<edward1_lin@asus.com>
+M:	Kunyang Fan <kunyang_fan@asus.com>
+M:	Frank Hsieh <frank2_hsieh@asus.com>
+M:	Jacob Wu <jacob_wu@asus.com>
+S:	Supported
+F:	drivers/gpio/gpio-aaeon.c
+F:	drivers/hwmon/hwmon-aaeon.c
+F:	drivers/leds/leds-aaeon.c
+F:	drivers/mfd/mfd-aaeon.c
+F:	drivers/watchdog/wdt_aaeon.c
+
 ABI/API
 L:	linux-api@vger.kernel.org
 F:	include/linux/syscalls.h
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a37d7d171382..f172564eed0d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2053,6 +2053,18 @@ config MFD_WCD934X
 	  This driver provides common support WCD934x audio codec and its
 	  associated Pin Controller, Soundwire Controller and Audio codec.
 
+
+config MFD_AAEON
+	tristate "AAEON WMI MFD devices"
+	depends on ASUS_WMI
+	help
+	  Say yes here to support mltiple IO devices on Single Board Computers
+	  produced by AAEON.
+
+	  This driver leverages the ASUS WMI interface to access device
+	  resources.
+
+
 menu "Multimedia Capabilities Port drivers"
 	depends on ARCH_SA1100
 
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9367a92f795a..36fff3d0da7e 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -264,3 +264,4 @@ obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
 obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
 
 obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
+obj-$(CONFIG_MFD_AAEON)		+= mfd-aaeon.o
diff --git a/drivers/mfd/mfd-aaeon.c b/drivers/mfd/mfd-aaeon.c
new file mode 100644
index 000000000000..9d2efde53cad
--- /dev/null
+++ b/drivers/mfd/mfd-aaeon.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * UP Board main platform driver and FPGA configuration support
+ *
+ * Copyright (c) 2021, AAEON Ltd.
+ *
+ * Author: Kunyang_Fan <knuyang_fan@aaeon.com.tw>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/acpi.h>
+#include <linux/gpio.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/leds.h>
+#include <linux/wmi.h>
+
+#define AAEON_WMI_MGMT_GUID      "97845ED0-4E6D-11DE-8A39-0800200C9A66"
+
+struct aaeon_wmi_priv {
+	const struct mfd_cell *cells;
+	size_t ncells;
+};
+
+static const struct mfd_cell aaeon_mfd_cells[] = {
+	{ .name = "gpio-aaeon" },
+	{ .name = "hwmon-aaeon"},
+	{ .name = "leds-aaeon"},
+	{ .name = "wdt-aaeon"},
+};
+
+static const struct aaeon_wmi_priv aaeon_wmi_priv_data = {
+	.cells = aaeon_mfd_cells,
+	.ncells = ARRAY_SIZE(aaeon_mfd_cells),
+};
+
+static int aaeon_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct aaeon_wmi_priv *priv;
+
+	if (!wmi_has_guid(AAEON_WMI_MGMT_GUID)) {
+		dev_info(&wdev->dev, "AAEON Management GUID not found\n");
+		return -ENODEV;
+	}
+
+
+	priv = (struct aaeon_wmi_priv *)context;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	return devm_mfd_add_devices(&wdev->dev, 0, priv->cells,
+				    priv->ncells, NULL, 0, NULL);
+}
+
+static const struct wmi_device_id aaeon_wmi_id_table[] = {
+	{ AAEON_WMI_MGMT_GUID, (void *)&aaeon_wmi_priv_data },
+	{}
+};
+
+static struct wmi_driver aaeon_wmi_driver = {
+	.driver = {
+		.name = "mfd-aaeon",
+	},
+	.id_table = aaeon_wmi_id_table,
+	.probe = aaeon_wmi_probe,
+};
+
+module_wmi_driver(aaeon_wmi_driver);
+
+MODULE_DEVICE_TABLE(wmi, aaeon_wmi_id_table);
+MODULE_AUTHOR("Kunyang Fan <kunyang_fan@aaeon.com.tw>");
+MODULE_DESCRIPTION("AAEON Board WMI driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

