Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B739823FE75
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgHIN0o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHIN0o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:26:44 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F31C061756;
        Sun,  9 Aug 2020 06:26:43 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id q17so3445477pls.9;
        Sun, 09 Aug 2020 06:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2tKf7D4Guj5h05mCpg9H+1TxsuZGYRNDBw+6Mfvm27Q=;
        b=KYMK3X1LVlA3tSQrqtykoqPv8oNuUaYiDIZfO5v3hgYzlCp5tBaWTGOJFqzVlEkxTw
         F4dQ/9ZKnjZY8rqtl7GIXRUYX0gfi0SKVWBTVhlnBxxLOW+EbmJKA3P/EjtT2z0Og2wa
         9Vm7ICnKV4MKGnAFL7IQP9PdPxbUzyrlMfctnmasqoHDih3T4bK9wN6JGJDAG3ry/nBF
         LejqcfmN4MMirmMBVKKp+Qv+olsfqnBbCL3pdYVO+4UCIUaC2MpmxIbcQaupHy1NO8Mm
         +mhE4y2Saci/uwBKHuyur/DREiS4XFIIFSv52RPt1oaW7EncmMnC1F4hV0zMxfK1v42y
         8c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2tKf7D4Guj5h05mCpg9H+1TxsuZGYRNDBw+6Mfvm27Q=;
        b=eQS9k6rMJ3jRQS/IZyarZzi7zMCoE4DOkfNxw/eYyFq8NG3u4dky1wi3wHSz99sTd4
         nMnH3PIgufAJRXJgVttzrSmSTEsLjdPX3aNrTGJkDNOnHcHcgwtag+W5nPe+Uxt47vXP
         BSZ97X/8cUGk0H77jXHYJpN3sMDxj3CKzWYE0gdDuqGBqZ/hoUTwE56qTm6eu0wSOhVE
         gbEOK1xHVpzodAB9NXDTy0WnvvusOf2lZ9vVNt8nheQ83zYRIkhFAspmzBVlESh5DD97
         PvqjzKNVa0vEt4UyjSq1bPY2LrXHEOhon+vm4Q3tbuy0xdb4UVRHks/IrOA3qDuRH5ck
         Ixiw==
X-Gm-Message-State: AOAM532+r8ABRmUd0SeiC8GdRex0m3juZicIAW+AW/nIaEUGKwAMb/Ak
        3pY2gNXpR4L5DVxob/qHD+T8stOB
X-Google-Smtp-Source: ABdhPJwGd7ybCy3a60kus8nSS2XcIEsoImSyhrFnZ2LqZ5vF0esQHFvoE2r+ElgYuCYR1LAQnt+L5w==
X-Received: by 2002:a17:90b:18b:: with SMTP id t11mr22745153pjs.105.1596979602689;
        Sun, 09 Aug 2020 06:26:42 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:26:42 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 06/18] gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
Date:   Sun,  9 Aug 2020 21:25:17 +0800
Message-Id: <20200809132529.264312-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for GPIO_V2_GET_LINEINFO_IOCTL and
GPIO_V2_GET_LINEINFO_WATCH_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

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

 drivers/gpio/gpiolib-cdev.c | 196 +++++++++++++++++++++++++++++++-----
 1 file changed, 169 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 4b657492d836..f88e012984d9 100644
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
@@ -716,7 +717,7 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
-					     GPIOLINE_CHANGED_REQUESTED, desc);
+					     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
 
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
@@ -1065,7 +1066,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		goto out_free_le;
 
 	blocking_notifier_call_chain(&desc->gdev->notifier,
-				     GPIOLINE_CHANGED_REQUESTED, desc);
+				     GPIO_V2_LINE_CHANGED_REQUESTED, desc);
 
 	irq = gpiod_to_irq(desc);
 	if (irq <= 0) {
@@ -1132,10 +1133,52 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	return ret;
 }
 
+static void gpio_v2_line_info_to_v1(struct gpio_v2_line_info *info_v2,
+				    struct gpioline_info *info_v1)
+{
+	int flagsv2 = info_v2->flags;
+
+	strncpy(info_v1->name, info_v2->name, sizeof(info_v1->name));
+	strncpy(info_v1->consumer, info_v2->consumer,
+		sizeof(info_v1->consumer));
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
@@ -1149,7 +1192,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	 * lock common to both frameworks?
 	 */
 	ok_for_pinctrl =
-		pinctrl_gpio_can_use_line(gc->base + info->line_offset);
+		pinctrl_gpio_can_use_line(gc->base + info->offset);
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
@@ -1178,23 +1221,27 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
@@ -1202,11 +1249,65 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
+			unsigned int cmd)
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
+	if (cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL) {
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
+		if (cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL)
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
@@ -1216,7 +1317,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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
@@ -1251,7 +1353,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
-		gpio_desc_to_lineinfo(desc, &lineinfo);
+		gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+		lineinfo_v2.offset = lineinfo.line_offset;
+		gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
@@ -1261,7 +1365,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
 		return lineevent_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
+		struct gpio_desc *desc;
 		struct gpioline_info lineinfo;
+		struct gpio_v2_line_info lineinfo_v2;
 
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
@@ -1271,10 +1377,15 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
+		if (lineinfo_ensure_abi_version(cdev, 1))
+			return -EPERM;
+
 		if (test_and_set_bit(lineinfo.line_offset, cdev->watched_lines))
 			return -EBUSY;
 
-		gpio_desc_to_lineinfo(desc, &lineinfo);
+		gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+		lineinfo_v2.offset = lineinfo.line_offset;
+		gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
 			clear_bit(lineinfo.line_offset, cdev->watched_lines);
@@ -1283,6 +1394,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		return 0;
 #endif /* CONFIG_GPIO_CDEV_V1 */
+	} else if (cmd == GPIO_V2_GET_LINEINFO_IOCTL ||
+		   cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL) {
+		return lineinfo_get(cdev, ip, cmd);
 	} else if (cmd == GPIO_V2_GET_LINE_IOCTL) {
 		return line_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
@@ -1318,7 +1432,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
 	struct gpio_chardev_data *cdev = to_gpio_chardev_data(nb);
-	struct gpioline_info_changed chg;
+	struct gpio_v2_line_info_changed chg;
 	struct gpio_desc *desc = data;
 	int ret;
 
@@ -1326,7 +1440,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 		return NOTIFY_DONE;
 
 	memset(&chg, 0, sizeof(chg));
-	chg.info.line_offset = gpio_chip_hwgpio(desc);
+	chg.info.offset = gpio_chip_hwgpio(desc);
 	chg.event_type = action;
 	chg.timestamp = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
@@ -1359,12 +1473,16 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
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
@@ -1386,7 +1504,17 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
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
@@ -1395,9 +1523,23 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
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

