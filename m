Return-Path: <linux-gpio+bounces-31481-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ4tK8OKhWlVDQQAu9opvQ
	(envelope-from <linux-gpio+bounces-31481-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 07:31:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D56CFAB16
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 07:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC303302DE0B
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 06:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513103043DB;
	Fri,  6 Feb 2026 06:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="fIdGW0CJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6777A2E5B32;
	Fri,  6 Feb 2026 06:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770359485; cv=none; b=Vud60uGUUwvejXj0e6Kab+Xy6hQ8EIr0NCWu4uNnul3CZzCUeALMD4eTJ+F4tj5higM9PSaAYq9IIZRWc/5DZClc86HwF7lNQfQq0arJlP5WN4MEPNhaGW60IvtDIJIGLh23nT8ApIGTfEWA3ucMzg6JXtmNoBt85IT4CCHmW5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770359485; c=relaxed/simple;
	bh=KR0/U7pYryZx/tTjFKi1PICDgNBwCUVqFTiv1cbZJIo=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=i/2S7B66EtXGwxezaBasNFFLDNONNFuyIgRWSyQiClpq6wzh+cPrMc9vqW0Mo+ikQFMtQWDJtJYXA1P8G3x2n60pcvYXzMWyisFHqX21AJ9zam5zH6yTmK/wCwtwxmxISkJhotfs36ZL8v4X2H5KKLKelNX3ckiVfJFA647DaIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=fIdGW0CJ; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1770359475; bh=pI6MlQ5n4V3Y2NJrBXfRhKrqqo3RWSmAaQ8RFR/BTRk=;
	h=From:To:Cc:Subject:Date;
	b=fIdGW0CJp8GG5xScIN+jAnLFvv2p7m0FtkQhkkrZbQRAbY//fNcKYdKAq9t8bENUe
	 q3rFE2ihJl1UngNiW6bR0CbGoCQo1rEuRp5d4UX+AsFK7ugpMCtfBAHhBC2ToB6JhK
	 g2LUTF5wZDCbMtrl4h4VsI1HMqGnloaY54gH+sFo=
Received: from bright.ght.com ([58.34.102.26])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 7CCA760D; Fri, 06 Feb 2026 14:31:12 +0800
X-QQ-mid: xmsmtpt1770359472ta1fwckyk
Message-ID: <tencent_ACA99123220028D078B20189509FD204BC0A@qq.com>
X-QQ-XMAILINFO: MhskRmK9qQAOqTl5HSMKn+9A3gRVQmmNzDdBaHg3ny0+NpbUZJ52sjSMsSIB0Z
	 OtdgM7hwmn36625xbXvQpiUFIecvMmzY0kRn4aIHyU+WQhUrGM3ZANkt2YjRNB24xHPn3oMGZDt0
	 uG2ycsB0UkTNJLTmTUYwYVBFa/mlRPQF8Hd4fegvehPfcScRdoKwUsEMjnq4jHDrgHTNIk2mBw2H
	 gfr/YACYKdBHf9YYJHXfW/VaqtzrkN/EaPGP0tkjUfVjp5AsJFXhK9W+t13rrYHemQJVZnlTH+JZ
	 DDD26vAXusnDtpYKhY1dSPB08QA5DQVJW7Ospzy2uEKdLmXHEkQh1GZF+nIw6O08tZoimm6/9IpX
	 lq/KvuqRR2qZy6mheJ8k/zY92HtlCEABNcVdhxkYT/LGCY+IQldXrgaMch26g4HtxPV1/MJ31te4
	 sI6/VUtb+ZTGL3zHksGcgA9NxSnSpxS5nI2QtkhxXQnG64ZW9qbRFG/Y4nZohw1DvkHaEZwXriQV
	 fzs30K+iYSPrOFP3Fu9eK1epIUz4vG4VkXiihqfhVLY8wi+ULddPLrV2wcn6HVDq4n5hbNZBkrSx
	 dLIwPcjts2ycEBz55Din1aO25FDvxgJrHSdl3hcDcaGi1jzquJzD4vKsxl241Ee/Y/v0mfUoaXL6
	 dik6pZw1+k0wlBXUphIiph2tVJ4ilxAVtVzjS5hlaB/+DI/FaLK77riqO1udFJabkr9IVVeQuQbK
	 JfbX3waAI0Xi7F3ljEUtiCZYOtz5Vq8+qcC5tesb7ah1LcBLdwfkR/ADozMdpi6Bi+e/J8Wq1iur
	 wAybm/d/Py9uNfx1MFWKa5NW3WEnZhyuBYB0K6nBT9Pv8U9brkv+ZqMH0wpKhZi/OXCAnXGgwwIS
	 tpC4TuzodCePyL5EPUxF6o+opHQWJIhudAKQapCKgWqtmGAhsIc5bW7yhwDuYPpIY9PNlMLk4vx+
	 EVH+AEStUzHOyCsnoLR0REkscIUhzklBLjTxtG6KU14TR9W01C9Iy9ZbnOByOnDdy/1ZkiemI5wO
	 v6MywMQw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: 434779359@qq.com
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	xuchen <434779359@qq.com>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	xuchen <bright.xu@faiot.com>
Subject: [PATCH] =?UTF-8?q?nfc:=20supply:=20Add=20PN7160=20drivers=20?= =?UTF-8?q?=C2=A0=20This=20patch=20adds=20support=20for=20the=20PN7160=20I?= =?UTF-8?q?Cs=20used=20in=20Qualcomm=20reference=20designs.?=
Date: Fri,  6 Feb 2026 01:31:10 -0500
X-OQ-MSGID: <20260206063110.3689143-1-434779359@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31481-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[434779359@qq.com,linux-gpio@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[qq.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[faiot.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D56CFAB16
X-Rspamd-Action: no action

From: xuchen <bright.xu@faiot.com>

Signed-off-by: xuchen <434779359@qq.com>
---
 drivers/nfc/pn7160/Kconfig    |  40 +++
 drivers/nfc/pn7160/Makefile   |   6 +
 drivers/nfc/pn7160/common.c   | 371 ++++++++++++++++++++++++
 drivers/nfc/pn7160/common.h   |  36 +++
 drivers/nfc/pn7160/i2c_drv.c  | 531 ++++++++++++++++++++++++++++++++++
 drivers/nfc/pn7160/i2c_drv.h  |  26 ++
 drivers/nfc/pn7160/platform.h | 164 +++++++++++
 7 files changed, 1174 insertions(+)
 create mode 100644 drivers/nfc/pn7160/Kconfig
 create mode 100644 drivers/nfc/pn7160/Makefile
 create mode 100644 drivers/nfc/pn7160/common.c
 create mode 100644 drivers/nfc/pn7160/common.h
 create mode 100644 drivers/nfc/pn7160/i2c_drv.c
 create mode 100644 drivers/nfc/pn7160/i2c_drv.h
 create mode 100644 drivers/nfc/pn7160/platform.h

diff --git a/drivers/nfc/pn7160/Kconfig b/drivers/nfc/pn7160/Kconfig
new file mode 100644
index 000000000000..fb497bc33059
--- /dev/null
+++ b/drivers/nfc/pn7160/Kconfig
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# near field communication configuration
+#
+
+config NXP_NFC_I2C
+	tristate "NFC I2C Slave driver for NXP-NFCC"
+	depends on I2C
+	help
+	  This enables the NFC driver for PN71xx based devices.
+	  This is for I2C connected version. NCI protocol logic
+	  resides in the usermode and it has no other NFC dependencies.
+
+	  If unsure, say N.
+
+config NXP_NFC_SPI
+	tristate "NFC SPI Slave driver for NXP-NFCC"
+	depends on SPI
+	help
+	  This enables the NFC driver for PN71xx based devices.
+	  This is for SPI connected version. NCI protocol logic
+	  resides in the usermode and it has no other NFC dependencies.
+
+	  If unsure, say N.
+
+config NXP_NFC_RECOVERY
+	bool "NXP based NFC minimal FW update support"
+	depends on NXP_NFC_I2C && I2C
+	default y
+	help
+	  This enables NFC minimal FW update.
+	  This feature allows updating the firmware of NXP NFC controllers
+	  in recovery mode. It is required for field updates and bug fixes.
+	  The driver will handle the download mode and firmware transfer
+	  when this option is enabled.
+
+	  If unsure, say N.
+
+source "drivers/nfc/pn7160/Kconfig"
+endif
diff --git a/drivers/nfc/pn7160/Makefile b/drivers/nfc/pn7160/Makefile
new file mode 100644
index 000000000000..8c6f670eaa7a
--- /dev/null
+++ b/drivers/nfc/pn7160/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Makefile for nfc devices
+#
+obj-m			+= nxpnfc_i2c.o
+nxpnfc_i2c-objs		:= common.o i2c_drv.o
diff --git a/drivers/nfc/pn7160/common.c b/drivers/nfc/pn7160/common.c
new file mode 100644
index 000000000000..cd433912764b
--- /dev/null
+++ b/drivers/nfc/pn7160/common.c
@@ -0,0 +1,371 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2019-2021 NXP
+ */
+
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/fs.h>
+
+#include "common.h"
+
+int nfc_parse_dt(struct device *dev, struct platform_configs *nfc_configs,
+		 uint8_t interface)
+{
+	struct device_node *np = dev->of_node;
+	struct platform_gpio *nfc_gpio = &nfc_configs->gpio;
+
+	if (!np) {
+		pr_err("%s: nfc of_node NULL\n", __func__);
+		return -EINVAL;
+	}
+
+	nfc_gpio->irq = -EINVAL;
+	nfc_gpio->dwl_req = -EINVAL;
+	nfc_gpio->ven = -EINVAL;
+
+	/* irq required for i2c based chips only */
+	if (interface == PLATFORM_IF_I2C || interface == PLATFORM_IF_SPI) {
+		nfc_gpio->irq = of_get_named_gpio(np, DTS_IRQ_GPIO_STR, 0);
+		if ((!gpio_is_valid(nfc_gpio->irq))) {
+			pr_err("%s: irq gpio invalid %d\n", __func__,
+			       nfc_gpio->irq);
+			return -EINVAL;
+		}
+		pr_info("%s: irq %d\n", __func__, nfc_gpio->irq);
+	}
+	nfc_gpio->ven = of_get_named_gpio(np, DTS_VEN_GPIO_STR, 0);
+	if ((!gpio_is_valid(nfc_gpio->ven))) {
+		pr_err("%s: ven gpio invalid %d\n", __func__, nfc_gpio->ven);
+		return -EINVAL;
+	}
+	/* some products like sn220 does not required fw dwl pin */
+	nfc_gpio->dwl_req = of_get_named_gpio(np, DTS_FWDN_GPIO_STR, 0);
+	if ((!gpio_is_valid(nfc_gpio->dwl_req)))
+		pr_warn("%s: dwl_req gpio invalid %d\n", __func__,
+			nfc_gpio->dwl_req);
+
+	pr_info("%s: %d, %d, %d\n", __func__, nfc_gpio->irq, nfc_gpio->ven,
+		nfc_gpio->dwl_req);
+	return 0;
+}
+EXPORT_SYMBOL(nfc_parse_dt);
+
+void set_valid_gpio(int gpio, int value)
+{
+	if (gpio_is_valid(gpio)) {
+		pr_debug("%s: gpio %d value %d\n", __func__, gpio, value);
+		gpio_set_value(gpio, value);
+		/* hardware dependent delay */
+		usleep_range(NFC_GPIO_SET_WAIT_TIME_US,
+			     NFC_GPIO_SET_WAIT_TIME_US + 100);
+	}
+}
+EXPORT_SYMBOL(set_valid_gpio);
+
+int get_valid_gpio(int gpio)
+{
+	int value = -EINVAL;
+
+	if (gpio_is_valid(gpio)) {
+		value = gpio_get_value(gpio);
+		pr_debug("%s: gpio %d value %d\n", __func__, gpio, value);
+	}
+	return value;
+}
+EXPORT_SYMBOL(get_valid_gpio);
+
+void gpio_set_ven(struct nfc_dev *nfc_dev, int value)
+{
+	struct platform_gpio *nfc_gpio = &nfc_dev->configs.gpio;
+
+	if (gpio_get_value(nfc_gpio->ven) != value) {
+		pr_debug("%s: value %d\n", __func__, value);
+
+		gpio_set_value(nfc_gpio->ven, value);
+		/* hardware dependent delay */
+		usleep_range(NFC_GPIO_SET_WAIT_TIME_US,
+			     NFC_GPIO_SET_WAIT_TIME_US + 100);
+	}
+}
+EXPORT_SYMBOL(gpio_set_ven);
+
+int configure_gpio(unsigned int gpio, int flag)
+{
+	int ret;
+
+	pr_debug("%s: nfc gpio [%d] flag [%01x]\n", __func__, gpio, flag);
+	if (gpio_is_valid(gpio)) {
+		ret = gpio_request(gpio, "nfc_gpio");
+		if (ret) {
+			pr_err("%s: unable to request nfc gpio [%d]\n",
+			       __func__, gpio);
+			return ret;
+		}
+		/* set direction and value for output pin */
+		if (flag & GPIO_OUTPUT) {
+			ret = gpio_direction_output(gpio, (GPIO_HIGH & flag));
+			pr_debug("%s: nfc o/p gpio %d level %d\n", __func__,
+				 gpio, gpio_get_value(gpio));
+		} else {
+			ret = gpio_direction_input(gpio);
+			pr_debug("%s: nfc i/p gpio %d\n", __func__, gpio);
+		}
+
+		if (ret) {
+			pr_err("%s: unable to set direction for nfc gpio [%d]\n",
+			       __func__, gpio);
+			gpio_free(gpio);
+			return ret;
+		}
+		/* Consider value as control for input IRQ pin */
+		if (flag & GPIO_IRQ) {
+			ret = gpio_to_irq(gpio);
+			if (ret < 0) {
+				pr_err("%s: unable to set irq [%d]\n", __func__,
+				       gpio);
+				gpio_free(gpio);
+				return ret;
+			}
+			pr_debug("%s: gpio_to_irq successful [%d]\n", __func__,
+				 gpio);
+			return ret;
+		}
+	} else {
+		pr_err("%s: invalid gpio\n", __func__);
+		ret = -EINVAL;
+	}
+	return ret;
+}
+EXPORT_SYMBOL(configure_gpio);
+
+void gpio_free_all(struct nfc_dev *nfc_dev)
+{
+	struct platform_gpio *nfc_gpio = &nfc_dev->configs.gpio;
+
+	if (gpio_is_valid(nfc_gpio->dwl_req))
+		gpio_free(nfc_gpio->dwl_req);
+
+	if (gpio_is_valid(nfc_gpio->irq))
+		gpio_free(nfc_gpio->irq);
+
+	if (gpio_is_valid(nfc_gpio->ven))
+		gpio_free(nfc_gpio->ven);
+}
+EXPORT_SYMBOL(gpio_free_all);
+
+void nfc_misc_unregister(struct nfc_dev *nfc_dev, int count)
+{
+	pr_debug("%s: entry\n", __func__);
+	device_destroy(nfc_dev->nfc_class, nfc_dev->devno);
+	cdev_del(&nfc_dev->c_dev);
+	class_destroy(nfc_dev->nfc_class);
+	unregister_chrdev_region(nfc_dev->devno, count);
+}
+EXPORT_SYMBOL(nfc_misc_unregister);
+
+int nfc_misc_register(struct nfc_dev *nfc_dev,
+		      const struct file_operations *nfc_fops, int count,
+		      char *devname, char *classname)
+{
+	int ret = 0;
+
+	ret = alloc_chrdev_region(&nfc_dev->devno, 0, count, devname);
+	if (ret < 0) {
+		pr_err("%s: failed to alloc chrdev region ret %d\n", __func__,
+		       ret);
+		return ret;
+	}
+	nfc_dev->nfc_class = class_create(classname);
+	if (IS_ERR(nfc_dev->nfc_class)) {
+		ret = PTR_ERR(nfc_dev->nfc_class);
+		pr_err("%s: failed to register device class ret %d\n", __func__,
+		       ret);
+		unregister_chrdev_region(nfc_dev->devno, count);
+		return ret;
+	}
+	cdev_init(&nfc_dev->c_dev, nfc_fops);
+	ret = cdev_add(&nfc_dev->c_dev, nfc_dev->devno, count);
+	if (ret < 0) {
+		pr_err("%s: failed to add cdev ret %d\n", __func__, ret);
+		class_destroy(nfc_dev->nfc_class);
+		unregister_chrdev_region(nfc_dev->devno, count);
+		return ret;
+	}
+	nfc_dev->nfc_device = device_create(nfc_dev->nfc_class, NULL,
+					    nfc_dev->devno, nfc_dev, devname);
+	if (IS_ERR(nfc_dev->nfc_device)) {
+		ret = PTR_ERR(nfc_dev->nfc_device);
+		pr_err("%s: failed to create the device ret %d\n", __func__,
+		       ret);
+		cdev_del(&nfc_dev->c_dev);
+		class_destroy(nfc_dev->nfc_class);
+		unregister_chrdev_region(nfc_dev->devno, count);
+		return ret;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(nfc_misc_register);
+
+/**
+ * nfc_ioctl_power_states() - power control
+ * @nfc_dev:    nfc device data structure
+ * @arg:    mode that we want to move to
+ *
+ * Device power control. Depending on the arg value, device moves to
+ * different states, refer platform.h for args
+ *
+ * Return: -ENOIOCTLCMD if arg is not supported, 0 in any other case
+ */
+static int nfc_ioctl_power_states(struct nfc_dev *nfc_dev, unsigned long arg)
+{
+	int ret = 0;
+	struct platform_gpio *nfc_gpio = &nfc_dev->configs.gpio;
+
+	if (arg == NFC_POWER_OFF) {
+		/*
+		 * We are attempting a hardware reset so let us disable
+		 * interrupts to avoid spurious notifications to upper
+		 * layers.
+		 */
+		nfc_dev->nfc_disable_intr(nfc_dev);
+		set_valid_gpio(nfc_gpio->dwl_req, 0);
+		gpio_set_ven(nfc_dev, 0);
+		nfc_dev->nfc_ven_enabled = false;
+	} else if (arg == NFC_POWER_ON) {
+		nfc_dev->nfc_enable_intr(nfc_dev);
+		set_valid_gpio(nfc_gpio->dwl_req, 0);
+
+		gpio_set_ven(nfc_dev, 1);
+		nfc_dev->nfc_ven_enabled = true;
+	} else if (arg == NFC_FW_DWL_VEN_TOGGLE) {
+		/*
+		 * We are switching to download Mode, toggle the enable pin
+		 * in order to set the NFCC in the new mode
+		 */
+		nfc_dev->nfc_disable_intr(nfc_dev);
+		set_valid_gpio(nfc_gpio->dwl_req, 1);
+		nfc_dev->nfc_state = NFC_STATE_FW_DWL;
+		gpio_set_ven(nfc_dev, 0);
+		gpio_set_ven(nfc_dev, 1);
+		nfc_dev->nfc_enable_intr(nfc_dev);
+	} else if (arg == NFC_FW_DWL_HIGH) {
+		/*
+		 * Setting firmware download gpio to HIGH
+		 * before FW download start
+		 */
+		set_valid_gpio(nfc_gpio->dwl_req, 1);
+		nfc_dev->nfc_state = NFC_STATE_FW_DWL;
+
+	} else if (arg == NFC_VEN_FORCED_HARD_RESET) {
+		nfc_dev->nfc_disable_intr(nfc_dev);
+		gpio_set_ven(nfc_dev, 0);
+		gpio_set_ven(nfc_dev, 1);
+		nfc_dev->nfc_enable_intr(nfc_dev);
+	} else if (arg == NFC_FW_DWL_LOW) {
+		/*
+		 * Setting firmware download gpio to LOW
+		 * FW download finished
+		 */
+		set_valid_gpio(nfc_gpio->dwl_req, 0);
+		nfc_dev->nfc_state = NFC_STATE_NCI;
+	} else {
+		pr_err("%s: bad arg %lu\n", __func__, arg);
+		ret = -ENOIOCTLCMD;
+	}
+	return ret;
+}
+
+/**
+ * nfc_dev_ioctl - used to set or get data from upper layer.
+ * @pfile   file node for opened device.
+ * @cmd     ioctl type from upper layer.
+ * @arg     ioctl arg from upper layer.
+ *
+ * NFC and ESE Device power control, based on the argument value
+ *
+ * Return: -ENOIOCTLCMD if arg is not supported, 0 or other in any other case
+ */
+long nfc_dev_ioctl(struct file *pfile, unsigned int cmd, unsigned long arg)
+{
+	int ret = 0;
+	struct nfc_dev *nfc_dev = pfile->private_data;
+
+	if (!nfc_dev)
+		return -ENODEV;
+
+	pr_debug("%s: cmd = %x arg = %zx\n", __func__, cmd, arg);
+	if (cmd == NFC_SET_PWR) {
+		ret = nfc_ioctl_power_states(nfc_dev, arg);
+	} else {
+		pr_err("%s: bad cmd %lu\n", __func__, arg);
+		ret = -ENOIOCTLCMD;
+	}
+	return ret;
+}
+EXPORT_SYMBOL(nfc_dev_ioctl);
+
+int nfc_dev_open(struct inode *inode, struct file *filp)
+{
+	struct nfc_dev *nfc_dev =
+		container_of(inode->i_cdev, struct nfc_dev, c_dev);
+
+	pr_debug("%s: %d, %d\n", __func__, imajor(inode), iminor(inode));
+
+	mutex_lock(&nfc_dev->dev_ref_mutex);
+
+	filp->private_data = nfc_dev;
+
+	if (nfc_dev->dev_ref_count == 0) {
+		set_valid_gpio(nfc_dev->configs.gpio.dwl_req, 0);
+
+		nfc_dev->nfc_enable_intr(nfc_dev);
+	}
+	nfc_dev->dev_ref_count = nfc_dev->dev_ref_count + 1;
+	mutex_unlock(&nfc_dev->dev_ref_mutex);
+	return 0;
+}
+EXPORT_SYMBOL(nfc_dev_open);
+
+int nfc_dev_close(struct inode *inode, struct file *filp)
+{
+	struct nfc_dev *nfc_dev =
+		container_of(inode->i_cdev, struct nfc_dev, c_dev);
+
+	pr_debug("%s: %d, %d\n", __func__, imajor(inode), iminor(inode));
+	mutex_lock(&nfc_dev->dev_ref_mutex);
+	if (nfc_dev->dev_ref_count == 1) {
+		nfc_dev->nfc_disable_intr(nfc_dev);
+		set_valid_gpio(nfc_dev->configs.gpio.dwl_req, 0);
+	}
+	if (nfc_dev->dev_ref_count > 0)
+		nfc_dev->dev_ref_count = nfc_dev->dev_ref_count - 1;
+	filp->private_data = NULL;
+
+	mutex_unlock(&nfc_dev->dev_ref_mutex);
+	return 0;
+}
+EXPORT_SYMBOL(nfc_dev_close);
+
+int validate_nfc_state_nci(struct nfc_dev *nfc_dev)
+{
+	struct platform_gpio *nfc_gpio = &nfc_dev->configs.gpio;
+
+	if (!gpio_get_value(nfc_gpio->ven)) {
+		pr_err("%s: ven low - nfcc powered off\n", __func__);
+		return -ENODEV;
+	}
+	if (get_valid_gpio(nfc_gpio->dwl_req) == 1) {
+		pr_err("%s: fw download in-progress\n", __func__);
+		return -EBUSY;
+	}
+	if (nfc_dev->nfc_state != NFC_STATE_NCI) {
+		pr_err("%s: fw download state\n", __func__);
+		return -EBUSY;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(validate_nfc_state_nci);
diff --git a/drivers/nfc/pn7160/common.h b/drivers/nfc/pn7160/common.h
new file mode 100644
index 000000000000..2451db295fc8
--- /dev/null
+++ b/drivers/nfc/pn7160/common.h
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2019-2021 NXP
+ */
+
+#ifndef _COMMON_H_
+#define _COMMON_H_
+
+#include "platform.h"
+
+/* 函数声明 */
+int nfc_dev_open(struct inode *inode, struct file *filp);
+int nfc_dev_close(struct inode *inode, struct file *filp);
+long nfc_dev_ioctl(struct file *pfile, unsigned int cmd, unsigned long arg);
+int nfc_parse_dt(struct device *dev, struct platform_configs *nfc_configs,
+		 uint8_t interface);
+int nfc_misc_register(struct nfc_dev *nfc_dev,
+		      const struct file_operations *nfc_fops, int count,
+		      char *devname, char *classname);
+void nfc_misc_unregister(struct nfc_dev *nfc_dev, int count);
+int configure_gpio(unsigned int gpio, int flag);
+void gpio_set_ven(struct nfc_dev *nfc_dev, int value);
+void gpio_free_all(struct nfc_dev *nfc_dev);
+int validate_nfc_state_nci(struct nfc_dev *nfc_dev);
+void set_valid_gpio(int gpio, int value);
+int get_valid_gpio(int gpio);
+
+/* I2C specific functions */
+int i2c_disable_irq(struct nfc_dev *dev);
+int i2c_enable_irq(struct nfc_dev *dev);
+int i2c_read(struct nfc_dev *nfc_dev, char *buf, size_t count, int timeout);
+int i2c_write(struct nfc_dev *nfc_dev, const char *buf, size_t count,
+	      int max_retry_cnt);
+
+#endif /* _COMMON_H_ */
diff --git a/drivers/nfc/pn7160/i2c_drv.c b/drivers/nfc/pn7160/i2c_drv.c
new file mode 100644
index 000000000000..859441472343
--- /dev/null
+++ b/drivers/nfc/pn7160/i2c_drv.c
@@ -0,0 +1,531 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2013-2021 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/uaccess.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/pm.h>
+#include <linux/fs.h>
+
+#include "common.h"
+#include "i2c_drv.h"
+
+/**
+ * i2c_disable_irq()
+ *
+ * Check if interrupt is disabled or not
+ * and disable interrupt
+ *
+ * Return: int
+ */
+int i2c_disable_irq(struct nfc_dev *dev)
+{
+	struct i2c_dev *i2c_dev = dev->platform_data;
+	unsigned long flags;
+
+	if (!i2c_dev)
+		return -EINVAL;
+
+	spin_lock_irqsave(&i2c_dev->irq_enabled_lock, flags);
+	if (i2c_dev->irq_enabled) {
+		disable_irq_nosync(i2c_dev->client->irq);
+		i2c_dev->irq_enabled = false;
+	}
+	spin_unlock_irqrestore(&i2c_dev->irq_enabled_lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL(i2c_disable_irq);
+
+/**
+ * i2c_enable_irq()
+ *
+ * Check if interrupt is enabled or not
+ * and enable interrupt
+ *
+ * Return: int
+ */
+int i2c_enable_irq(struct nfc_dev *dev)
+{
+	struct i2c_dev *i2c_dev = dev->platform_data;
+	unsigned long flags;
+
+	if (!i2c_dev)
+		return -EINVAL;
+
+	spin_lock_irqsave(&i2c_dev->irq_enabled_lock, flags);
+	if (!i2c_dev->irq_enabled) {
+		i2c_dev->irq_enabled = true;
+		enable_irq(i2c_dev->client->irq);
+	}
+	spin_unlock_irqrestore(&i2c_dev->irq_enabled_lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL(i2c_enable_irq);
+
+static irqreturn_t i2c_irq_handler(int irq, void *dev_id)
+{
+	struct nfc_dev *nfc_dev = dev_id;
+	struct i2c_dev *i2c_dev = nfc_dev->platform_data;
+
+	if (!i2c_dev)
+		return IRQ_NONE;
+
+	if (device_may_wakeup(&i2c_dev->client->dev))
+		pm_wakeup_event(&i2c_dev->client->dev, WAKEUP_SRC_TIMEOUT);
+
+	i2c_disable_irq(nfc_dev);
+	wake_up(&nfc_dev->read_wq);
+
+	return IRQ_HANDLED;
+}
+
+int i2c_read(struct nfc_dev *nfc_dev, char *buf, size_t count, int timeout)
+{
+	struct i2c_dev *i2c_dev = nfc_dev->platform_data;
+	struct platform_gpio *nfc_gpio = &nfc_dev->configs.gpio;
+	int ret = -EINVAL;
+
+	pr_debug("%s: reading %zu bytes.\n", __func__, count);
+
+	if (!i2c_dev)
+		return -EINVAL;
+
+	if (timeout > NCI_CMD_RSP_TIMEOUT_MS)
+		timeout = NCI_CMD_RSP_TIMEOUT_MS;
+
+	if (count > MAX_NCI_BUFFER_SIZE)
+		count = MAX_NCI_BUFFER_SIZE;
+
+	if (!gpio_get_value(nfc_gpio->irq)) {
+		while (1) {
+			ret = 0;
+			if (!i2c_dev->irq_enabled) {
+				i2c_dev->irq_enabled = true;
+				enable_irq(i2c_dev->client->irq);
+			}
+			if (!gpio_get_value(nfc_gpio->irq)) {
+				if (timeout) {
+					ret = wait_event_interruptible_timeout(
+						nfc_dev->read_wq,
+						!i2c_dev->irq_enabled,
+						msecs_to_jiffies(timeout));
+
+					if (ret <= 0) {
+						pr_err("%s: timeout error\n",
+						       __func__);
+						goto err;
+					}
+				} else {
+					ret = wait_event_interruptible(
+						nfc_dev->read_wq,
+						!i2c_dev->irq_enabled);
+					if (ret) {
+						pr_err("%s: err wakeup of wq\n",
+						       __func__);
+						goto err;
+					}
+				}
+			}
+			i2c_disable_irq(nfc_dev);
+
+			if (gpio_get_value(nfc_gpio->irq))
+				break;
+			if (!gpio_get_value(nfc_gpio->ven)) {
+				pr_info("%s: releasing read\n", __func__);
+				ret = -EIO;
+				goto err;
+			}
+			pr_warn("%s: spurious interrupt detected\n", __func__);
+		}
+	}
+
+	memset(buf, 0x00, count);
+	/* Read data */
+	ret = i2c_master_recv(i2c_dev->client, buf, count);
+	if (ret <= 0) {
+		pr_err("%s: returned %d\n", __func__, ret);
+		goto err;
+	}
+err:
+	return ret;
+}
+EXPORT_SYMBOL(i2c_read);
+
+int i2c_write(struct nfc_dev *nfc_dev, const char *buf, size_t count,
+	      int max_retry_cnt)
+{
+	struct i2c_dev *i2c_dev = nfc_dev->platform_data;
+	struct platform_gpio *nfc_gpio = &nfc_dev->configs.gpio;
+	int ret = -EINVAL;
+	int retry_cnt;
+
+	if (!i2c_dev)
+		return -EINVAL;
+
+	if (count > MAX_DL_BUFFER_SIZE)
+		count = MAX_DL_BUFFER_SIZE;
+
+	pr_debug("%s: writing %zu bytes.\n", __func__, count);
+	/*
+	 * Wait for any pending read for max 15ms before write
+	 * This is to avoid any packet corruption during read, when
+	 * the host cmds resets NFCC during any parallel read operation
+	 */
+	for (retry_cnt = 1; retry_cnt <= MAX_WRITE_IRQ_COUNT; retry_cnt++) {
+		if (gpio_get_value(nfc_gpio->irq)) {
+			pr_warn("%s: irq high during write, wait\n", __func__);
+			usleep_range(NFC_WRITE_IRQ_WAIT_TIME_US,
+				     NFC_WRITE_IRQ_WAIT_TIME_US + 100);
+		} else {
+			break;
+		}
+		if (retry_cnt == MAX_WRITE_IRQ_COUNT &&
+		    gpio_get_value(nfc_gpio->irq)) {
+			pr_warn("%s: allow after maximum wait\n", __func__);
+		}
+	}
+
+	for (retry_cnt = 1; retry_cnt <= max_retry_cnt; retry_cnt++) {
+		ret = i2c_master_send(i2c_dev->client, buf, count);
+		if (ret <= 0) {
+			pr_warn("%s: write failed ret(%d), maybe in standby\n",
+				__func__, ret);
+			usleep_range(WRITE_RETRY_WAIT_TIME_US,
+				     WRITE_RETRY_WAIT_TIME_US + 100);
+		} else if (ret != count) {
+			pr_err("%s: failed to write %d\n", __func__, ret);
+			ret = -EIO;
+		} else if (ret == count)
+			break;
+	}
+	return ret;
+}
+EXPORT_SYMBOL(i2c_write);
+
+ssize_t nfc_i2c_dev_read(struct file *filp, char __user *buf, size_t count,
+			 loff_t *offset)
+{
+	int ret;
+	struct nfc_dev *nfc_dev = filp->private_data;
+
+	if (filp->f_flags & O_NONBLOCK) {
+		pr_err("%s: f_flags has nonblock. try again\n", __func__);
+		return -EAGAIN;
+	}
+	mutex_lock(&nfc_dev->read_mutex);
+	ret = i2c_read(nfc_dev, nfc_dev->read_kbuf, count, 0);
+	if (ret > 0) {
+		if (copy_to_user(buf, nfc_dev->read_kbuf, ret)) {
+			pr_warn("%s: failed to copy to user space\n", __func__);
+			ret = -EFAULT;
+		}
+	}
+	mutex_unlock(&nfc_dev->read_mutex);
+	return ret;
+}
+EXPORT_SYMBOL(nfc_i2c_dev_read);
+
+ssize_t nfc_i2c_dev_write(struct file *filp, const char __user *buf,
+			  size_t count, loff_t *offset)
+{
+	int ret;
+	struct nfc_dev *nfc_dev = filp->private_data;
+
+	if (count > MAX_DL_BUFFER_SIZE)
+		count = MAX_DL_BUFFER_SIZE;
+
+	mutex_lock(&nfc_dev->write_mutex);
+	if (copy_from_user(nfc_dev->write_kbuf, buf, count)) {
+		pr_err("%s: failed to copy from user space\n", __func__);
+		mutex_unlock(&nfc_dev->write_mutex);
+		return -EFAULT;
+	}
+	ret = i2c_write(nfc_dev, nfc_dev->write_kbuf, count, NO_RETRY);
+	mutex_unlock(&nfc_dev->write_mutex);
+	return ret;
+}
+EXPORT_SYMBOL(nfc_i2c_dev_write);
+
+static const struct file_operations nfc_i2c_dev_fops = {
+	.owner = THIS_MODULE,
+	.llseek = noop_llseek,
+	.read = nfc_i2c_dev_read,
+	.write = nfc_i2c_dev_write,
+	.open = nfc_dev_open,
+	.release = nfc_dev_close,
+	.unlocked_ioctl = nfc_dev_ioctl,
+};
+
+int nfc_i2c_dev_probe(struct i2c_client *client)
+{
+	int ret = 0;
+	struct nfc_dev *nfc_dev = NULL;
+	struct i2c_dev *i2c_dev = NULL;
+	struct platform_configs nfc_configs;
+	struct platform_gpio *nfc_gpio = &nfc_configs.gpio;
+
+	pr_debug("%s: enter\n", __func__);
+	/* retrieve details of gpios from dt */
+	ret = nfc_parse_dt(&client->dev, &nfc_configs, PLATFORM_IF_I2C);
+	if (ret) {
+		pr_err("%s: failed to parse dt\n", __func__);
+		goto err;
+	}
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		pr_err("%s: need I2C_FUNC_I2C\n", __func__);
+		ret = -ENODEV;
+		goto err;
+	}
+
+	/* 分配 nfc_dev 和 i2c_dev */
+	nfc_dev = kzalloc(sizeof(struct nfc_dev), GFP_KERNEL);
+	if (nfc_dev == NULL) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	i2c_dev = kzalloc(sizeof(struct i2c_dev), GFP_KERNEL);
+	if (i2c_dev == NULL) {
+		ret = -ENOMEM;
+		goto err_free_nfc_dev;
+	}
+
+	i2c_dev->client = client;
+	nfc_dev->platform_data = i2c_dev;
+	nfc_dev->interface = PLATFORM_IF_I2C;
+	nfc_dev->nfc_state = NFC_STATE_NCI;
+
+	nfc_dev->read_kbuf = kzalloc(MAX_NCI_BUFFER_SIZE, GFP_DMA | GFP_KERNEL);
+	if (!nfc_dev->read_kbuf) {
+		ret = -ENOMEM;
+		goto err_free_i2c_dev;
+	}
+
+	nfc_dev->write_kbuf = kzalloc(MAX_DL_BUFFER_SIZE, GFP_DMA | GFP_KERNEL);
+	if (!nfc_dev->write_kbuf) {
+		ret = -ENOMEM;
+		goto err_free_read_kbuf;
+	}
+
+	nfc_dev->nfc_read = i2c_read;
+	nfc_dev->nfc_write = i2c_write;
+	nfc_dev->nfc_enable_intr = i2c_enable_irq;
+	nfc_dev->nfc_disable_intr = i2c_disable_irq;
+
+	ret = configure_gpio(nfc_gpio->ven, GPIO_OUTPUT);
+	if (ret) {
+		pr_err("%s: unable to request nfc reset gpio [%d]\n", __func__,
+		       nfc_gpio->ven);
+		goto err_free_write_kbuf;
+	}
+
+	ret = configure_gpio(nfc_gpio->irq, GPIO_IRQ);
+	if (ret <= 0) {
+		pr_err("%s: unable to request nfc irq gpio [%d]\n", __func__,
+		       nfc_gpio->irq);
+		goto err_free_gpio;
+	}
+
+	client->irq = ret;
+	ret = configure_gpio(nfc_gpio->dwl_req, GPIO_OUTPUT);
+	if (ret) {
+		pr_err("%s: unable to request nfc firm downl gpio [%d]\n",
+		       __func__, nfc_gpio->dwl_req);
+	}
+
+	/* copy the retrieved gpio details from DT */
+	memcpy(&nfc_dev->configs, &nfc_configs,
+	       sizeof(struct platform_configs));
+
+	/* init mutex and queues */
+	init_waitqueue_head(&nfc_dev->read_wq);
+	mutex_init(&nfc_dev->read_mutex);
+	mutex_init(&nfc_dev->write_mutex);
+	mutex_init(&nfc_dev->dev_ref_mutex);
+	spin_lock_init(&i2c_dev->irq_enabled_lock);
+
+	ret = nfc_misc_register(nfc_dev, &nfc_i2c_dev_fops, DEV_COUNT,
+				NFC_CHAR_DEV_NAME, CLASS_NAME);
+	if (ret) {
+		pr_err("%s: nfc_misc_register failed\n", __func__);
+		goto err_mutex_destroy;
+	}
+
+	/* interrupt initializations */
+	pr_info("%s: requesting IRQ %d\n", __func__, client->irq);
+	i2c_dev->irq_enabled = true;
+	ret = request_irq(client->irq, i2c_irq_handler, IRQF_TRIGGER_HIGH,
+			  client->name, nfc_dev);
+	if (ret) {
+		pr_err("%s: request_irq failed\n", __func__);
+		goto err_nfc_misc_unregister;
+	}
+
+	i2c_disable_irq(nfc_dev);
+	gpio_set_ven(nfc_dev, 1);
+	gpio_set_ven(nfc_dev, 0);
+	gpio_set_ven(nfc_dev, 1);
+	device_init_wakeup(&client->dev, true);
+	i2c_set_clientdata(client, nfc_dev);
+	i2c_dev->irq_wake_up = false;
+
+	pr_info("%s: probing nfc i2c successfully\n", __func__);
+	return 0;
+
+err_nfc_misc_unregister:
+	nfc_misc_unregister(nfc_dev, DEV_COUNT);
+err_mutex_destroy:
+	mutex_destroy(&nfc_dev->dev_ref_mutex);
+	mutex_destroy(&nfc_dev->read_mutex);
+	mutex_destroy(&nfc_dev->write_mutex);
+err_free_gpio:
+	gpio_free_all(nfc_dev);
+err_free_write_kbuf:
+	kfree(nfc_dev->write_kbuf);
+err_free_read_kbuf:
+	kfree(nfc_dev->read_kbuf);
+err_free_i2c_dev:
+	kfree(i2c_dev);
+err_free_nfc_dev:
+	kfree(nfc_dev);
+err:
+	pr_err("%s: probing not successful, check hardware\n", __func__);
+	return ret;
+}
+EXPORT_SYMBOL(nfc_i2c_dev_probe);
+
+void nfc_i2c_dev_remove(struct i2c_client *client)
+{
+	struct nfc_dev *nfc_dev = i2c_get_clientdata(client);
+	struct i2c_dev *i2c_dev;
+
+	if (!nfc_dev) {
+		pr_err("%s: device doesn't exist anymore\n", __func__);
+		return;
+	}
+
+	i2c_dev = nfc_dev->platform_data;
+
+	pr_info("%s: remove device\n", __func__);
+
+	if (nfc_dev->dev_ref_count > 0) {
+		pr_err("%s: device already in use\n", __func__);
+		return;
+	}
+
+	device_init_wakeup(&client->dev, false);
+	free_irq(client->irq, nfc_dev);
+	nfc_misc_unregister(nfc_dev, DEV_COUNT);
+	mutex_destroy(&nfc_dev->read_mutex);
+	mutex_destroy(&nfc_dev->write_mutex);
+	mutex_destroy(&nfc_dev->dev_ref_mutex);
+	gpio_free_all(nfc_dev);
+	kfree(nfc_dev->read_kbuf);
+	kfree(nfc_dev->write_kbuf);
+	kfree(i2c_dev);
+	kfree(nfc_dev);
+}
+EXPORT_SYMBOL(nfc_i2c_dev_remove);
+
+int nfc_i2c_dev_suspend(struct device *device)
+{
+	struct i2c_client *client = to_i2c_client(device);
+	struct nfc_dev *nfc_dev = i2c_get_clientdata(client);
+	struct i2c_dev *i2c_dev;
+
+	if (!nfc_dev)
+		return 0;
+
+	i2c_dev = nfc_dev->platform_data;
+	if (!i2c_dev)
+		return 0;
+
+	if (device_may_wakeup(&client->dev) && i2c_dev->irq_enabled) {
+		if (!enable_irq_wake(client->irq))
+			i2c_dev->irq_wake_up = true;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(nfc_i2c_dev_suspend);
+
+int nfc_i2c_dev_resume(struct device *device)
+{
+	struct i2c_client *client = to_i2c_client(device);
+	struct nfc_dev *nfc_dev = i2c_get_clientdata(client);
+	struct i2c_dev *i2c_dev;
+
+	if (!nfc_dev)
+		return 0;
+
+	i2c_dev = nfc_dev->platform_data;
+	if (!i2c_dev)
+		return 0;
+
+	if (device_may_wakeup(&client->dev) && i2c_dev->irq_wake_up) {
+		if (!disable_irq_wake(client->irq))
+			i2c_dev->irq_wake_up = false;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(nfc_i2c_dev_resume);
+
+static const struct i2c_device_id nfc_i2c_dev_id[] = {
+	{ "nxpnfc", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, nfc_i2c_dev_id);
+
+static const struct of_device_id nfc_i2c_dev_match_table[] = {
+	{ .compatible = "nxp,nxpnfc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, nfc_i2c_dev_match_table);
+
+static const struct dev_pm_ops nfc_i2c_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(nfc_i2c_dev_suspend, nfc_i2c_dev_resume)
+};
+
+static struct i2c_driver nfc_i2c_dev_driver = {
+	.id_table = nfc_i2c_dev_id,
+	.probe = nfc_i2c_dev_probe,
+	.remove = nfc_i2c_dev_remove,
+	.driver = {
+		.name = "nxpnfc",
+		.pm = &nfc_i2c_dev_pm_ops,
+		.of_match_table = nfc_i2c_dev_match_table,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+
+static int __init nfc_i2c_dev_init(void)
+{
+	int ret = 0;
+
+	pr_info("%s: Loading NXP NFC I2C driver\n", __func__);
+	ret = i2c_add_driver(&nfc_i2c_dev_driver);
+	if (ret != 0)
+		pr_err("%s: NFC I2C add driver error ret %d\n", __func__, ret);
+	return ret;
+}
+
+module_init(nfc_i2c_dev_init);
+
+static void __exit nfc_i2c_dev_exit(void)
+{
+	pr_info("%s: Unloading NXP NFC I2C driver\n", __func__);
+	i2c_del_driver(&nfc_i2c_dev_driver);
+}
+
+module_exit(nfc_i2c_dev_exit);
+
+MODULE_DESCRIPTION("NXP NFC I2C driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/nfc/pn7160/i2c_drv.h b/drivers/nfc/pn7160/i2c_drv.h
new file mode 100644
index 000000000000..70f0faa0dd17
--- /dev/null
+++ b/drivers/nfc/pn7160/i2c_drv.h
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2019-2021 NXP
+ */
+
+#ifndef _I2C_DRV_H_
+#define _I2C_DRV_H_
+
+#include "platform.h"
+
+/* kept same as dts */
+#define NFC_I2C_DRV_STR		"nxp,nxpnfc"
+#define NFC_I2C_DEV_ID		"nxpnfc"
+
+/* Function declarations */
+ssize_t nfc_i2c_dev_read(struct file *filp, char __user *buf, size_t count,
+			 loff_t *offset);
+ssize_t nfc_i2c_dev_write(struct file *filp, const char __user *buf,
+			  size_t count, loff_t *offset);
+int nfc_i2c_dev_probe(struct i2c_client *client);
+void nfc_i2c_dev_remove(struct i2c_client *client);
+int nfc_i2c_dev_suspend(struct device *device);
+int nfc_i2c_dev_resume(struct device *device);
+
+#endif /* _I2C_DRV_H_ */
diff --git a/drivers/nfc/pn7160/platform.h b/drivers/nfc/pn7160/platform.h
new file mode 100644
index 000000000000..05468fa31193
--- /dev/null
+++ b/drivers/nfc/pn7160/platform.h
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2019-2021 NXP
+ */
+
+#ifndef _PLATFORM_H_
+#define _PLATFORM_H_
+
+#include <linux/cdev.h>
+#include <linux/fs.h>
+#include <linux/spinlock.h>
+#include <linux/miscdevice.h>
+
+/* nfc platform interface type */
+enum interface_flags {
+	/* I2C physical IF for NFCC */
+	PLATFORM_IF_I2C = 0,
+	PLATFORM_IF_SPI = 1,
+};
+
+/* nfc state flags */
+enum nfc_state_flags {
+	/* nfc in unknown state */
+	NFC_STATE_UNKNOWN = 0,
+	/* nfc in download mode */
+	NFC_STATE_FW_DWL = 0x1,
+	/* nfc booted in NCI mode */
+	NFC_STATE_NCI = 0x2,
+	/* nfc booted in Fw teared mode */
+	NFC_STATE_FW_TEARED = 0x4,
+};
+
+/*
+ * Power state for IBI handing, mainly needed to defer the IBI handling
+ *  for the IBI received in suspend state to do it later in resume call
+ */
+enum pm_state_flags {
+	PM_STATE_NORMAL = 0,
+	PM_STATE_SUSPEND,
+	PM_STATE_IBI_BEFORE_RESUME,
+};
+
+/* Enum for GPIO values */
+enum gpio_values {
+	GPIO_INPUT = 0x0,
+	GPIO_OUTPUT = 0x1,
+	GPIO_HIGH = 0x2,
+	GPIO_OUTPUT_HIGH = 0x3,
+	GPIO_IRQ = 0x4,
+};
+
+/* Enum for nfcc_ioctl_request */
+enum nfcc_ioctl_request {
+	/* NFC disable request with VEN LOW */
+	NFC_POWER_OFF = 0,
+	/* NFC enable request with VEN Toggle */
+	NFC_POWER_ON,
+	/* firmware download request with VEN Toggle */
+	NFC_FW_DWL_VEN_TOGGLE,
+	/* ISO reset request */
+	NFC_ISO_RESET,
+	/* request for firmware download gpio HIGH */
+	NFC_FW_DWL_HIGH,
+	/* VEN hard reset request */
+	NFC_VEN_FORCED_HARD_RESET,
+	/* request for firmware download gpio LOW */
+	NFC_FW_DWL_LOW,
+};
+
+/* NFC GPIO variables */
+struct platform_gpio {
+	unsigned int irq;
+	unsigned int ven;
+	unsigned int dwl_req;
+};
+
+/* NFC Struct to get all the required configs from DTS */
+struct platform_configs {
+	struct platform_gpio gpio;
+};
+
+/* Interface specific parameters - 基础结构 */
+struct i2c_dev {
+	struct i2c_client *client;
+	/* IRQ parameters */
+	bool irq_enabled;
+	spinlock_t irq_enabled_lock;
+	/* NFC_IRQ wake-up state */
+	bool irq_wake_up;
+};
+
+struct spi_dev {
+	struct spi_device *client;
+	struct miscdevice device;
+	/* IRQ parameters */
+	bool irq_enabled;
+	spinlock_t irq_enabled_lock;
+	/* NFC_IRQ wake-up state */
+	bool irq_wake_up;
+	/* Temporary write kernel buffer */
+	uint8_t *tmp_write_kbuf;
+	/* Temporary read kernel buffer */
+	uint8_t *tmp_read_kbuf;
+};
+
+/* Device specific structure */
+struct nfc_dev {
+	wait_queue_head_t read_wq;
+	struct mutex read_mutex;
+	struct mutex write_mutex;
+	uint8_t *read_kbuf;
+	uint8_t *write_kbuf;
+	struct mutex dev_ref_mutex;
+	unsigned int dev_ref_count;
+	struct class *nfc_class;
+	struct device *nfc_device;
+	struct cdev c_dev;
+	dev_t devno;
+	/* Interface flag */
+	uint8_t interface;
+	/* nfc state flags */
+	uint8_t nfc_state;
+	/* NFC VEN pin state */
+	bool nfc_ven_enabled;
+	/* Platform specific data */
+	void *platform_data;
+	struct platform_configs configs;
+
+	/* function pointers */
+	int (*nfc_read)(struct nfc_dev *dev, char *buf, size_t count,
+			int timeout);
+	int (*nfc_write)(struct nfc_dev *dev, const char *buf,
+			 const size_t count, int max_retry_cnt);
+	int (*nfc_enable_intr)(struct nfc_dev *dev);
+	int (*nfc_disable_intr)(struct nfc_dev *dev);
+};
+
+/* 从common.h移过来的常量定义 */
+#define DEV_COUNT			1
+#define CLASS_NAME			"nfc"
+#define NFC_CHAR_DEV_NAME		"nxpnfc"
+#define NCI_CMD				(0x20)
+#define NCI_RSP				(0x40)
+#define NCI_HDR_LEN			(3)
+#define MAX_NCI_BUFFER_SIZE		(NCI_HDR_LEN + 255)
+#define MAX_DL_BUFFER_SIZE		(2 + 2 + 550)
+#define NO_RETRY			(1)
+#define MAX_RETRY_COUNT			(3)
+#define MAX_WRITE_IRQ_COUNT		(5)
+#define WAKEUP_SRC_TIMEOUT		(2000)
+#define NCI_CMD_RSP_TIMEOUT_MS		(2000)
+#define NFC_GPIO_SET_WAIT_TIME_US	(10000)
+#define NFC_WRITE_IRQ_WAIT_TIME_US	(3000)
+#define WRITE_RETRY_WAIT_TIME_US	(1000)
+#define NFC_MAGIC			(0xE9)
+#define NFC_SET_PWR			_IOW(NFC_MAGIC, 0x01, long)
+#define ESE_SET_PWR			_IOW(NFC_MAGIC, 0x02, long)
+#define ESE_GET_PWR			_IOR(NFC_MAGIC, 0x03, long)
+#define DTS_IRQ_GPIO_STR		"nxp,nxpnfc-irq"
+#define DTS_VEN_GPIO_STR		"nxp,nxpnfc-ven"
+#define DTS_FWDN_GPIO_STR		"nxp,nxpnfc-fw-dwnld"
+
+#endif /* _PLATFORM_H_ */
-- 
2.25.1


