Return-Path: <linux-gpio+bounces-30839-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M/dIjuXcGlyYgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30839-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 10:07:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102B54124
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 10:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F19785231FC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 09:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3580B47B427;
	Wed, 21 Jan 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="FMZTW6cy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FDD3A9626;
	Wed, 21 Jan 2026 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985973; cv=none; b=CcinTv/EDmefnRpA6w1RJ3oYxEh0m8/cB5DUh6H7U6fdh2ji2cxSN08GDKQKeOsU64zYl4SCvPVlBRSr4zetRXCZOkJvzNN2gEylwUUakNOCAlSq7BtlUtzGS88GGOlFAtqTTCtl6zwrbcoTva47gJETAuwsNa8cz+5uNGk6l4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985973; c=relaxed/simple;
	bh=+9NGIpwerQUnng0enXi3A6KqnvdVKr5p9W5ZxFbRlUk=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=cgu5RD8mkhpWOqzeI63E/hf0EMUjFvMttiAwyryykyumnu7kR1HqlK3XSlqdm6eUbK1f5VvKlsrf+ZDv636LpRVH+SkhulUpDzJhrgWH3NZYCdJN9XWSbQ93652akwtD+RGk+KhBd/7VVOuhHtZ7lssHkuQu2IYA+O3FBpxD0k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=FMZTW6cy; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768985961; bh=tF+mqiAd/5R+ZNnVRInT+balrl3kOBDbayMXkXFRZIo=;
	h=From:To:Cc:Subject:Date;
	b=FMZTW6cyFgQ2rqLe/4aztWHGady96MiYXSJRtlAac3BKyhk8jo4R4v+X2eVBTu4ad
	 67I5uen5s7JS+Xrey95+h+skeG1zocWbQ8rOOAfzxONyzWw4xXSjCmgyqWI+lvmQnx
	 VC5YGvNGXCuC16BEQCZMpvWMxNbSfUOzdeoEtQQ4=
Received: from bright.ght.com ([58.34.102.26])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id ED30DA1D; Wed, 21 Jan 2026 16:59:19 +0800
X-QQ-mid: xmsmtpt1768985959t5vx0s7sy
Message-ID: <tencent_3AC818B2FE367BA7DD8940E08827CB146806@qq.com>
X-QQ-XMAILINFO: OPIY/Y5G02yj9xkAXWq6dOdNMKsQ5XIHPLsejmCenKudfQlS3Qsn+K5OzhonvN
	 HyoK5vwesGAr6/EcA8KgGSZpBNGXj44b7GPWMDZDHhogGzOmCQN5tNdEovXJv95hJEzw/nOOr214
	 ad5rTth2Cgk28LPgsQr1PhUiuPOCJya5TjO5vYDkLoP5n4EIx8JBa383y0aMChlWMa4opV6FWAPo
	 5LC/GbZxPyFG7lvxa1rSzh8xGHiNLwf1n5PCcw28GewbgtRtU+zcJzein69yqa6hbqu7JErsfEvL
	 zu2PhFhYKMxxqiTXLMB5AxdWvKB615nkko0cI0d02TfGmZwKIjeGqRZ0kFjxxEGQ5u3JCKaB908I
	 97HFElg7GVWChzRroqI5t4Pv7+OE4MIsmOpuFzsTopojhZX4bzsdyNKxo03jD0qiEANNtxCVhv8B
	 616AD5p8a4AUOcdK3TGvetL/QghukEcsfkX1s2PdZHQ/486Zt/vMb1BitiHZTADCXnFakekeiNWQ
	 d/htgL4ZO+HNLmGaadw8rZR7T5nO+oeW+Rj5MQSlemigc2tUmD6Y30x2XJ3BNgJ8ijWv+Sq1ykSa
	 Wya7D3VNyrxRR7wChp8uDtspweXGucWcynAm9qKUohnjCf76G35ivACLHeV3T//8ugf7NwIefw+t
	 Zan80waWukNXRyiyHlXGKw4yC4xlOXdflAlrYg6KbANTu0PR4exCFRKBFRa1ffxZ4Dmi1HKxnc37
	 QnFohapAZ4Z2VE1GttLGqSX/3/DR+C2vJdTm8Htp5HwVOz38LG1KUrlrjxgATzMDUNm0luDTdOis
	 bs2LATHCdKlZzmvzyaYupMnBK474oMcKD20aiqZsSpuo3YSEefI1cbzG4q8sa/NUkOt+B3LUBnJE
	 dQFuX+ZsPXGrTnEhAv6TLADjW8SlYAgXNcueQvEwpACUGa8pbedAvqa2HutOuEp3bJ8jielnTDVS
	 FURt8lu3bPN8Z/YrMIwdN7izspSbPYJT4pRvl7HM1Bi0tMFrElHw==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: 756271518@qq.com
To: dmitry.torokhov@gmail.com
Cc: linusw@kernel.org,
	brgl@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	xuchen <756271518@qq.com>
Subject: [PATCH] Add common hall sensor drivers
Date: Wed, 21 Jan 2026 03:59:14 -0500
X-OQ-MSGID: <20260121085914.226873-1-756271518@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-30839-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,qq.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qq.com,quarantine];
	DKIM_TRACE(0.00)[qq.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[756271518@qq.com,linux-gpio@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FREEMAIL_FROM(0.00)[qq.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qq.com:email,qq.com:dkim,qq.com:mid,faiot.com:url,extbd_ctrl_class.name:url]
X-Rspamd-Queue-Id: 3102B54124
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: xuchen <756271518@qq.com>

This patch adds support for common hall sensor ICs used in Qualcomm
reference designs. The driver handles both rising and falling edges
to detect magnetic field changes.

Signed-off-by: xuchen <756271518@qq.com>
---
 drivers/input/keyboard/pogo_switch.c | 323 +++++++++++++++++++++++++++
 1 file changed, 323 insertions(+)
 create mode 100644 drivers/input/keyboard/pogo_switch.c

diff --git a/drivers/input/keyboard/pogo_switch.c b/drivers/input/keyboard/pogo_switch.c
new file mode 100644
index 000000000000..ea91037caeb3
--- /dev/null
+++ b/drivers/input/keyboard/pogo_switch.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Pogo switch/hall sensor driver
+ *
+ * Copyright (c) 2024 faiot.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/init.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/sched.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/sysctl.h>
+#include <linux/proc_fs.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/input.h>
+#include <linux/gpio_keys.h>
+#include <linux/workqueue.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/spinlock.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+
+#define LID_DEV_NAME	"hall_sensor"
+#define HALL_INPUT	"/dev/input/hall_dev"
+#define KEY_HALL	84
+
+struct hall_data {
+	int gpio;			/* device use gpio number */
+	int irq;			/* device request irq number */
+	int active_low;			/* gpio active high or low for valid value */
+	bool wakeup;			/* device can wakeup system or not */
+	struct input_dev *hall_dev;
+	struct device *dev;
+	int detect_irq;
+	struct workqueue_struct *hall_wq;
+	struct delayed_work hall_debounce_work_det;
+};
+
+static struct hall_data *p_hall_data;
+static struct class extbd_ctrl_class;
+static int g_extbd_status;
+
+static void hall_driver_remove(struct platform_device *dev);
+
+static int hall_parse_dt(struct device *dev, struct hall_data *data)
+{
+	struct device_node *np = dev->of_node;
+
+	data->gpio = of_get_named_gpio(np, "faiot,hall-int", 0);
+	if (!gpio_is_valid(data->gpio)) {
+		dev_err(dev, "hall gpio is not valid\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static irqreturn_t hall_interrupt_handler(int irq, void *dev)
+{
+	if (p_hall_data == NULL || p_hall_data->hall_wq == NULL) {
+		pr_err("zy : irq resource not rdy\n");
+		return IRQ_HANDLED;
+	}
+
+	queue_delayed_work(p_hall_data->hall_wq,
+			   &p_hall_data->hall_debounce_work_det,
+			   msecs_to_jiffies(50));
+	return IRQ_HANDLED;
+}
+
+static void hall_det_debounce_work_func(struct work_struct *work)
+{
+	int value;
+
+	value = (gpio_get_value_cansleep(p_hall_data->gpio) ? 1 : 0) ^
+		p_hall_data->active_low;
+	if (value) {
+		input_report_key(p_hall_data->hall_dev, KEY_HALL, 0);
+		input_sync(p_hall_data->hall_dev);
+		dev_info(&p_hall_data->hall_dev->dev,
+			 "hall_interrupt_handler near\n");
+	} else {
+		input_report_key(p_hall_data->hall_dev, KEY_HALL, 1);
+		input_sync(p_hall_data->hall_dev);
+		dev_info(&p_hall_data->hall_dev->dev,
+			 "hall_interrupt_handler far\n");
+	}
+}
+
+static int hall_input_init(struct platform_device *pdev,
+			   struct hall_data *data)
+{
+	int err;
+
+	data->hall_dev = devm_input_allocate_device(&pdev->dev);
+	if (!data->hall_dev) {
+		dev_err(&pdev->dev, "input device allocation failed\n");
+		return -EINVAL;
+	}
+
+	data->hall_dev->name = LID_DEV_NAME;
+	data->hall_dev->phys = HALL_INPUT;
+	set_bit(EV_KEY, data->hall_dev->evbit);
+	set_bit(KEY_HALL, data->hall_dev->keybit);
+
+	err = input_register_device(data->hall_dev);
+	if (err < 0) {
+		dev_err(&pdev->dev, "unable to register input device %s\n",
+			LID_DEV_NAME);
+		return err;
+	}
+
+	return 0;
+}
+
+static ssize_t extbd_status_store(const struct class *c,
+				  const struct class_attribute *attr,
+				  const char *buf, size_t count)
+{
+	if (kstrtoint(buf, 0, &g_extbd_status))
+		return -EINVAL;
+
+	return count;
+}
+
+static ssize_t extbd_status_show(const struct class *c,
+				 const struct class_attribute *attr,
+				 char *buf)
+{
+	g_extbd_status = (gpio_get_value_cansleep(p_hall_data->gpio) ? 1 : 0) ^
+			 p_hall_data->active_low;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", g_extbd_status);
+}
+
+static CLASS_ATTR_RW(extbd_status);
+
+static struct attribute *extbd_ctrl_class_attrs[] = {
+	&class_attr_extbd_status.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(extbd_ctrl_class);
+
+static int hall_driver_probe(struct platform_device *dev)
+{
+	struct hall_data *data;
+	int err;
+	int irq_flags;
+
+	dev_info(&dev->dev, "hall_driver probe\n");
+
+	data = devm_kzalloc(&dev->dev, sizeof(struct hall_data), GFP_KERNEL);
+	if (data == NULL) {
+		err = -ENOMEM;
+		dev_err(&dev->dev, "failed to allocate memory %d\n", err);
+		goto exit;
+	}
+
+	data->dev = &dev->dev;
+	dev_set_drvdata(&dev->dev, data);
+
+	err = hall_parse_dt(&dev->dev, data);
+	if (err < 0) {
+		dev_err(&dev->dev, "Failed to parse device tree\n");
+		goto exit;
+	}
+
+	err = hall_input_init(dev, data);
+	if (err < 0) {
+		dev_err(&dev->dev, "input init failed\n");
+		goto exit;
+	}
+
+	if (!gpio_is_valid(data->gpio)) {
+		dev_err(&dev->dev, "gpio is not valid\n");
+		err = -EINVAL;
+		goto free_gpio;
+	}
+
+	irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
+	err = gpio_request_one(data->gpio, GPIOF_IN, "hall_sensor_irq");
+	if (err) {
+		dev_err(&dev->dev, "unable to request gpio %d\n", data->gpio);
+		goto exit;
+	}
+
+	data->irq = gpio_to_irq(data->gpio);
+	err = devm_request_threaded_irq(&dev->dev, data->irq, NULL,
+					hall_interrupt_handler,
+					irq_flags, "hall_sensor", data);
+	if (err < 0)
+		goto free_irq;
+
+	data->hall_wq = create_singlethread_workqueue("hall_wq");
+	if (!data->hall_wq)
+		return -EINVAL;
+
+	INIT_DELAYED_WORK(&data->hall_debounce_work_det,
+			  hall_det_debounce_work_func);
+
+	/*
+	 * err = sysfs_create_group(&data->dev->kobj, &hall_attr_group);
+	 * if (err) {
+	 *     printk(KERN_ERR "%s sysfs_create_group fail\n", __func__);
+	 *     return err;
+	 * }
+	 */
+
+	extbd_ctrl_class.name = "extbd_ctrl";
+	extbd_ctrl_class.class_groups = extbd_ctrl_class_groups;
+	err = class_register(&extbd_ctrl_class);
+	if (err < 0)
+		dev_err(&dev->dev, "Failed to create extbd_ctrl_class rc=%d\n",
+			err);
+
+	p_hall_data = data;
+	device_init_wakeup(&dev->dev, data->wakeup);
+	enable_irq_wake(data->irq);
+
+	dev_info(&dev->dev, "guh hall probe end");
+
+	return 0;
+
+free_irq:
+	disable_irq_wake(data->irq);
+	device_init_wakeup(&dev->dev, 0);
+free_gpio:
+	gpio_free(data->gpio);
+exit:
+	return err;
+}
+
+static void hall_driver_remove(struct platform_device *dev)
+{
+	struct hall_data *data = dev_get_drvdata(&dev->dev);
+
+	disable_irq_wake(data->irq);
+	device_init_wakeup(&dev->dev, 0);
+	if (data->gpio)
+		gpio_free(data->gpio);
+}
+
+static int hall_driver_suspend(struct platform_device *dev,
+			       pm_message_t state)
+{
+	/*
+	 * struct hall_data *data = dev_get_drvdata(&dev->dev);
+	 * gpio_direction_output(data->extbd_power, 0);
+	 */
+
+	return 0;
+}
+
+static int hall_driver_resume(struct platform_device *dev)
+{
+	/*
+	 * struct hall_data *data = dev_get_drvdata(&dev->dev);
+	 * gpio_direction_output(data->extbd_power, 1);
+	 */
+
+	return 0;
+}
+
+static struct platform_device_id hall_id[] = {
+	{ LID_DEV_NAME, 0 },
+	{ },
+};
+
+#ifdef CONFIG_OF
+static const struct of_device_id hall_match_table[] = {
+	{ .compatible = "hall-switch", },
+	{ },
+};
+#endif
+
+static struct platform_driver hall_driver = {
+	.driver = {
+		.name = LID_DEV_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(hall_match_table),
+	},
+	.probe = hall_driver_probe,
+	.remove = hall_driver_remove,
+	.suspend = hall_driver_suspend,
+	.resume = hall_driver_resume,
+	.id_table = hall_id,
+};
+
+static int __init hall_init(void)
+{
+	return platform_driver_register(&hall_driver);
+}
+
+static void __exit hall_exit(void)
+{
+	platform_driver_unregister(&hall_driver);
+}
+
+module_init(hall_init);
+module_exit(hall_exit);
+
+MODULE_DESCRIPTION("Hall sensor driver");
+MODULE_LICENSE("GPL");


