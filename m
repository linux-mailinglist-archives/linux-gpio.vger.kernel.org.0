Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278E538FA07
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 07:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhEYFnf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 01:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhEYFnf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 01:43:35 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C9BC061756
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 22:42:05 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id f22so14348401pfn.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 22:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fFJdx8/X4/hjfklAH2qe2kArlxn2v10apy+++g5+Keo=;
        b=RnDuqWjxH57s4gCwvNJ1LoahDmwSS5TyFB2qu0s4jX6OTuIf/w9a0SzVsqgADXWXYr
         RVO/0+gd9VRzrKtWO8DjmAJCHwGgfDTrhSfpMOnp0gXrUPMSpytFROUzd0wat7iUDoDa
         8tue5KDs065qbO0ylRzsIjsdgh489N+BgyVbVIEE46b7bmOLNSShExPtHFiEzRQ8WnX4
         yaklKd9AUoM0TIbN+Br6MabA8ji1RP1D8uR2CCISdaCxUmO+cR9t4ENNumCBQ7JZtVGJ
         1sOpGtAmSpHq3z3I87C6AuvI+7lX8y3PTD9fIJepwsKYkAtyyTqnlqeQaxxC4DUwOVSw
         Z/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fFJdx8/X4/hjfklAH2qe2kArlxn2v10apy+++g5+Keo=;
        b=cs9escUAq51HF+Ik5J3B0c/pbgiHqa5U4yfbFRFmZ6zgrMa14QRR4rjJ+YKJUeGxqp
         jgpPHAvdwp8FCmopqTymMtPMaAO9MGNU1qtJZK23Ba3YZmhguldYxqZh/PjYMJV1qU+D
         QV8n7Q5YNEIsRDVMbgYtY5syNQBwjoeO3jqMz9l/P4KQD6sO3A4/wUAB5pOat6wvbZuy
         /9csqxEH+LRAb9R69Des2Q5J173/CFyewr78fW9RS+8uHMTqRTGsCKMeYpWOQBKIOe1G
         Kta4nqqtOaOkQLrpkg9LoVQyXxOg2UZzpMe464NAUIs7OVqfwAJlIss1jzrbY1t8x6FE
         jglQ==
X-Gm-Message-State: AOAM531E/BORyJt8M9/B6f7WiIOz8I8tEg3fUIadVzUSqImH34n5LqEl
        IljH6QEka2L401dMCOn680MIThVB8IE=
X-Google-Smtp-Source: ABdhPJygsVB6pgOsKrJFgi3TL7v1Oxjdr+9ADck8PmP15kECQ4CxheaKUHfykPnADzAqNT+yY91pbQ==
X-Received: by 2002:a63:5126:: with SMTP id f38mr4139846pgb.402.1621921324844;
        Mon, 24 May 2021 22:42:04 -0700 (PDT)
Received: from asus-UPX-TGL01.hitronhub.home ([61.64.1.242])
        by smtp.gmail.com with ESMTPSA id m3sm13208256pfh.174.2021.05.24.22.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 22:42:04 -0700 (PDT)
From:   aaeon.asus@gmail.com
X-Google-Original-From: kunyang_fan@asus.com
To:     linux-gpio@vger.kernel.org
Cc:     acelan.kao@canonical.com, Kunyang_Fan <kunyang_fan@asus.com>
Subject: [PATCH 3/5] watchdog: add driver for AAEON devices
Date:   Tue, 25 May 2021 13:41:47 +0800
Message-Id: <20210525054149.1792-3-kunyang_fan@asus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525054149.1792-1-kunyang_fan@asus.com>
References: <20210525054149.1792-1-kunyang_fan@asus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Kunyang_Fan <kunyang_fan@asus.com>

This patch adds support for the watchdog whose control are
transported to BIOS through ASUS WMI interface.

This driver imitates the old type SIO watchdog driver to
provide the basic control for watchdog functions.

Signed-off-by: Kunyang_Fan <kunyang_fan@asus.com>
---
 drivers/watchdog/Kconfig     |  12 ++
 drivers/watchdog/Makefile    |   1 +
 drivers/watchdog/wdt_aaeon.c | 242 +++++++++++++++++++++++++++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 drivers/watchdog/wdt_aaeon.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 2b2839e89b7b..8fa00a9cfdfd 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1623,6 +1623,18 @@ config NIC7018_WDT
 	  To compile this driver as a module, choose M here: the module will be
 	  called nic7018_wdt.
 
+config AAEON_IWMI_WDT
+	tristate "AAEON Watchdog Timer"
+	depends on ASUS_WMI
+	select MFD_AAEON
+	help
+	  This is the driver for the hardware watchdog on Single Board
+	  Computers produced by AAEON.Say `Y' here to support its built-in
+	  watchdog timer feature.
+
+	  This driver leverages the ASUS WMI interface to access device
+	  resources.
+
 # M68K Architecture
 
 config M54xx_WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 97bed1d3d97c..9d27fec12480 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -145,6 +145,7 @@ obj-$(CONFIG_INTEL_MEI_WDT) += mei_wdt.o
 obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
 obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
 obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
+obj-$(CONFIG_AAEON_IWMI_WDT) += wdt_aaeon.o
 
 # M68K Architecture
 obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
diff --git a/drivers/watchdog/wdt_aaeon.c b/drivers/watchdog/wdt_aaeon.c
new file mode 100644
index 000000000000..41c68805cc93
--- /dev/null
+++ b/drivers/watchdog/wdt_aaeon.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AAEON WDT driver
+ *
+ * Author: Edward Lin <edward1_lin@aaeon.com.tw>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/acpi.h>
+#include <linux/fs.h>
+#include <linux/err.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/platform_data/x86/asus-wmi.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/uaccess.h>
+#include <linux/watchdog.h>
+
+#define AAEON_WMI_MGMT_GUID      "97845ED0-4E6D-11DE-8A39-0800200C9A66"
+#define WMI_WDT_GETMAX_METHOD_ID	0x00020000
+#define WMI_WDT_GETVALUE_METHOD_ID	0x00020001
+#define WMI_WDT_SETANDSTOP_METHOD_ID	0x00020002
+
+#define WMI_WDT_SUPPORTED_DEVICE_ID                                            \
+	0x12 /* Dev_Id for WDT_WMI supported or not */
+#define WMI_WDT_GETMAX_DEVICE_ID  0x10  /* Dev_Id for WDT_WMI get Max timeout */
+#define WMI_WDT_STOP_DEVICE_ID    0x00  /* Dev_Id for WDT_WMI stop watchdog*/
+
+/* Default values */
+#define WATCHDOG_TIMEOUT  60000  /* 1 minute default timeout */
+#define WATCHDOG_MAX_TIMEOUT  (60000 * 255) /* WD_TIME is a byte long */
+#define WATCHDOG_PULSE_WIDTH  5000 /* default pulse width for watchdog signal */
+
+static const int max_timeout = WATCHDOG_MAX_TIMEOUT;
+static int timeout = WATCHDOG_TIMEOUT;    /* default timeout in seconds */
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout, "Initial watchdog timeout in mini-seconds");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0444);
+MODULE_PARM_DESC(nowayout, " Disable watchdog shutdown on close");
+
+/* Wdog internal data information */
+struct watchdog_data {
+	unsigned long       opened;       /* driver open state */
+	struct mutex        lock;         /* concurrency control */
+	char                expect_close; /* controlled close */
+	struct watchdog_info ident;       /* wdog information*/
+	unsigned short      timeout;      /* current wdog timeout */
+	u8                  timer_val;    /* content for the WD_TIME register */
+	char                minutes_mode;
+	u8                  pulse_val;    /* pulse width flag */
+	char                pulse_mode;   /* enable pulse output mode? */
+	char                caused_reboot;/* last reboot was by the watchdog */
+};
+
+static long aaeon_watchdog_ioctl(struct file *file, unsigned int cmd,
+			  unsigned long arg);
+static int aaeon_watchdog_notify_sys(struct notifier_block *this,
+			       unsigned long code, void *unused);
+
+static struct watchdog_data watchdog = {
+	.lock = __MUTEX_INITIALIZER(watchdog.lock),
+};
+
+/* /dev/watchdog api available options */
+static const struct file_operations watchdog_fops = {
+	.owner              = THIS_MODULE,
+	.unlocked_ioctl     = aaeon_watchdog_ioctl,
+};
+
+static struct miscdevice watchdog_miscdev = {
+	.minor      = WATCHDOG_MINOR,
+	.name       = "watchdog",
+	.fops       = &watchdog_fops,
+};
+
+static struct notifier_block watchdog_notifier = {
+	.notifier_call = aaeon_watchdog_notify_sys,
+};
+
+/* Internal Configuration functions */
+static int aaeon_watchdog_set_timeout(int timeout)
+{
+	int err = 0;
+	u32 retval, dev_id = timeout;
+
+	if (timeout <= 0 || timeout >  max_timeout) {
+		pr_debug("watchdog timeout out of range\n");
+		return -EINVAL;
+	}
+
+	mutex_lock(&watchdog.lock);
+	err = asus_wmi_evaluate_method(WMI_WDT_SETANDSTOP_METHOD_ID,
+				       dev_id, 0, &retval);
+	mutex_unlock(&watchdog.lock);
+
+	return err;
+}
+
+static int aaeon_watchdog_get_timeout(void)
+{
+	int err = 0;
+	u32 retval;
+
+	if (timeout <= 0 || timeout >  max_timeout) {
+		pr_debug("watchdog timeout out of range\n");
+		return -EINVAL;
+	}
+	mutex_lock(&watchdog.lock);
+	err = asus_wmi_evaluate_method(WMI_WDT_GETVALUE_METHOD_ID,
+				       0, 0, &retval);
+	mutex_unlock(&watchdog.lock);
+
+	return err ? err : retval;
+}
+
+static int aaeon_watchdog_stop(void)
+{
+	int err = 0;
+
+	mutex_lock(&watchdog.lock);
+	err = asus_wmi_evaluate_method(WMI_WDT_SETANDSTOP_METHOD_ID,
+				       0, 0, NULL);
+	mutex_unlock(&watchdog.lock);
+
+	return err;
+}
+
+static int aaeon_watchdog_get_maxsupport(void)
+{
+	int err;
+	u32 retval;
+
+	mutex_lock(&watchdog.lock);
+	err = asus_wmi_evaluate_method(WMI_WDT_GETMAX_METHOD_ID,
+				       WMI_WDT_GETMAX_DEVICE_ID,
+				       0, &retval);
+	mutex_unlock(&watchdog.lock);
+
+	return err ? err : retval;
+
+}
+
+static long aaeon_watchdog_ioctl(struct file *file, unsigned int cmd,
+			  unsigned long arg)
+{
+	int new_timeout;
+
+	union {
+		struct watchdog_info __user *ident;
+		int __user *i;
+	} uarg;
+
+	uarg.i = (int __user *) arg;
+	switch (cmd) {
+	case WDIOC_SETTIMEOUT:
+		if (get_user(new_timeout, uarg.i))
+			return -EFAULT;
+		if (aaeon_watchdog_set_timeout(new_timeout))
+			return -EINVAL;
+		return 0;
+	case WDIOC_GETTIMEOUT:
+		return aaeon_watchdog_get_timeout();
+	case WDIOS_DISABLECARD:
+		return aaeon_watchdog_stop();
+	case WDIOC_GETSUPPORT:
+		return aaeon_watchdog_get_maxsupport();
+	default:
+		return -ENOTTY;
+	}
+}
+
+static int aaeon_watchdog_notify_sys(struct notifier_block *this,
+			       unsigned long code, void *unused)
+{
+	if (code == SYS_DOWN || code == SYS_HALT)
+		aaeon_watchdog_stop();
+	return NOTIFY_DONE;
+}
+
+static int aaeon_wdt_probe(struct platform_device *pdev)
+{
+	int err = 0;
+	int retval = 0;
+
+	pr_debug("aaeon watchdog device probe!\n");
+	if (!wmi_has_guid(AAEON_WMI_MGMT_GUID)) {
+		pr_debug("AAEON Management GUID not found\n");
+		return -ENODEV;
+	}
+	err = asus_wmi_evaluate_method(WMI_WDT_GETMAX_METHOD_ID,
+				       WMI_WDT_SUPPORTED_DEVICE_ID, 0, &retval);
+	if (err)
+		goto exit;
+
+	/*
+	 * This driver imitates the old type SIO watchdog driver to
+	 * provide the basic control for watchdog functions and only
+	 * access by customized userspace tool
+	 */
+	err = misc_register(&watchdog_miscdev);
+	if (err) {
+		pr_debug(" cannot register miscdev on minor=%d\n",
+			 watchdog_miscdev.minor);
+		goto exit;
+	}
+
+	err = register_reboot_notifier(&watchdog_notifier);
+	if (err)
+		goto exit_miscdev;
+
+	if (nowayout)
+		__module_get(THIS_MODULE);
+
+	return 0;
+
+exit_miscdev:
+	misc_deregister(&watchdog_miscdev);
+exit:
+	return err;
+}
+
+static struct platform_driver aaeon_wdt_driver = {
+	.driver = {
+		.name = "wdt-aaeon",
+	},
+};
+
+module_platform_driver_probe(aaeon_wdt_driver, aaeon_wdt_probe);
+
+MODULE_ALIAS("platform:wdt-aaeon");
+MODULE_DESCRIPTION("AAEON WDT Driver");
+MODULE_AUTHOR("Edward Lin <edward1_lin@aaeon.com.tw>");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

