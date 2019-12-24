Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C13212A10F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfLXMHd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:07:33 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53917 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfLXMHc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:32 -0500
Received: by mail-wm1-f66.google.com with SMTP id m24so2258371wmc.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ymp1GMvAvV2SApdJNUszBq9CyuSY0meISM2KWZJrHeg=;
        b=OMDZKBzT57a7HUwKBDlTt4D4AtQgf65EkXSCPI2c8j8bbkCTVWKHnjYo+A5jF7mGBU
         oS/DvTqQwgF0ojGUSV6N5snJ7fnyCjN9NdracCp3gZsQHavX2b3irQyctihGbShFzyTD
         PmPAw+g23BsRTI5UGLRgy60BP2X6rlLQ50yDrx9dSbnkagri7nKw83xNP4oL3pkUgruV
         AeMRjRddGwha9d/UAgsmWgvAUvjbfZRrd/WdAHrkISD8Ruk9yESmadz0ABj9TQYz4nF8
         +M9tmAgnEgERE+jHVqBYDFLdlkvMSUDhoE+yI0nc1PYJeFFxNLN+uQiWIATjP46q7cJi
         xNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ymp1GMvAvV2SApdJNUszBq9CyuSY0meISM2KWZJrHeg=;
        b=JHPjnwh1DHuwPoSZCDBFY/F4qMk8BbmB9ggCkYRv5DeW9hMZ/ysyI8Fq8SqJ6O3qIl
         Hz0U3kKEY+/HJErjcYujU6UUvXlkpZxkdgQR9OCpnXdfDFIYp97Cx53WTGoAK+B0A/w7
         W4ed8xzDVzAxGR/f9zt8D/NZOZr0In7TJ5WyM58qkHsgihSdgXEE93Qk7Ia8urUfVzzG
         6ROLdkqh5McbuwkbqAm5bEv9nqNpUof+6uh1mVg43an34/YE7Ppgm9kP9LHqH0U17WHd
         gKMu12oaZzcQEkkxY7bKPbP2UhNjfjoGEjvjEfQd2XjpQrS4hhlaNqTtT9wcR0n7gup4
         sbnQ==
X-Gm-Message-State: APjAAAWS7aaE6cWadvaNfV7PGi5t2U27UYklCD4l7aQxNoegp8SNRcC4
        suIP5SBLKdhuQA0irjNUZixieQ==
X-Google-Smtp-Source: APXvYqxCPBgkeXaPnXTKyeGdzvAX/ZsLzGiPti0H/ZqfKBCf6AFfdfWRCeEiT64WxFd9Kh70Yr4ITg==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr3760621wmg.95.1577189249563;
        Tue, 24 Dec 2019 04:07:29 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:28 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 12/13] gpiolib: add new ioctl() for monitoring changes in line info
Date:   Tue, 24 Dec 2019 13:07:08 +0100
Message-Id: <20191224120709.18247-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191224120709.18247-1-brgl@bgdev.pl>
References: <20191224120709.18247-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Currently there is no way for user-space to be informed about changes
in status of GPIO lines e.g. when someone else requests the line or its
config changes. We can only periodically re-read the line-info. This
is fine for simple one-off user-space tools, but any daemon that provides
a centralized access to GPIO chips would benefit hugely from an event
driven line info synchronization.

This patch adds a new ioctl() that allows user-space processes to reuse
the file descriptor associated with the character device for watching
any changes in line properties. Every such event contains the updated
line information.

Currently the events are generated on three types of status changes: when
a line is requested, when it's released and when its config is changed.
The first two are self-explanatory. For the third one: this will only
happen when another user-space process calls the new SET_CONFIG ioctl()
as any changes that can happen from within the kernel (i.e.
set_transitory() or set_debounce()) are of no interest to user-space.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c    | 187 ++++++++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib.h    |   1 +
 include/uapi/linux/gpio.h |  30 ++++++
 3 files changed, 210 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 276a7068f23c..9952405deb7d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -547,6 +547,9 @@ static long linehandle_set_config(struct linehandle_state *lh,
 			if (ret)
 				return ret;
 		}
+
+		atomic_notifier_call_chain(&desc->gdev->notifier,
+					   GPIOLINE_CHANGED_CONFIG, desc);
 	}
 	return 0;
 }
@@ -1202,14 +1205,25 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	spin_unlock_irqrestore(&gpio_lock, flags);
 }
 
+struct gpio_chardev_data {
+	struct gpio_device *gdev;
+	wait_queue_head_t wait;
+	DECLARE_KFIFO(events, struct gpioline_info_changed, 32);
+	struct notifier_block lineinfo_changed_nb;
+	unsigned long *watched_lines;
+};
+
 /*
  * gpio_ioctl() - ioctl handler for the GPIO chardev
  */
 static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
-	struct gpio_device *gdev = filp->private_data;
+	struct gpio_chardev_data *priv = filp->private_data;
+	struct gpio_device *gdev = priv->gdev;
 	struct gpio_chip *chip = gdev->chip;
 	void __user *ip = (void __user *)arg;
+	struct gpio_desc *desc;
+	__u32 offset;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
 	if (!chip)
@@ -1231,9 +1245,9 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
 			return -EFAULT;
 		return 0;
-	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
+	} else if (cmd == GPIO_GET_LINEINFO_IOCTL ||
+		   cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
 		struct gpioline_info lineinfo;
-		struct gpio_desc *desc;
 
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
@@ -1246,11 +1260,25 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
+
+		if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL)
+			set_bit(desc_to_gpio(desc), priv->watched_lines);
+
 		return 0;
 	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
 		return linehandle_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
 		return lineevent_create(gdev, ip);
+	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
+		if (copy_from_user(&offset, ip, sizeof(offset)))
+			return -EFAULT;
+
+		desc = gpiochip_get_desc(chip, offset);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+
+		clear_bit(desc_to_gpio(desc), &desc->flags);
+		return 0;
 	}
 	return -EINVAL;
 }
@@ -1263,6 +1291,102 @@ static long gpio_ioctl_compat(struct file *filp, unsigned int cmd,
 }
 #endif
 
+static struct gpio_chardev_data *
+to_gpio_chardev_data(struct notifier_block *nb)
+{
+	return container_of(nb, struct gpio_chardev_data, lineinfo_changed_nb);
+}
+
+static int lineinfo_changed_notify(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct gpio_chardev_data *priv = to_gpio_chardev_data(nb);
+	struct gpioline_info_changed chg;
+	struct gpio_desc *desc = data;
+	int ret;
+
+	if (!test_bit(desc_to_gpio(desc), priv->watched_lines))
+		return NOTIFY_DONE;
+
+	memset(&chg, 0, sizeof(chg));
+	chg.info.line_offset = gpio_chip_hwgpio(desc);
+	chg.event_type = action;
+	chg.timestamp = ktime_get_real_ns();
+	gpio_desc_to_lineinfo(desc, &chg.info);
+
+	ret = kfifo_in_spinlocked(&priv->events, &chg,
+				  1, &priv->wait.lock);
+	if (ret)
+		wake_up_poll(&priv->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("lineinfo event FIFO is full - event dropped\n");
+
+	return NOTIFY_OK;
+}
+
+static __poll_t lineinfo_watch_poll(struct file *filep,
+				    struct poll_table_struct *pollt)
+{
+	struct gpio_chardev_data *priv = filep->private_data;
+	__poll_t events = 0;
+
+	poll_wait(filep, &priv->wait, pollt);
+
+	if (!kfifo_is_empty_spinlocked_noirqsave(&priv->events,
+						 &priv->wait.lock))
+		events = EPOLLIN | EPOLLRDNORM;
+
+	return events;
+}
+
+static ssize_t lineinfo_watch_read(struct file *filep, char __user *buf,
+				   size_t count, loff_t *off)
+{
+	struct gpio_chardev_data *priv = filep->private_data;
+	struct gpioline_info_changed event;
+	ssize_t bytes_read = 0;
+	int ret;
+
+	if (count < sizeof(event))
+		return -EINVAL;
+
+	do {
+		spin_lock(&priv->wait.lock);
+		if (kfifo_is_empty(&priv->events)) {
+			if (bytes_read) {
+				spin_unlock(&priv->wait.lock);
+				return bytes_read;
+			}
+
+			if (filep->f_flags & O_NONBLOCK) {
+				spin_unlock(&priv->wait.lock);
+				return -EAGAIN;
+			}
+
+			ret = wait_event_interruptible_locked(priv->wait,
+					!kfifo_is_empty(&priv->events));
+			if (ret) {
+				spin_unlock(&priv->wait.lock);
+				return ret;
+			}
+		}
+
+		ret = kfifo_out(&priv->events, &event, 1);
+		spin_unlock(&priv->wait.lock);
+		if (ret != 1) {
+			ret = -EIO;
+			break;
+			/* We should never get here. See lineevent_read(). */
+		}
+
+		if (copy_to_user(buf + bytes_read, &event, sizeof(event)))
+			return -EFAULT;
+		bytes_read += sizeof(event);
+	} while (count >= bytes_read + sizeof(event));
+
+	return bytes_read;
+}
+
 /**
  * gpio_chrdev_open() - open the chardev for ioctl operations
  * @inode: inode for this chardev
@@ -1273,14 +1397,48 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
 {
 	struct gpio_device *gdev = container_of(inode->i_cdev,
 					      struct gpio_device, chrdev);
+	struct gpio_chardev_data *priv;
+	int ret = -ENOMEM;
 
 	/* Fail on open if the backing gpiochip is gone */
 	if (!gdev->chip)
 		return -ENODEV;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
+	if (!priv->watched_lines)
+		goto out_free_priv;
+
+	init_waitqueue_head(&priv->wait);
+	INIT_KFIFO(priv->events);
+	priv->gdev = gdev;
+
+	priv->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
+	ret = atomic_notifier_chain_register(&gdev->notifier,
+					     &priv->lineinfo_changed_nb);
+	if (ret)
+		goto out_free_bitmap;
+
 	get_device(&gdev->dev);
-	filp->private_data = gdev;
+	filp->private_data = priv;
 
-	return nonseekable_open(inode, filp);
+	ret = nonseekable_open(inode, filp);
+	if (ret)
+		goto out_unregister_notifier;
+
+	return ret;
+
+out_unregister_notifier:
+	atomic_notifier_chain_unregister(&gdev->notifier,
+					 &priv->lineinfo_changed_nb);
+out_free_bitmap:
+	bitmap_free(priv->watched_lines);
+out_free_priv:
+	kfree(priv);
+	return ret;
 }
 
 /**
@@ -1291,17 +1449,23 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
  */
 static int gpio_chrdev_release(struct inode *inode, struct file *filp)
 {
-	struct gpio_device *gdev = container_of(inode->i_cdev,
-					      struct gpio_device, chrdev);
+	struct gpio_chardev_data *priv = filp->private_data;
+	struct gpio_device *gdev = priv->gdev;
 
+	bitmap_free(priv->watched_lines);
+	atomic_notifier_chain_unregister(&gdev->notifier,
+					 &priv->lineinfo_changed_nb);
 	put_device(&gdev->dev);
+	kfree(priv);
+
 	return 0;
 }
 
-
 static const struct file_operations gpio_fileops = {
 	.release = gpio_chrdev_release,
 	.open = gpio_chrdev_open,
+	.poll = lineinfo_watch_poll,
+	.read = lineinfo_watch_read,
 	.owner = THIS_MODULE,
 	.llseek = no_llseek,
 	.unlocked_ioctl = gpio_ioctl,
@@ -1512,6 +1676,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	for (i = 0; i < chip->ngpio; i++)
 		gdev->descs[i].gdev = gdev;
 
+	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
+
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
@@ -2851,6 +3017,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	}
 done:
 	spin_unlock_irqrestore(&gpio_lock, flags);
+	atomic_notifier_call_chain(&desc->gdev->notifier,
+				   GPIOLINE_CHANGED_REQUESTED, desc);
 	return ret;
 }
 
@@ -2948,6 +3116,9 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 	}
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
+	atomic_notifier_call_chain(&desc->gdev->notifier,
+				   GPIOLINE_CHANGED_RELEASED, desc);
+
 	return ret;
 }
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index a1cbeabadc69..8e3969616cfe 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -54,6 +54,7 @@ struct gpio_device {
 	const char		*label;
 	void			*data;
 	struct list_head        list;
+	struct atomic_notifier_head notifier;
 
 #ifdef CONFIG_PINCTRL
 	/*
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 799cf823d493..10183d4d4276 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -59,6 +59,34 @@ struct gpioline_info {
 /* Maximum number of requested handles */
 #define GPIOHANDLES_MAX 64
 
+/* Possible line status change events */
+enum {
+	GPIOLINE_CHANGED_REQUESTED = 1,
+	GPIOLINE_CHANGED_RELEASED,
+	GPIOLINE_CHANGED_CONFIG,
+};
+
+/**
+ * struct gpioline_info_changed - Information about a change in status
+ * of a GPIO line
+ * @info: updated line information
+ * @timestamp: estimate of time of status change occurrence, in nanoseconds
+ * and GPIOLINE_CHANGED_CONFIG
+ * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
+ *
+ * Note: struct gpioline_info embedded here has 32-bit alignment on its own,
+ * but it works fine with 64-bit alignment too. With its 72 byte size, we can
+ * guarantee there are no implicit holes between it and subsequent members.
+ * The 5-byte padding at the end makes sure we don't add any implicit padding
+ * at the end of the structure on 64-bit architectures.
+ */
+struct gpioline_info_changed {
+	struct gpioline_info info;
+	__u64 timestamp;
+	__u32 event_type;
+	__u32 padding[5]; /* for future use */
+};
+
 /* Linerequest flags */
 #define GPIOHANDLE_REQUEST_INPUT	(1UL << 0)
 #define GPIOHANDLE_REQUEST_OUTPUT	(1UL << 1)
@@ -176,6 +204,8 @@ struct gpioevent_data {
 
 #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
+#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0b, struct gpioline_info)
+#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0c, __u32)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
 #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
 
-- 
2.23.0

