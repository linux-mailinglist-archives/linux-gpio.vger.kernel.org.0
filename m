Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99283158BBE
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 10:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbgBKJUM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 04:20:12 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42513 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgBKJTy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 04:19:54 -0500
Received: by mail-wr1-f65.google.com with SMTP id k11so11269132wrd.9
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 01:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7GTgwOZ/m9C2QqpKrDaMOvg9J3Lcu2z6erwzDJvekDo=;
        b=H95hoMBxMEVyOsiaFOMnk8DZ7YCYg3rahxk+c0AjSfoTey9rzABH4itLWqBznp6Loy
         XYbVnE6etn1hNULZ4GK4CinkJDzCd5KQb/BtWW5auhfy+JGfYLvo+4F0edoOO4zQ18Lq
         8DIhtLp7razmgUI09SDQD9iBYl1vrDXwgbCgg9KUa+LK+TWj1KbM8nbOElOkCGH6yC30
         6vNmEO5bQ5ap9JWjx+t83N7gzV9nOHAniSlIyWNdEtJEZwPqsRCJ2a7wlmqKhtJNyneR
         uCAbyDivqDJrFGSM9Iq1TyWBnj3lEtaxmThCl3maD+JIpc251tkVxPAP7iilOHP8g4Ij
         pV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7GTgwOZ/m9C2QqpKrDaMOvg9J3Lcu2z6erwzDJvekDo=;
        b=uLnkmbmgQQkO83h0JyO64VpiaHBmQnFkEElTFMPC72HET9yOa1a5KcMJkcmY+Id6CA
         pFCKifdOYu1FqS57mY5f7yk8gvJYUVGa++rnAvXfpleQbreiD6oAaw4mAPZeK09mpSJm
         sc8fbGLZogCiyyz1mRkWNpwes+YirCeJ0JM/ehIsGK+9lqEs7DmBu4iWLHDugWMrKC5E
         H31lnF3yP5YkWHzP9fsUMgT5OrOlukDok/0PP3h3+fpDgIKqhqnRFQGWxiPcNvMx1+SD
         CEXujT/y3wxu9wG6nNyGLn9s9UombYoxJevSdF108lRWQIbl7f8Y6zQaNX1ra0YA1Nk1
         /Q5g==
X-Gm-Message-State: APjAAAU31B8B/nVIiMC1qwPvwYegPo3Wp3CYd03uoksXlyKgpgqLD3M6
        JTSHHCT+H81Kg06s7U4+aiHmWQ==
X-Google-Smtp-Source: APXvYqzo/jfOQjm9eCVixJUwXFXn4gD6kg9mF9LV7rqqQHRJBcF0NxW3S+MlXqwVDcExN3TyK3JFFA==
X-Received: by 2002:a5d:614b:: with SMTP id y11mr7105255wrt.47.1581412791447;
        Tue, 11 Feb 2020 01:19:51 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id y131sm2958622wmc.13.2020.02.11.01.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 01:19:51 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v6 6/7] gpiolib: add new ioctl() for monitoring changes in line info
Date:   Tue, 11 Feb 2020 10:19:36 +0100
Message-Id: <20200211091937.29558-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211091937.29558-1-brgl@bgdev.pl>
References: <20200211091937.29558-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c    | 186 ++++++++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib.h    |   1 +
 include/uapi/linux/gpio.h |  30 ++++++
 3 files changed, 209 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 443321f9cf63..f73077f26eff 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -546,6 +546,9 @@ static long linehandle_set_config(struct linehandle_state *lh,
 			if (ret)
 				return ret;
 		}
+
+		atomic_notifier_call_chain(&desc->gdev->notifier,
+					   GPIOLINE_CHANGED_CONFIG, desc);
 	}
 	return 0;
 }
@@ -1201,14 +1204,25 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
@@ -1230,9 +1244,9 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
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
@@ -1245,11 +1259,25 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 
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
@@ -1262,6 +1290,101 @@ static long gpio_ioctl_compat(struct file *filp, unsigned int cmd,
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
+	chg.timestamp = ktime_get_ns();
+	gpio_desc_to_lineinfo(desc, &chg.info);
+
+	ret = kfifo_in_spinlocked(&priv->events, &chg, 1, &priv->wait.lock);
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
@@ -1272,14 +1395,48 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
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
@@ -1290,17 +1447,23 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
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
@@ -1511,6 +1674,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
+	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
+
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
@@ -2843,6 +3008,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	}
 done:
 	spin_unlock_irqrestore(&gpio_lock, flags);
+	atomic_notifier_call_chain(&desc->gdev->notifier,
+				   GPIOLINE_CHANGED_REQUESTED, desc);
 	return ret;
 }
 
@@ -2940,6 +3107,9 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 	}
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
+	atomic_notifier_call_chain(&desc->gdev->notifier,
+				   GPIOLINE_CHANGED_RELEASED, desc);
+
 	return ret;
 }
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 3e0aab2945d8..5ab90746b519 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -56,6 +56,7 @@ struct gpio_device {
 	const char		*label;
 	void			*data;
 	struct list_head        list;
+	struct atomic_notifier_head notifier;
 
 #ifdef CONFIG_PINCTRL
 	/*
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 799cf823d493..dca320764e4d 100644
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
+ * The 20-byte padding at the end makes sure we don't add any implicit padding
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
2.25.0

