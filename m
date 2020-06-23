Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4486C20483A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732059AbgFWECN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWECM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:12 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DED9C061573;
        Mon, 22 Jun 2020 21:02:12 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id h95so958823pje.4;
        Mon, 22 Jun 2020 21:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i8zhdctiZjWNhC59KOSnhC2O0eynxpTLLMagiHeOKl0=;
        b=s+sq0iV/dgi4bkDc3ee6DQ59A/BJnaCe2GarZs9OeaVDK+akfDBRGR0Ukgr0+6OGUu
         nFi9RYKm2QNkZZlpQgg8KLWIrmgsD56EHIWmsbLU9C1fggbn0GxvECr8tBGeS0oqiiCN
         p5nm3cojPhPI7hfOgJ6YiB4bqcK8zzEhN/eEo2h1OvB59REvPgID3qCTHCb3WX6PK8ph
         SDfs9iFZu1pG5xxPuSVoHi85c6u3Lo+OOykUU0jdDkFAXV13zPr+HZaQXMuw/diykeUo
         JyczitS+mmKu8m+g8PQmBK5w5Od5MzZ9X1xGlDdhzRY+4o6+xKKvEiLh8MGHqPP8FKXA
         HFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i8zhdctiZjWNhC59KOSnhC2O0eynxpTLLMagiHeOKl0=;
        b=fKFcTxHEvytckrIkzGJveWhWErwuHW2++heFtzAoLmyArykDxgDnKZ1BgHeG/5+ifo
         Q5uLiTzztpi4KnN5x7bk7d8NX8BHcPC3PMsSW6EwkLURg2zRG6RplRR1QXTdeFqQNLiF
         mKPW4457ppebaebLaJiCAhCREtP3FvzdmwvBGaGqmHRM6hizkUTGn06oNKG+lkG4vqF5
         2WJ9+tUxsOt8E6IMigRtGLqnwOo5L38bjExgw4jukTBAhxhleuWELAkhsMnULpuTU74x
         hEglOeG6UvRHfTfBI9K6730CKCrwJVvDEwog1HbpYJvho5xDXv1HOID5W7dpCCueefvu
         FKnQ==
X-Gm-Message-State: AOAM5318U1Yq/G5/6i+b4amkY5BbFZTwA50pjInyaM6AGZfT6/6MwfJ9
        2e3VCUuLwyy3V/iffHNfk2sNjPqSVrI=
X-Google-Smtp-Source: ABdhPJzkpbQrCQBUfQ57Ima0NM2NFEbu/g2JH4CCNsz2jHrAbuKtC/9fP3kd1y9nas82mIoBR+Ym0Q==
X-Received: by 2002:a17:902:bc82:: with SMTP id bb2mr21648148plb.225.1592884931586;
        Mon, 22 Jun 2020 21:02:11 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:10 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 05/22] gpiolib: cdev: rename 'filep' and 'filp' to 'file' to be consistent with other use
Date:   Tue, 23 Jun 2020 12:00:50 +0800
Message-Id: <20200623040107.22270-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
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

The code was using both "filep" and "filp" and I flip flopped between
which one to change to until looking at code elsewhere in the kernel
where "struct file *file" is the most common and so going with that.

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

