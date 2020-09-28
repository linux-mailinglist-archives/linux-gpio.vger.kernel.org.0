Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429B527A4CB
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgI1AaP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgI1AaP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:30:15 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22527C0613CE;
        Sun, 27 Sep 2020 17:30:15 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d6so7745933pfn.9;
        Sun, 27 Sep 2020 17:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ADkrA+l4uzKnZImYbXPd+UqVMJaLEJwSfCB7v9VQ3qM=;
        b=plxeWcxhaoT/uXHcld0oOl33GyInyzeq43hMFAajvSi9hliE0cFSIcJ4aK8hkU7Xzn
         Sz93obOTTNgWXf9Nr6gdMHQsYuZ/aShxanF8O6CkUlV2De3AzAm1Y/3Lk8gUZCx8BVPl
         Cx8wUBs8j9XdYB9KFP3spLsz4oqJIG0A+oIvksZvgGzDTWegZGAw+l0ZvascJ4MmjVCD
         KrqxQXoZl/216TyBI7HSlGg++xTZYr8Fzn2N5u9gmNoFbYazWLIZmpg5yaZ8uNMRlvz3
         MwGklkOxcBSPbP54Pwu+O33BIrryx0zDfg6j4cT7e47XOAX+xBwBDqDnJo82YZUQNueg
         zmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ADkrA+l4uzKnZImYbXPd+UqVMJaLEJwSfCB7v9VQ3qM=;
        b=AAkOEFcI+PoMZsVLujLGLKVlH91xhexgNWgH9bAeIGZHwn46rD4qSXMEqfrQ9fjZT5
         u5MqAubnT9pDDXlZbpXjtqZaI0QQxYdePsT6cSFW/Xv3+YhlrhlCtf6jKITAEFiOrN/Z
         wqORLAsDPSur2CoVkKdV2nOoZb5/GUEUdrpJ8ziko4hqUGCFMj4lZK54T6PA2G60Hv0s
         B5sl4ky50LDHrxsrGNNjF4Vxo87BIHi+2Vjgmi0nm2jJAyRwxT4JhOCbOxPAXK/VI44+
         3SuJXO7WEEb04MVZvqYsqo8wwkHUrU8R8Shtf9OlhHxnQkV21uWPAbeM6GPTc5T9y71F
         3nsQ==
X-Gm-Message-State: AOAM530ilyiRK0h2/q0NSQfz/qrj9JDj3x2TjQwx1RIzh/tJYsUfuDry
        cFF5YCmeKvcuAoS0G6ik8QoIcaj9PIQHrw==
X-Google-Smtp-Source: ABdhPJwhcXXCHjsityuGkc/VqCS8tlWWVAgis61RdWCLo6w6M8rnV1Vi1eIOe1oJFvLjiFEHA0kIpQ==
X-Received: by 2002:a17:902:6504:b029:d2:63a7:1737 with SMTP id b4-20020a1709026504b02900d263a71737mr8791287plk.74.1601253014094;
        Sun, 27 Sep 2020 17:30:14 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:30:13 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 08/20] gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
Date:   Mon, 28 Sep 2020 08:27:55 +0800
Message-Id: <20200928002807.12146-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for GPIO_V2_GET_LINEINFO_IOCTL and
GPIO_V2_GET_LINEINFO_WATCH_IOCTL.

The core of this change is the event kfifo switching to contain
struct gpioline_info_changed_v2, instead of v1 as v2 is richer.

The two uAPI versions are mostly independent - other than where they both
provide line info changes via reads on the chip fd.  As the info change
structs differ between v1 and v2, the infowatch implementation tracks which
version of the infowatch ioctl, either GPIO_GET_LINEINFO_WATCH_IOCTL or
GPIO_V2_GET_LINEINFO_WATCH_IOCTL, initiates the initial watch and returns
the corresponding info change struct to the read.  The version supported
on that fd locks to that version on the first watch request, so subsequent
watches from that process must use the same uAPI version.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Changes for v10:
 - as per cover letter

Changes for v5:
 - as per cover letter

Changes for v4:
 - replace strncpy with memcpy in gpio_v2_line_info_to_v1

 drivers/gpio/gpiolib-cdev.c | 196 ++++++++++++++++++++++++++++++------
 1 file changed, 168 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index a5f2256cdf8c..786e667cdc85 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -181,7 +181,8 @@ static long linehandle_set_config(struct linehandle_state *lh,
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
-					     GPIOLINE_CHANGED_CONFIG, desc);
+					     GPIO_V2_LINE_CHANGED_CONFIG,
+					     desc);
 	}
 	return 0;
 }
@@ -353,7 +354,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
-					     GPIOLINE_CHANGED_REQUESTED, desc);
+					     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
 
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
@@ -749,7 +750,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
-					     GPIOLINE_CHANGED_REQUESTED, desc);
+					     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
 
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
@@ -1096,7 +1097,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		goto out_free_le;
 
 	blocking_notifier_call_chain(&desc->gdev->notifier,
-				     GPIOLINE_CHANGED_REQUESTED, desc);
+				     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
 
 	irq = gpiod_to_irq(desc);
 	if (irq <= 0) {
@@ -1163,17 +1164,58 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	return ret;
 }
 
+static void gpio_v2_line_info_to_v1(struct gpio_v2_line_info *info_v2,
+				    struct gpioline_info *info_v1)
+{
+	u64 flagsv2 = info_v2->flags;
+
+	memcpy(info_v1->name, info_v2->name, sizeof(info_v1->name));
+	memcpy(info_v1->consumer, info_v2->consumer, sizeof(info_v1->consumer));
+	info_v1->line_offset = info_v2->offset;
+	info_v1->flags = 0;
+
+	if (flagsv2 & GPIO_V2_LINE_FLAG_USED)
+		info_v1->flags |= GPIOLINE_FLAG_KERNEL;
+
+	if (flagsv2 & GPIO_V2_LINE_FLAG_OUTPUT)
+		info_v1->flags |= GPIOLINE_FLAG_IS_OUT;
+
+	if (flagsv2 & GPIO_V2_LINE_FLAG_ACTIVE_LOW)
+		info_v1->flags |= GPIOLINE_FLAG_ACTIVE_LOW;
+
+	if (flagsv2 & GPIO_V2_LINE_FLAG_OPEN_DRAIN)
+		info_v1->flags |= GPIOLINE_FLAG_OPEN_DRAIN;
+	if (flagsv2 & GPIO_V2_LINE_FLAG_OPEN_SOURCE)
+		info_v1->flags |= GPIOLINE_FLAG_OPEN_SOURCE;
+
+	if (flagsv2 & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)
+		info_v1->flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
+	if (flagsv2 & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN)
+		info_v1->flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
+	if (flagsv2 & GPIO_V2_LINE_FLAG_BIAS_DISABLED)
+		info_v1->flags |= GPIOLINE_FLAG_BIAS_DISABLE;
+}
+
+static void gpio_v2_line_info_changed_to_v1(
+		struct gpio_v2_line_info_changed *lic_v2,
+		struct gpioline_info_changed *lic_v1)
+{
+	gpio_v2_line_info_to_v1(&lic_v2->info, &lic_v1->info);
+	lic_v1->timestamp = lic_v2->timestamp_ns;
+	lic_v1->event_type = lic_v2->event_type;
+}
+
 #endif /* CONFIG_GPIO_CDEV_V1 */
 
 static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
-				  struct gpioline_info *info)
+				  struct gpio_v2_line_info *info)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
 	bool ok_for_pinctrl;
 	unsigned long flags;
 
 	memset(info, 0, sizeof(*info));
-	info->line_offset = gpio_chip_hwgpio(desc);
+	info->offset = gpio_chip_hwgpio(desc);
 
 	/*
 	 * This function takes a mutex so we must check this before taking
@@ -1183,7 +1225,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	 * lock common to both frameworks?
 	 */
 	ok_for_pinctrl =
-		pinctrl_gpio_can_use_line(gc->base + info->line_offset);
+		pinctrl_gpio_can_use_line(gc->base + info->offset);
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
@@ -1204,23 +1246,27 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	    test_bit(FLAG_EXPORT, &desc->flags) ||
 	    test_bit(FLAG_SYSFS, &desc->flags) ||
 	    !ok_for_pinctrl)
-		info->flags |= GPIOLINE_FLAG_KERNEL;
+		info->flags |= GPIO_V2_LINE_FLAG_USED;
+
 	if (test_bit(FLAG_IS_OUT, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_IS_OUT;
+		info->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
+	else
+		info->flags |= GPIO_V2_LINE_FLAG_INPUT;
+
 	if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_ACTIVE_LOW;
+		info->flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
+
 	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
-		info->flags |= (GPIOLINE_FLAG_OPEN_DRAIN |
-				GPIOLINE_FLAG_IS_OUT);
+		info->flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
 	if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
-		info->flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
-				GPIOLINE_FLAG_IS_OUT);
+		info->flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
+
 	if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_BIAS_DISABLE;
+		info->flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
 	if (test_bit(FLAG_PULL_DOWN, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
+		info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
 	if (test_bit(FLAG_PULL_UP, &desc->flags))
-		info->flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
+		info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 }
@@ -1228,11 +1274,65 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 struct gpio_chardev_data {
 	struct gpio_device *gdev;
 	wait_queue_head_t wait;
-	DECLARE_KFIFO(events, struct gpioline_info_changed, 32);
+	DECLARE_KFIFO(events, struct gpio_v2_line_info_changed, 32);
 	struct notifier_block lineinfo_changed_nb;
 	unsigned long *watched_lines;
+#ifdef CONFIG_GPIO_CDEV_V1
+	atomic_t watch_abi_version;
+#endif
 };
 
+#ifdef CONFIG_GPIO_CDEV_V1
+/*
+ * returns 0 if the versions match, else the previously selected ABI version
+ */
+static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
+				       unsigned int version)
+{
+	int abiv = atomic_cmpxchg(&cdata->watch_abi_version, 0, version);
+
+	if (abiv == version)
+		return 0;
+
+	return abiv;
+}
+#endif
+
+static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
+			bool watch)
+{
+	struct gpio_desc *desc;
+	struct gpio_v2_line_info lineinfo;
+
+	if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
+		return -EFAULT;
+
+	if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
+		return -EINVAL;
+
+	desc = gpiochip_get_desc(cdev->gdev->chip, lineinfo.offset);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	if (watch) {
+#ifdef CONFIG_GPIO_CDEV_V1
+		if (lineinfo_ensure_abi_version(cdev, 2))
+			return -EPERM;
+#endif
+		if (test_and_set_bit(lineinfo.offset, cdev->watched_lines))
+			return -EBUSY;
+	}
+	gpio_desc_to_lineinfo(desc, &lineinfo);
+
+	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
+		if (watch)
+			clear_bit(lineinfo.offset, cdev->watched_lines);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
 /*
  * gpio_ioctl() - ioctl handler for the GPIO chardev
  */
@@ -1242,7 +1342,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct gpio_device *gdev = cdev->gdev;
 	struct gpio_chip *gc = gdev->chip;
 	void __user *ip = (void __user *)arg;
-	struct gpio_desc *desc;
 	__u32 offset;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
@@ -1265,7 +1364,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return 0;
 #ifdef CONFIG_GPIO_CDEV_V1
 	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
+		struct gpio_desc *desc;
 		struct gpioline_info lineinfo;
+		struct gpio_v2_line_info lineinfo_v2;
 
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
@@ -1275,7 +1376,8 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
-		gpio_desc_to_lineinfo(desc, &lineinfo);
+		gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+		gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
@@ -1285,7 +1387,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
 		return lineevent_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
+		struct gpio_desc *desc;
 		struct gpioline_info lineinfo;
+		struct gpio_v2_line_info lineinfo_v2;
 
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
@@ -1295,10 +1399,14 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
+		if (lineinfo_ensure_abi_version(cdev, 1))
+			return -EPERM;
+
 		if (test_and_set_bit(lineinfo.line_offset, cdev->watched_lines))
 			return -EBUSY;
 
-		gpio_desc_to_lineinfo(desc, &lineinfo);
+		gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+		gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
 			clear_bit(lineinfo.line_offset, cdev->watched_lines);
@@ -1307,6 +1415,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		return 0;
 #endif /* CONFIG_GPIO_CDEV_V1 */
+	} else if (cmd == GPIO_V2_GET_LINEINFO_IOCTL ||
+		   cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL) {
+		return lineinfo_get(cdev, ip,
+				    cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL);
 	} else if (cmd == GPIO_V2_GET_LINE_IOCTL) {
 		return linereq_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
@@ -1342,7 +1454,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
 	struct gpio_chardev_data *cdev = to_gpio_chardev_data(nb);
-	struct gpioline_info_changed chg;
+	struct gpio_v2_line_info_changed chg;
 	struct gpio_desc *desc = data;
 	int ret;
 
@@ -1351,7 +1463,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 
 	memset(&chg, 0, sizeof(chg));
 	chg.event_type = action;
-	chg.timestamp = ktime_get_ns();
+	chg.timestamp_ns = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
 
 	ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);
@@ -1382,12 +1494,16 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 				   size_t count, loff_t *off)
 {
 	struct gpio_chardev_data *cdev = file->private_data;
-	struct gpioline_info_changed event;
+	struct gpio_v2_line_info_changed event;
 	ssize_t bytes_read = 0;
 	int ret;
+	size_t event_size;
 
-	if (count < sizeof(event))
+#ifndef CONFIG_GPIO_CDEV_V1
+	event_size = sizeof(struct gpio_v2_line_info_changed);
+	if (count < event_size)
 		return -EINVAL;
+#endif
 
 	do {
 		spin_lock(&cdev->wait.lock);
@@ -1409,7 +1525,17 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 				return ret;
 			}
 		}
-
+#ifdef CONFIG_GPIO_CDEV_V1
+		/* must be after kfifo check so watch_abi_version is set */
+		if (atomic_read(&cdev->watch_abi_version) == 2)
+			event_size = sizeof(struct gpio_v2_line_info_changed);
+		else
+			event_size = sizeof(struct gpioline_info_changed);
+		if (count < event_size) {
+			spin_unlock(&cdev->wait.lock);
+			return -EINVAL;
+		}
+#endif
 		ret = kfifo_out(&cdev->events, &event, 1);
 		spin_unlock(&cdev->wait.lock);
 		if (ret != 1) {
@@ -1418,9 +1544,23 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 			/* We should never get here. See lineevent_read(). */
 		}
 
-		if (copy_to_user(buf + bytes_read, &event, sizeof(event)))
+#ifdef CONFIG_GPIO_CDEV_V1
+		if (event_size == sizeof(struct gpio_v2_line_info_changed)) {
+			if (copy_to_user(buf + bytes_read, &event, event_size))
+				return -EFAULT;
+		} else {
+			struct gpioline_info_changed event_v1;
+
+			gpio_v2_line_info_changed_to_v1(&event, &event_v1);
+			if (copy_to_user(buf + bytes_read, &event_v1,
+					 event_size))
+				return -EFAULT;
+		}
+#else
+		if (copy_to_user(buf + bytes_read, &event, event_size))
 			return -EFAULT;
-		bytes_read += sizeof(event);
+#endif
+		bytes_read += event_size;
 	} while (count >= bytes_read + sizeof(event));
 
 	return bytes_read;
-- 
2.28.0

