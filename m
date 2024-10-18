Return-Path: <linux-gpio+bounces-11612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E279A398A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D62851F2561B
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 09:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A771922E5;
	Fri, 18 Oct 2024 09:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IDJ/WP8t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A18191F85
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729242632; cv=none; b=KGYZjmtsuK6cfRKVFvAzpdz7Qy58I9hVafomWZpj1cf+maY56hbohocedX3cGaVOxk2GdGyNogy1sSH3yNZXjen1ry9zrkLyJ32V8bFa8jIU9Tq7PM4n49q8tLVFep3VFOMHdWFnM179ws2EVsPXDF5aTDOe0ZRhOVHrkEEQFHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729242632; c=relaxed/simple;
	bh=PrpJFSn1v8nec0wiPaBWRUGeCDKvtDkJixy1vIPLnV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1nkjcVpl+YsVRCG2HG/wxdbqiEFagdeJLa/j9pCJUQtOA9YhyAt95tCbdzTEdSOjx2sOGg0rh3SiOG26/uW+d+JToJ9D3IXqd9RpeYt1x7ZhywR4DrUNyIg8MTBuKxOM4cfbYIDVPJPykUcxrlOsfbN27g70Ka4V+6szuO0rDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IDJ/WP8t; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43118c9a955so17846225e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729242629; x=1729847429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ9+jptp7Dks8GR7GteYZhyJSD9aHU2HeME8AuCmILE=;
        b=IDJ/WP8tEn1jvshLljmQkpKyXPpgyubb25HYdEze5iYWtFbetBj8ugn776nJQMwwEN
         kr4H06KtpaWVeIpaVfx5ALf2FD0ZPL5H+45HbIGqf6Zgux8r9nlC5/2460kx05eVxv4v
         hMEnNQZrfhgZunz/6GaEOi/elYL61f2kzUZrVaY/xXlK03uOzHQcPbs3mDuSjBOqqCrx
         Segres0XrLWa1CF74/0R2a03bjiX8tqhLSZpGlCth4D1rQGQ1XIlQvNifAjmPGkcAI3B
         6UGGmXRklw7AhQxN4agL1dmBdlVwx+2dbWIwXlkuYsYukuirgRIBTOaGUMehvI/RAqPm
         lNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242629; x=1729847429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ9+jptp7Dks8GR7GteYZhyJSD9aHU2HeME8AuCmILE=;
        b=RUNK3MmIFKXLnkaVD9x9pjt3sI0oLtMJsSEpSmr0E7Ll7SozkI0PQIEaqlxBWAJNlU
         5jb6VbSBgFU8aXwV6cnBOLi+OhDQYAv5rnRffVIX0jrgcmpUik0lGVX0/R92GLzYWWrn
         tvZrYRng+Pn7/I8zSZfJRTpNzxYIVQG8Y+YAnbs2CEzZ1z6HN8I8yHH8PayqWUZTFTr7
         +Uqo3nHFrkR8GhKexImCAGz1gxF5b8cCUZxXjN0xjyToZEqFX+NDUa79SCb+ha2ZxL5B
         LDijMVHtABS2yRlf1eZHtUpwT1m2HXtNLR7yj1nVjftLnlfl63hDxYgnK3MSeBPHXFDf
         ZK8w==
X-Gm-Message-State: AOJu0YzMesFz3j6SMN4Lp+GLgq0Owt8TqVpnoqI4/kZo+g6UTU28rs3m
	bFAVIecPwDUYGD63o14lFBo7HOBVCaTlWUcxG+8UQljio/QCbik8HRyP2ZGRCqMpghWw7/k2hJB
	2
X-Google-Smtp-Source: AGHT+IFmqL8sHA3yU+jyEcXkUGG9y3Ve5K2STpHvAB3B5giEyg4OKEDNCoHJjkz0nT9f6TRUOnZ6lg==
X-Received: by 2002:a05:600c:3513:b0:431:4a83:2d80 with SMTP id 5b1f17b1804b1-431615c0697mr13134425e9.0.1729242628874;
        Fri, 18 Oct 2024 02:10:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:45a3:93e:5196:d8ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160dbe76bsm18700455e9.10.2024.10.18.02.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:10:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 18 Oct 2024 11:10:14 +0200
Subject: [PATCH v5 6/8] gpio: cdev: put emitting the line state events on a
 workqueue
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-gpio-notify-in-kernel-events-v5-6-c79135e58a1c@linaro.org>
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
In-Reply-To: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4814;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8oH0OI5uVpWymK+8p6k+EMIaU2WzdTdaL9nSO2G6k4U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEiX7hW6vtWqYx1czNkm1yo2NiV1EAvlNZn0x9
 lL1z8mzDRaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxIl+wAKCRARpy6gFHHX
 crkbD/96p00C/wm4UJamFYsrbsS4zC9BxFflYyeS1729zFWFg85I9O6a5WQGMg8glJohrrkbls3
 kDfgbdeQxPAEaWVoG/cWshAy8x09nXd8R+zMGWdeU3ZlhDr6iXR73N3x/d9rQ/vietCb0PAc7L9
 HnsuVR/o/IZwwCj1xnNhv+hVRTUPEYx2J/V/CJc20V+D4F4KeyCNRhXnTrI9YdTvZRcgAfrZ8BU
 KRI7lIUGZCPtfCE28utFrO6cWvhWHzpR+Q7WuTjk/DxwbDFUVHql0EXl1GI1YgANs9eO9PtXtuG
 DzV/MmLGIEnlwQwFiaZhk8wjabZcrX6ODshIBGJ1vWUP9rlvTzgrehxquS3n3/vQVAzSCTPKrms
 SIy///AoIPQeSX+vJZjsupC5YfKpbP1UXYIiQEHhTEtDimWsXDGYW1UAl9MWFblX+rxT8ocmM6B
 DnkTIUuRN2pLkSPi8G37kzwmkX1aI/LpuDw9nUKM2lE2V2F+kSMGc5SEZObXNdY8YMP8EZ3rwVo
 gnwvs68lEapYLn1s/vEdt3AaJT2plXPTTz4r05WbTrW4WwPqI685N7yqQGVHqpXy0ZzUiyt7q21
 YqRfDOdFRRa7v4IpwOpCpXXA1vtX6633P2ZfR0fUqDyIySuEitFrfTZT+72qfd9YLQWipwhxsr/
 glsWgRus6XSrUkw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to allow line state notifications to be emitted from atomic
context (for instance: from gpiod_direction_input/output()), we must
stop calling any sleeping functions in lineinfo_changed_notify(). To
that end let's use the new workqueue.

Let's atomically allocate small structures containing the required data
and fill it with information immediately upon being notified about the
change except for the pinctrl state which will be retrieved later from
process context. We can pretty reliably do this as pin functions are
typically set once per boot.

Let's make sure to bump the reference count of GPIO device and the GPIO
character device file descriptor to keep both alive until the event was
queued.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 82 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 71 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b242fdb1ad28..7759dca92f8b 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2333,6 +2333,7 @@ struct gpio_chardev_data {
 #ifdef CONFIG_GPIO_CDEV_V1
 	atomic_t watch_abi_version;
 #endif
+	struct file *fp;
 };
 
 static int chipinfo_get(struct gpio_chardev_data *cdev, void __user *ip)
@@ -2502,28 +2503,86 @@ static long gpio_ioctl_compat(struct file *file, unsigned int cmd,
 }
 #endif
 
+struct lineinfo_changed_ctx {
+	struct work_struct work;
+	struct gpio_v2_line_info_changed chg;
+	struct gpio_device *gdev;
+	struct gpio_chardev_data *cdev;
+};
+
+static void lineinfo_changed_func(struct work_struct *work)
+{
+	struct lineinfo_changed_ctx *ctx =
+			container_of(work, struct lineinfo_changed_ctx, work);
+	struct gpio_chip *gc;
+	int ret;
+
+	if (!(ctx->chg.info.flags & GPIO_V2_LINE_FLAG_USED)) {
+		/*
+		 * If nobody set the USED flag earlier, let's see with pinctrl
+		 * now. We're doing this late because it's a sleeping function.
+		 * Pin functions are in general much more static and while it's
+		 * not 100% bullet-proof, it's good enough for most cases.
+		 */
+		scoped_guard(srcu, &ctx->gdev->srcu) {
+			gc = srcu_dereference(ctx->gdev->chip, &ctx->gdev->srcu);
+			if (gc &&
+			    !pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
+				ctx->chg.info.flags |= GPIO_V2_LINE_FLAG_USED;
+		}
+	}
+
+	ret = kfifo_in_spinlocked(&ctx->cdev->events, &ctx->chg, 1,
+				  &ctx->cdev->wait.lock);
+	if (ret)
+		wake_up_poll(&ctx->cdev->wait, EPOLLIN);
+	else
+		pr_debug_ratelimited("lineinfo event FIFO is full - event dropped\n");
+
+	gpio_device_put(ctx->gdev);
+	fput(ctx->cdev->fp);
+	kfree(ctx);
+}
+
 static int lineinfo_changed_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
 	struct gpio_chardev_data *cdev =
 		container_of(nb, struct gpio_chardev_data, lineinfo_changed_nb);
-	struct gpio_v2_line_info_changed chg;
+	struct lineinfo_changed_ctx *ctx;
 	struct gpio_desc *desc = data;
-	int ret;
 
 	if (!test_bit(gpio_chip_hwgpio(desc), cdev->watched_lines))
 		return NOTIFY_DONE;
 
-	memset(&chg, 0, sizeof(chg));
-	chg.event_type = action;
-	chg.timestamp_ns = ktime_get_ns();
-	gpio_desc_to_lineinfo(desc, &chg.info, false);
+	/*
+	 * If this is called from atomic context (for instance: with a spinlock
+	 * taken by the atomic notifier chain), any sleeping calls must be done
+	 * outside of this function in process context of the dedicated
+	 * workqueue.
+	 *
+	 * Let's gather as much info as possible from the descriptor and
+	 * postpone just the call to pinctrl_gpio_can_use_line() until the work
+	 * is executed.
+	 */
 
-	ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);
-	if (ret)
-		wake_up_poll(&cdev->wait, EPOLLIN);
-	else
-		pr_debug_ratelimited("lineinfo event FIFO is full - event dropped\n");
+	ctx = kzalloc(sizeof(*ctx), GFP_ATOMIC);
+	if (!ctx) {
+		pr_err("Failed to allocate memory for line info notification\n");
+		return NOTIFY_DONE;
+	}
+
+	ctx->chg.event_type = action;
+	ctx->chg.timestamp_ns = ktime_get_ns();
+	gpio_desc_to_lineinfo(desc, &ctx->chg.info, true);
+	/* Keep the GPIO device alive until we emit the event. */
+	ctx->gdev = gpio_device_get(desc->gdev);
+	ctx->cdev = cdev;
+	/* Keep the file descriptor alive too. */
+	get_file(ctx->cdev->fp);
+
+	INIT_WORK(&ctx->work, lineinfo_changed_func);
+	queue_work(ctx->gdev->line_state_wq, &ctx->work);
 
 	return NOTIFY_OK;
 }
@@ -2683,6 +2742,7 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 		goto out_unregister_line_notifier;
 
 	file->private_data = cdev;
+	cdev->fp = file;
 
 	ret = nonseekable_open(inode, file);
 	if (ret)

-- 
2.43.0


