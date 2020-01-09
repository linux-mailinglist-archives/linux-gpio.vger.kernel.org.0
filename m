Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5336A135866
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 12:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729114AbgAILuV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 06:50:21 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38432 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727701AbgAILuU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 06:50:20 -0500
Received: by mail-wm1-f68.google.com with SMTP id u2so2502938wmc.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2020 03:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FA3+2VP5jAU36J2OH+8r6uyx7DpqKu5B6mxuwntNrmg=;
        b=y0zf90SH/xz46Ta5Z+ipALrxGQSFFIUJRsJTjVK2piTWKeLB9vzcdCQr1Kwzwmc+8j
         T6z2lD3TbAbS34SiyDT06Tup2pQGOAwwYakLxgcUFXN0Pq1j6RcF14eEKKY5i1bEaPxE
         FAMZpgOTj3VJNOeKSeH/hekuZgfqdjQjggdaJnrcpNNckqWAl1RSyRirM/TDJCgvWdFk
         Ma3MifhS8C2LiHKgBCRjhL2fhMJNrhgtu+krUnd2vwbO3N3IeR3WKnhySnvD86GFYAhq
         OaNcNFuMvFVV8a9JXDnfMJ2x6QlmDvozTVji4405hb5xNGqiHw0C/HmgvFhxuDNGqKpS
         g0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FA3+2VP5jAU36J2OH+8r6uyx7DpqKu5B6mxuwntNrmg=;
        b=NPugDZeMJa0Ch7TSv8j7rJZdULB0G076NxmwqG5HXrq1/WzJhPLKHFK7q+hK5yKkUU
         ovGd3KaUvdmFCACnOqIweyLpUnsKikcqZJ6kYRi8MUnBMv2wKvhNu/q4pAY5uzyu1JV7
         IjCWxpU10PMt4tZuyhaY+QNKggQPp9vyAl40EeF9fAQZW1V+VgT5LZ9HQN7U403zSwSL
         P8DbcPWtW14VyaypKfO1cyRa3awQIXFmABr1VuQrDqouiyD4FUzTLBmFaRyk9gcUgSEg
         6MumD4a02or4s2mb6U3PKSnjIRZ+dIHOD9hUuCyjajr7wkXtzgEEaoOpeeXv52pwaEnF
         OGWg==
X-Gm-Message-State: APjAAAXySmb8032Ham7QZVLhqCgTMSEOYw8anrvZbPZgdyFCUxdeePkQ
        t26rSO3QhsB6bA3roA+ewrbpWQ==
X-Google-Smtp-Source: APXvYqxv8DiI2j/pEwy6D48Ut1X97xSOn0Ai9KBCq84xPYr1GFVwPbZNpfD6u2vecLPzx+W5vx2ybg==
X-Received: by 2002:a05:600c:290f:: with SMTP id i15mr4513441wmd.115.1578570618381;
        Thu, 09 Jan 2020 03:50:18 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u16sm2574979wmj.41.2020.01.09.03.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 03:50:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 3/7] gpiolib: rework the locking mechanism for lineevent kfifo
Date:   Thu,  9 Jan 2020 12:50:06 +0100
Message-Id: <20200109115010.27814-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200109115010.27814-1-brgl@bgdev.pl>
References: <20200109115010.27814-1-brgl@bgdev.pl>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 64 +++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ee5ab39d7ab7..43c96e7cdc48 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -796,8 +796,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * @irq: the interrupt that trigger in response to events on this GPIO
  * @wait: wait queue that handles blocking reads of events
  * @events: KFIFO for the GPIO events
- * @read_lock: mutex lock to protect reads from colliding with adding
- * new events to the FIFO
  * @timestamp: cache for the timestamp storing it between hardirq
  * and IRQ thread, used to bring the timestamp close to the actual
  * event
@@ -810,7 +808,6 @@ struct lineevent_state {
 	int irq;
 	wait_queue_head_t wait;
 	DECLARE_KFIFO(events, struct gpioevent_data, 16);
-	struct mutex read_lock;
 	u64 timestamp;
 };
 
@@ -826,7 +823,7 @@ static __poll_t lineevent_poll(struct file *filep,
 
 	poll_wait(filep, &le->wait, wait);
 
-	if (!kfifo_is_empty(&le->events))
+	if (!kfifo_is_empty_spinlocked_noirqsave(&le->events, &le->wait.lock))
 		events = EPOLLIN | EPOLLRDNORM;
 
 	return events;
@@ -839,43 +836,52 @@ static ssize_t lineevent_read(struct file *filep,
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
@@ -977,7 +983,8 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 		return IRQ_NONE;
 	}
 
-	ret = kfifo_put(&le->events, ge);
+	ret = kfifo_in_spinlocked_noirqsave(&le->events, &ge,
+					    1, &le->wait.lock);
 	if (ret)
 		wake_up_poll(&le->wait, EPOLLIN);
 
@@ -1092,7 +1099,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	INIT_KFIFO(le->events);
 	init_waitqueue_head(&le->wait);
-	mutex_init(&le->read_lock);
 
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(le->irq,
-- 
2.23.0

