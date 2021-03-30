Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30CC34E39E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 10:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhC3I5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 04:57:32 -0400
Received: from www.zeus03.de ([194.117.254.33]:42652 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231608AbhC3I5N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 04:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=KnhUC5L4exbNP6
        uWLCR7MtTaThBKiCT9BGDRRxU3Cac=; b=bVieYpBVnQa+GCAWK4oE5VcYrbhh0s
        HdLfAH/lzgwzXVNP+Z6WX0a5pLjIf7HZgGa1BcNyFw/PZism7WKi2OoqYPifC5rt
        6bF63YmcfDTabuDKDr7MhDx1L8jOLFYQS/hbqFgkTbqhNH7LFI7+Wb/dT0i1C9Fd
        sCM6ItPhFFVNM=
Received: (qmail 144583 invoked from network); 30 Mar 2021 10:57:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2021 10:57:12 +0200
X-UD-Smtp-Session: l3s3148p1@IwIZL72+iNMgARa4RV5TAXqFgB02ZUaY
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC/RFT 1/1] misc: add simple logic analyzer using polling
Date:   Tue, 30 Mar 2021 10:56:55 +0200
Message-Id: <20210330085655.12615-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210330085655.12615-1-wsa+renesas@sang-engineering.com>
References: <20210330085655.12615-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a simple logic analyzer using GPIO polling. It comes with a
script to isolate a CPU for polling. While this is definately not a
production level analyzer, it can be a helpful first view when remote
debugging. Read the documentation for details.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../dev-tools/gpio-logic-analyzer.rst         |  63 ++++
 Documentation/dev-tools/index.rst             |   1 +
 .../bindings/misc/gpio-logic-analyzer.yaml    |  40 ++
 drivers/misc/Kconfig                          |  12 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/gpio-logic-analyzer.c            | 355 ++++++++++++++++++
 tools/debugging/gpio-logic-analyzer           | 156 ++++++++
 7 files changed, 628 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-logic-analyzer.rst
 create mode 100644 Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
 create mode 100644 drivers/misc/gpio-logic-analyzer.c
 create mode 100755 tools/debugging/gpio-logic-analyzer

diff --git a/Documentation/dev-tools/gpio-logic-analyzer.rst b/Documentation/dev-tools/gpio-logic-analyzer.rst
new file mode 100644
index 000000000000..2847260736d4
--- /dev/null
+++ b/Documentation/dev-tools/gpio-logic-analyzer.rst
@@ -0,0 +1,63 @@
+Linux Kernel GPIO based logic analyzer
+======================================
+
+:Author: Wolfram Sang
+
+Introduction
+------------
+
+This document briefly describes how to run the software based in-kernel logic
+analyzer.
+
+Note that this is still a last resort analyzer which can be affected by
+latencies and non-determinant code paths. However, for e.g. remote development,
+it may be useful to get a first view and aid further debugging.
+
+Setup
+-----
+
+Tell the kernel which GPIOs are used as probes. For a DT based system:
+
+    i2c-analyzer {
+            compatible = "gpio-logic-analyzer";
+            probe-gpios = <&gpio6 21 GPIO_OPEN_DRAIN>, <&gpio6 4 GPIO_OPEN_DRAIN>;
+            probe-names = "SCL", "SDA";
+    };
+
+The binding documentation is in the ``misc`` folder of the Kernel binding
+documentation.
+
+Usage
+-----
+
+The logic analyzer is configurable via files in debugfs. However, it is
+strongly recommended to not use them directly, but to to use the
+``gpio-logic-analyzer`` script in the ``tools/debugging`` directory. Besides
+checking parameters more extensively, it will isolate a CPU core for you, so
+you will have least disturbance while measuring.
+
+The script has a help option explaining the parameters. For the above DT
+snipplet which analyzes an I2C bus at 400KHz on a Renesas Salvator-XS board,
+the following settings are used: The isolated CPU shall be CPU1 because it is a
+big core in a big.LITTLE setup. Because CPU1 is the default, we don't need a
+parameter. The bus speed is 400kHz. So, the sampling theorem says we need to
+sample at least at 800kHz. However, falling of both, SDA and SCL, in a start
+condition is faster, so we need a higher sampling frequency, e.g. ``-s
+1500000`` for 1.5MHz. Also, we don't want to sample right away but wait for a
+start condition on an idle bus. So, we need to set a trigger to a falling edge
+on SDA, i.e. ``-t "2F"``. Last is the duration, let us assume 15ms here which
+results in the parameter ``-d 15000``. So, altogether:
+
+    gpio-logic-analyzer -s 1500000 -t "2F" -d 15000
+
+Note that the process will return you back to the prompt but a sub-process is
+still sampling in the background. Unless this finished, you will not find a
+result file in the current or specified directory. Please also note that
+currently this sub-process is not killable! For the above example, we will then
+need to trigger I2C communication:
+
+    i2cdetect -y -r <your bus number>
+
+Result is a .sr file to be consumed with PulseView from the free Sigrok project. It is
+a zip file which also contains the binary sample data which may be consumed by others.
+The filename is the logic analyzer instance name plus a since-epoch timestamp.
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 1b1cf4f5c9d9..9e0168bd3698 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -27,6 +27,7 @@ whole; patches welcome!
    kgdb
    kselftest
    kunit/index
+   gpio-logic-analyzer
 
 
 .. only::  subproject and html
diff --git a/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml b/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
new file mode 100644
index 000000000000..e664cec85a72
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/gpio-logic-analyzer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for a GPIO based logic analyzer
+
+maintainers:
+  - Wolfram Sang <wsa@sang-engineering.com>
+
+properties:
+  compatible:
+    items:
+      - const: gpio-logic-analyzer
+
+  probe-gpios:
+    description:
+      gpios used as probes for the logic analyzer
+
+  probe-names:
+    description:
+      names used to distinguish the probes
+
+  required:
+    - compatible
+    - probe-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c-analyzer {
+            compatible = "gpio-logic-analyzer";
+
+            probe-gpios = <&gpio6 21 GPIO_OPEN_DRAIN>, <&gpio6 4 GPIO_OPEN_DRAIN>;
+            probe-names = "SCL", "SDA";
+    };
+
+...
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index f532c59bb59b..6b1c1c951d74 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -445,6 +445,18 @@ config HISI_HIKEY_USB
 	  switching between the dual-role USB-C port and the USB-A host ports
 	  using only one USB controller.
 
+config GPIO_LOGIC_ANALYZER
+	tristate "Simple GPIO logic analyzer"
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  This option enables support for a simple logic analyzer using polled
+	  GPIOs. Use the 'tools/debugging/gpio-logic-analyzer' script with this
+	  driver. The script will make using it easier and can also isolate a
+	  CPU for the polling task. Note that this is still a last resort
+	  analyzer which can be affected by latencies and non-determinant code
+	  paths. However, for e.g. remote development, it may be useful to get
+	  a first view and aid further debugging.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 99b6f15a3c70..cff9c0a2a2fb 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -56,3 +56,4 @@ obj-$(CONFIG_HABANA_AI)		+= habanalabs/
 obj-$(CONFIG_UACCE)		+= uacce/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
+obj-$(CONFIG_GPIO_LOGIC_ANALYZER)	+= gpio-logic-analyzer.o
diff --git a/drivers/misc/gpio-logic-analyzer.c b/drivers/misc/gpio-logic-analyzer.c
new file mode 100644
index 000000000000..3c8d5e1f8489
--- /dev/null
+++ b/drivers/misc/gpio-logic-analyzer.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Simple logic analyzer using GPIOs (to be run on an isolated CPU)
+ *
+ * Use the 'gpio-logic-analyzer' script in the 'tools/debugging' folder for
+ * easier usage and further documentation. Note that this is still a last resort
+ * analyzer which can be affected by latencies and non-determinant code paths.
+ * However, for e.g. remote development, it may be useful to get a first view
+ * and aid further debugging.
+ *
+ * Copyright (C) Wolfram Sang <wsa@sang-engineering.com>
+ * Copyright (C) Renesas Electronics Corporation
+ */
+
+#include <linux/ctype.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sizes.h>
+#include <linux/timekeeping.h>
+#include <linux/vmalloc.h>
+
+#define GPIO_LA_NAME "gpio-logic-analyzer"
+#define GPIO_LA_DEFAULT_BUF_SIZE SZ_256K
+/* can be increased if needed */
+#define GPIO_LA_MAX_PROBES 8
+#define GPIO_LA_PROBES_MASK 7
+
+struct gpio_la_poll_priv {
+	unsigned long ndelay;
+	u32 buf_idx;
+	struct mutex lock;
+	struct debugfs_blob_wrapper blob;
+	struct gpio_descs *descs;
+	struct dentry *debug_dir, *blob_dent;
+	struct debugfs_blob_wrapper meta;
+	unsigned long gpio_delay;
+	unsigned int trigger_len;
+	u8 trigger_data[PAGE_SIZE];
+};
+
+static struct dentry *gpio_la_poll_debug_dir;
+
+static int fops_capture_set(void *data, u64 val)
+{
+	struct gpio_la_poll_priv *priv = data;
+	u8 *la_buf = priv->blob.data;
+	unsigned long state = 0;
+	int i, ret;
+
+	if (!la_buf)
+		return -ENOMEM;
+
+	if (val) {
+		mutex_lock(&priv->lock);
+		if (priv->blob_dent) {
+			debugfs_remove(priv->blob_dent);
+			priv->blob_dent = NULL;
+		}
+
+		priv->buf_idx = 0;
+
+		local_irq_disable();
+		preempt_disable_notrace();
+
+		for (i = 0; i < priv->trigger_len; i++) {
+			u8 data = priv->trigger_data[i];
+
+			do {
+				ret = gpiod_get_array_value(priv->descs->ndescs, priv->descs->desc,
+							    priv->descs->info, &state);
+
+				if (ret)
+					goto gpio_err;
+			} while (!!(state & BIT(data & GPIO_LA_PROBES_MASK)) != !!(data & 0x80));
+		}
+
+		if (priv->trigger_len) {
+			la_buf[priv->buf_idx++] = state;
+			ndelay(priv->ndelay);
+		}
+
+		while (priv->buf_idx < priv->blob.size && ret == 0) {
+			ret = gpiod_get_array_value(priv->descs->ndescs, priv->descs->desc,
+					      priv->descs->info, &state);
+			la_buf[priv->buf_idx++] = state;
+			ndelay(priv->ndelay);
+		}
+gpio_err:
+		preempt_enable_notrace();
+		local_irq_enable();
+		if (ret)
+			pr_err("%s: couldn't read GPIOs: %d\n", __func__, ret);
+
+		priv->blob_dent = debugfs_create_blob("sample_data", 0400, priv->debug_dir, &priv->blob);
+		mutex_unlock(&priv->lock);
+	}
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_capture, NULL, fops_capture_set, "%llu\n");
+
+static int fops_buf_size_get(void *data, u64 *val)
+{
+	struct gpio_la_poll_priv *priv = data;
+
+	*val = priv->blob.size;
+
+	return 0;
+}
+
+static int fops_buf_size_set(void *data, u64 val)
+{
+	struct gpio_la_poll_priv *priv = data;
+	int ret = 0;
+	void *p;
+
+	if (!val)
+		return -EINVAL;
+
+	mutex_lock(&priv->lock);
+
+	vfree(priv->blob.data);
+	p = vzalloc(val);
+	if (!p) {
+		/* Try the old value again */
+		val = priv->blob.size;
+		p = vzalloc(val);
+		if (!p) {
+			val = 0;
+			ret = -ENOMEM;
+		}
+	}
+
+	priv->blob.data = p;
+	priv->blob.size = val;
+
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_buf_size, fops_buf_size_get, fops_buf_size_set, "%llu\n");
+
+static int trigger_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, NULL, inode->i_private);
+}
+
+static ssize_t trigger_write(struct file *file, const char __user *ubuf,
+			     size_t count, loff_t *offset)
+{
+	struct seq_file *m = file->private_data;
+	struct gpio_la_poll_priv *priv = m->private;
+	char *buf;
+	int i, trigger_len = 0;
+
+	priv->trigger_len = 0;
+
+	if (count & 1)
+	    return -EINVAL;
+
+	buf = memdup_user(ubuf, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	for (i = 0; i < count; i += 2) {
+		u8 val;
+
+		if (buf[i] < '1' || buf[i] > '0' + GPIO_LA_MAX_PROBES)
+			goto bail_out;
+
+		val = buf[i] - '1';
+
+		switch (toupper(buf[i + 1])) {
+		case 'L':
+			priv->trigger_data[trigger_len] = val;
+			trigger_len++;
+			break;
+		case 'H':
+			priv->trigger_data[trigger_len] = val | 0x80;
+			trigger_len++;
+			break;
+		case 'R':
+			priv->trigger_data[trigger_len] = val;
+			priv->trigger_data[trigger_len + 1] = val | 0x80;
+			trigger_len += 2;
+			break;
+		case 'F':
+			priv->trigger_data[trigger_len] = val | 0x80;
+			priv->trigger_data[trigger_len + 1] = val;
+			trigger_len += 2;
+			break;
+		default:
+			goto bail_out;
+		}
+
+		if (trigger_len > PAGE_SIZE)	/* should never happen */
+			goto bail_out;
+
+	}
+
+	priv->trigger_len = trigger_len;
+
+bail_out:
+	kfree(buf);
+	return priv->trigger_len ? count : -EINVAL;
+}
+
+static const struct file_operations fops_trigger = {
+	.owner = THIS_MODULE,
+	.open = trigger_open,
+	.write = trigger_write,
+	.llseek = no_llseek,
+	.release = single_release,
+};
+
+static int gpio_la_poll_probe(struct platform_device *pdev)
+{
+	struct gpio_la_poll_priv *priv;
+	struct device *dev = &pdev->dev;
+	char *meta = NULL;
+	unsigned long state;
+	ktime_t start_time, end_time;
+	int ret, i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->lock);
+
+	fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
+
+	priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);
+	if (IS_ERR(priv->descs))
+		return PTR_ERR(priv->descs);
+
+	/* artificial limit to keep 1 byte per sample for now */
+	if (priv->descs->ndescs > GPIO_LA_MAX_PROBES)
+		return -ERANGE;
+
+	for (i = 0; i < priv->descs->ndescs; i++) {
+		const char *str, *old_meta;
+		char *def_name = "ProbeX\0";
+
+		if (gpiod_cansleep(priv->descs->desc[i]))
+			return -EREMOTE;
+
+		ret = of_property_read_string_index(pdev->dev.of_node, "probe-names",
+						    i, &str);
+
+		/* Hacky way of providing a fallback name if none provided */
+		if (ret) {
+			def_name[5] = i + '1'; /* assumes GPIO_LA_MAX_PROBES = 8 */
+			str = def_name;
+		}
+
+		gpiod_set_consumer_name(priv->descs->desc[i], str);
+
+		old_meta = meta;
+		meta = devm_kasprintf(dev, GFP_KERNEL, "%sprobe%d=%s\n",
+				      old_meta ?: "", i + 1, str);
+		if (!meta)
+			return -ENOMEM;
+
+		devm_kfree(dev, old_meta);
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	/* Measure delay of reading GPIOs */
+	local_irq_disable();
+	preempt_disable_notrace();
+	start_time = ktime_get();
+	for (i = 0, ret = 0; i < 1024 && ret == 0; i++)
+		ret = gpiod_get_array_value(priv->descs->ndescs, priv->descs->desc,
+				      priv->descs->info, &state);
+	end_time = ktime_get();
+	preempt_enable_notrace();
+	local_irq_enable();
+	if (ret) {
+		dev_err(dev, "couldn't read GPIOs: %d\n", ret);
+		return ret;
+	}
+
+	priv->gpio_delay = ktime_sub(end_time, start_time) / 1024;
+
+	priv->debug_dir = debugfs_create_dir(dev_name(dev), gpio_la_poll_debug_dir);
+	if (IS_ERR(priv->debug_dir))
+		return PTR_ERR(priv->debug_dir);
+
+	priv->meta.data = meta;
+	priv->meta.size = strlen(meta);
+	debugfs_create_blob("meta_data", 0400, priv->debug_dir, &priv->meta);
+	debugfs_create_ulong("delay_ns_acquisition", 0400, priv->debug_dir, &priv->gpio_delay);
+	debugfs_create_ulong("delay_ns_user", 0600, priv->debug_dir, &priv->ndelay);
+	debugfs_create_file_unsafe("buf_size", 0600, priv->debug_dir, priv, &fops_buf_size);
+	debugfs_create_file_unsafe("capture", 0200, priv->debug_dir, priv, &fops_capture);
+	debugfs_create_file_unsafe("trigger", 0200, priv->debug_dir, priv, &fops_trigger);
+
+	return 0;
+}
+
+static int gpio_la_poll_remove(struct platform_device *pdev)
+{
+	struct gpio_la_poll_priv *priv = platform_get_drvdata(pdev);
+
+	mutex_lock(&priv->lock);
+	debugfs_remove_recursive(priv->debug_dir);
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
+static const struct of_device_id gpio_la_poll_of_match[] = {
+	{ .compatible = GPIO_LA_NAME, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, gpio_la_poll_of_match);
+
+static struct platform_driver gpio_la_poll_device_driver = {
+	.probe = gpio_la_poll_probe,
+	.remove = gpio_la_poll_remove,
+	.driver = {
+		.name = GPIO_LA_NAME,
+		.of_match_table = gpio_la_poll_of_match,
+	}
+};
+
+static int __init gpio_la_poll_init(void)
+{
+	gpio_la_poll_debug_dir = debugfs_create_dir(GPIO_LA_NAME, NULL);
+	if (IS_ERR(gpio_la_poll_debug_dir))
+		return PTR_ERR(gpio_la_poll_debug_dir);
+
+	return platform_driver_register(&gpio_la_poll_device_driver);
+}
+late_initcall(gpio_la_poll_init);
+
+static void __exit gpio_la_poll_exit(void)
+{
+	platform_driver_unregister(&gpio_la_poll_device_driver);
+	debugfs_remove_recursive(gpio_la_poll_debug_dir);
+}
+module_exit(gpio_la_poll_exit);
+
+MODULE_AUTHOR("Wolfram Sang <wsa@sang-engineering.com>");
+MODULE_DESCRIPTION("Simple logic analyzer using GPIOs");
+MODULE_LICENSE("GPL v2");
diff --git a/tools/debugging/gpio-logic-analyzer b/tools/debugging/gpio-logic-analyzer
new file mode 100755
index 000000000000..4506f67c18bc
--- /dev/null
+++ b/tools/debugging/gpio-logic-analyzer
@@ -0,0 +1,156 @@
+#! /bin/sh
+
+INITCPU=
+SAMPLEFREQ=1000000
+NUMSAMPLES=250000
+LASYSFSDIR=
+CPUSETDIR='/dev/cpuset'
+LACPUSETDIR="$CPUSETDIR/gpio-logic-analyzer"
+SYSFSDIR='/sys/kernel/debug/gpio-logic-analyzer/'
+OUTPUTDIR="$PWD"
+TRIGGERDAT=
+NEEDEDCMDS='taskset zip'
+
+print_help()
+{
+	cat <<EOF
+$0 - helper script for the Linux Kernel Simple GPIO Logic Analyzer
+Available options:
+	-d|--duration-us <n>: number of microseconds to sample. Overrides -n, no default value.
+	-h|--help: print this help
+	-i|--init <n>: which CPU to isolate for sampling. Only needed once. Default <1>.
+		       Remember that a more powerful CPU gives you higher sample speeds.
+		       Also CPU0 is not recommended as it usually does extra bookkeeping.
+	-n|--num_samples <n>: number of samples to acquire. Default <$NUMSAMPLES>
+	-o|--output-dir <str>: directory to put the result files. Default: current dir
+	-p|--path <str>: path to Logic Analyzer dir in case you have multiple instances.
+			 Default to first instance found.
+	-s|--sample_freq <n>: desired sample frequency. Might be capped if too large. Default: 1MHz.
+	-t|--trigger <str>: pattern to use as trigger. <str> consists of n two-char pairs. First
+			    char is channel number starting at "1". Second char is trigger level:
+			    "L" - low; "H" - high; "R" - rising; "F" - falling
+Examples:
+Samples $NUMSAMPLES at 1MHz with already prepared CPU or automatically prepare CPU1 if needed
+	'$0'
+Samples 50us at 2MHz waiting for falling edge on channel 2. CPU usage as above.
+	'$0 -d 50 -s 2000000 -t "2F"'
+
+Note that the process exits after checking all parameters but a sub-process still works in
+the background. The result is only available once the sub-process finished. As the time of
+writing, the sub-process is not killable, so be extra careful that your triggers work.
+
+Result is a .sr file to be consumed with PulseView from the free Sigrok project. It is
+a zip file which also contains the binary sample data which may be consumed by others.
+The filename is the logic analyzer instance name plus a since-epoch timestamp.
+EOF
+}
+
+set_newmask()
+{
+	local f
+	for f in $(find $1 -iname "$2"); do echo $NEWMASK > $f 2>/dev/null; done
+}
+
+init_cpu()
+{
+	CPU="$1"
+
+	[ ! -d $CPUSETDIR ] && mkdir $CPUSETDIR
+	mount | grep -q $CPUSETDIR || mount -t cpuset cpuset $CPUSETDIR
+	[ ! -d $LACPUSETDIR ] && mkdir $LACPUSETDIR
+
+	echo $CPU > $LACPUSETDIR/cpus
+	echo 1 > $LACPUSETDIR/cpu_exclusive
+	echo 0 > $LACPUSETDIR/mems
+
+	OLDMASK=$(cat /proc/irq/default_smp_affinity)
+	let val="0x$OLDMASK & ~(1 << $CPU)"
+	NEWMASK=$(printf "%x" $val)
+
+	set_newmask '/proc/irq' '*smp_affinity'
+	set_newmask '/sys/devices/virtual/workqueue/' 'cpumask'
+
+	# Move tasks away from isolated CPU
+	for p in $(ps -o pid | tail -n +2); do
+		MASK=$(taskset -p $p)
+		[ "${MASK##*: }" != "$OLDMASK" ] && continue
+		taskset -p $NEWMASK $p
+	done 2>/dev/null >/dev/null
+
+	echo 1 > /sys/module/rcupdate/parameters/rcu_cpu_stall_suppress
+}
+
+do_capture()
+{
+	taskset $1 echo 1 > $LASYSFSDIR/capture
+
+	SRTMP=$(mktemp -d)
+	echo 1 > $SRTMP/version
+	cp $LASYSFSDIR/sample_data $SRTMP/logic-1-1
+	cat > $SRTMP/metadata <<EOF
+[global]
+sigrok version=0.2.0
+
+[device 1]
+capturefile=logic-1
+total probes=$(cat $LASYSFSDIR/meta_data | wc -l)
+samplerate=${SAMPLEFREQ}Hz
+unitsize=1
+EOF
+	cat $LASYSFSDIR/meta_data >> $SRTMP/metadata
+
+	ZIPNAME="$OUTPUTDIR/${LASYSFSDIR##*/}-$(date +%s).sr"
+	zip -jq $ZIPNAME $SRTMP/*
+	rm -rf $SRTMP
+}
+
+REP=$(getopt -a -l path:,init:,sample_freq:,num_samples:,duration-us:,trigger:,output-dir:,help -o i:s:n:d:t:o:h -- "$@") || exit 1
+eval set -- "$REP"
+while true; do
+	case "$1" in
+	-d|--duration-us) DURATION="$2"; shift 2;;
+	-h|--help) print_help; exit 0;;
+	-i|--init) INITCPU="$2"; shift 2;;
+	-n|--num_samples) NUMSAMPLES="$2"; shift 2;;
+	-o|--output-dir) OUTPUTDIR="$2"; shift 2;;
+	-p|--path) LASYSFSDIR="$2"; shift 2;;
+	-s|--sample_freq) SAMPLEFREQ="$2"; shift 2;;
+	-t|--trigger) TRIGGERDAT="$2"; shift 2;;
+	--)	shift; break;;
+	*)	echo "error parsing commandline: $@"; exit 1;;
+	esac
+done
+
+for f in $NEEDEDCMDS; do
+	command -v $f >/dev/null || { echo "Command '$f' not found"; exit 1; }
+done
+
+[ $SAMPLEFREQ -eq 0 ] && echo "Invalid sample frequency" && exit 1
+
+[ -z "$LASYSFSDIR" ] && LASYSFSDIR="$SYSFSDIR/$(ls -1 $SYSFSDIR | head -n1)"
+[ ! -d "$LASYSFSDIR" ] && echo "LA directory '$LASYSFSDIR' not found!" && exit 1
+
+[ -n "$INITCPU" ] && init_cpu $INITCPU
+[ ! -d "$LACPUSETDIR" ] && echo "Auto-Isolating CPU1" && init_cpu 1
+
+let NDELAY=1000000000/$SAMPLEFREQ
+NDELAY_ACQ=$(cat $LASYSFSDIR/delay_ns_acquisition)
+[ $NDELAY_ACQ -eq 0 ] && echo "Invalid acquisition delay received" && exit 1
+let NDELAY_USER=$NDELAY-$NDELAY_ACQ
+let MAXFREQ=1000000000/$NDELAY_ACQ
+
+[ $NDELAY_USER -lt 0 ] && NDELAY_USER=0 && SAMPLEFREQ=$MAXFREQ && echo "Capping sample_freq to $MAXFREQ"
+echo $NDELAY_USER > $LASYSFSDIR/delay_ns_user
+
+[ -n "$DURATION" ] && let NUMSAMPLES=$SAMPLEFREQ*$DURATION/1000000
+echo $NUMSAMPLES > $LASYSFSDIR/buf_size
+
+if [ -n "$TRIGGERDAT" ]; then
+	echo -n "$TRIGGERDAT" > $LASYSFSDIR/trigger 2>/dev/null
+	[ $? -gt 0 ] && echo "Trigger data '$TRIGGERDAT' rejected" && exit 1
+fi
+
+CPU=$(cat $LACPUSETDIR/effective_cpus)
+[ -z "$CPU" ] && echo "No isolated CPU found" && exit 1
+let CPUMASK="1 << $CPU"
+do_capture $CPUMASK &
-- 
2.30.0

