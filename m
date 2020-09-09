Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42416262D3F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgIIKcl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgIIK2E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:28:04 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23ABC061756;
        Wed,  9 Sep 2020 03:28:03 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w186so1748191pgb.8;
        Wed, 09 Sep 2020 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RiIlDwC7B7uF7c1ZHUXEY+j14pT4ikAqGJpx0R2mghU=;
        b=pBNNKzBrML9LItoCcgzxpivyf9Dqqug3LFp4I3Ifdx+YiKykLJ62vser/QglSwpCVo
         LqagQDMjRr6BTbTxxtIZSK4iNqQLejff0BRlX52JUbZXC1jCN+avq5/I5JE1Luw/X5qj
         xbo3iBpKRNNNNNBTK7tTBpDazWNKM+yeCpf4XuHEXssOXx75qpDb7/ElSB9YtvDv7Fyw
         vFiAhke3YotdWb63NOS3iGRmcOq+rwnPPximnQzY4SWBQ4cw+KVJpBd9VWtdjoUORS36
         Bv4tSrFlHbcwWm8W5CPGJ8/V2JOvC6ZHHN3LFj6xQkCgrR5i2lk3+1sAzA9ZqZkio3bw
         wMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RiIlDwC7B7uF7c1ZHUXEY+j14pT4ikAqGJpx0R2mghU=;
        b=ndjssFUPlnqao9fwsyE/QYH7m3FWW8w+zXZtSklrGsxHbjZYHbw6f/qwuRpXVGMRBV
         yiXK5sOOjzG27KaBpRMrlaVA2HFA9vFqxcSyDoVvIzHcrRqTj17XvXvb1vgUJRB3LazJ
         fpaZBfVtnb9pVFzmrX+Gn5vQR274lwafPF9lKFaFmM1NxrU6881U0BRGzke9AbAiiXDs
         OejhwCiHXcJMJkR64eqdbyKpto1NmocftLY33rw7pLySMSv6SYJOv8WuRU6P5rFT19GR
         414sW1R3SV7PYHYen/Za7lbujk8kZRlHTXOkaaEET+YgVSWcaPCJ8wMvpomq/5hRVK+s
         077Q==
X-Gm-Message-State: AOAM531BytdmE4MO2JSM2Dzn7X6Lu56Nj9iMgUiPxFLYomGinhrhJvA3
        iTNmeBoTNThRwOW0ai5KDT8tWwvcc8g=
X-Google-Smtp-Source: ABdhPJysQ3lq6vQXpvnjFKpKX0YiLooxS6DMRH1+gQ9piWMZTFn14e1urRvlTOrGzYWQfvbcJyRH/g==
X-Received: by 2002:a63:413:: with SMTP id 19mr134201pge.310.1599647282954;
        Wed, 09 Sep 2020 03:28:02 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:02 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 08/20] gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
Date:   Wed,  9 Sep 2020 18:26:28 +0800
Message-Id: <20200909102640.1657622-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
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

Changes for v5:
 - as per cover letter

Changes for v4:
 - replace strncpy with memcpy in gpio_v2_line_info_to_v1

 drivers/gpio/gpiolib-cdev.c | 195 +++++++++++++++++++++++++++++++-----
 1 file changed, 168 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index db4136ac1c6d..a0aa1ff1124a 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -162,7 +162,8 @@ static long linehandle_set_config(struct linehandle_state *lh,
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
-					     GPIOLINE_CHANGED_CONFIG, desc);
+					     GPIO_V2_LINE_CHANGED_CONFIG,
+					     desc);
 	}
 	return 0;
 }
@@ -334,7 +335,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
-					     GPIOLINE_CHANGED_REQUESTED, desc);
+					     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
 
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
@@ -726,7 +727,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
-					     GPIOLINE_CHANGED_REQUESTED, desc);
+					     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
 
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
@@ -1073,7 +1074,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		goto out_free_le;
 
 	blocking_notifier_call_chain(&desc->gdev->notifier,
-				     GPIOLINE_CHANGED_REQUESTED, desc);
+				     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
 
 	irq = gpiod_to_irq(desc);
 	if (irq <= 0) {
@@ -1140,17 +1141,59 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	return ret;
 }
 
+static void gpio_v2_line_info_to_v1(struct gpio_v2_line_info *info_v2,
+				    struct gpioline_info *info_v1)
+{
+	u64 flagsv2 = info_v2->flags;
+
+	memcpy(info_v1->name, info_v2->name, sizeof(info_v1->name));
+	memcpy(info_v1->consumer, info_v2->consumer,
+	       sizeof(info_v1->consumer));
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
+	lic_v1->timestamp = lic_v2->timestamp;
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
 	 * the spinlock.
@@ -1159,7 +1202,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	 * lock common to both frameworks?
 	 */
 	ok_for_pinctrl =
-		pinctrl_gpio_can_use_line(gc->base + info->line_offset);
+		pinctrl_gpio_can_use_line(gc->base + info->offset);
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
@@ -1180,23 +1223,27 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
@@ -1204,11 +1251,65 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
+static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
+				       unsigned int version)
+{
+	int abiv = atomic_read(&cdata->watch_abi_version);
+
+	if (abiv == 0) {
+		atomic_cmpxchg(&cdata->watch_abi_version, 0, version);
+		abiv = atomic_read(&cdata->watch_abi_version);
+	}
+	if (abiv != version)
+		return -EPERM;
+	return 0;
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
@@ -1218,7 +1319,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct gpio_device *gdev = cdev->gdev;
 	struct gpio_chip *gc = gdev->chip;
 	void __user *ip = (void __user *)arg;
-	struct gpio_desc *desc;
 	__u32 offset;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
@@ -1241,7 +1341,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return 0;
 #ifdef CONFIG_GPIO_CDEV_V1
 	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
+		struct gpio_desc *desc;
 		struct gpioline_info lineinfo;
+		struct gpio_v2_line_info lineinfo_v2;
 
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
@@ -1251,7 +1353,8 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
-		gpio_desc_to_lineinfo(desc, &lineinfo);
+		gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+		gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
@@ -1261,7 +1364,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
 		return lineevent_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
+		struct gpio_desc *desc;
 		struct gpioline_info lineinfo;
+		struct gpio_v2_line_info lineinfo_v2;
 
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
@@ -1271,10 +1376,14 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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
@@ -1283,6 +1392,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		return 0;
 #endif /* CONFIG_GPIO_CDEV_V1 */
+	} else if (cmd == GPIO_V2_GET_LINEINFO_IOCTL ||
+		   cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL) {
+		return lineinfo_get(cdev, ip,
+				    cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL);
 	} else if (cmd == GPIO_V2_GET_LINE_IOCTL) {
 		return linereq_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
@@ -1318,7 +1431,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
 	struct gpio_chardev_data *cdev = to_gpio_chardev_data(nb);
-	struct gpioline_info_changed chg;
+	struct gpio_v2_line_info_changed chg;
 	struct gpio_desc *desc = data;
 	int ret;
 
@@ -1358,12 +1471,16 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
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
@@ -1385,7 +1502,17 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
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
@@ -1394,9 +1521,23 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
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

