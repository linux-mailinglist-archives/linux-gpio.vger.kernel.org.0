Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9571836FA5F
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbhD3MgX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbhD3MgU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:36:20 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2660C06138C
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:35:27 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id y26so2801024eds.4
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PPM6nNPsrjG/byTfy/KGfZqX+cnw8iNV1tv+faDfK+8=;
        b=CK1FBwDn7z+sU+N/bokoUYBF3+F3QP21ick2LXXMLwUzvByuMiR/2n3iE5b5KA1Ivo
         u/ZHCMD5SgquTZ5Y3zb3hGIZukDlXsNkaVjKTFA6QNApr0JJAsh5uwY2F8kOfhyybOz1
         Dw9Iv1G1yilUSGNlqqHI5jaSsVnP7++64198PGGDdDzohevYnAQbRN2FFOei7L3gCaZF
         QOqwPa3NGDTBPjlNC0/Y4yv8DSd7sFCQzuhfqOIUMGY7CLTYQZCtN08cuseLcZIXD4Fd
         ACme/KCjuAbHdpC4db0uyIfuwO1EUX+aAZYkB2IS6NTk/dCDzFEfyQt/QtzMuNfR6zP2
         Re2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PPM6nNPsrjG/byTfy/KGfZqX+cnw8iNV1tv+faDfK+8=;
        b=cIJJVlzr96fiP8CbsBXRBF4nXYVvX4eCdLtNyKBQpK+1OamzUYwgha6O174fhUqGu5
         3ZlRQl1hAwh/blyi4tttNh3yhjb3N4H0YkjzKtSXC7DCl/2LHRSgtiFDTq9N/nyZNDVj
         BGkDhF2L4OlRb5WtZ5EznQaGYmD/P74K21z11hbFbbirihh2efzPvRFmVTLaQwJIfoqy
         m8JNVVSo55ucR6MgtWRAR+7+aJYxBr6vqJ6n9fEPOjfo8fMBqJeg02CDFbgBSk57EVKU
         C1ppv83ku02fubBkypdWrzAtLk81JYqG2g0QEgvEPU7v3lidTMU6eyYweyXszhoXcv2G
         sTXA==
X-Gm-Message-State: AOAM532sKliPjtRrghasjjFU49sXb+vx3IIjgEVfdoudkb7Ff/OjjwaK
        J3KF5kEwo6FIB+QSX7GQNoKc2A==
X-Google-Smtp-Source: ABdhPJzQC0UT6ZaLyj8ZmvqfpHXYjIf2BHGZc8oEbMCim3eNmD2vNJZUL2tzwVP+MkNifabF473gJA==
X-Received: by 2002:a50:eb45:: with SMTP id z5mr5712942edp.243.1619786126736;
        Fri, 30 Apr 2021 05:35:26 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-15.xnet.hr. [88.207.97.15])
        by smtp.googlemail.com with ESMTPSA id d15sm1822988ejj.42.2021.04.30.05.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 05:35:26 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     lee.jones@linaro.org, robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jdelvare@suse.com, linux@roeck-us.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 4/6] hwmon: Add Delta TN48M CPLD HWMON driver
Date:   Fri, 30 Apr 2021 14:35:09 +0200
Message-Id: <20210430123511.116057-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430123511.116057-1-robert.marko@sartura.hr>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Delta TN48M has a CPLD that also monitors the power supply
statuses.

These are useful to be presented to the users, so lets
add a driver for HWMON part of the CPLD.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/hwmon/Kconfig       |  10 +++
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/tn48m-hwmon.c | 148 ++++++++++++++++++++++++++++++++++++
 drivers/mfd/tn48m-cpld.c    |   3 +
 include/linux/mfd/tn48m.h   |   1 +
 5 files changed, 163 insertions(+)
 create mode 100644 drivers/hwmon/tn48m-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 54f04e61fb83..89271dfeb775 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1924,6 +1924,16 @@ config SENSORS_TMP513
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp513.
 
+config SENSORS_TN48M
+	tristate "Delta Networks TN48M switch CPLD HWMON driver"
+	depends on MFD_TN48M_CPLD
+	help
+	  If you say yes here you get support for Delta Networks TN48M
+	  CPLD.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tn48m-hwmon.
+
 config SENSORS_VEXPRESS
 	tristate "Versatile Express"
 	depends on VEXPRESS_CONFIG
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index fe38e8a5c979..22e470057ffe 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -187,6 +187,7 @@ obj-$(CONFIG_SENSORS_TMP108)	+= tmp108.o
 obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
 obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
 obj-$(CONFIG_SENSORS_TMP513)	+= tmp513.o
+obj-$(CONFIG_SENSORS_TN48M)	+= tn48m-hwmon.o
 obj-$(CONFIG_SENSORS_VEXPRESS)	+= vexpress-hwmon.o
 obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
 obj-$(CONFIG_SENSORS_VIA686A)	+= via686a.o
diff --git a/drivers/hwmon/tn48m-hwmon.c b/drivers/hwmon/tn48m-hwmon.c
new file mode 100644
index 000000000000..80fd18d74f1d
--- /dev/null
+++ b/drivers/hwmon/tn48m-hwmon.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Delta TN48M CPLD HWMON driver
+ *
+ * Copyright 2020 Sartura Ltd
+ *
+ * Author: Robert Marko <robert.marko@sartura.hr>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <linux/mfd/tn48m.h>
+
+#define PSU1_PRESENT_MASK	BIT(0)
+#define PSU2_PRESENT_MASK	BIT(1)
+#define PSU1_POWERGOOD_MASK	BIT(2)
+#define PSU2_POWERGOOD_MASK	BIT(3)
+#define PSU1_ALERT_MASK		BIT(4)
+#define PSU2_ALERT_MASK		BIT(5)
+
+static int board_id_get(struct tn48m_data *data)
+{
+	unsigned int regval;
+
+	regmap_read(data->regmap, BOARD_ID, &regval);
+
+	switch (regval) {
+	case BOARD_ID_TN48M:
+		return BOARD_ID_TN48M;
+	case BOARD_ID_TN48M_P:
+		return BOARD_ID_TN48M_P;
+	default:
+		return -EINVAL;
+	}
+}
+
+static ssize_t psu_present_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
+	struct tn48m_data *data = dev_get_drvdata(dev);
+	unsigned int regval, status;
+
+	if (board_id_get(data) == BOARD_ID_TN48M_P) {
+		regmap_read(data->regmap, attr2->nr, &regval);
+
+		if (attr2->index == 1)
+			status = !FIELD_GET(PSU1_PRESENT_MASK, regval);
+		else
+			status = !FIELD_GET(PSU2_PRESENT_MASK, regval);
+	} else
+		status = 0;
+
+	return sprintf(buf, "%d\n", status);
+}
+
+static ssize_t psu_pg_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
+	struct tn48m_data *data = dev_get_drvdata(dev);
+	unsigned int regval, status;
+
+	regmap_read(data->regmap, attr2->nr, &regval);
+
+	if (attr2->index == 1)
+		status = FIELD_GET(PSU1_POWERGOOD_MASK, regval);
+	else
+		status = FIELD_GET(PSU2_POWERGOOD_MASK, regval);
+
+	return sprintf(buf, "%d\n", status);
+}
+
+static ssize_t psu_alert_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
+	struct tn48m_data *data = dev_get_drvdata(dev);
+	unsigned int regval, status;
+
+	if (board_id_get(data) == BOARD_ID_TN48M_P) {
+		regmap_read(data->regmap, attr2->nr, &regval);
+
+		if (attr2->index == 1)
+			status = !FIELD_GET(PSU1_ALERT_MASK, regval);
+		else
+			status = !FIELD_GET(PSU2_ALERT_MASK, regval);
+	} else
+		status = 0;
+
+	return sprintf(buf, "%d\n", status);
+}
+
+static SENSOR_DEVICE_ATTR_2_RO(psu1_present, psu_present, PSU_STATUS, 1);
+static SENSOR_DEVICE_ATTR_2_RO(psu2_present, psu_present, PSU_STATUS, 2);
+static SENSOR_DEVICE_ATTR_2_RO(psu1_pg, psu_pg, PSU_STATUS, 1);
+static SENSOR_DEVICE_ATTR_2_RO(psu2_pg, psu_pg, PSU_STATUS, 2);
+static SENSOR_DEVICE_ATTR_2_RO(psu1_alert, psu_alert, PSU_STATUS, 1);
+static SENSOR_DEVICE_ATTR_2_RO(psu2_alert, psu_alert, PSU_STATUS, 2);
+
+static struct attribute *tn48m_hwmon_attrs[] = {
+	&sensor_dev_attr_psu1_present.dev_attr.attr,
+	&sensor_dev_attr_psu2_present.dev_attr.attr,
+	&sensor_dev_attr_psu1_pg.dev_attr.attr,
+	&sensor_dev_attr_psu2_pg.dev_attr.attr,
+	&sensor_dev_attr_psu1_alert.dev_attr.attr,
+	&sensor_dev_attr_psu2_alert.dev_attr.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(tn48m_hwmon);
+
+static int tn48m_hwmon_probe(struct platform_device *pdev)
+{
+	struct tn48m_data *data = dev_get_drvdata(pdev->dev.parent);
+	struct device *hwmon_dev;
+
+	hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
+							   "tn48m_hwmon",
+							   data,
+							   tn48m_hwmon_groups);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct platform_device_id tn48m_hwmon_id_table[] = {
+	{ "delta,tn48m-hwmon", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, tn48m_hwmon_id_table);
+
+static struct platform_driver tn48m_hwmon_driver = {
+	.driver = {
+		.name = "tn48m-hwmon",
+	},
+	.probe = tn48m_hwmon_probe,
+	.id_table = tn48m_hwmon_id_table,
+};
+module_platform_driver(tn48m_hwmon_driver);
+
+MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
+MODULE_DESCRIPTION("Delta TN48M CPLD HWMON driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/tn48m-cpld.c b/drivers/mfd/tn48m-cpld.c
index f22a15ddd22d..4d837aca01e7 100644
--- a/drivers/mfd/tn48m-cpld.c
+++ b/drivers/mfd/tn48m-cpld.c
@@ -20,6 +20,9 @@
 static const struct mfd_cell tn48m_cell[] = {
 	{
 		.name = "delta,tn48m-gpio",
+	},
+	{
+		.name = "delta,tn48m-hwmon",
 	}
 };
 
diff --git a/include/linux/mfd/tn48m.h b/include/linux/mfd/tn48m.h
index 9cc2b04c8d69..eb2cfc3a5db7 100644
--- a/include/linux/mfd/tn48m.h
+++ b/include/linux/mfd/tn48m.h
@@ -22,6 +22,7 @@
 #define SFP_TX_DISABLE		0x31
 #define SFP_PRESENT		0x3a
 #define SFP_LOS			0x40
+#define PSU_STATUS		0xa
 
 struct tn48m_data {
 	struct device *dev;
-- 
2.31.1

