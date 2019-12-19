Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 376A81267D8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfLSRQH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:16:07 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37956 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbfLSRPr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:15:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so6794018wrh.5
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0OkuyO6pI87nxwHDFAFros/G0Asl1CJacpmgH90eRXU=;
        b=mIRpvHTYI7yAj5njue7Coqe3+OX2ef3/eQsemEjW3Tf8bheoac9PHSyIieoqXsN1dD
         +OPKwvUkTwqf5dxGcDMMiZtOHsYBt5sIo410CW9+GOp7FFTidnsJAPAOnZNWhm6PZZ3v
         znmFCRs6Bm4r98mcVp6NJuL02Umh+wVYIAAT9uGqb8yz0HchFc2Ffck7xwKphiX26afD
         aNoBH9blvg4zn1ul7cwjnhMfel2qp7a1hXX/6i4B+yTt7RDD/KtzpWIuJ5laCu0VgMsx
         uOHWEvtwWzHbMMOKxa49CYqGGm/KbhntI2SWT80NlOhBUWFq8nVKLbuN8kNY8ChD+s+g
         0bMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0OkuyO6pI87nxwHDFAFros/G0Asl1CJacpmgH90eRXU=;
        b=Y2D7zquDTt2BWFyHjspNeKxN/E4ZwUB3jr95xD+gOYz88DXyRcr4GsNUbeS2iUB5gA
         MxrKx/gx0R9lODzWBxNxaETAmWOWuFoPLzgQUO5uoSckuFKak+CJe8NnsKzX20bX2hVI
         STudw2bOFdHqJBP5PrHcPy5u58NjP0eXDf+bs7v5AWL7FFmJPUJlBp4FPCO8dbBsGwcL
         E3b67inKsVVtfDE/6UBT4YgJT11tbCxhEWsEp72HoTtsL8ZtJnyp1ogYBXzU2iAFyZsz
         R+Dw4gkRBUppe1yUYxcQV49XKUkutD5aJ8+MzpTDi02vQP+pjhMDxmsD/ddzh39bymy+
         O07Q==
X-Gm-Message-State: APjAAAV7G3k4adUdjK4EfpTdoAKN2CoF6g7is80EyX3TZXgBo7Xq65W/
        Im4VguZYPfc+MzA6ZEI9OMQdog==
X-Google-Smtp-Source: APXvYqxqTF4ScmikfQcnwxQTw5v6wzqEIRbOYS7a5w7X9UkGcQKfBf5JB2VbDrsC81TKmIlklKUjog==
X-Received: by 2002:a5d:4847:: with SMTP id n7mr10683978wrs.30.1576775745354;
        Thu, 19 Dec 2019 09:15:45 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id q6sm7401428wrx.72.2019.12.19.09.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 09:15:44 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 09/13] gpiolib: rework the locking mechanism for lineevent kfifo
Date:   Thu, 19 Dec 2019 18:15:24 +0100
Message-Id: <20191219171528.6348-10-brgl@bgdev.pl>
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

The read_lock mutex is supposed to prevent collisions between reading
and writing to the line event kfifo but it's actually only taken when
the events are being read from it.

Drop the mutex entirely and reuse the spinlock made available to us in
the waitqueue struct. Take the lock whenever the fifo is modified or
inspected. Drop the call to kfifo_to_user() and instead first extract
the new element from kfifo when the lock is taken and only then pass
it on to the user after the spinlock is released.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 64 +++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b7043946c029..073bc75b3d45 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -788,8 +788,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * @irq: the interrupt that trigger in response to events on this GPIO
  * @wait: wait queue that handles blocking reads of events
  * @events: KFIFO for the GPIO events
- * @read_lock: mutex lock to protect reads from colliding with adding
- * new events to the FIFO
  * @timestamp: cache for the timestamp storing it between hardirq
  * and IRQ thread, used to bring the timestamp close to the actual
  * event
@@ -802,7 +800,6 @@ struct lineevent_state {
 	int irq;
 	wait_queue_head_t wait;
 	DECLARE_KFIFO(events, struct gpioevent_data, 16);
-	struct mutex read_lock;
 	u64 timestamp;
 };
 
@@ -818,7 +815,7 @@ static __poll_t lineevent_poll(struct file *filep,
 
 	poll_wait(filep, &le->wait, wait);
 
-	if (!kfifo_is_empty(&le->events))
+	if (!kfifo_is_empty_spinlocked_noirqsave(&le->events, &le->wait.lock))
 		events = EPOLLIN | EPOLLRDNORM;
 
 	return events;
@@ -831,43 +828,52 @@ static ssize_t lineevent_read(struct file *filep,
 			      loff_t *f_ps)
 {
 	struct lineevent_state *le = filep->private_data;
-	unsigned int copied;
+	struct gpioevent_data event;
+	ssize_t bytes_read = 0;
 	int ret;
 
-	if (count < sizeof(struct gpioevent_data))
+	if (count < sizeof(event))
 		return -EINVAL;
 
 	do {
+		spin_lock(&le->wait.lock);
 		if (kfifo_is_empty(&le->events)) {
-			if (filep->f_flags & O_NONBLOCK)
+			if (bytes_read) {
+				spin_unlock(&le->wait.lock);
+				return bytes_read;
+			}
+
+			if (filep->f_flags & O_NONBLOCK) {
+				spin_unlock(&le->wait.lock);
 				return -EAGAIN;
+			}
 
-			ret = wait_event_interruptible(le->wait,
+			ret = wait_event_interruptible_locked(le->wait,
 					!kfifo_is_empty(&le->events));
-			if (ret)
+			if (ret) {
+				spin_unlock(&le->wait.lock);
 				return ret;
+			}
 		}
 
-		if (mutex_lock_interruptible(&le->read_lock))
-			return -ERESTARTSYS;
-		ret = kfifo_to_user(&le->events, buf, count, &copied);
-		mutex_unlock(&le->read_lock);
-
-		if (ret)
-			return ret;
-
-		/*
-		 * If we couldn't read anything from the fifo (a different
-		 * thread might have been faster) we either return -EAGAIN if
-		 * the file descriptor is non-blocking, otherwise we go back to
-		 * sleep and wait for more data to arrive.
-		 */
-		if (copied == 0 && (filep->f_flags & O_NONBLOCK))
-			return -EAGAIN;
+		ret = kfifo_out(&le->events, &event, 1);
+		spin_unlock(&le->wait.lock);
+		if (ret != 1) {
+			/*
+			 * This should never happen - we were holding the lock
+			 * from the moment we learned the fifo is no longer
+			 * empty until now.
+			 */
+			ret = -EIO;
+			break;
+		}
 
-	} while (copied == 0);
+		if (copy_to_user(buf + bytes_read, &event, sizeof(event)))
+			return -EFAULT;
+		bytes_read += sizeof(event);
+	} while (count >= bytes_read + sizeof(event));
 
-	return copied;
+	return bytes_read;
 }
 
 static int lineevent_release(struct inode *inode, struct file *filep)
@@ -969,7 +975,8 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 		return IRQ_NONE;
 	}
 
-	ret = kfifo_put(&le->events, ge);
+	ret = kfifo_in_spinlocked_noirqsave(&le->events, &ge,
+					    1, &le->wait.lock);
 	if (ret)
 		wake_up_poll(&le->wait, EPOLLIN);
 
@@ -1084,7 +1091,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	INIT_KFIFO(le->events);
 	init_waitqueue_head(&le->wait);
-	mutex_init(&le->read_lock);
 
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(le->irq,
-- 
2.23.0

