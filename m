Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E37672DDDBE
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Dec 2020 05:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730833AbgLRExS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 23:53:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgLRExS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2020 23:53:18 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB957C0617B0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Dec 2020 20:52:37 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id 6so1338371ejz.5
        for <linux-gpio@vger.kernel.org>; Thu, 17 Dec 2020 20:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v1y9ENSNNQay1LklhJx7zHeDeGFoZWOh+gGzItd4vCU=;
        b=QMJrIDnfPUqFaaBXIPcjjkPvEBUr4hiZIZVXcwffn5K7MeFtJS1X9fMtg8o1uCHT62
         A+K/RvNdhBnlooaAJZnyIz+dDmzVPRdm4uCUDwZt0w/6r/Gt7WUI2Sumyq45lJRU3SLV
         LHXnFAJSLdEJ0YDYH21cACdDsOGxlF+pV7dyy+caCkgqJAYH6H18/SnAg0TnzcspRaB5
         dJGxR8kCFbB495E3CcfERHsfZYQFADmYjpq1HJoSqNE4h9IXPw+KTv7vPMswwyCc2uXy
         57tcRePGItfuhBEVlynxdRaKNK5Mrg2CDgISsM2SmbJfAAAy4TJyQIudcNoj9jsGWSSV
         P9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v1y9ENSNNQay1LklhJx7zHeDeGFoZWOh+gGzItd4vCU=;
        b=qyKH4fnDHj58dGjRvbxkJ9DDFd9P0jEqmC+Q6y57PN8sPtk+ziE/R2CKRaumfi6GbJ
         yKBmGI9e0CNpZ0crqP6cgPXy8HeJzhIYvaBAelmDq7W7qJtOOKqry8siDJmaM9RLUYbM
         DVkjIzGNBgLPmkbRdSy3FCtM7j79KB15X3PN9hq3Istmp33cdVxWk4wHBl0Yp2FWqmRa
         6JdOxisCuKQmyoMD05cqkdpWsNJWUAQ+CNPPzCMB9f4tTdqPa4eJi4DG029HnBZrKqUM
         G4Td0gAiReuSGlQELpI331DalnRe85vSzmo2phGDWRJqf4FNa3ArgvrQu085jmL60LiU
         M9WA==
X-Gm-Message-State: AOAM5323JuuWfla/UB0SicpaPymLz+k0HZFyeuC5WyiSywp8uVhXaJ1o
        +GEJsi5P8bOQ2ZLpcw2N0WOf1tPq2IZWDOFs
X-Google-Smtp-Source: ABdhPJw9UnCix9kdGowJBC5zGRkA0tFavYPXj1xdi+72QloQ5c7OP/S2CkQNDBDShirlHuVnv5vobg==
X-Received: by 2002:a17:906:354a:: with SMTP id s10mr2225404eja.335.1608267155975;
        Thu, 17 Dec 2020 20:52:35 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([212.102.53.198])
        by smtp.gmail.com with ESMTPSA id b21sm24322117edr.53.2020.12.17.20.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 20:52:34 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Pantelis Antoniou <pantelis.antoniou@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [RFC PATCH v2] pinctrl: add helper to expose pinctrl state in debugfs
Date:   Thu, 17 Dec 2020 20:51:34 -0800
Message-Id: <20201218045134.4158709-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

BeagleBoard.org [0] currently uses an out-of-tree driver called
bone-pinmux-helper [1] developed by Pantelis Antoniou [2] back in 2013.
The driver assists users of our BeagleBone and PocketBeagle boards in
rapid prototyping by allowing them to change at run-time between defined
set of pinctrl states [3] for each pin on the expansion connectors [4].
This is achieved by exposing a 'state' file in sysfs for each pin which
is used by our 'config-pin' utility [5].

Our goal is to eliminate all out-of-tree drivers for BeagleBoard.org
boards and thus I have been working to replace bone-pinmux-helper with a
new driver that could be acceptable upstream. My understanding is that
debugfs, unlike sysfs, could be the appropriate mechanism to expose such
functionality.

Here is an example of how pin P9.14 on the BeagleBone Black expansion
connector [6] would be represented in device tree:

&am33xx_pinmux {
	/* P9_14 (ZCZ ball U14) gpio1_18 */
	P9_14_default_pin: pinmux_P9_14_default_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE7) >; };
	P9_14_gpio_pin: pinmux_P9_14_gpio_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_OUTPUT | INPUT_EN | MUX_MODE7) >; };
	P9_14_gpio_pu_pin: pinmux_P9_14_gpio_pu_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE7) >; };
	P9_14_gpio_pd_pin: pinmux_P9_14_gpio_pd_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE7) >; };
	P9_14_gpio_input_pin: pinmux_P9_14_gpio_input_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_INPUT | MUX_MODE7) >; };
	P9_14_pwm_pin: pinmux_P9_14_pwm_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE6) >; };
};

&ocp {
	/* P9_14 (ZCZ ball U14) */
	P9_14_pinmux {
		compatible = "pinctrl,state-helper";
		status = "okay";
		pinctrl-names = "default", "gpio", "gpio_pu", "gpio_pd", "gpio_input", "pwm";
		pinctrl-0 = <&P9_14_default_pin>;
		pinctrl-1 = <&P9_14_gpio_pin>;
		pinctrl-2 = <&P9_14_gpio_pu_pin>;
		pinctrl-3 = <&P9_14_gpio_pd_pin>;
		pinctrl-4 = <&P9_14_gpio_input_pin>;
		pinctrl-5 = <&P9_14_pwm_pin>;
	};
};

I used the compatible string "pinctrl,state-helper" but would appreciate
advice on how to best name this. Should I create a new vendor prefix?

The P9_14_pinmux entry would cause pinctrl-state-helper to be probed.
The driver would create the corresponding pinctrl state file in debugfs
for the pin.  Here is an example of how the state can be read and
written from userspace:

root@beaglebone:~# cat /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
default
root@beaglebone:~# echo pwm > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
root@beaglebone:~# cat /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
pwm

I would very much appreciate feedback on both this general concept, and
also specific areas in which the code should be changed to be acceptable
upstream.

Thank you!
Drew

[0] http://beagleboard.org/latest-images
[1] https://github.com/beagleboard/linux/blob/5.4/drivers/misc/cape/beaglebone/bone-pinmux-helper.c
[2] https://github.com/RobertCNelson/linux-dev/blob/master/patches/drivers/ti/gpio/0001-BeagleBone-pinmux-helper.patch
[3] https://github.com/beagleboard/BeagleBoard-DeviceTrees/blob/v5.4.x-ti-overlays/src/arm/am335x-bone-common-univ.dtsi#L2084
[4] https://github.com/beagleboard/beaglebone-black/wiki/System-Reference-Manual#section-7-1
[5] https://github.com/beagleboard/bb.org-overlays/blob/master/tools/beaglebone-universal-io/config-pin
[6] https://beagleboard.org/Support/bone101/#headers

Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Pantelis Antoniou <pantelis.antoniou@linaro.org>
Cc: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Cc: Jason Kridner <jkridner@beagleboard.org>
Cc: Robert Nelson <robertcnelson@beagleboard.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v2 changes:
- add RFC: comments in places where I would appreciate feedback
- remove panto@antoniou-consulting.com as it is bouncing
- add alternative email addresses for Pantelis
- update pinctrl_state_read() to use kasprintf() based on Andy's advice
- update pinctrl_state_write() to use memdup_user_nul()
- call debugfs_lookup() to use existing "pinctrl" dir as parent
- create subdir "pinctrl_state" to be parent of per-pin directories
- add pinctrl_state_helper_init() and pinctrl_state_helper_exit() to
handle creating and cleaning up debugfs_root ("pinctrl_state")

 drivers/pinctrl/Kconfig                |  10 +
 drivers/pinctrl/Makefile               |   1 +
 drivers/pinctrl/pinctrl-state-helper.c | 241 +++++++++++++++++++++++++
 3 files changed, 252 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-state-helper.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8828613c4e0e..4faed5c8c83b 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -255,6 +255,16 @@ config PINCTRL_SINGLE
 	help
 	  This selects the device tree based generic pinctrl driver.
 
+config PINCTRL_STATE_HELPER
+	tristate "Helper to expose pinctrl state to debugfs"
+	depends on OF
+	depends on HAS_IOMEM
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	help
+	  This selects the device tree based generic pinctrl driver.
+
 config PINCTRL_SIRF
 	bool "CSR SiRFprimaII pin controller driver"
 	depends on ARCH_SIRF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 1731b2154df9..156c356dbd3f 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_PINCTRL_RZA1)	+= pinctrl-rza1.o
 obj-$(CONFIG_PINCTRL_RZA2)	+= pinctrl-rza2.o
 obj-$(CONFIG_PINCTRL_RZN1)	+= pinctrl-rzn1.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
+obj-$(CONFIG_PINCTRL_STATE_HELPER)	+= pinctrl-state-helper.o
 obj-$(CONFIG_PINCTRL_SIRF)	+= sirf/
 obj-$(CONFIG_PINCTRL_SX150X)	+= pinctrl-sx150x.o
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
diff --git a/drivers/pinctrl/pinctrl-state-helper.c b/drivers/pinctrl/pinctrl-state-helper.c
new file mode 100644
index 000000000000..81f9932d6ec5
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-state-helper.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Pinmux state helper driver
+ *
+ * Copyright (C) 2013 Pantelis Antoniou <panto@antoniou-consulting.com>
+ * Copyright (C) 2020 Drew Fustini <drew@beagleboard.org>
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/fs.h>
+#include <linux/path.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/dcache.h>
+#include "core.h"
+
+#define DRIVER_NAME	"pinctrl_state_helper"
+/* RFC: is there a better directory name? */
+#define DEBUGFS_DIR	"pinctrl_state"
+#define STATE_NAME_MAX	64
+
+static struct dentry *debugfs_root;
+
+struct pinctrl_state_helper_priv {
+	struct device *dev;
+	struct pinctrl *pinctrl;
+	struct dentry *pin_dentry;
+	/* RFC: should this be dynamically allocated? */
+	char selected_state_name[STATE_NAME_MAX];
+};
+
+static ssize_t pinctrl_state_read(struct file *file, char __user *user_buf,
+				  size_t cnt, loff_t *ppos)
+{
+	struct pinctrl_state_helper_priv *priv;
+	struct seq_file *sfile;
+	char *state_name;
+	ssize_t len;
+	char *buf;
+
+	if (*ppos != 0)
+		return 0;
+
+	sfile = file->private_data;
+	if (!sfile)
+		return -ENODEV;
+
+	priv = sfile->private;
+	if (!priv)
+		return -ENODEV;
+
+	state_name = priv->selected_state_name;
+	if (state_name == NULL || strlen(state_name) == 0)
+		state_name = "none";
+
+	buf = kasprintf(GFP_KERNEL, "%s\n", state_name);
+	if (!buf)
+		return -ENOMEM;
+
+	if (cnt < strlen(buf)) {
+		kfree(buf);
+		return -ENOSPC;
+	}
+
+	len = simple_read_from_buffer(user_buf, cnt, ppos, buf, strlen(buf));
+	kfree(buf);
+	return len;
+}
+
+static ssize_t pinctrl_state_write(struct file *file, const char __user *user_buf,
+				   size_t cnt, loff_t *ppos)
+{
+	int err;
+	char *state_name;
+	struct seq_file *sfile;
+	struct pinctrl *p;
+	struct pinctrl_state *state;
+	struct pinctrl_state_helper_priv *priv;
+
+	if (*ppos != 0)
+		return -EINVAL;
+
+	if (cnt == 0)
+		return 0;
+
+	state_name = memdup_user_nul(user_buf, cnt);
+	if (IS_ERR(state_name))
+		return PTR_ERR(state_name);
+
+	if (state_name[cnt - 1] == '\n')
+		state_name[cnt - 1] = '\0';
+
+	sfile = file->private_data;
+	priv = sfile->private;
+	p = devm_pinctrl_get(priv->dev);
+	state = pinctrl_lookup_state(p, state_name);
+	if (IS_ERR(state)) {
+		err = PTR_ERR_OR_ZERO(state);
+		goto err_no_state;
+	}
+
+	err = pinctrl_select_state(p, state);
+	if (err != 0) {
+		err = -EINVAL;
+		goto err_no_state;
+	}
+	strncpy(priv->selected_state_name, state_name, STATE_NAME_MAX);
+
+	kfree(state_name);
+	return cnt;
+
+err_no_state:
+	kfree(state_name);
+	return err;
+}
+
+static int pinctrl_state_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, NULL, inode->i_private);
+}
+
+static const struct file_operations pinctrl_state_ops = {
+	.owner = THIS_MODULE,
+	.open = pinctrl_state_open,
+	.read = pinctrl_state_read,
+	.write = pinctrl_state_write,
+	.llseek = no_llseek,
+	.release = single_release,
+};
+
+static int pinctrl_state_helper_probe(struct platform_device *pdev)
+{
+	int err;
+	struct pinctrl_state *state;
+	struct pinctrl_state_helper_priv *priv;
+	struct dentry *pin_dir;
+	struct device *dev = &pdev->dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (priv == NULL) {
+		dev_err(dev, "Failed to allocate priv");
+		return -ENOMEM;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(priv->pinctrl)) {
+		dev_err(dev, "Failed to get pinctrl");
+		err = PTR_ERR_OR_ZERO(priv->pinctrl);
+		goto err_no_pinctrl;
+	}
+
+	strcpy(priv->selected_state_name, PINCTRL_STATE_DEFAULT);
+	state = pinctrl_lookup_state(priv->pinctrl, priv->selected_state_name);
+	if (IS_ERR(state)) {
+		dev_err(dev, "Failed to lookup default state");
+		err = PTR_ERR_OR_ZERO(state);
+		goto err_no_state;
+	}
+
+	err = pinctrl_select_state(priv->pinctrl, state);
+	if (err != 0) {
+		dev_err(dev, "Failed to select default state");
+		goto err_no_state;
+	}
+
+	pin_dir = debugfs_create_dir(dev_name(dev), debugfs_root);
+	priv->dev = dev;
+	priv->pin_dentry = debugfs_create_file("state", 0600, pin_dir, priv, &pinctrl_state_ops);
+
+	return 0;
+
+err_no_state:
+	devm_pinctrl_put(priv->pinctrl);
+err_no_pinctrl:
+	devm_kfree(dev, priv);
+	return err;
+}
+
+static int pinctrl_state_helper_remove(struct platform_device *pdev)
+{
+	struct pinctrl_state_helper_priv *priv;
+
+	priv = platform_get_drvdata(pdev);
+	devm_pinctrl_put(priv->pinctrl);
+	debugfs_remove(priv->pin_dentry);
+
+	return 0;
+}
+
+static const struct of_device_id helper_of_match[] = {
+	{
+		/* RFC: keep generic or make begalebone specific? */
+		.compatible = "pinctrl,state-helper",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, helper_of_match);
+
+static struct platform_driver pinctrl_state_helper_driver = {
+	.probe		= pinctrl_state_helper_probe,
+	.remove		= pinctrl_state_helper_remove,
+	.driver = {
+		.name           = "pinctrl_state_helper",
+		.owner          = THIS_MODULE,
+		.of_match_table	= helper_of_match,
+	},
+};
+
+static int pinctrl_state_helper_init(void)
+{
+	int err;
+	struct dentry *pinctrl_dir;
+
+	pinctrl_dir = debugfs_lookup("pinctrl", NULL);
+	debugfs_root = debugfs_create_dir(DEBUGFS_DIR, pinctrl_dir);
+	if (IS_ERR(debugfs_root) || !debugfs_root) {
+		pr_err("Failed to create debugfs directory %s", DEBUGFS_DIR);
+		return -EINVAL;
+	}
+
+	err = platform_driver_register(&pinctrl_state_helper_driver);
+	return err;
+}
+module_init(pinctrl_state_helper_init);
+
+static void pinctrl_state_helper_exit(void)
+{
+	debugfs_remove_recursive(debugfs_root);
+	platform_driver_unregister(&pinctrl_state_helper_driver);
+}
+module_exit(pinctrl_state_helper_exit);
+
+MODULE_AUTHOR("Drew Fustini <drew@beagleboard.org>");
+MODULE_DESCRIPTION("Helper driver exposes pinctrl state to debugfs");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

