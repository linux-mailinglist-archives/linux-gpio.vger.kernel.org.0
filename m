Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0304877FE23
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 20:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354574AbjHQSuf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Aug 2023 14:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354591AbjHQSuP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 14:50:15 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C1319E
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 11:50:14 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so1628405e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 11:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692298212; x=1692903012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymh7FtRtjmNqFd5iXsBgPf98eexBLYZK+7NV8eOQbss=;
        b=qUnHYo2R5NY07SwtBVrLB+cELSlnFOYYRN03P7vvjPjZuIuPHyWfTWaLN1ErKtjlqP
         bYWVqs7taGTCwggjcL3BzWcr557kkFPZRMweo0pWGsKnHbYmi5iwQwTi7du/vIfYXMYt
         LNXTlEx+mlpu6zl8ixAXJW13tkDxYXCKZCi8vYukF2MFR5+JvjtoDiqo6C9NZ7X+Ud6q
         QVY+D4IoaF2Z2tTd7SDBzAppL8muK9WRwH6dbOXXna6hchjx0bGIKu5b206lUiR2pk5k
         WTK2mZGb6cZPGWcyGZmHJQR3JbFyCRm0HZm6D+retC1/Zi9xZlyxuPWgo/fQdpMPzNG2
         geUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298212; x=1692903012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymh7FtRtjmNqFd5iXsBgPf98eexBLYZK+7NV8eOQbss=;
        b=C4oGMCG6P3mPpBJv5jU9Iw4hE1sEnHHR1YnuT1zZMrJM/aR6yEqGRi6GBWMMgEIOik
         OoEncNM1gvtjMmyKvzfu5didtrX4TXh0QmC9AHEcr/W6ThgqMVCqHz8lMEcScjZXZlra
         hGbFmzMK71h9dlGdCgUPK+Z0f9W0ocUlQichu4ZCD0++mIz32XDTmoCTVH5ADf30ugdB
         1qrjAcr/c6PZXj/pj3kcul/1hEtmCvCTPXwOoI8hUmg1WgDJ1bAkGSTmzhvUxA0ejRqh
         QXtiSZWgkEOvC3d4yCCIlTbsXnxuPRIwS6yw7ON/ov/ZXBMeFhXWy60R5hMsXahd57NC
         XOsQ==
X-Gm-Message-State: AOJu0YwMyd3vFAlMvVH2HLLX5sB0L67QQeJoe5Z0jRwqs79fNCV1AhIb
        FAyDQWG6Nzwvdw3g+U34/WkHDUsCGotGGv3pQ052Uw==
X-Google-Smtp-Source: AGHT+IGEkvy4TWcD9g9170QYDYF4klTaCVDRS1y5zHC7+DrV5zU7NafjnIW8fB1BcZJI2wLMIYs9/g==
X-Received: by 2002:a1c:cc16:0:b0:3f8:2777:15e with SMTP id h22-20020a1ccc16000000b003f82777015emr463874wmb.31.1692298212737;
        Thu, 17 Aug 2023 11:50:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2f99:c690:b4da:e3d2])
        by smtp.gmail.com with ESMTPSA id a23-20020a05600c225700b003fe1cdbc33dsm3963020wmm.9.2023.08.17.11.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 11:50:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 6/6] gpio: cdev: wake up lineevent poll() on device unbind
Date:   Thu, 17 Aug 2023 20:49:58 +0200
Message-Id: <20230817184958.25349-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817184958.25349-1-brgl@bgdev.pl>
References: <20230817184958.25349-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a notifier block to the lineevent_state structure and register it
with the gpio_device's device notifier. Upon reception of an event, wake
up the wait queue so that the user-space be forced out of poll() and
need to go into a new system call which will then fail due to the chip
being gone.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 4c3b186bc638..76a71471c724 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1802,6 +1802,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
  * @eflags: the event flags this line was requested with
  * @irq: the interrupt that trigger in response to events on this GPIO
  * @wait: wait queue that handles blocking reads of events
+ * @device_unregistered_nb: notifier block for receiving gdev unregister events
  * @events: KFIFO for the GPIO events
  * @timestamp: cache for the timestamp storing it between hardirq
  * and IRQ thread, used to bring the timestamp close to the actual
@@ -1814,6 +1815,7 @@ struct lineevent_state {
 	u32 eflags;
 	int irq;
 	wait_queue_head_t wait;
+	struct notifier_block device_unregistered_nb;
 	DECLARE_KFIFO(events, struct gpioevent_data, 16);
 	u64 timestamp;
 };
@@ -1847,6 +1849,17 @@ static __poll_t lineevent_poll(struct file *file,
 	return call_poll_locked(file, wait, le->gdev, lineevent_poll_unlocked);
 }
 
+static int lineevent_unregistered_notify(struct notifier_block *nb,
+					 unsigned long action, void *data)
+{
+	struct lineevent_state *le = container_of(nb, struct lineevent_state,
+						  device_unregistered_nb);
+
+	wake_up_poll(&le->wait, EPOLLIN | EPOLLERR);
+
+	return NOTIFY_OK;
+}
+
 struct compat_gpioeevent_data {
 	compat_u64	timestamp;
 	u32		id;
@@ -1932,6 +1945,9 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 
 static void lineevent_free(struct lineevent_state *le)
 {
+	if (le->device_unregistered_nb.notifier_call)
+		blocking_notifier_chain_unregister(&le->gdev->device_notifier,
+						   &le->device_unregistered_nb);
 	if (le->irq)
 		free_irq(le->irq, le);
 	if (le->desc)
@@ -2160,6 +2176,12 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	INIT_KFIFO(le->events);
 	init_waitqueue_head(&le->wait);
 
+	le->device_unregistered_nb.notifier_call = lineevent_unregistered_notify;
+	ret = blocking_notifier_chain_register(&gdev->device_notifier,
+					       &le->device_unregistered_nb);
+	if (ret)
+		goto out_free_le;
+
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(irq,
 				   lineevent_irq_handler,
-- 
2.39.2

