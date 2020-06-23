Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F030204842
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732150AbgFWECf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWECe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:34 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37480C061573;
        Mon, 22 Jun 2020 21:02:34 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id cm23so911145pjb.5;
        Mon, 22 Jun 2020 21:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LqoHGw9AEr8BsRttpXKzXntPiww4DtH340vCNhdtdPA=;
        b=W0YsMx4Ctpkab0DRzxUXRRVIY1RkgDkP5OoqTj4BlY77Z8GVA3y7cdKXlccwj6Pfkm
         Pi40S51YUYLL5arJXUGcuKva8p47sJMEQc8/8do03PQNov7CRMJLOiwyo0Lsp/kOB6E3
         vW36uWFEsgtoTwDMvdZ3teH4j+U3CJ3JSnbTEGzrCqVYo6G3fCsYQaOwGOJiIRAoiwo0
         vaNIan77MVnXvt5oipEAbcKDYDn3E6cvmOV7Vvx2YEb3i3xjkO4KcG8bY7oQROmPCY1c
         kG5tZwhjRu4bxWS2FPWCbwLUKa4sSN5ZQ7OXjeKtQPXpdqL7Pv4lAk5NuyrYvx0Zf7wI
         uacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LqoHGw9AEr8BsRttpXKzXntPiww4DtH340vCNhdtdPA=;
        b=VUVJU//KjFVd24QD2HIkln5KQJpxLaCW09UdOawrIwtuQiJyuSspKvoqyft6IKr8bl
         eim/B74ADCw4Llxhzh05gE6bdnaD0avhWaYw8HcSSH99/6TvYkhDoXzne8O0E0Imm/J5
         wMXkBXiAb85miMf6wLSfgo0fcrApTufg0x1m8YvEwuzdBfDy+UffHAkqCY9JYvb/pXDC
         +ktYBFt74UFq6qoil4HsQ3O823oDxAGYzgVlGwUe7lY8+pUJH62un6U9MNbV6hL1wuaC
         uK4PPbTF02CuVytOW04ooiTylaaGpnwSVE3oQzmFsp7bRrVg3Hz5I1EVgjtIbEuvmFB5
         zoKg==
X-Gm-Message-State: AOAM532OHdUdihY66x0PJ+v+HZ1SNEf0PfTOWGY0Js9vx7UEzuruiT1g
        XtG3HyHiZjdoFZ1+ye4qp1G4kR1caLc=
X-Google-Smtp-Source: ABdhPJxpuUOmBahnAb/6/luKkrs3opwmJRABEYRF5jqMPsgNNM9FxQq/YtyT09SjPyVgaUgbwD49+A==
X-Received: by 2002:a17:90a:e288:: with SMTP id d8mr22548179pjz.173.1592884953203;
        Mon, 22 Jun 2020 21:02:33 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:32 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 09/22] gpiolib: cdev: rename priv to gcdev
Date:   Tue, 23 Jun 2020 12:00:54 +0800
Message-Id: <20200623040107.22270-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename priv to gcdev to improve readability.

The name "priv" indicates that the object is pointed to by
file->private_data, not what the object is actually is.
It is always used to point to a struct gpio_chardev_data so renaming
it to gcdev seemed as good as anything, and certainly clearer than "priv".

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 drivers/gpio/gpiolib-cdev.c | 90 ++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 1e8e0a0a9b51..5f5b715ed7f7 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -828,8 +828,8 @@ struct gpio_chardev_data {
  */
 static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
-	struct gpio_chardev_data *priv = file->private_data;
-	struct gpio_device *gdev = priv->gdev;
+	struct gpio_chardev_data *gcdev = file->private_data;
+	struct gpio_device *gdev = gcdev->gdev;
 	struct gpio_chip *gc = gdev->chip;
 	void __user *ip = (void __user *)arg;
 	struct gpio_desc *desc;
@@ -889,7 +889,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		hwgpio = gpio_chip_hwgpio(desc);
 
-		if (test_bit(hwgpio, priv->watched_lines))
+		if (test_bit(hwgpio, gcdev->watched_lines))
 			return -EBUSY;
 
 		gpio_desc_to_lineinfo(desc, &lineinfo);
@@ -897,7 +897,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
 
-		set_bit(hwgpio, priv->watched_lines);
+		set_bit(hwgpio, gcdev->watched_lines);
 		return 0;
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
 		if (copy_from_user(&offset, ip, sizeof(offset)))
@@ -909,10 +909,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		hwgpio = gpio_chip_hwgpio(desc);
 
-		if (!test_bit(hwgpio, priv->watched_lines))
+		if (!test_bit(hwgpio, gcdev->watched_lines))
 			return -EBUSY;
 
-		clear_bit(hwgpio, priv->watched_lines);
+		clear_bit(hwgpio, gcdev->watched_lines);
 		return 0;
 	}
 	return -EINVAL;
@@ -935,12 +935,12 @@ to_gpio_chardev_data(struct notifier_block *nb)
 static int lineinfo_changed_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
-	struct gpio_chardev_data *priv = to_gpio_chardev_data(nb);
+	struct gpio_chardev_data *gcdev = to_gpio_chardev_data(nb);
 	struct gpioline_info_changed chg;
 	struct gpio_desc *desc = data;
 	int ret;
 
-	if (!test_bit(gpio_chip_hwgpio(desc), priv->watched_lines))
+	if (!test_bit(gpio_chip_hwgpio(desc), gcdev->watched_lines))
 		return NOTIFY_DONE;
 
 	memset(&chg, 0, sizeof(chg));
@@ -949,9 +949,9 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	chg.timestamp = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
 
-	ret = kfifo_in_spinlocked(&priv->events, &chg, 1, &priv->wait.lock);
+	ret = kfifo_in_spinlocked(&gcdev->events, &chg, 1, &gcdev->wait.lock);
 	if (ret)
-		wake_up_poll(&priv->wait, EPOLLIN);
+		wake_up_poll(&gcdev->wait, EPOLLIN);
 	else
 		pr_debug_ratelimited("lineinfo event FIFO is full - event dropped\n");
 
@@ -961,13 +961,13 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 static __poll_t lineinfo_watch_poll(struct file *file,
 				    struct poll_table_struct *pollt)
 {
-	struct gpio_chardev_data *priv = file->private_data;
+	struct gpio_chardev_data *gcdev = file->private_data;
 	__poll_t events = 0;
 
-	poll_wait(file, &priv->wait, pollt);
+	poll_wait(file, &gcdev->wait, pollt);
 
-	if (!kfifo_is_empty_spinlocked_noirqsave(&priv->events,
-						 &priv->wait.lock))
+	if (!kfifo_is_empty_spinlocked_noirqsave(&gcdev->events,
+						 &gcdev->wait.lock))
 		events = EPOLLIN | EPOLLRDNORM;
 
 	return events;
@@ -976,7 +976,7 @@ static __poll_t lineinfo_watch_poll(struct file *file,
 static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 				   size_t count, loff_t *off)
 {
-	struct gpio_chardev_data *priv = file->private_data;
+	struct gpio_chardev_data *gcdev = file->private_data;
 	struct gpioline_info_changed event;
 	ssize_t bytes_read = 0;
 	int ret;
@@ -985,28 +985,28 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 		return -EINVAL;
 
 	do {
-		spin_lock(&priv->wait.lock);
-		if (kfifo_is_empty(&priv->events)) {
+		spin_lock(&gcdev->wait.lock);
+		if (kfifo_is_empty(&gcdev->events)) {
 			if (bytes_read) {
-				spin_unlock(&priv->wait.lock);
+				spin_unlock(&gcdev->wait.lock);
 				return bytes_read;
 			}
 
 			if (file->f_flags & O_NONBLOCK) {
-				spin_unlock(&priv->wait.lock);
+				spin_unlock(&gcdev->wait.lock);
 				return -EAGAIN;
 			}
 
-			ret = wait_event_interruptible_locked(priv->wait,
-					!kfifo_is_empty(&priv->events));
+			ret = wait_event_interruptible_locked(gcdev->wait,
+					!kfifo_is_empty(&gcdev->events));
 			if (ret) {
-				spin_unlock(&priv->wait.lock);
+				spin_unlock(&gcdev->wait.lock);
 				return ret;
 			}
 		}
 
-		ret = kfifo_out(&priv->events, &event, 1);
-		spin_unlock(&priv->wait.lock);
+		ret = kfifo_out(&gcdev->events, &event, 1);
+		spin_unlock(&gcdev->wait.lock);
 		if (ret != 1) {
 			ret = -EIO;
 			break;
@@ -1031,33 +1031,33 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 {
 	struct gpio_device *gdev = container_of(inode->i_cdev,
 						struct gpio_device, chrdev);
-	struct gpio_chardev_data *priv;
+	struct gpio_chardev_data *gcdev;
 	int ret = -ENOMEM;
 
 	/* Fail on open if the backing gpiochip is gone */
 	if (!gdev->chip)
 		return -ENODEV;
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
+	gcdev = kzalloc(sizeof(*gcdev), GFP_KERNEL);
+	if (!gcdev)
 		return -ENOMEM;
 
-	priv->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
-	if (!priv->watched_lines)
-		goto out_free_priv;
+	gcdev->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
+	if (!gcdev->watched_lines)
+		goto out_free_gcdev;
 
-	init_waitqueue_head(&priv->wait);
-	INIT_KFIFO(priv->events);
-	priv->gdev = gdev;
+	init_waitqueue_head(&gcdev->wait);
+	INIT_KFIFO(gcdev->events);
+	gcdev->gdev = gdev;
 
-	priv->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
+	gcdev->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
 	ret = atomic_notifier_chain_register(&gdev->notifier,
-					     &priv->lineinfo_changed_nb);
+					     &gcdev->lineinfo_changed_nb);
 	if (ret)
 		goto out_free_bitmap;
 
 	get_device(&gdev->dev);
-	file->private_data = priv;
+	file->private_data = gcdev;
 
 	ret = nonseekable_open(inode, file);
 	if (ret)
@@ -1067,11 +1067,11 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 
 out_unregister_notifier:
 	atomic_notifier_chain_unregister(&gdev->notifier,
-					 &priv->lineinfo_changed_nb);
+					 &gcdev->lineinfo_changed_nb);
 out_free_bitmap:
-	bitmap_free(priv->watched_lines);
-out_free_priv:
-	kfree(priv);
+	bitmap_free(gcdev->watched_lines);
+out_free_gcdev:
+	kfree(gcdev);
 	return ret;
 }
 
@@ -1083,14 +1083,14 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
  */
 static int gpio_chrdev_release(struct inode *inode, struct file *file)
 {
-	struct gpio_chardev_data *priv = file->private_data;
-	struct gpio_device *gdev = priv->gdev;
+	struct gpio_chardev_data *gcdev = file->private_data;
+	struct gpio_device *gdev = gcdev->gdev;
 
-	bitmap_free(priv->watched_lines);
+	bitmap_free(gcdev->watched_lines);
 	atomic_notifier_chain_unregister(&gdev->notifier,
-					 &priv->lineinfo_changed_nb);
+					 &gcdev->lineinfo_changed_nb);
 	put_device(&gdev->dev);
-	kfree(priv);
+	kfree(gcdev);
 
 	return 0;
 }
-- 
2.27.0

