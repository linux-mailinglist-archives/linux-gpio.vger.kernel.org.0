Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4D42D6F51
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 05:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405391AbgLKEbJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 23:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405388AbgLKEax (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 23:30:53 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8A0C0613D3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 20:30:12 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id lt17so10564006ejb.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 20:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7mhKza1Cax/u42moL2BVtPYkbdV4UBxjh48EyphNhVU=;
        b=BZaANn+WakBOTmPUNY8qL1KIrb5KJ1veI1O0KRHiVUwHj9yaYQ+MuQk7IWDp8B7K00
         viqTKdzcvd6trw13q6NnTCAvcss6ewUMDdv8TObErfbCkfO6qlzqBZ/OYAl+FJKSPJgH
         KlNyrh6UHw8Z4aWFiX8wV7OnO3+jZ0zxCfJHKtvgYrFK5Q42ig0WPieZ44w4tMSsr3nZ
         /vlJXWq/bvKPbUN4wyEAf/ynXDVgdDOvfp/Jkp6QwrDK8+R+Ks5ym6d3Av3aRUYZ5ACj
         8qXkgAtX2ThE9hS+s5nE6MtM6AUhdMdzQhE5OnNK1kl6DoXJWa2JCINkh+sJCTgxNdoj
         4nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7mhKza1Cax/u42moL2BVtPYkbdV4UBxjh48EyphNhVU=;
        b=VcOOEPG7bMl9kJLRlpfPpGLNSQybpaFDDTQigGqE4YIA9LhQ7YkkM3TD8ViyFdd4C8
         NHKW8AxDsu+F60RoxcjXk4k3NDIEEBzvHLQ2jUNxd5Cv7LhgmJk6DH9jDMYlSCPglq7d
         +yQOyTFnPEJm7xD44coCO3mCbA9+ipD9UpaAi4x0MG9sAeY1k2nmOacAx4QBjbeDFAlE
         ab1go2mmWEhIloyc6DPEL0B9H/5I04pggPsbguly/aWxmiTy07r5Gj+cSv/Gv/vBM/OS
         p7TTNy1qtKVd7OAyJmeCIn8bHsRwQTFfiIu/tclUrANFdm0B72YOwPks69tnUAsA74Rh
         9wyw==
X-Gm-Message-State: AOAM5318vcLIWp80heoT6C9dPy7Sl7Hnzj6EWgQ1E+oa/++UmFuSyAkz
        rmaWFVddSTcm7o6ZFo84YhaPUMFDo2qZzmam
X-Google-Smtp-Source: ABdhPJxJQgnJFIlCVdRvlaPqkuxPf1zlJAyfe+/8E84Vc5IGVW1ZVjzZ6XVMFQXYTr3Fyeo4lkELOw==
X-Received: by 2002:a17:907:214d:: with SMTP id rk13mr9500297ejb.501.1607661010805;
        Thu, 10 Dec 2020 20:30:10 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([143.244.37.163])
        by smtp.gmail.com with ESMTPSA id b19sm6453163edx.47.2020.12.10.20.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 20:30:09 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Pantelis Antoniou <panto@antoniou-consulting.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: [RFC PATCH] pinctrl: add helper to expose pinctrl state in debugfs
Date:   Thu, 10 Dec 2020 20:26:29 -0800
Message-Id: <20201211042625.129255-1-drew@beagleboard.org>
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

root@beaglebone:~# cat /sys/kernel/debug/ocp\:P9_14_pinmux/state
default
root@beaglebone:~# echo pwm > /sys/kernel/debug/ocp\:P9_14_pinmux/state
root@beaglebone:~# cat /sys/kernel/debug/ocp\:P9_14_pinmux/state
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

Cc: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/Kconfig                |  10 ++
 drivers/pinctrl/Makefile               |   1 +
 drivers/pinctrl/pinctrl-state-helper.c | 233 +++++++++++++++++++++++++
 3 files changed, 244 insertions(+)
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
index 000000000000..d11edb9ee9b4
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-state-helper.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Pinmux state helper driver
+ *
+ * Copyright (C) 2013 Pantelis Antoniou <panto@antoniou-consulting.com>
+ * Copyright (C) 2020 Drew Fustini <drew@beagleboard.org>
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/list.h>
+#include <linux/interrupt.h>
+
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+
+#include <linux/fs.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/dcache.h>
+
+#include "core.h"
+#include "devicetree.h"
+#include "pinconf.h"
+#include "pinmux.h"
+
+#define DRIVER_NAME			"pinctrl_state_helper"
+
+struct pinctrl_state_helper_priv {
+	unsigned int offset;
+	struct device *dev;
+	struct pinctrl *pinctrl;
+	char selected_state_name[64];
+};
+
+static ssize_t pinctrl_state_read(struct file *file,
+					char __user *usr_buf,
+					size_t size, loff_t *ppos)
+{
+	int cnt;
+	char buf[64];
+	struct pinctrl_state_helper_priv *priv;
+	struct seq_file *sfile;
+	char *state_name;
+
+	sfile = file->private_data;
+	priv = sfile->private;
+	state_name = priv->selected_state_name;
+	if (state_name == NULL || strlen(state_name) == 0)
+		state_name = "none";
+
+	if (*ppos != 0)
+		return 0;
+
+	cnt = snprintf(buf, sizeof(buf), "%s\n", state_name);
+
+	return simple_read_from_buffer(usr_buf, size, ppos, buf, cnt);
+}
+
+static ssize_t pinctrl_state_write(struct file *file, const char __user *ubuf, size_t cnt, loff_t *ppos)
+{
+	int err;
+	char *s;
+	char state_name[64];
+	struct seq_file *sfile;
+	struct pinctrl *p;
+	struct pinctrl_state *state;
+	struct pinctrl_state_helper_priv *priv;
+
+	if (cnt > 63) {
+		pr_debug("%s: cnt TRUNCATED to 63", __func__);
+		cnt = 63;
+	}
+
+	if (copy_from_user(state_name, ubuf, cnt)) {
+		pr_debug("%s: return -EFAULT", __func__);
+		return -EFAULT;
+	}
+
+	state_name[cnt] = '\0';
+	s = strchr(state_name, '\n');
+	if (s != NULL)
+		*s = '\0';
+
+	sfile = file->private_data;
+	priv = sfile->private;
+	strncpy(priv->selected_state_name, state_name, 64);
+
+	p = devm_pinctrl_get(priv->dev);
+
+	state = pinctrl_lookup_state(p, state_name);
+
+	if (!IS_ERR(state)) {
+		err = pinctrl_select_state(p, state);
+		if (err != 0) {
+			pr_err("Failed to select state %s\n", state_name);
+			return -EINVAL;
+		}
+	} else {
+		err = PTR_ERR_OR_ZERO(state);
+		pr_err("Failed to find state %s err=%d\n", state_name, err);
+		return -EINVAL;
+	}
+
+	if (*ppos != 0) {
+		pr_err("%s: ppos not zero, return -EINVAL", __func__);
+		return -EINVAL;
+	}
+
+	return cnt;
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
+	struct pinctrl_state *state;
+	char *state_name = "default";
+	struct pinctrl_state_helper_priv *priv;
+	struct device *dev = &pdev->dev;
+	int err;
+	struct dentry *pin_dentry;
+	struct dentry *helper_dir;
+	struct dentry *parent = NULL;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (priv == NULL) {
+		dev_err(&pdev->dev, "Failed to allocate priv\n");
+		err = -ENOMEM;
+		goto err_no_mem;
+	}
+
+	state_name = devm_kzalloc(&pdev->dev, strlen(PINCTRL_STATE_DEFAULT) + 1,
+			GFP_KERNEL);
+	if (state_name == NULL) {
+		dev_err(dev, "Failed to allocate state name\n");
+		err = -ENOMEM;
+		goto err_no_state_mem;
+	}
+	strcpy(priv->selected_state_name, PINCTRL_STATE_DEFAULT);
+	platform_set_drvdata(pdev, priv);
+
+	priv->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(priv->pinctrl)) {
+		dev_err(dev, "Failed to get pinctrl\n");
+		err = PTR_ERR_OR_ZERO(priv->pinctrl);
+		goto err_no_pinctrl;
+	}
+
+	if (err != 0) {
+		state = pinctrl_lookup_state(priv->pinctrl,
+				priv->selected_state_name);
+		if (!IS_ERR(state)) {
+			err = pinctrl_select_state(priv->pinctrl, state);
+			if (err != 0) {
+				dev_err(dev, "Failed to select default state\n");
+				goto err_no_state;
+			}
+		} else {
+			*priv->selected_state_name = '\0';
+		}
+	}
+
+	helper_dir = debugfs_create_dir(dev_name(dev), parent);
+	priv->dev = dev;
+	pin_dentry = debugfs_create_file("state", 0600, helper_dir, priv, &pinctrl_state_ops);
+
+	return 0;
+
+err_no_state:
+	devm_pinctrl_put(priv->pinctrl);
+err_no_pinctrl:
+	devm_kfree(dev, priv->selected_state_name);
+err_no_state_mem:
+	devm_kfree(dev, priv);
+err_no_mem:
+	return err;
+}
+
+static int pinctrl_state_helper_remove(struct platform_device *pdev)
+{
+	struct pinctrl_state_helper_priv *priv;
+
+	priv = platform_get_drvdata(pdev);
+	devm_pinctrl_put(priv->pinctrl);
+	return 0;
+}
+
+static const struct of_device_id helper_of_match[] = {
+	{
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
+module_platform_driver(pinctrl_state_helper_driver);
+
+MODULE_AUTHOR("Drew Fustini <drew@beagleboard.org>");
+MODULE_DESCRIPTION("One-register-per-pin type device tree based pinctrl driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

