Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F78E1267CB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfLSRP4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:15:56 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54852 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbfLSRPv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:15:51 -0500
Received: by mail-wm1-f65.google.com with SMTP id b19so6230917wmj.4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C2M6sI+GaPDwiZ86mCdlGOwzavWJLidzR+bx2oQQ/mo=;
        b=nyAuIVTayku53ZNj5rodyH5uhOx51b/6Hg/TN5OKhAHxkfmt4IJxcaBubRU7mKoSkS
         rHUdPnIY3YgE9y6YQU5IErBzQSLrGhAQoC254UNCGRp2/nsM2ovOtATx4zq6EEUeqpYe
         S6hl8c9D8DhIWWEUdbDqdSKDwdQl1DejKZH91KmGb9cdB9tMw6bkR2P2uvhpVs5rE8Cd
         EeJXQXQfzTMILAQdk4PgDcBDmQul/I56SMoFzHIeDS9snWo3ACFgjQqiP2G6k0gK0UEf
         pf65ppBcu53OPNeoi60SGXWTydImHpAQjJxh20Wm6ltU/Df12pHY/VwOfJCgm7BGBaeK
         VQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C2M6sI+GaPDwiZ86mCdlGOwzavWJLidzR+bx2oQQ/mo=;
        b=iQ1tIVrttlkNbSduUyXE39LK3FGpqnQikZjqSxA8loPLmMUCnv7CMln8Xz9UsiQ3Wk
         XkwtdLNcqg2SaDiJpRVYndnDOzQKGyQqJLNBTkruK3mp4YSeP27KN0iX08RLO/Q6M7Mk
         TGL2p7oe5Flptf1o5RbB+7I/XYDOk5TZxrsNeKGtVzHPBLxibAyMQ57r0HWWh8FHM7GA
         2Oe9PfCKq4lB5yk5ApGTUg7RjyW15Hg+ZwUkqj0U/+qlsV0nfMJDLctavj6435je5odB
         sJeI1Zqk0AVM8UwvJ5fnX6p9bDdwdEH8Xu0wp77mjHU34sHJcmYJ6v0eowaBIFFxynf4
         Em1w==
X-Gm-Message-State: APjAAAWOXdS1NP2UJptYAUgeoF/yNBx9JVJQLQ0UnsBCUpFONmilt91N
        fWkUkcui6vUQ1SocnuqSelwaeQ==
X-Google-Smtp-Source: APXvYqzv+7PBu/6hraYa2jFmjgRRClahKNcDeLbEpmS1C8tpgpAf8AeWLJqxaIEuIUf3H0RdG/+EEg==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr10740519wme.73.1576775748762;
        Thu, 19 Dec 2019 09:15:48 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id q6sm7401428wrx.72.2019.12.19.09.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 09:15:48 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 12/13] gpiolib: add new ioctl() for monitoring changes in line info
Date:   Thu, 19 Dec 2019 18:15:27 +0100
Message-Id: <20191219171528.6348-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191219171528.6348-1-brgl@bgdev.pl>
References: <20191219171528.6348-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c    | 191 ++++++++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib.h    |   1 +
 include/uapi/linux/gpio.h |  24 +++++
 tools/gpio/gpio-watch     | Bin 0 -> 26528 bytes
 4 files changed, 208 insertions(+), 8 deletions(-)
 create mode 100755 tools/gpio/gpio-watch

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 41abf17640de..a422086e6973 100644
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
@@ -1203,14 +1206,25 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
@@ -1232,9 +1246,9 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
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
@@ -1247,11 +1261,25 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 
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
@@ -1264,6 +1292,105 @@ static long gpio_ioctl_compat(struct file *filp, unsigned int cmd,
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
+	int ret = NOTIFY_DONE;
+
+	if (test_bit(desc_to_gpio(desc), priv->watched_lines)) {
+		memset(&chg, 0, sizeof(chg));
+		chg.info.line_offset = gpio_chip_hwgpio(desc);
+		chg.event_type = action;
+		chg.timestamp = ktime_get_real_ns();
+		gpio_desc_to_lineinfo(desc, &chg.info);
+
+		ret = kfifo_in_spinlocked(&priv->events, &chg,
+					  1, &priv->wait.lock);
+		if (ret)
+			wake_up_poll(&priv->wait, EPOLLIN);
+		else
+			pr_debug_ratelimited(
+				"%s: lineinfo event FIFO is full - event dropped\n",
+				__func__);
+
+		ret = NOTIFY_OK;
+	}
+
+	return ret;
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
@@ -1274,14 +1401,48 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
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
+
+	ret = nonseekable_open(inode, filp);
+	if (ret)
+		goto out_unregister_notifier;
+
+	return ret;
 
-	return nonseekable_open(inode, filp);
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
@@ -1292,17 +1453,23 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
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
@@ -1513,6 +1680,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	for (i = 0; i < chip->ngpio; i++)
 		gdev->descs[i].gdev = gdev;
 
+	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
+
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
@@ -2852,6 +3021,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	}
 done:
 	spin_unlock_irqrestore(&gpio_lock, flags);
+	atomic_notifier_call_chain(&desc->gdev->notifier,
+				   GPIOLINE_CHANGED_REQUESTED, desc);
 	return ret;
 }
 
@@ -2949,6 +3120,9 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 	}
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
+	atomic_notifier_call_chain(&desc->gdev->notifier,
+				   GPIOLINE_CHANGED_RELEASED, desc);
+
 	return ret;
 }
 
@@ -3111,6 +3285,7 @@ static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
 		if (ret != -ENOTSUPP)
 			return ret;
 	}
+
 	return 0;
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
index 799cf823d493..a37ad3d97c8d 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -59,6 +59,28 @@ struct gpioline_info {
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
@@ -176,6 +198,8 @@ struct gpioevent_data {
 
 #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
+#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0b, struct gpioline_info)
+#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0c, __u32)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
 #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
 
diff --git a/tools/gpio/gpio-watch b/tools/gpio/gpio-watch
new file mode 100755
index 0000000000000000000000000000000000000000..d67bf021afad6b6eec40cf10b673c5127e55b0da
GIT binary patch
literal 26528
zcmeHQ4|H4AdB0E3lAbMDcH+c|oq!c^Af!mL1B3+PL{98Prp|vS4KzWPW!csuORDq~
z5=PrVV8u<{g|%y0*A>osw$VS^*v2|aH);wijGcARt{rDxTh_7R(3Vl?dcr7pzwh4r
z>7V7b-FkMmb9{Z?`~KYT`|fwYd*6NU-FJ2U-u}Uz4#N<fOtDoE_25#)3G0mEn>7Lu
z7Mp|z=e43!xIouQp2`m^fLxU(9F@@0d=rrL9?<#KuwBbBWDg0F-a=`@t#TNOW<`^p
zlTb}p!;7?0hMZq4&rixoet9m!yS4ue%k?NWvjHVP+fxZyp6kteWRCPMXuS(skKyy=
z5E4U<C%I3@6WX6@*hfl83`v&KzJIYt32$B_$$4;#Vhe_>w;y`s=g*or><4st3&mxn
z_Mf4yt_Y=)Bcar2AeBrPP6keH+8Ee)buga^Zh!;i(=r^?r*`c*BtG!Sqifop-Z%L5
zzy9=fpZo4t(<6u5U9yhICwnAAiR5*068b<>zO0vVJ22rOUK5UI6JMF!{OZ}&#H^Lt
zz|@yaMfM$_{1qHUkZdja9SiW+FTfvNfd2{b{Wz*q2#i|g?puKGS%81_0{npm_`eUn
zA4hefmbj#v37Y!b64543hgBx`bAf&kr-t7svWZ+SlM~roGHs8EXcS~R6HR5}F*}(_
zi(Dc$DzceWO62XFohc9;g^WmM;&w`m-I7b%36aSr($I~cj77(i=~yaxYXT${63yGO
zoE@EvCDUTp;K24B(G9^3!D~cxU}$#~h7#k+yq(Am?cR~fq!UB2krZi;PiE3uGpa;u
z3Zhcf^BnrGgfZ7ZPc$IG*G-{4Sx-_YR5%2WCmfe^Eh^&`Jzg+>pXN`5RX+2Xer}uM
zQ=g}@IXz#-FTc)b%lLYzl`5~4@f+C);Ds_iT}zy}U1?0F>x<LMu)@eT)t{3;tT5u!
zb<1g8SYgEHv57ccVLA&zd^zq*N{CHig%F=(L7Z@y&PpDEE~ZFWp(Ni><YL?`<I^?5
z=}1^%B=2SBB3z8XVgwc=uo!{G2rNcmF#`XGA`m(AeJgU-`7OK`MDCig9dpk_&OBi~
zUi5J8n(rcOZtV*=H+6)85j{cq=bxWLTKf+~)1%t?XC(bqqUllc{EVcZCYm1E&Oa#W
zFA+_TYUl5l^dm&mBii|MlKx|&>5=pNX-R*YXnLGFpOy4)6HSk9=Z7V|0rc28&@%PD
zqxW#{p@FG??;SdHFmn6%p9A;Ioa4P$44f^9$aK$-nuO?{neB&a<n|{h_hIt=oyU5Q
z_8#lKxi|Xw)SHpB@3FdP9(CXWarP(#@0#hIdZOv>wGf={e{*2!Uk9d-HSeCj?JrkG
zrc<5G-}5$gh{&18t-;N2*ay02K2Oh&k*R-sE%KSj+3UN%Iym*?*=t~Cs;{#-a<;DX
z^d`}C*CZI-Gm)v69`!sFndzH)arR4ZQAzga;N<V%NqP2F(C3dptZ!<x(~3+V?X<?8
z?CbQJs79)DcyRifK8OuY2X;!Zb`QY!9EHmtxf_rCk5Z)~Q{S2WfV6sQ7FKU3s~;z;
z4q5o;X>Nu5{LI<gI;}^jO(Rn;&)xuu$e9Zhg~Hi8J0Aq|%ms%%dgg*@Z#pw;*oPu#
z8+QeTc;rfCsbZ#k(quYDrhkvLr+fYy?*Ox1#P|qKgHtb^wL6Ewe-V6C`|JlgAAtJo
zqi;gu?eJ!B>bu|j$HA#rzxVgE9|I4PZ$R=%`RG17OHzAa2XXHH!NAnBH%F$v8#(jB
zEBl59r=2&Ts*&l&uaW!HJwJi$+;Ueyh#xg|^hwqfh{&|_4g#Am*vrw~zYXW9yVuV>
z-_&s$n&NQ{Vd6$9f6V~`SG*OOdL{DM%iAK4T`(iYmm|-<WiNw)Kh*}Tx#!1ZIjn!W
zryF{r5Q?1X`6z|xP-N;~Y;WXj&wqfL-3|9<C*b0-FFP#=8m!0g{4XPOEZEd>CwV2#
z^}b_px@X&ZA$kuFOnpQ5?B1!L9EwZ_y1+g-c*UFY8h-3eb2ju7gzl~%*#7QsvH`?&
zaO!3Buim+3-$5reBAdTec!{p@vMxVXDv+*xX|G}wkiIOQ79+42fyD?cMqn`lixF6i
zz+wazBd{2O|K|}f@YN@mNF`$V#Hfg8(qqYSe|#dA9tW9AysMDFH?C1pNYm#nzn$^Z
z_cH%@7T?e&lG!qTK4JR{SwB9{Cj7U=?Dzye)B#;vxX!;e?~mF3wW(AAA5i2sJ3oDv
zOQy&D_C!Le=o0;7qa02pN8j*BPTEpJ{=|ty+7`+534E*@Rg~X8l}-3_iFhJ;A~EV8
z%Vj2|>Enr9I+2o}ZPw<m^KW6lxB9n`#V!rIxB7#@pcE6vD)V~!_DB;D&HpwxcQ@dJ
zfb=3f1Nao+{Xd+WI|6v_)w#Kq^rHRR+}tohB>E0b$+-1^FitibtGsUOoZ)UJK7Bk6
zL-%bYpi^ymft3|X{`AXpbN7?1uX(3$<qb`qTddP!Tl@9vuj;&n*rbowTyX(%7BO@h
z1U!o474W}BzHRq4|EgoVZ{-Kg?LPl>UB7SL2b{gWu3vHW`Zk?$@A92<+}z;XwA0ts
z>stp2NJ3+~&+1iQx2TNI;>g1P1fa4vK=%5J_WH<PMA-}He4Aju%9{M1`6H;`3p+Yw
zWNk4mMqn`lixF6iz+wazBd{2O#Rx1$U@-!}zzFdAKwb~X&)y8ZT$WyN*r@4c`UQp7
zw^HJDhpQA>Tti3S5-IWeLweVt#P1~k{?=SZ(t7b8ugQC`PKv2Dw?MmezIq#@Pk<`%
z8oQO6Ualbnt%esY#i0+-l;{gDC4SGM56P5PC?L-1#f{8=SUbjkvp%m0<nrH`Q}uxv
zDT=R?vVQk!eSF1}G{^T9O`p{HuWP#KxAy0M8}PdF>T);gey~%+!y1lhctXQp(eNW0
z{;r0f(~#{>gcY`H$Byg#>#zd*3jby-r|sf=hF1bnZKqm*e}_>1&djm|sh>FnzDE~(
z8gWZ$3s8qh<E&d$`^9UZxqs_!SW?uO^5<Mp{~4_>->K(G3!&sgC`^@izg~a)t{Sq$
zQvNldyDRyn+CE<&D|N?Zy4uWoFm$|RSL1knlPidPx;AMUu5p@5tCQD)W$Xs-{S53<
z_E8*;5G)ugJl6rQH-#Sn$*gl?eYL2&iinGGIK%+XmT`s{NL!&*D&aSAA=Qa@f^Ql3
zBdFf>=;5?HBuuh8%>p_MYcH}K4mbVe!cpgbH&K@RBmu*<U*<Xg4w~8nhvj?-HLaT@
z@q62Df{nU3;lHtpaHm!G7sz%zCMlOSEz58nfgLyDF6+ZMyMF^G>sm0)fbV@0hY2$%
z@wyqZ|BV$}!LRED?p)P+EpU|lhm`XOoN;!ne^IjBc^IiD%WvUmAe|23`8ebvuB)vu
zM7_H}xUR9DLYDBx5oy;(Nz{37fUfIW_shtzyzeJslO)!OMt2<*>DuOs!G!N1Oc=iJ
zK*HhsZHk5Pq`{hS?Y2HiMf?sGv1bLjAiT%O&|d4Cz$4y!C}*E6Z=ZKLD(TuURfa@8
zIrJycmQL3R&))#I+@02ofK8Z!b6-|}P#Sy{Hr$st4T7li{*Z`ul5h!+g|eQrx~(*z
zcLa5_u5v4-FN0%kte3&{UJfPeT1hl}SCiN#Nv!n#0f}vvgx~uzd2pR1)_D)XS?hX9
zba~xmV2dO+dA~+FJ(37}x01E6BqHATlTNQB_IYQ>+IC4C@m@>@`dZ%y)nRXe#C9&5
z1~K8ii3~)f*IBQRhyh91-j9%h8$2=8`=s~VWMKEwE)b`^Arjlu)DPkg?<dHez1D{S
z&Ul|BvHeY-1aY_bV`SjQ#z}~s^X5tCohzuq_j=z;9vp4^Jc#?fxKf05OuF-c_i8e5
zbNwmkJm~dNPPF0AK|JhjB?H6Kw;AtWK+_trz6kIHS_Poq-9|0f{LfVA+k8vNAD4B9
zJX413q~w=uZ_2wB#F8wmx~xwTdK*e}Sq}k~vVY66Eu!v=@Ty^V%P+$b>thgWnDV`d
zY?o|!D+wD7@0T2_i*nB@{6C=OY4=ixsJ{=V)yP{a+)DtgyC`o}JF%?S3BOp%S$7iN
zA^9!KfO|U}O$Q+4vZyPyv=VELVp%D;(AcRi;MWP?pllq3KaJNae30<#CBEz@2!qk;
zB!8+0aO2}$ZXuSB!-~=BBMGc!l4-dqd8^0?YKYI`XpK*d3u9#mU7Y4U&%CD<bL7Hk
zlNX?Q&*}HHW^w%(?ag#~nfF|H_X;9cxybA-U`^s!kp!oKIOjo81FiTaa2kozgi1Ez
zSdmNE;58Gk2lQ1qRvI`Nt7SC)0O)6Nv?kK9zq*+sWZv`2yI15uUerJh_;qAIi=*xD
za59FC^ZLfp{)R@V+B1mJD&tVSIqQc7O6{FX6w-t2Z_4Z;r<az(iT2|<YXDgnRF>lw
z=<heWMEeJI<{@Nu;Gqg;9k<~OZCc?5DF=SL(*6l87K7MUC01{4^{X;P`wKcdjqDL^
zB~Mn2ZdfoIu(qxJM`b2%XA{|?iB^5*yA>wxli5QknaZ~&MEhQy`#$9U6)QiimAM>;
zb){$@){^AuEK6QiEancKO<{E7kYT)uvsZsaXa5?qE_$HMl$5)d<;2B*gXW>5VbJh)
ztVdMo@ICJBSb|2Rqv@gcjt2ngXuiUG@k<b<qrq)9c6=M%hYt5f@5P@6lMe5M(d@qz
z(rq}Fh>mw4pAK_vqxgHkIuU@BWrR>E@9&{Bx_ehYryK@f-*HX4Ejqrjq90;)SL3Ab
z(oXecpzn^3=DN3_<4Qq*4!5wZ9H1PA8|W6&@IF2vi*B5j^&y;bv!|Q1=WEb5)-}bz
z@-)CTW4*#}BmR{NznJ(ziMzfIK{}`)y5)I2A12AJrl-lmmk95cc;g=v9yR1Q7~~-Y
zG8rHDy-Ybf46b~lnDZ3~HOVnyM=SYG4dKDjB*%mumr_;Ypy`&|^sCZJ7xDfS^dI7A
zK2N;E&0+9Nj2{M$CC|2iLRzbUp!?KPj0W#$qNuKi$YnTMexSvc$t!4?G30o+ScdNV
z9tbUG8|0v9rK^w*<Jw03Y<4pWw~PehGz@_i=zXPUGh>Npb}ccM8m4cRZ>_Hdio#f8
z0P_&18Sg}ntA**i&U3wIvuB`XTbl!~J7%Zwc(!^>i~x0)i2-s>8am{vZRXI5C5AMm
z^)Q^4n`kX70FP5mFpgeBfK0np309>WTiVc%3}c|hfJnm{I1z%9rv(-9c$Bx4<83Un
zy$KSHb;ec?87|5A)<I@9@|qxQaZO3Mx#Stzss&<H?9w%;Z;N)vsiH#sWkF+G8;9!h
zwt*JJ)g4~>(d}*I$#Q3zCyo_=wjH5ug^^-`6xbCN3?;O(yy9B1t)Xaa30l2<>J9^~
z)-8jv>iu`%3+~E$w!_|PWC+T@h{G~?WDkmMZCl#XKItrKfZ@4<g{Bt5U&*TM7*w_D
z7A*yfnoV~MXQ`{WxVhXEK#SYAez|eEj8KD9b|p`FeaTO>;&O30KqGln3UD#J7#u4@
zU(BJvH`NGyb9os$rb|2s;ZirLEUnQDEh>I!=Cb%MFU7aDGF%kF8W+V8a7{rEj)w7u
zuMubYLwmHL5e$a%r}CqTY(9kFGDkOJ0FXa74IWg(Q@w*<<jk#x*&N({>DJwyorM!-
zvpwO!FGGz>rR|Gq*~Yi=q#cYSONbZ_Q-pB-SzL(c>}1IU{_Uyxm@ozlJt2n!Mnt`X
zUzyFX3Byqb-Y;R)GDSN^o_U3YCewCkG-k&_Bf0TZ=oEf>n+c5+lBv<?yAqRyP=53{
z1tOQp*!fUAlS^#C@45ro%<)s|m)@a5J{L-+<Eg@EA~ce;^Wqn2@#iz98cI3`x6Aya
zpQe{(>YVX-yarcJdT@<?zVd%scw+g<z<45^$R*?G0xD!!=1@5Ki!BDt^@}w~%^IQ=
z9C;yVg+@TGA5k4xvV#+JQOKWn1I5D#e#kwV7z2(jhslXRDuvAeCg^R7^nu~dMoUb9
z;YNs`e;49*bmzceKNz?pmM|ES@?`T=o_;}|!jHNkh4Kn%prgQ%Ii9dHSvyKCpfbne
zX`9R|XV3u@E`M4M6s2yVUTz1HX_^_pjgGDye)lk24X2|;re#jUWu7#gPOH!9aG75c
zN31nqwOC_Be(}9Qr`u)RU^|^RI^6-VdYn#|;au)I?%HB4bzX{z6Nl@Fb2&lSl;jOg
z({<z1kTIMsPXT{BnQ*#@{UK*PP}7AnTtMnvZ~ubR1H|DvDsvpJ8=Z}?S9hD)aK!1k
z&AipNoeeHC9|W7ku5g+y3)rZ0-Q)_o?vuH7E~`bBTIWhTo2Vqzz-4+~u>RcX1!=m>
zJx9I(%ZAfqUWxKteJ<-9@Eq{NBzo$I)71jxCZ{(CFmWU4Ih+__JZKwJK4Q)vZD_Rk
z?_Z4~ks3pT@!(nPWhhX!A3rCWj|<enY%-|v-eow~nM;FC!%W+Ry;{Wlgl!=nV!zAv
z&K9R-IMMVbs@-(N=|*dr2$&_I;q*)Rq;rj?TP1|5qUn6ZX)GJVTBV@tF|)ytH-cku
z?&lie)1?ufCmYSnjkil<=%YO0XueJJ=H047e5aCwb3PXjjV4A4<DqdxJ|5Z-ys9gZ
z>k5r0?NB^lpv^Y?y$AhZ(`+wMJG#5o+^;_{x$$b8V!8N4j~v}V*oAbWNaXX0tH2w}
zPR8ts9#H<kxIeIWgFk@A=^0NKU@9;MxM?#QPOcIQj3rXZNo?g{Cjy0Z0n6F~(!GEj
zN+3O%$c-lgu~aI6<!-1-+RlTU%M{YI)C}I(6QI)>6cLLb4`g#0JAu1aj#QBskmC>t
zJCzSiW=0dK9_lj5SSpY>nTTW0hrQVU0j8o<wwND1eUqKHUqxslGl_c~-6n6z<c{aF
zv3P=_IFiX6N2kU(9<no;R6aywoQP&{3(bs;VcnhBwQpeW;J}{#=#EJ5o?ZQY(H(pD
z>>SvI-6#rpu#gVLP9&l<S3sj8rX=zcnVjvXd0k>i5$v0BJZei+?u-%5+BqRNzfcSA
z$jnG#EINXfg0P%OpGfAg%Lewx$YGgXUMkXZJy}e2ESJCz8F|tmH?G<smjf>7@PYpQ
zhx!i=_4mmEoZ2y(Opj%vyb>{5HaZLGPn4RoQd;f!fz3FuUXV^yy=XL_$Ce&cF{&VM
z7J@cJ^TftclXxMAaXnR-O!I~!IavT|M1|sZniH|y_z77-x^vL|L~bV%MeQ)eqows;
zA{93;^qcWqY!dZ2p?4&Srel){+*b0*@ibN`qHZ~1CnvGOGB%l|GUC{c1bdE*i&7nm
z(o`AhuLX2p>57UwoTR3tFsp4%sF_szsfJRQz=l%uP_uGdQjeI|c@Fds_V*q{Q^1)d
z1d44*w?+gs8ymew;6zu8?no70qVrSCYSdr4s-jSGlYEF$$Jlr^wGv?j5gqKiBE^!U
zi6}inDz|Y>7P6`r%F9d-DcAnbh7>)j(8%&%jvt6dDmI=+Jn7OeMO6k{?Im-<rnR!%
z)u{$~y85&PJx5SvDMZ+DCY4CzT9!8HsU}lE)u9oG@%RY}2aPS!SS}YkrFNAOxbU*z
zW3!rMCBJm<()-t7^p#?j(kkBBTw<POx=<iXqj;2bNkDZ)_@#EYsZ>*@%IwJg^#5gq
zuNcht4eVHG&|hGjuQ{;Oy|ps&BOgz{8sZS6OZ7Zvop{YSbRSbIH5Y=6?kKVjGdiSa
z6qPPh3C%UcVMc$yLa@>|Ny%4I=Fj(bh`r@$V?!KclwBq#hKd#FD0(}@=#xd(F-F;C
zrOOn1jY1eLufPy}OIRRXq087%ENdU5Un#PVGWv{WIYeG?;n8CB_A$y%81e&YRmmZ3
zqrYgYtA>B`r8d-%V$*DEf6?WAJhA>;CDtc3`qdJPC(d6hv0m5c8zmMOQ-Tw^(zh2Y
zzrU1O!gx~s(xTYDdo=p%C00qk7Df{xl+d#oy;*U<I?8B5vsBO4!~%fL7-ERgVJ(Ut
z#Avz2|EdR(CYv$Denv-%7H?*>+~WRut!apEtwLYbDdBolNa>6>*P_@a&31^c`xs{h
zLsX9_B^!icorz3EZnMJp(Vi!3__4kyrxCv5`7*1{ueQ&2SLkxs?nTS0HGev7A~41M
z56i^y!c*MGu#An@98=8Vjk`LTc=M<4(bdVsJOHmJD$g_Ve$MNTD*0}~>vJmkmbe#F
z3f0LJ_2S{0{D$JXqH-O4yvH<iIY;3pb_(;?<Tr|$ntWgJGiJFp6FaGKdsp&d#9z))
zxQVYryzgUqu8D88`_`0mSiYsW{;NFK#EKGL_f^SXE^4hWGDWN4edj9WF-;yW=P2A1
zE5&e4erbQeaxKh7mXk%?6swAOIbzCHMCBZXn}X(7=O<HsYpKQWn9l^KxR$0W*A(-E
zOmhu&;)iopqT-<i_}&Hhm_e^;rxSb!K5;*<M{STYU4}F9n=vC^o;GVfuN&mNy+91?
z&v<uOama5<G>jWH`omq|lYL%?NV1gf!C{E`{pvyRYsF!qdVN9KSt{<l1V~k?W#_M?
zOv}7}`w!q7Vt&8<XD!d`AGwGhOJx3aRF8ldw8}8dk_t9BC=T<-fey$orTFV{l;cTj
zvZ|U&8rluMztXg%o|gRi*Gm%oW?V<vaHY}};4gK|A2+hZuN0NkoeS_kx&Z%E3-F%;
zpZux5uD=exzec$)fWHJ^%_hQ?nLi{xEU^;ifK@`ADV{uK$G2?yV%&^=doHZyG@$RP
zB+s8+-lqA@utW0Iaa*nJ^Zk?81Fn($O4~%y3XWRw>|cO?;{tqI{Z-4(9pF=Zs{Q;R
z`2P9s$ouXkHTbk|aLs*JV<X8x8dG6-!>O3(z;ssLE?@_lxF~Ik8nq{*aoQFYvnbKg
zOmsYz8HuH$qnJj^M`QRR5zkC!QwjXEG`Oj&8+)qO5-NYk#ZNwSr^Fa0R4^A%n4COC
zFSRAA{54sLmQCeGqdO1u?(UEF@9B$TPu5CVOg{A8xTkmbz>dlsImZbWCM=`<5p5yT
zcR)mU4es6EI~d)&bLYYSq3BTW_Q8I#T6}G$H*?T<!7tm5HXQz$w~$T9xem3fZKax=
z;i+WNj9VpV-sZK{*<@bNB~))$8y(GOqWJOeC~aj+6Bng<%(4o~c>zp*<@4H%oF$}*
z#LA**I;4`LcI>U>>DjbOrkYTz<VB;{YL^?4_Ta6#v2Nv7zLgf#%v2>$1oNjRF=GRW
zX*~%i7{i=fB9|3G+3hjO9F!j}14+#4N>=aofq)$w7eUIKh~+0laP(9f_7ucKo6I?Z
z=~3E{xSWV04?nw(k%GpuDO&_(Y=c09;~9{4;v~+pM+I{k*)f8N3ElH2Mqz|0rK)Cx
zlm_D{AvTFmf@F~_!#SEv3!?o*5ZB=({hT@|=g6T#zx)PYku(R(cx+?@6QfMg6fNTj
z7o(VCWmH?LF~s~_EP7(Y(2RSgO8maSu=+`lWXsc~An?hrs9(J=Iz11Sr{euXGdBX3
z>+|~uLw~t4@M`@&@P3T7{_H=$r!ZWn_4zddt86OL9#FKpfc5!(hT&;lVSI6vabkU}
z2a$>1Bk9$M_4&Pr;gd?Nc&?5gJ<s7Cu;@R(A2IZ6P4=J5VR#(*^xFug`8|pu>sR})
z&5B!rP)u3>VO<cz=d>V~UtRw@wf=T3$G`VrSgwz!HU5<Vo=jBwAOOXL{F8~_$226J
z@>JdaQ^+jW_iH_d_m?XJuQD$_T%|vw1sHOD*$mSRf2&HLpH~?6R=qcK`E2i#Rr>sX
z$*`UUHLR}xr?ft|pYUrz4V$Yv9Q&=M#2*165!UDTRfbzwP{Zo-zgVTu@3jm!{gm?Q
zJ%JVkbC~$~pZ|YBwZBX=r0311GJSqeekA}V63Z#7L^J=NkU@Qq%jfrL{{IlqYyY`_
zvL3hNz0f5Q*5~)`=V(n3(mDl-XVz!<5^~D*MOce=DLAZ22CT>MHDr|Q4~LcHu-0ck
ztM!?F9SGTC|4)ZiPIdu(zsfG2-vUPEYw;qV^_LVm3L#la4BbE&S2^l@P8;m1%B-$W
z>jL^SdXDhQhH|U(%erI%{qJ9|^s*cnZKlc{LH<?qNc8A7rSN6$I1A`+(fZZ#yJV+Q
zpykiyiOXWROY4`*5Po2{;>4;hSk`0t0}JTS>{k-^v!I66@h5vcc9e?_A5hd&+W$*I
qUW<eKEsy^+zEy=-Dz3Xp0`Xjx@oN96f7Q|#v~B}wxJsdl6#oe#t^DEu

literal 0
HcmV?d00001

-- 
2.23.0

