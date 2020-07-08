Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB319217E16
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgGHETr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHETq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:19:46 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86101C061755;
        Tue,  7 Jul 2020 21:19:46 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u5so19392020pfn.7;
        Tue, 07 Jul 2020 21:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zs9gcJh1GuqENL0684ED+OEV5vC6ieHQPjBw7Yiioes=;
        b=eWEtjukyd4B/iIk4TZaUcjglHYlXoeXyGUov5TUBdYgyWmefN8mZa4hRd1Mv9tmN26
         FucBcYfPQtavumQL0O1wxvd3mlJOblp9aPp8VYVX5x/O82Uz7n5o0vlE8eSWvgdLgig8
         c9JsiNNQrTC9J8KLkt4lwi4B6lxHfadd36v4PH/X9hzUd6Yk0aD+/drXGl40K+CRtRuq
         QyUrpqvsoNHp1Kn+4qHcnLNfA+TFIzzjfPhs1Gn3k7Dav823EAD7zn5d076Nb1JPusYm
         qOZXk2r/diryGAf0M9+2JhkKmpWYagURTNJhrYkwd8saNtfigR3ErjDpREQmrVLnlqeG
         X8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zs9gcJh1GuqENL0684ED+OEV5vC6ieHQPjBw7Yiioes=;
        b=uEEFufeqmk8tkVFO0xOAiFb46xIArwax32dugjwzC+jOD+wz7JRJw6BsCDhKvt81b1
         pQLlieT88GLc4D5SVD8JA8yIaKbYvS86jg/xMlmanohzLYOMKSaLa9GlDrICtYoYO+Dz
         DOlFWzJUwqs7x1Fu+6f2rI7N7GHMPEXlyRagGLY9JV5XTqMN+1tuJWAk+LrIsgrT5B9F
         rRolEJ9auuVU6kx96O7qwK+ezQOI1v685cjLxazHv2BxVN3IXkmVdlelfj2akB5ZjzWi
         EX7mfH8EN8WVycr3NMQ7PVs3xM/rXoas+SYYQZ+rnbOIBrfHy7kDStMLGTeiA/tNeikM
         iYkA==
X-Gm-Message-State: AOAM531uOVJYjUwoGgKZ+NzEMityb0F++Sx7X7L7Glyf2hSYUjBK1wwl
        Yu5+U03f28VY4Oh8oaCUm4Pi88Zp
X-Google-Smtp-Source: ABdhPJxqAWofiG7Ff+XVsjXf0AapWy6YRlVt5dywMdwPPCPchFfVCRz0dERk40S87GG4CwTQ75PqEg==
X-Received: by 2002:a05:6a00:148c:: with SMTP id v12mr51188651pfu.171.1594181985478;
        Tue, 07 Jul 2020 21:19:45 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:19:44 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 09/17] gpiolib: cdev: rename priv to cdev
Date:   Wed,  8 Jul 2020 12:15:52 +0800
Message-Id: <20200708041600.768775-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename priv to cdev to improve readability.

The name "priv" indicates that the object is pointed to by
file->private_data, not what the object is actually is.
As it is always used to point to a struct gpio_chardev_data, renaming
it to cdev is more appropriate.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 90 ++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 352d815bbd07..fe1b385deecc 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -826,8 +826,8 @@ struct gpio_chardev_data {
  */
 static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
-	struct gpio_chardev_data *priv = file->private_data;
-	struct gpio_device *gdev = priv->gdev;
+	struct gpio_chardev_data *cdev = file->private_data;
+	struct gpio_device *gdev = cdev->gdev;
 	struct gpio_chip *gc = gdev->chip;
 	void __user *ip = (void __user *)arg;
 	struct gpio_desc *desc;
@@ -887,7 +887,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		hwgpio = gpio_chip_hwgpio(desc);
 
-		if (test_bit(hwgpio, priv->watched_lines))
+		if (test_bit(hwgpio, cdev->watched_lines))
 			return -EBUSY;
 
 		gpio_desc_to_lineinfo(desc, &lineinfo);
@@ -895,7 +895,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
 
-		set_bit(hwgpio, priv->watched_lines);
+		set_bit(hwgpio, cdev->watched_lines);
 		return 0;
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
 		if (copy_from_user(&offset, ip, sizeof(offset)))
@@ -907,10 +907,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		hwgpio = gpio_chip_hwgpio(desc);
 
-		if (!test_bit(hwgpio, priv->watched_lines))
+		if (!test_bit(hwgpio, cdev->watched_lines))
 			return -EBUSY;
 
-		clear_bit(hwgpio, priv->watched_lines);
+		clear_bit(hwgpio, cdev->watched_lines);
 		return 0;
 	}
 	return -EINVAL;
@@ -933,12 +933,12 @@ to_gpio_chardev_data(struct notifier_block *nb)
 static int lineinfo_changed_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
-	struct gpio_chardev_data *priv = to_gpio_chardev_data(nb);
+	struct gpio_chardev_data *cdev = to_gpio_chardev_data(nb);
 	struct gpioline_info_changed chg;
 	struct gpio_desc *desc = data;
 	int ret;
 
-	if (!test_bit(gpio_chip_hwgpio(desc), priv->watched_lines))
+	if (!test_bit(gpio_chip_hwgpio(desc), cdev->watched_lines))
 		return NOTIFY_DONE;
 
 	memset(&chg, 0, sizeof(chg));
@@ -947,9 +947,9 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	chg.timestamp = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
 
-	ret = kfifo_in_spinlocked(&priv->events, &chg, 1, &priv->wait.lock);
+	ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);
 	if (ret)
-		wake_up_poll(&priv->wait, EPOLLIN);
+		wake_up_poll(&cdev->wait, EPOLLIN);
 	else
 		pr_debug_ratelimited("lineinfo event FIFO is full - event dropped\n");
 
@@ -959,13 +959,13 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 static __poll_t lineinfo_watch_poll(struct file *file,
 				    struct poll_table_struct *pollt)
 {
-	struct gpio_chardev_data *priv = file->private_data;
+	struct gpio_chardev_data *cdev = file->private_data;
 	__poll_t events = 0;
 
-	poll_wait(file, &priv->wait, pollt);
+	poll_wait(file, &cdev->wait, pollt);
 
-	if (!kfifo_is_empty_spinlocked_noirqsave(&priv->events,
-						 &priv->wait.lock))
+	if (!kfifo_is_empty_spinlocked_noirqsave(&cdev->events,
+						 &cdev->wait.lock))
 		events = EPOLLIN | EPOLLRDNORM;
 
 	return events;
@@ -974,7 +974,7 @@ static __poll_t lineinfo_watch_poll(struct file *file,
 static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 				   size_t count, loff_t *off)
 {
-	struct gpio_chardev_data *priv = file->private_data;
+	struct gpio_chardev_data *cdev = file->private_data;
 	struct gpioline_info_changed event;
 	ssize_t bytes_read = 0;
 	int ret;
@@ -983,28 +983,28 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 		return -EINVAL;
 
 	do {
-		spin_lock(&priv->wait.lock);
-		if (kfifo_is_empty(&priv->events)) {
+		spin_lock(&cdev->wait.lock);
+		if (kfifo_is_empty(&cdev->events)) {
 			if (bytes_read) {
-				spin_unlock(&priv->wait.lock);
+				spin_unlock(&cdev->wait.lock);
 				return bytes_read;
 			}
 
 			if (file->f_flags & O_NONBLOCK) {
-				spin_unlock(&priv->wait.lock);
+				spin_unlock(&cdev->wait.lock);
 				return -EAGAIN;
 			}
 
-			ret = wait_event_interruptible_locked(priv->wait,
-					!kfifo_is_empty(&priv->events));
+			ret = wait_event_interruptible_locked(cdev->wait,
+					!kfifo_is_empty(&cdev->events));
 			if (ret) {
-				spin_unlock(&priv->wait.lock);
+				spin_unlock(&cdev->wait.lock);
 				return ret;
 			}
 		}
 
-		ret = kfifo_out(&priv->events, &event, 1);
-		spin_unlock(&priv->wait.lock);
+		ret = kfifo_out(&cdev->events, &event, 1);
+		spin_unlock(&cdev->wait.lock);
 		if (ret != 1) {
 			ret = -EIO;
 			break;
@@ -1029,33 +1029,33 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 {
 	struct gpio_device *gdev = container_of(inode->i_cdev,
 						struct gpio_device, chrdev);
-	struct gpio_chardev_data *priv;
+	struct gpio_chardev_data *cdev;
 	int ret = -ENOMEM;
 
 	/* Fail on open if the backing gpiochip is gone */
 	if (!gdev->chip)
 		return -ENODEV;
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
+	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
+	if (!cdev)
 		return -ENOMEM;
 
-	priv->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
-	if (!priv->watched_lines)
-		goto out_free_priv;
+	cdev->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
+	if (!cdev->watched_lines)
+		goto out_free_cdev;
 
-	init_waitqueue_head(&priv->wait);
-	INIT_KFIFO(priv->events);
-	priv->gdev = gdev;
+	init_waitqueue_head(&cdev->wait);
+	INIT_KFIFO(cdev->events);
+	cdev->gdev = gdev;
 
-	priv->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
+	cdev->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
 	ret = blocking_notifier_chain_register(&gdev->notifier,
-					       &priv->lineinfo_changed_nb);
+					       &cdev->lineinfo_changed_nb);
 	if (ret)
 		goto out_free_bitmap;
 
 	get_device(&gdev->dev);
-	file->private_data = priv;
+	file->private_data = cdev;
 
 	ret = nonseekable_open(inode, file);
 	if (ret)
@@ -1065,11 +1065,11 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 
 out_unregister_notifier:
 	blocking_notifier_chain_unregister(&gdev->notifier,
-					   &priv->lineinfo_changed_nb);
+					   &cdev->lineinfo_changed_nb);
 out_free_bitmap:
-	bitmap_free(priv->watched_lines);
-out_free_priv:
-	kfree(priv);
+	bitmap_free(cdev->watched_lines);
+out_free_cdev:
+	kfree(cdev);
 	return ret;
 }
 
@@ -1081,14 +1081,14 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
  */
 static int gpio_chrdev_release(struct inode *inode, struct file *file)
 {
-	struct gpio_chardev_data *priv = file->private_data;
-	struct gpio_device *gdev = priv->gdev;
+	struct gpio_chardev_data *cdev = file->private_data;
+	struct gpio_device *gdev = cdev->gdev;
 
-	bitmap_free(priv->watched_lines);
+	bitmap_free(cdev->watched_lines);
 	blocking_notifier_chain_unregister(&gdev->notifier,
-					   &priv->lineinfo_changed_nb);
+					   &cdev->lineinfo_changed_nb);
 	put_device(&gdev->dev);
-	kfree(priv);
+	kfree(cdev);
 
 	return 0;
 }
-- 
2.27.0

