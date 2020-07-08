Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB997217E0D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728868AbgGHETI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHETI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:19:08 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1044BC061755;
        Tue,  7 Jul 2020 21:19:08 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id b92so609556pjc.4;
        Tue, 07 Jul 2020 21:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lgHf/mGY+UlgAlm73qvEOx3bpdQsypqQFPDG2HWa7cg=;
        b=C0kxEEDHVaO6u4cmXjvqBxLtJWmd/TYlTe6TEbxIWZELugiGCqf1RZmsMrZv30BPrg
         Ndgknq8qwTvWniNn/xJ1bJQgJAkmYjYeOtqbwLmiTDToMXPuNu9I22STelFxExc95CnI
         81oUrzTEAZjiioeQSYUdMOEi3X/qIEwRCc4kumFfUe/D/auu3D41R/NDEP25HPKJLmD8
         iIl8p4/oDZ0Uy92h1RqCO5f1/j2LMJINKwQ1/KMgxGkt0xlAD7X98Vok2fo8dxhx8Dto
         GO5NjB8iMRfjvW5rns8dNQyR1YGrM6/KGBwYH54NPGlcD0JTiIUJbU7oHgzfhh3GiTt8
         KmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lgHf/mGY+UlgAlm73qvEOx3bpdQsypqQFPDG2HWa7cg=;
        b=U1Te2ZluwZPND3ZubwuqRa2pnN71YL3Cv6IcaY1lS/p0Li/tuweq12W1rbq9VijrLb
         Do/S/CLf26iSA04jJV/JtT5yPAi6Y+NcE+dbql1M4ZkiMWGhxYEgJvnzB7hXfaDX1Mi0
         7fXulZ8sFqvT9oMJqUUHLQ63KSi/SUPlIujaO4eRKZIJRiZI2icx29xc1Kbwca+ZoybR
         MWA2SqXq6IpflkdhmB8udFdhRb0eHa4toNzsHnannWnI7gPjp85qVUbXKKfzj1ZCRbUX
         5gW+/xys+kehFu1UxBW84vN5nXsbV1IIgJCYvDaHaJa9NN9mO9C5PnQ5GEVJMbSM4F6q
         v9YQ==
X-Gm-Message-State: AOAM531IEkJNci9LJFN85L1XbEQPs3B89/y7BMw54P2FWsUTKjxuRlL/
        KePpSNn/aGSQui6lUT9QH6BBHijp
X-Google-Smtp-Source: ABdhPJxa38qkZnGoGFCV3uPwCi2FILM5VoB84ENlKOoA+9dhKo4+4JPZwHTHTNf0RYpMLvUQbQhl6Q==
X-Received: by 2002:a17:902:ff10:: with SMTP id f16mr48622667plj.277.1594181947104;
        Tue, 07 Jul 2020 21:19:07 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:19:06 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 05/17] gpiolib: cdev: rename 'filep' and 'filp' to 'file' to be consistent with other use
Date:   Wed,  8 Jul 2020 12:15:48 +0800
Message-Id: <20200708041600.768775-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename 'filep' and 'filp' to 'file' to be consistent with other use
and improve readability.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 70 ++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e64613b8d0ba..0d3a799e09ae 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -164,10 +164,10 @@ static long linehandle_set_config(struct linehandle_state *lh,
 	return 0;
 }
 
-static long linehandle_ioctl(struct file *filep, unsigned int cmd,
+static long linehandle_ioctl(struct file *file, unsigned int cmd,
 			     unsigned long arg)
 {
-	struct linehandle_state *lh = filep->private_data;
+	struct linehandle_state *lh = file->private_data;
 	void __user *ip = (void __user *)arg;
 	struct gpiohandle_data ghd;
 	DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
@@ -221,16 +221,16 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
 }
 
 #ifdef CONFIG_COMPAT
-static long linehandle_ioctl_compat(struct file *filep, unsigned int cmd,
+static long linehandle_ioctl_compat(struct file *file, unsigned int cmd,
 				    unsigned long arg)
 {
-	return linehandle_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
+	return linehandle_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
 }
 #endif
 
-static int linehandle_release(struct inode *inode, struct file *filep)
+static int linehandle_release(struct inode *inode, struct file *file)
 {
-	struct linehandle_state *lh = filep->private_data;
+	struct linehandle_state *lh = file->private_data;
 	struct gpio_device *gdev = lh->gdev;
 	int i;
 
@@ -412,13 +412,13 @@ struct lineevent_state {
 	(GPIOEVENT_REQUEST_RISING_EDGE | \
 	GPIOEVENT_REQUEST_FALLING_EDGE)
 
-static __poll_t lineevent_poll(struct file *filep,
+static __poll_t lineevent_poll(struct file *file,
 			       struct poll_table_struct *wait)
 {
-	struct lineevent_state *le = filep->private_data;
+	struct lineevent_state *le = file->private_data;
 	__poll_t events = 0;
 
-	poll_wait(filep, &le->wait, wait);
+	poll_wait(file, &le->wait, wait);
 
 	if (!kfifo_is_empty_spinlocked_noirqsave(&le->events, &le->wait.lock))
 		events = EPOLLIN | EPOLLRDNORM;
@@ -427,12 +427,12 @@ static __poll_t lineevent_poll(struct file *filep,
 }
 
 
-static ssize_t lineevent_read(struct file *filep,
+static ssize_t lineevent_read(struct file *file,
 			      char __user *buf,
 			      size_t count,
 			      loff_t *f_ps)
 {
-	struct lineevent_state *le = filep->private_data;
+	struct lineevent_state *le = file->private_data;
 	struct gpioevent_data ge;
 	ssize_t bytes_read = 0;
 	int ret;
@@ -448,7 +448,7 @@ static ssize_t lineevent_read(struct file *filep,
 				return bytes_read;
 			}
 
-			if (filep->f_flags & O_NONBLOCK) {
+			if (file->f_flags & O_NONBLOCK) {
 				spin_unlock(&le->wait.lock);
 				return -EAGAIN;
 			}
@@ -481,9 +481,9 @@ static ssize_t lineevent_read(struct file *filep,
 	return bytes_read;
 }
 
-static int lineevent_release(struct inode *inode, struct file *filep)
+static int lineevent_release(struct inode *inode, struct file *file)
 {
-	struct lineevent_state *le = filep->private_data;
+	struct lineevent_state *le = file->private_data;
 	struct gpio_device *gdev = le->gdev;
 
 	free_irq(le->irq, le);
@@ -494,10 +494,10 @@ static int lineevent_release(struct inode *inode, struct file *filep)
 	return 0;
 }
 
-static long lineevent_ioctl(struct file *filep, unsigned int cmd,
+static long lineevent_ioctl(struct file *file, unsigned int cmd,
 			    unsigned long arg)
 {
-	struct lineevent_state *le = filep->private_data;
+	struct lineevent_state *le = file->private_data;
 	void __user *ip = (void __user *)arg;
 	struct gpiohandle_data ghd;
 
@@ -524,10 +524,10 @@ static long lineevent_ioctl(struct file *filep, unsigned int cmd,
 }
 
 #ifdef CONFIG_COMPAT
-static long lineevent_ioctl_compat(struct file *filep, unsigned int cmd,
+static long lineevent_ioctl_compat(struct file *file, unsigned int cmd,
 				   unsigned long arg)
 {
-	return lineevent_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
+	return lineevent_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
 }
 #endif
 
@@ -826,9 +826,9 @@ struct gpio_chardev_data {
 /*
  * gpio_ioctl() - ioctl handler for the GPIO chardev
  */
-static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
-	struct gpio_chardev_data *priv = filp->private_data;
+	struct gpio_chardev_data *priv = file->private_data;
 	struct gpio_device *gdev = priv->gdev;
 	struct gpio_chip *gc = gdev->chip;
 	void __user *ip = (void __user *)arg;
@@ -919,10 +919,10 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 }
 
 #ifdef CONFIG_COMPAT
-static long gpio_ioctl_compat(struct file *filp, unsigned int cmd,
+static long gpio_ioctl_compat(struct file *file, unsigned int cmd,
 			      unsigned long arg)
 {
-	return gpio_ioctl(filp, cmd, (unsigned long)compat_ptr(arg));
+	return gpio_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
 }
 #endif
 
@@ -958,13 +958,13 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static __poll_t lineinfo_watch_poll(struct file *filep,
+static __poll_t lineinfo_watch_poll(struct file *file,
 				    struct poll_table_struct *pollt)
 {
-	struct gpio_chardev_data *priv = filep->private_data;
+	struct gpio_chardev_data *priv = file->private_data;
 	__poll_t events = 0;
 
-	poll_wait(filep, &priv->wait, pollt);
+	poll_wait(file, &priv->wait, pollt);
 
 	if (!kfifo_is_empty_spinlocked_noirqsave(&priv->events,
 						 &priv->wait.lock))
@@ -973,10 +973,10 @@ static __poll_t lineinfo_watch_poll(struct file *filep,
 	return events;
 }
 
-static ssize_t lineinfo_watch_read(struct file *filep, char __user *buf,
+static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 				   size_t count, loff_t *off)
 {
-	struct gpio_chardev_data *priv = filep->private_data;
+	struct gpio_chardev_data *priv = file->private_data;
 	struct gpioline_info_changed event;
 	ssize_t bytes_read = 0;
 	int ret;
@@ -992,7 +992,7 @@ static ssize_t lineinfo_watch_read(struct file *filep, char __user *buf,
 				return bytes_read;
 			}
 
-			if (filep->f_flags & O_NONBLOCK) {
+			if (file->f_flags & O_NONBLOCK) {
 				spin_unlock(&priv->wait.lock);
 				return -EAGAIN;
 			}
@@ -1024,10 +1024,10 @@ static ssize_t lineinfo_watch_read(struct file *filep, char __user *buf,
 /**
  * gpio_chrdev_open() - open the chardev for ioctl operations
  * @inode: inode for this chardev
- * @filp: file struct for storing private data
+ * @file: file struct for storing private data
  * Returns 0 on success
  */
-static int gpio_chrdev_open(struct inode *inode, struct file *filp)
+static int gpio_chrdev_open(struct inode *inode, struct file *file)
 {
 	struct gpio_device *gdev = container_of(inode->i_cdev,
 						struct gpio_device, chrdev);
@@ -1057,9 +1057,9 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
 		goto out_free_bitmap;
 
 	get_device(&gdev->dev);
-	filp->private_data = priv;
+	file->private_data = priv;
 
-	ret = nonseekable_open(inode, filp);
+	ret = nonseekable_open(inode, file);
 	if (ret)
 		goto out_unregister_notifier;
 
@@ -1078,12 +1078,12 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
 /**
  * gpio_chrdev_release() - close chardev after ioctl operations
  * @inode: inode for this chardev
- * @filp: file struct for storing private data
+ * @file: file struct for storing private data
  * Returns 0 on success
  */
-static int gpio_chrdev_release(struct inode *inode, struct file *filp)
+static int gpio_chrdev_release(struct inode *inode, struct file *file)
 {
-	struct gpio_chardev_data *priv = filp->private_data;
+	struct gpio_chardev_data *priv = file->private_data;
 	struct gpio_device *gdev = priv->gdev;
 
 	bitmap_free(priv->watched_lines);
-- 
2.27.0

