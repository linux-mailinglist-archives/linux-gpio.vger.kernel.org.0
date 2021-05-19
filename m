Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73252388F06
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 15:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346776AbhESN1a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 09:27:30 -0400
Received: from www.zeus03.de ([194.117.254.33]:51252 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353662AbhESN13 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 09:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=JR+tQ679U3FGyw
        lKHr5Bve7mAjvpqdFfRtqEb//F8g8=; b=Jz6HPa27ZeZFmDfV+Fo/YYafLW8pQG
        6uozffBJO4jyE8hVcUOVlKFnrfLZl+NQlHWaQums3bMia7S7n/yY+fgil0dAYenA
        0NQGMTYhwPq4VGpmuONksU3Mv6eHMVv6tgvZRuKJ3ZpTPgwR8JvME23bTFQUM2Kb
        ReK7s/Xeh+cGE=
Received: (qmail 3334788 invoked from network); 19 May 2021 15:26:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2021 15:26:07 +0200
X-UD-Smtp-Session: l3s3148p1@XzDoxK7CNswgAwDPXwaBAEltFu20ukzh
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 1/1] misc: add sloppy logic analyzer using polling
Date:   Wed, 19 May 2021 15:25:28 +0200
Message-Id: <20210519132528.4394-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210519132528.4394-1-wsa+renesas@sang-engineering.com>
References: <20210519132528.4394-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a sloppy logic analyzer using GPIOs. It comes with a script to
isolate a CPU for polling. While this is definately not a production
level analyzer, it can be a helpful first view when remote debugging.
Read the documentation for details.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../dev-tools/gpio-sloppy-logic-analyzer.rst  |  72 ++++
 Documentation/dev-tools/index.rst             |   1 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sloppy-logic-analyzer.c     | 317 ++++++++++++++++++
 tools/gpio/gpio-sloppy-logic-analyzer         | 200 +++++++++++
 6 files changed, 608 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 create mode 100644 drivers/gpio/gpio-sloppy-logic-analyzer.c
 create mode 100755 tools/gpio/gpio-sloppy-logic-analyzer

diff --git a/Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst b/Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
new file mode 100644
index 000000000000..da807b341091
--- /dev/null
+++ b/Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
@@ -0,0 +1,72 @@
+=============================================
+Linux Kernel GPIO based sloppy logic analyzer
+=============================================
+
+:Author: Wolfram Sang
+
+Introduction
+============
+
+This document briefly describes how to run the GPIO based in-kernel sloppy
+logic analyzer running on an isolated CPU.
+
+Note that this is a last resort analyzer which can be affected by latencies,
+non-determinant code paths and non-maskable interrupts. It is called 'sloppy'
+for a reason. However, for e.g. remote development, it may be useful to get a
+first view and aid further debugging.
+
+Setup
+=====
+
+Tell the kernel which GPIOs are used as probes. For a DT based system, you need
+to use the following bindings. Because these bindings are only for debugging,
+there is no official yaml file::
+
+    i2c-analyzer {
+            compatible = "gpio-sloppy-logic-analyzer";
+            probe-gpios = <&gpio6 21 GPIO_OPEN_DRAIN>, <&gpio6 4 GPIO_OPEN_DRAIN>;
+            probe-names = "SCL", "SDA";
+    };
+
+Note that you must provide a name for every GPIO specified. Currently a
+maximum of 8 probes are supported. 32 are likely possible but are not
+implemented yet.
+
+Usage
+=====
+
+The logic analyzer is configurable via files in debugfs. However, it is
+strongly recommended to not use them directly, but to use the script
+``tools/gpio/gpio-sloppy-logic-analyzer``. Besides checking parameters more
+extensively, it will isolate the CPU core so you will have least disturbance
+while measuring.
+
+The script has a help option explaining the parameters. For the above DT
+snippet which analyzes an I2C bus at 400KHz on a Renesas Salvator-XS board, the
+following settings are used: The isolated CPU shall be CPU1 because it is a big
+core in a big.LITTLE setup. Because CPU1 is the default, we don't need a
+parameter. The bus speed is 400kHz. So, the sampling theorem says we need to
+sample at least at 800kHz. However, falling edges of both signals in an I2C
+start condition happen faster, so we need a higher sampling frequency, e.g.
+``-s 1500000`` for 1.5MHz. Also, we don't want to sample right away but wait
+for a start condition on an idle bus. So, we need to set a trigger to a falling
+edge on SDA while SCL stays high, i.e. ``-t 1H+2F``. Last is the duration, let
+us assume 15ms here which results in the parameter ``-d 15000``. So,
+altogether::
+
+    gpio-sloppy-logic-analyzer -s 1500000 -t 1H+2F -d 15000
+
+Note that the process will return you back to the prompt but a sub-process is
+still sampling in the background. Unless this has finished, you will not find a
+result file in the current or specified directory. Please also note that
+currently this sub-process is not killable! For the above example, we will then
+need to trigger I2C communication::
+
+    i2cdetect -y -r <your bus number>
+
+Result is a .sr file to be consumed with PulseView or sigrok-cli from the free
+`sigrok`_ project. It is a zip file which also contains the binary sample data
+which may be consumed by other software. The filename is the logic analyzer
+instance name plus a since-epoch timestamp.
+
+.. _sigrok: https://sigrok.org/
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 010a2af1e7d9..cdf1356a9c94 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -32,6 +32,7 @@ Documentation/dev-tools/testing-overview.rst
    kgdb
    kselftest
    kunit/index
+   gpio-sloppy-logic-analyzer
 
 
 .. only::  subproject and html
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1dd0ec6727fd..e8fc8d973055 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1657,4 +1657,21 @@ config GPIO_MOCKUP
 
 endmenu
 
+menu "GPIO hardware hacking tools"
+
+config GPIO_LOGIC_ANALYZER
+	tristate "Sloppy GPIO logic analyzer"
+	depends on (GPIOLIB || COMPILE_TEST) && EXPERT
+	help
+	  This option enables support for a sloppy logic analyzer using polled
+	  GPIOs. Use the 'tools/gpio/gpio-sloppy-logic-analyzer' script with
+	  this driver. The script will make using it easier and will also
+	  isolate a CPU for the polling task. Note that this is a last resort
+	  analyzer which can be affected by latencies, non-determinant code
+	  paths, or NMIs. However, for e.g. remote development, it may be useful
+	  to get a first view and aid further debugging.
+
+	  If this driver is built as a module it will be called
+	  'gpio-sloppy-logic-analyzer'.
+endmenu
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d7c81e1611a4..5d3143c899b4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_GPIO_IT87)			+= gpio-it87.o
 obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
 obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
+obj-$(CONFIG_GPIO_LOGIC_ANALYZER)	+= gpio-sloppy-logic-analyzer.o
 obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
 obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
 obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
new file mode 100644
index 000000000000..dc2c4c499e66
--- /dev/null
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Sloppy logic analyzer using GPIOs (to be run on an isolated CPU)
+ *
+ * Use the 'gpio-sloppy-logic-analyzer' script in the 'tools/gpio' folder for
+ * easier usage and further documentation. Note that this is a last resort
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
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/sizes.h>
+#include <linux/timekeeping.h>
+#include <linux/vmalloc.h>
+
+#define GPIO_LA_NAME "gpio-sloppy-logic-analyzer"
+#define GPIO_LA_DEFAULT_BUF_SIZE SZ_256K
+/* can be increased but then we need to extend the u8 buffers */
+#define GPIO_LA_MAX_PROBES 8
+#define GPIO_LA_NUM_TESTS 1024
+
+#define gpio_la_get_array(d, sptr) gpiod_get_array_value((d)->ndescs, (d)->desc, \
+							 (d)->info, sptr);
+
+struct gpio_la_poll_priv {
+	struct mutex lock;
+	u32 buf_idx;
+	unsigned long ndelay;
+	struct gpio_descs *descs;
+	struct debugfs_blob_wrapper blob;
+	struct dentry *debug_dir, *blob_dent;
+	struct debugfs_blob_wrapper meta;
+	unsigned long gpio_acq_delay;
+	struct device *dev;
+	unsigned int trig_len;
+	u8 *trig_data;
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
+	if (!val)
+		return 0;
+
+	if (!la_buf)
+		return -ENOMEM;
+
+	mutex_lock(&priv->lock);
+	if (priv->blob_dent) {
+		debugfs_remove(priv->blob_dent);
+		priv->blob_dent = NULL;
+	}
+
+	priv->buf_idx = 0;
+
+	local_irq_disable();
+	preempt_disable_notrace();
+
+	for (i = 0; i < priv->trig_len; i+= 2) {
+		do {
+			ret = gpio_la_get_array(priv->descs, &state);
+			if (ret)
+				goto gpio_err;
+
+			ndelay(priv->ndelay);
+		} while ((state & priv->trig_data[i]) != priv->trig_data[i + 1]);
+	}
+
+	/* With triggers, final state is also the first sample */
+	if (priv->trig_len)
+		la_buf[priv->buf_idx++] = state;
+
+	while (priv->buf_idx < priv->blob.size) {
+		ret = gpio_la_get_array(priv->descs, &state);
+		if (ret)
+			goto gpio_err;
+
+		la_buf[priv->buf_idx++] = state;
+		ndelay(priv->ndelay);
+	}
+gpio_err:
+	preempt_enable_notrace();
+	local_irq_enable();
+	if (ret)
+		dev_err(priv->dev, "couldn't read GPIOs: %d\n", ret);
+
+	kfree(priv->trig_data);
+	priv->trig_data = NULL;
+	priv->trig_len = 0;
+
+	priv->blob_dent = debugfs_create_blob("sample_data", 0400, priv->debug_dir, &priv->blob);
+	mutex_unlock(&priv->lock);
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
+		val = 0;
+		ret = -ENOMEM;
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
+
+	/* upper limit is arbitrary */
+	if (count == 0 || count > 2048 || count & 1)
+		return -EINVAL;
+
+	buf = memdup_user(ubuf, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	priv->trig_data = buf;
+	priv->trig_len = count;
+
+	return count;
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
+	unsigned long state;
+	ktime_t start_time, end_time;
+	const char *gpio_names[GPIO_LA_MAX_PROBES];
+	char *meta = NULL;
+	unsigned int meta_len = 0;
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
+	ret = device_property_read_string_array(dev, "probe-names", gpio_names,
+						priv->descs->ndescs);
+	if (ret >= 0 && ret != priv->descs->ndescs)
+		ret = -ENOSTR;
+	if (ret < 0) {
+		dev_err(dev, "error naming the GPIOs: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < priv->descs->ndescs; i++) {
+		unsigned int add_len;
+
+		if (gpiod_cansleep(priv->descs->desc[i]))
+			return -EREMOTE;
+
+		gpiod_set_consumer_name(priv->descs->desc[i], gpio_names[i]);
+
+		/* '10' is length of 'probe00=\n\0' */
+		add_len = strlen(gpio_names[i]) + 10;
+		meta = devm_krealloc(dev, meta, meta_len + add_len, GFP_KERNEL);
+		if (!meta)
+			return -ENOMEM;
+		snprintf(meta + meta_len, add_len, "probe%02d=%s\n", i + 1, gpio_names[i]);
+		/* ' - 1' to skip the NUL terminator */
+		meta_len += add_len - 1;
+	}
+
+	platform_set_drvdata(pdev, priv);
+	priv->dev = dev;
+
+	/* Measure delay of reading GPIOs */
+	local_irq_disable();
+	preempt_disable_notrace();
+	start_time = ktime_get();
+	for (i = 0, ret = 0; i < GPIO_LA_NUM_TESTS && ret == 0; i++)
+		ret = gpio_la_get_array(priv->descs, &state);
+	end_time = ktime_get();
+	preempt_enable_notrace();
+	local_irq_enable();
+	if (ret) {
+		dev_err(dev, "couldn't read GPIOs: %d\n", ret);
+		return ret;
+	}
+
+	priv->gpio_acq_delay = ktime_sub(end_time, start_time) / GPIO_LA_NUM_TESTS;
+
+	priv->meta.data = meta;
+	priv->meta.size = meta_len;
+	priv->debug_dir = debugfs_create_dir(dev_name(dev), gpio_la_poll_debug_dir);
+	debugfs_create_blob("meta_data", 0400, priv->debug_dir, &priv->meta);
+	debugfs_create_ulong("delay_ns_acquisition", 0400, priv->debug_dir, &priv->gpio_acq_delay);
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
+	{ }
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
+MODULE_DESCRIPTION("Sloppy logic analyzer using GPIOs");
+MODULE_LICENSE("GPL v2");
diff --git a/tools/gpio/gpio-sloppy-logic-analyzer b/tools/gpio/gpio-sloppy-logic-analyzer
new file mode 100755
index 000000000000..345cdd67bfd1
--- /dev/null
+++ b/tools/gpio/gpio-sloppy-logic-analyzer
@@ -0,0 +1,200 @@
+#! /bin/sh
+# Helper script for the Linux Kernel GPIO sloppy logic analyzer
+# 
+# Copyright (C) Wolfram Sang <wsa@sang-engineering.com>
+# Copyright (C) Renesas Electronics Corporation
+#
+# TODO: support SI units in command line parameters?
+
+INITCPU=
+SAMPLEFREQ=1000000
+NUMSAMPLES=250000
+LASYSFSDIR=
+CPUSETDIR='/dev/cpuset'
+LACPUSETDIR="$CPUSETDIR/gpio-sloppy-logic-analyzer"
+SYSFSDIR='/sys/kernel/debug/gpio-sloppy-logic-analyzer/'
+OUTPUTDIR="$PWD"
+TRIGGERDAT=
+TRIGGER_BINDAT=
+NEEDEDCMDS='taskset zip'
+MAX_CHANS=8
+
+print_help()
+{
+	cat <<EOF
+$0 - helper script for the Linux Kernel Sloppy GPIO Logic Analyzer
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
+	-t|--trigger <str>: pattern to use as trigger. <str> consists of two-char pairs. First
+			    char is channel number starting at "1". Second char is trigger level:
+			    "L" - low; "H" - high; "R" - rising; "F" - falling
+			    These pairs can be combined with "+", so "1H+2F" triggers when probe 1
+			    is high while probe 2 has a falling edge. You can have multiple triggers
+			    combined with ",". So, "1H+2F,1H+2R" is like the example before but it
+			    waits for a rising edge on probe 2 while probe 1 is still high after the
+			    first trigger has been met.
+			    Trigger data will only be used for the next capture and then be erased.
+Examples:
+Samples $NUMSAMPLES at 1MHz with an already prepared CPU or automatically prepares CPU1 if needed
+	'$0'
+Samples 50us at 2MHz waiting for falling edge on channel 2. CPU usage as above.
+	'$0 -d 50 -s 2000000 -t "2F"'
+
+Note that the process exits after checking all parameters but a sub-process still works in
+the background. The result is only available once the sub-process finishes. As the time of
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
+	local CPU OLDMASK
+
+	CPU="$1"
+	[ ! -d $CPUSETDIR ] && mkdir $CPUSETDIR
+	mount | grep -q $CPUSETDIR || mount -t cpuset cpuset $CPUSETDIR
+	[ ! -d $LACPUSETDIR ] && mkdir $LACPUSETDIR
+
+	echo $CPU > $LACPUSETDIR/cpus
+	echo 1 > $LACPUSETDIR/cpu_exclusive
+	echo 0 > $LACPUSETDIR/mems
+
+	OLDMASK=$(cat /proc/irq/default_smp_affinity)
+	val=$((0x$OLDMASK & ~(1 << $CPU)))
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
+parse_triggerdat()
+{
+	local OLDIFS mask val1 val2 chan mode bit t c
+
+	OLDIFS="$IFS"
+	IFS=','; for t in $1; do
+		mask=0; val1=0; val2=0
+		IFS='+'; for c in $t; do
+			chan=${c%[lhfrLHFR]}
+			mode=${c#$chan}
+			# Check if we could parse something and the channel number fits
+			[ $chan != $c -a $chan -le $MAX_CHANS ] 2> /dev/null || { echo "Syntax error: $c" && exit 1; }
+			bit=$((1 << ($chan - 1)))
+			mask=$(($mask | $bit))
+			case $mode in
+				[hH]) val1=$(($val1 | $bit)); val2=$(($val2 | $bit));;
+				[fF]) val1=$(($val1 | $bit));;
+				[rR]) val2=$(($val2 | $bit));;
+			esac
+		done
+		TRIGGER_BINDAT="$TRIGGER_BINDAT$(printf '\\%o\\%o' $mask $val1)"
+		[ $val1 -ne $val2 ] &&	TRIGGER_BINDAT="$TRIGGER_BINDAT$(printf '\\%o\\%o' $mask $val2)"
+	done
+	IFS="$OLDIFS"
+}
+
+do_capture()
+{
+	local SRTMP ZIPNAME
+
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
+NDELAY=$((1000000000 / $SAMPLEFREQ))
+NDELAY_ACQ=$(cat $LASYSFSDIR/delay_ns_acquisition)
+[ $NDELAY_ACQ -eq 0 ] && echo "Invalid acquisition delay received" && exit 1
+NDELAY_USER=$(($NDELAY - $NDELAY_ACQ))
+MAXFREQ=$((1000000000 / $NDELAY_ACQ))
+
+[ $NDELAY_USER -lt 0 ] && NDELAY_USER=0 && SAMPLEFREQ=$MAXFREQ && echo "Capping sample_freq to $MAXFREQ"
+echo $NDELAY_USER > $LASYSFSDIR/delay_ns_user
+
+[ -n "$DURATION" ] && NUMSAMPLES=$(($SAMPLEFREQ * $DURATION / 1000000))
+echo $NUMSAMPLES > $LASYSFSDIR/buf_size
+
+if [ -n "$TRIGGERDAT" ]; then
+	parse_triggerdat $TRIGGERDAT
+	printf "$TRIGGER_BINDAT" > $LASYSFSDIR/trigger 2>/dev/null
+	[ $? -gt 0 ] && echo "Trigger data '$TRIGGERDAT' rejected" && exit 1
+fi
+
+CPU=$(cat $LACPUSETDIR/effective_cpus)
+[ -z "$CPU" ] && echo "No isolated CPU found" && exit 1
+CPUMASK=$((1 << $CPU))
+do_capture $CPUMASK &
-- 
2.30.2

