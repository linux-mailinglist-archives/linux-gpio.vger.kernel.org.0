Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A82536AB90E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjCFJAp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjCFJAk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:00:40 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 15C8A222FF;
        Mon,  6 Mar 2023 01:00:33 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.98,236,1673881200"; 
   d="scan'208";a="151662709"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Mar 2023 18:00:33 +0900
Received: from localhost.localdomain (unknown [10.226.93.39])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4D1E941C704C;
        Mon,  6 Mar 2023 18:00:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 03/13] pinctrl: Add sysfs support
Date:   Mon,  6 Mar 2023 09:00:04 +0000
Message-Id: <20230306090014.128732-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a simple sysfs interface to the generic pinctrl framework
for configuring pins for output disable operation.

/sys/class/pinctrl/
  `-- output-disable/
      |-- configure    (w/o) ask the kernel to configure a pin group
                             for output disable operation.

  echo "<group-name function-name 0 1>" > configure

The existing "pinmux-functions" debugfs file lists the pin functions
registered for the pin controller. For example:

  function 0: usb0, groups = [ usb0 ]
  function 1: usb1, groups = [ usb1 ]
  function 2: gpt4-pins, groups = [ gpt4-pins ]
  function 3: scif0, groups = [ scif0 ]
  function 4: scif2, groups = [ scif2 ]
  function 5: spi1, groups = [ spi1 ]

To configure gpt4-pins for output disable activation by user:

  echo "gpt4-pins gpt4-pins 0 1" > configure

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * New patch
Ref:
 https://lore.kernel.org/linux-renesas-soc/OS0PR01MB5922F5494D3C0862E15F3F8486B39@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#t
---
 Documentation/ABI/testing/sysfs-class-pinctrl |  32 ++++
 drivers/pinctrl/Kconfig                       |   4 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/core.c                        |   3 +
 drivers/pinctrl/output-disable.c              | 148 ++++++++++++++++++
 drivers/pinctrl/output-disable.h              |  32 ++++
 6 files changed, 220 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-pinctrl
 create mode 100644 drivers/pinctrl/output-disable.c
 create mode 100644 drivers/pinctrl/output-disable.h

diff --git a/Documentation/ABI/testing/sysfs-class-pinctrl b/Documentation/ABI/testing/sysfs-class-pinctrl
new file mode 100644
index 000000000000..cdf47ea77c32
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-pinctrl
@@ -0,0 +1,32 @@
+What:		/sys/class/pinctrl
+Date:		March 2023
+KernelVersion:	6.4
+Contact:	Biju Das <biju.das.jz@bp.renesas.com>
+Description:
+		The pinctrl class sub-directory belongs to the Generic pincontrol
+		Framework and provides a sysfs interface for using pincontrol
+		configurations.
+
+What:		/sys/class/pinctrl/output-disable
+Date:		March 2023
+KernelVersion:	6.4
+Contact:	Biju Das <biju.das.jz@bp.renesas.com>
+Description:
+		A /sys/class/pinctrl/output-disable directory is created for
+		pin output disable function.
+
+What:		/sys/class/pinctrl/output-disable/configure
+Date:		March 2023
+KernelVersion:	6.4
+Contact:	Biju Das <biju.das.jz@bp.renesas.com>
+Description:
+		The configuration for pin output disable IP.
+
+		Write the following string to configure the pin output disable:
+
+		- "fname gname conf conf_val"
+
+		fname is function name,
+		gname is group name,
+		conf is configuration
+		conf_val is 0 or 1, to disable/enable the above conf.
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index dcb53c4a9584..3553d76c3577 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -21,6 +21,10 @@ config GENERIC_PINMUX_FUNCTIONS
 config PINCONF
 	bool "Support pin configuration controllers" if COMPILE_TEST
 
+config PIN_OUTPUT_DISABLE
+	bool
+	default y if SYSFS
+
 config GENERIC_PINCONF
 	bool
 	select PINCONF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index d5939840bb2a..e923adaa2b9c 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -6,6 +6,7 @@ subdir-ccflags-$(CONFIG_DEBUG_PINCTRL)	+= -DDEBUG
 obj-y				+= core.o pinctrl-utils.o
 obj-$(CONFIG_PINMUX)		+= pinmux.o
 obj-$(CONFIG_PINCONF)		+= pinconf.o
+obj-$(CONFIG_PIN_OUTPUT_DISABLE) += output-disable.o
 obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
 obj-$(CONFIG_OF)		+= devicetree.o
 
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2ba222026db4..3fce50786754 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -36,6 +36,7 @@
 
 #include "core.h"
 #include "devicetree.h"
+#include "output-disable.h"
 #include "pinconf.h"
 #include "pinmux.h"
 
@@ -2171,6 +2172,7 @@ int pinctrl_enable(struct pinctrl_dev *pctldev)
 	mutex_unlock(&pinctrldev_list_mutex);
 
 	pinctrl_init_device_debugfs(pctldev);
+	output_disable_init_device_sysfs(pctldev);
 
 	return 0;
 }
@@ -2252,6 +2254,7 @@ void pinctrl_unregister(struct pinctrl_dev *pctldev)
 
 	mutex_lock(&pctldev->mutex);
 	pinctrl_remove_device_debugfs(pctldev);
+	output_disable_remove_device_sysfs(pctldev);
 	mutex_unlock(&pctldev->mutex);
 
 	if (!IS_ERR_OR_NULL(pctldev->p))
diff --git a/drivers/pinctrl/output-disable.c b/drivers/pinctrl/output-disable.c
new file mode 100644
index 000000000000..fb233b10b7df
--- /dev/null
+++ b/drivers/pinctrl/output-disable.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic pin output-disable sysfs interface for pinctrl
+ * Copyright (C) 2023  <biju.das.jz@bp.renesas.com>
+ */
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/output-disable.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "core.h"
+#include "output-disable.h"
+
+#define OUTPUT_DISABLE_BUF_MAX 128
+
+static int output_disable_get_vars(char *src, char **dst)
+{
+	char *result = (char *)dst;
+
+	/* find a separator which is a spacelike character */
+	for (result = src; !isspace(*result); result++) {
+		if (*result == '\0')
+			return -EINVAL;
+	}
+	*result = '\0';
+
+	/* drop extra spaces between function and group names */
+	result = skip_spaces(result + 1);
+	if (*result == '\0')
+		return -EINVAL;
+
+	*dst = result;
+
+	return 0;
+}
+
+static ssize_t configure_store(struct device *parent,
+			       struct device_attribute *attr,
+			       const char *src_buf,
+			       size_t len)
+{
+	struct pinctrl_dev *pctldev = dev_get_drvdata(parent);
+	const struct pin_output_disable_ops *poutdisops = pctldev->desc->poutdisops;
+	char *buf, *gname, *fname, *conf, *conf_val;
+	int config, config_val;
+	struct device *dev;
+	int ret;
+
+	if (len > OUTPUT_DISABLE_BUF_MAX)
+		return -ENOMEM;
+
+	buf = kzalloc(OUTPUT_DISABLE_BUF_MAX, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy(buf, src_buf, len);
+	buf[len - 1] = '\0';
+
+	/* remove leading and trailing spaces of input buffer */
+	gname = strstrip(buf);
+	if (*gname == '\0') {
+		ret = -EINVAL;
+		goto exit_free_buf;
+	}
+
+	ret = output_disable_get_vars(gname, &fname);
+	if (ret < 0)
+		goto exit_free_buf;
+
+	ret = output_disable_get_vars(fname, &conf);
+	if (ret < 0)
+		goto exit_free_buf;
+
+	ret = output_disable_get_vars(conf, &conf_val);
+	if (ret < 0)
+		goto exit_free_buf;
+
+	ret = kstrtoint(conf, 0, &config);
+	if (ret)
+		goto exit_free_buf;
+
+	ret = kstrtoint(conf_val, 0, &config_val);
+	if (ret)
+		goto exit_free_buf;
+
+	dev = pinctrl_get_device(fname, gname);
+	if (IS_ERR(dev)) {
+		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
+		goto exit_free_buf;
+	}
+
+	if (poutdisops)
+		poutdisops->pin_output_disable_config_set(pctldev, dev,
+							  fname, gname,
+							  config, config_val);
+
+exit_free_buf:
+	kfree(buf);
+
+	return ret ? : len;
+}
+static DEVICE_ATTR_WO(configure);
+
+static struct attribute *pinctrl_attrs[] = {
+	&dev_attr_configure.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(pinctrl);
+
+static struct class pinctrl_class = {
+	.name = "pinctrl",
+	.owner = THIS_MODULE,
+	.dev_groups = pinctrl_groups,
+};
+
+void output_disable_init_device_sysfs(struct pinctrl_dev *pctldev)
+{
+	struct device *parent;
+
+	parent = device_create(&pinctrl_class, pctldev->dev, MKDEV(0, 0),
+			       pctldev, "output-disable");
+	if (IS_ERR(parent))
+		dev_err(pctldev->dev, "device_create failed for pinctrl sysfs\n");
+}
+
+void output_disable_remove_device_sysfs(struct pinctrl_dev *pctldev)
+{
+	device_destroy(&pinctrl_class, MKDEV(0, 0));
+}
+
+static int __init pinctrl_sysfs_init(void)
+{
+	return class_register(&pinctrl_class);
+}
+subsys_initcall(pinctrl_sysfs_init);
+
+static void __exit pinctrl_sysfs_exit(void)
+{
+	class_unregister(&pinctrl_class);
+}
+module_exit(pinctrl_sysfs_exit);
diff --git a/drivers/pinctrl/output-disable.h b/drivers/pinctrl/output-disable.h
new file mode 100644
index 000000000000..f933965599d2
--- /dev/null
+++ b/drivers/pinctrl/output-disable.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Internal interface between the core pin control system and the
+ * ouput-disable portions
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ * Based on bits of pinmux.c
+ *
+ * Author: Biju Das <biju.das.jz@bp.renesas.com>
+ */
+
+#include <linux/types.h>
+
+struct dentry;
+struct seq_file;
+
+struct pinctrl_dev;
+
+#ifdef CONFIG_PIN_OUTPUT_DISABLE
+void output_disable_init_device_sysfs(struct pinctrl_dev *pctldev);
+void output_disable_remove_device_sysfs(struct pinctrl_dev *pctldev);
+
+#else
+static inline void output_disable_init_device_sysfs(struct pinctrl_dev *pctldev)
+{
+}
+
+static inline void output_disable_remove_device_sysfs(struct pinctrl_dev *pctldev)
+{
+}
+
+#endif
-- 
2.25.1

