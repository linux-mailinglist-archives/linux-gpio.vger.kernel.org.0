Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB89112F59
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 17:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbfLDQBq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 11:01:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37990 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728587AbfLDP73 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 10:59:29 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so9238469wrh.5
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2019 07:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CdsiFTfek5xLI09RRog+58+WxPNQjw5a0l6zl3ADLU8=;
        b=rmBYXtduNWBjbJdBB+q6r8IPnN9IU+yx+mQDtMjrL6H4bTPot1sIMDnhXMoAJg8zR1
         MWtQXlxfH1Lo+XbbhWyVrezj+c8MS5InDMMXyMEkMFKiwiZ3jxn214vTKImaqO814FHS
         ML5WqrnkJaDMVU9EvxqemBXs7quBnEfMdz5rpNlXNxspdd7N4Zhtx0W5Gl4Vl9iTlrzr
         aBB+6xVLC+Rg2FJcTlkkgXyzMHveem+THF9aBXQo0fvoq/AKIQQzXLt0DGSaP7mnrVHf
         qs4X4sIz7Ylf3KCih22Pl+za7oHFWJuoNuREYki9j/GxBoQ9+9uuthx2b2ud7hAR9iyI
         bRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CdsiFTfek5xLI09RRog+58+WxPNQjw5a0l6zl3ADLU8=;
        b=IJd5b4duzACMUOU0RY29E9jNa26FQJoA+f4SF0oNpiXF53Psfp3sXT+eGDVVrLAZr4
         HY/bo7CU/oGJ0kZLZEYfjFe8ZeyiJhwb7A/A4fYHjzmLrMmQT56h47GDsxzW+eGLX6Ti
         49EQBnFef3mM5w0mZoCprqO6sCQqJO22JKDpwymx6VP3A59vhjTMARgqHishstJR1xMY
         bRRAogTHiVKyix+JsivgP+i74pU7plmYuNHCIvfTdy0LcY2bZvP0yb9AMJhkbrTfkn7m
         tjLnRuk9/ZS8yNKOIOpdfFS0qbYmB3BC+faIo+cRbFdkg6dEey4edVzsUe9VpxW95O3t
         uXHA==
X-Gm-Message-State: APjAAAXh0KNJeERVKA8W1HEQJR6I+BaFLSttEUr+G0nXL8YoBrv8aITc
        iCt8ZHCxB998oFN5VpgyN9Ys/Q==
X-Google-Smtp-Source: APXvYqzgSN35FsKw+z4ACL3rPKUl4UEmfcPcuA9exxMvkFs/K/t3RLZn3dchtV+0t9ZL9bpN7xdjUg==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr4976853wrn.19.1575475167360;
        Wed, 04 Dec 2019 07:59:27 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u18sm8640508wrt.26.2019.12.04.07.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:59:26 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 07/11] gpiolib: rework the locking mechanism for lineevent kfifo
Date:   Wed,  4 Dec 2019 16:59:10 +0100
Message-Id: <20191204155912.17590-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204155912.17590-1-brgl@bgdev.pl>
References: <20191204155912.17590-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c | 54 ++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b7043946c029..43f90eca6d45 100644
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
 
@@ -818,8 +815,10 @@ static __poll_t lineevent_poll(struct file *filep,
 
 	poll_wait(filep, &le->wait, wait);
 
+	spin_lock(&le->wait.lock);
 	if (!kfifo_is_empty(&le->events))
 		events = EPOLLIN | EPOLLRDNORM;
+	spin_unlock(&le->wait.lock);
 
 	return events;
 }
@@ -831,43 +830,47 @@ static ssize_t lineevent_read(struct file *filep,
 			      loff_t *f_ps)
 {
 	struct lineevent_state *le = filep->private_data;
-	unsigned int copied;
+	struct gpioevent_data event;
 	int ret;
 
-	if (count < sizeof(struct gpioevent_data))
+	if (count < sizeof(event))
 		return -EINVAL;
 
-	do {
+	for (;;) {
+		spin_lock(&le->wait.lock);
 		if (kfifo_is_empty(&le->events)) {
-			if (filep->f_flags & O_NONBLOCK)
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
-		}
+			}
 
-		if (mutex_lock_interruptible(&le->read_lock))
-			return -ERESTARTSYS;
-		ret = kfifo_to_user(&le->events, buf, count, &copied);
-		mutex_unlock(&le->read_lock);
+		}
 
-		if (ret)
-			return ret;
+		ret = kfifo_out(&le->events, &event, 1);
+		spin_unlock(&le->wait.lock);
+		if (ret == 1)
+			break;
 
 		/*
-		 * If we couldn't read anything from the fifo (a different
-		 * thread might have been faster) we either return -EAGAIN if
-		 * the file descriptor is non-blocking, otherwise we go back to
-		 * sleep and wait for more data to arrive.
+		 * We should never get here since we're holding the lock from
+		 * the moment we noticed a new event until calling kfifo_out()
+		 * but we must check the return value. On the off-chance - just
+		 * go back to waiting.
 		 */
-		if (copied == 0 && (filep->f_flags & O_NONBLOCK))
-			return -EAGAIN;
+	}
 
-	} while (copied == 0);
+	ret = copy_to_user(buf, &event, sizeof(event));
+	if (ret)
+		return -EFAULT;
 
-	return copied;
+	return sizeof(event);
 }
 
 static int lineevent_release(struct inode *inode, struct file *filep)
@@ -969,7 +972,7 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 		return IRQ_NONE;
 	}
 
-	ret = kfifo_put(&le->events, ge);
+	ret = kfifo_in_spinlocked(&le->events, &ge, 1, &le->wait.lock);
 	if (ret)
 		wake_up_poll(&le->wait, EPOLLIN);
 
@@ -1084,7 +1087,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	INIT_KFIFO(le->events);
 	init_waitqueue_head(&le->wait);
-	mutex_init(&le->read_lock);
 
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(le->irq,
-- 
2.23.0

