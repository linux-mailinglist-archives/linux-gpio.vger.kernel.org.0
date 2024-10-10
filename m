Return-Path: <linux-gpio+bounces-11135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D239981AC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 11:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55E711C2146F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 09:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996211BDA8D;
	Thu, 10 Oct 2024 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aS1f1M9O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6011BC9F9
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551442; cv=none; b=l2ZDUQu/rq/gG/hfk4gOjLPCGps6t2J8HI82IH29b8dFUCoPvfmLqueqTPX5+Q54UuMTI2SVzyvX6i19yENfAco/J9Y2Le/z1ByyPmPfEtKg7jDXT9typU0ErlPkTgpU8uJdtufh6RONrLUesN+G7Iy1pEAio+TqqpZtzSoSij0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551442; c=relaxed/simple;
	bh=mVy8M39xpgHamH10lQJesyfPKmnaqpskSJdZZ6zu3FU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUEGYcEt/m2fbZNGHO1rBju9RXSz99XwddZs30bN+xLQmRJxgER9njw9SO+NFkCYQA828C/IotMxxd4b3u6l3HuLcQJNZTM9JlHsbZPjRwx580ExSWsOaT8gKgPIgSDk5n1qTlsCzA2nYCnhPcnvN3q5h5KIVTCYpWrk9H2qSQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aS1f1M9O; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431137d12a5so6072165e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728551438; x=1729156238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xHrQaBWU1wo1cXgJKaVBgoXiXzmKNYjJCV9azRNaU4=;
        b=aS1f1M9OgAiC/ygUoYhVV6fqeRsMC8/Ny6UvAFbXZLnSdamPATabsWWjoJZnRDDkF+
         KYONT0oEhxpoXQsqkTNdRUkGviy9ZZK6MUypKdF7n5xP9Lld4BlvPKhDjfkfl3OBqiJ2
         7gd2CATyZ28CLg/Uy2/c3MUplRT4RHNgZtole4YuOuAUdudGhECcSIA+SRF7yfDBDQtk
         efN/a2WLL4p/lN58uJ6i9m7KYJxZSXkkX6jQ7JOCEPT5bfFQbHq5Rop1aVqK7FVavpts
         +sgr7BYE0ocHSjvlcqDc2xHPTVDTQ33bw2Nu6lAfmZdOftcR77IvI6zs3shFB+IN6MOc
         MC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728551438; x=1729156238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xHrQaBWU1wo1cXgJKaVBgoXiXzmKNYjJCV9azRNaU4=;
        b=ZuDUzAVZ1jIUzp67Ee0TKKdeJ9wusSgcvEHltlv1AtEo6huQIcY5OLRv2eqAxFphSC
         YzAbe6Gs+PHt/CWxH3rSa8PsoO/hIUcxhl8nWX6cRHkDLyYf5oMOGWgGxzRyvmayhy8p
         LdCPjPDj1uB6cM25u6b3JhjMXzmLgQtKHnB82FQ7w3wje2r+gyTrR9frG7DhPShBHzBh
         QVwV4+09X5PtLoDnmjpWCgvEn846EZ/R2tCCl1OJlzm8xvTsye9LRtMfWHK5m3bg5ug2
         mgoiNJ68O0COiIlCJ1BxHIVqbCYSf7hpw5kdOuhQ2uYJ9/+2Xa5Kps1YuxGBpd8YLo9Q
         KFkQ==
X-Gm-Message-State: AOJu0YwEIRPjdzylZSGy8GRYEV2dwl5sDWaQFkIoSZrGeatRx9rpqvYI
	dyhHfd1/fRAqHkoY2CaNXuSuqaQQR6ooluWpkmGePU9y5lGRz+j2oXye6ADhjt8NhjcxpN2NOzT
	s
X-Google-Smtp-Source: AGHT+IGWnTMl52kdHU0OAALf275O2mhqkYoiP4N91jpTbJiZZSEu9KAs2g4/XaDGDW7uURA9AwOptg==
X-Received: by 2002:a05:600c:1f11:b0:42c:b995:20d9 with SMTP id 5b1f17b1804b1-430d6faca5fmr48557505e9.28.1728551437933;
        Thu, 10 Oct 2024 02:10:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5e5d:bfca:20cc:60ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff785sm9913305e9.13.2024.10.10.02.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:10:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Oct 2024 11:10:25 +0200
Subject: [PATCH v2 4/6] gpio: cdev: put emitting the line state events on a
 workqueue
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-gpio-notify-in-kernel-events-v2-4-b560411f7c59@linaro.org>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
In-Reply-To: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4357;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sCvTb92VsU9o5sQdk/sTByAevcKbdTEudD1FU5KTG6Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnB5oHslqxMHergOZ85ymfnNVnjvhx3UNOSbjhy
 2Tk58ON3MaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZweaBwAKCRARpy6gFHHX
 cpHhD/9U+MxzygvDhzTtOpl7hxtef7JseBNg7YFZUWg3KraN6xZf2ymhT7rzcDY+X4/yhxSGLm2
 beutzqT3WHKrBUJ+uNbipqgdi3i+W8CjU/pr1Ok1KWwjqPTJiWtWEtWnrbTA55n1wLAYiKPxLNj
 Gv8GmuK66jlM1tlJSo/FZkpU6dTi40qQqg4FGaJGci7CWj4HsB6rB6sh0Sqii40nqLXUsQbLA++
 hzAL+Et9JLk1akIAWA9y3h4Dq8+lVuntGVWzJAkqvbIm5xbJL6xKXHjXKBqx/kNyGtuOcSnsIUQ
 Pknm5X74ARS926scOPe6N7KLI54Pu3ib/B+SD+aTKoT9VIRHRnS7fwWgfwQA/QN5s1G/mIfiqwZ
 zcfBu5hT+ct6hlZTB25+n39OUwmUQvI/YmN2liHsLwjtGg5fKlwpojb351lJQxohmnhf0TjsWKz
 4UXNDuwnR4LmXIlRA2qY7SR5fr5AF4/3zBY/CAMTBslwDKbSKQUhUFbxFRlWw+JVbJvciWPJOrF
 vxuUQQq24KLXzoB6urAc1t6jr3uamnw92u0NKLcH1IiCl2YLwQEV5qWB1mto8PKbUtX+0tm/mKa
 Dcpp10U8G5Z/vkJpGSdCqk3mvjVQHpgEmzilP68dMZTtoixEh2UdHHi0G1FF7/lKFVTGsGi+gi0
 AOz2k5r6wbw5zeQ==
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
 drivers/gpio/gpiolib-cdev.c | 72 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index dec6c9a6005f..2677134b52cd 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2451,6 +2451,7 @@ struct gpio_chardev_data {
 #ifdef CONFIG_GPIO_CDEV_V1
 	atomic_t watch_abi_version;
 #endif
+	struct file *fp;
 };
 
 static int chipinfo_get(struct gpio_chardev_data *cdev, void __user *ip)
@@ -2621,29 +2622,75 @@ static long gpio_ioctl_compat(struct file *file, unsigned int cmd,
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
+	scoped_guard(srcu, &ctx->gdev->srcu) {
+		gc = srcu_dereference(ctx->gdev->chip, &ctx->gdev->srcu);
+		if (!gc)
+			return;
+
+		/*
+		 * We're doing this late because it's a sleeping function. Pin
+		 * functions are in general much more static and while it's not
+		 * 100% bullet-proof, it's good enough for most cases.
+		 */
+		if (!pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
+			ctx->chg.info.flags |= GPIO_V2_LINE_FLAG_USED;
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
-	supinfo_to_lineinfo(desc, &chg.info);
+	ctx = kzalloc(sizeof(*ctx), GFP_ATOMIC);
+	if (!ctx) {
+		pr_err("Failed to allocate memory for line info notification\n");
+		return NOTIFY_DONE;
+	}
 
-	ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);
-	if (ret)
-		wake_up_poll(&cdev->wait, EPOLLIN);
-	else
-		pr_debug_ratelimited("lineinfo event FIFO is full - event dropped\n");
+	ctx->chg.event_type = action;
+	ctx->chg.timestamp_ns = ktime_get_ns();
+	gpio_desc_to_lineinfo(desc, &ctx->chg.info, true);
+	supinfo_to_lineinfo(desc, &ctx->chg.info);
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
@@ -2803,6 +2850,7 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 		goto out_unregister_line_notifier;
 
 	file->private_data = cdev;
+	cdev->fp = file;
 
 	ret = nonseekable_open(inode, file);
 	if (ret)

-- 
2.43.0


