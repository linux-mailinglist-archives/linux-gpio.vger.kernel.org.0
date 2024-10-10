Return-Path: <linux-gpio+bounces-11136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8302E9981AF
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 11:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 003991F22630
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 09:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25031BE236;
	Thu, 10 Oct 2024 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kt3iZLm3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446A1BD4EB
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 09:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551443; cv=none; b=QskwcNbBEYS7w1mygubENy5ZT8odzz1FQYoziYUTVa5YAwDvr+f5PlQdm8wVB4WZQvoWZ5390YJFj68q37xBibOJf31/n0+X7A5IgAx3qEAqqNSj39nDKvJZbAVCyp6KQUCYOpkx+5H+BoqDgvpzMQu37H5DBBvg/cN9/EPvCR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551443; c=relaxed/simple;
	bh=aW/b/T1d54Yns4/Dn9IWAFr7kazZPhss/gdB8BCgwcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbG+BL35OuKdk6B4XHsqU6YfCbL9N+4QCr3WNT1Wp8kmIvcP5swX2p3boFevb9tTzmIw9dyF5gqANFHivbl0ROWmJiLr4pWwbigeWcmaLSVRquSi0rM530x779EuAz7pkR/7dPhZpl5SH2rmSc67qnMVW/AVdEzMsiQgcLPgg+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kt3iZLm3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37cc846fbc4so417020f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 02:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728551440; x=1729156240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvoKEm861qnmPYL94kUVnrmcLydUdJpjADRRQZ6lwKU=;
        b=kt3iZLm3KuFGROtMehJlQW7OvGk47PgthNdLV/hfyLd6ckH4rKE9ijGgmsugHpmy0O
         5MPsk0YptJVmMi+uv5aZHYCjcAn1gJwOPAYCnyn2XnGdXFNo68gx3izCHl5exnun+4/X
         5E5p+TCb3R/+jkSLdVovVSytk8Vtp/HOUU/ZBwaKlVtsay57etuWGRY1moo1XFP60v5w
         AzctradVUKoc305FY//P/7YEDkVq/9sFjB0CkIM8c0O/VPEO+A0ByBRsoLBXVbtT0fZu
         wK3RNcnnZDBSUtjjmnCncrASLrQVXhOFJHR7uaMdX7zO/umB4J0LtnA0cvqyL2pc50sx
         aVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728551440; x=1729156240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvoKEm861qnmPYL94kUVnrmcLydUdJpjADRRQZ6lwKU=;
        b=celcqTcQ2bghtjJfn5+KMVRaKwaCwK7DB/OBXDMnYTLjn18wOiExrkd5kGt8hPEMW0
         E9iWJoKH8kdFSKVG19VSRZq5M29P/m+WwOhnsGeYxtgsdHRqEuIF0TvkPYhnvIHfgMq1
         igLSHAsPp/Mfs+9+sW7dUCa8t774hWYW4Ccy7yKmix4N5P+vP/Y+Hxlf6bFr5Bd+Xm08
         1j77/5yonqUXGMakJF6Xd64p+N+RyhnPnIENdrGD0s/sKnrcU9wt05YaRJd5nwPj6p88
         hDcRmjfc1CRYjMr4cVDztx6wHyFS1fEneZdQ3DJ06K7+4ORBOSQ/pZFrOJR7vJveqf7B
         V2Ow==
X-Gm-Message-State: AOJu0YxxPCFDj+7FdmgfRsylcZPzBqiwJpXSjxAKf9MnmTvdan7r0gYE
	afoEHWLCoRsh3ruprx75/tYkG96zGVocSwT9bYvPZ5jjTldZziMfmkHrZi3z5tnbAv4kjVsHy/o
	h
X-Google-Smtp-Source: AGHT+IFKSWpq+jqGFW9ejz23rt/KEV5YFr6YCkz/jzb4YhUhAucXzJ3D8WvGbchMf1Jov1MtKswThQ==
X-Received: by 2002:a5d:5745:0:b0:37d:3742:a5a7 with SMTP id ffacd0b85a97d-37d3aa31aecmr3851200f8f.33.1728551439662;
        Thu, 10 Oct 2024 02:10:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5e5d:bfca:20cc:60ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff785sm9913305e9.13.2024.10.10.02.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:10:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Oct 2024 11:10:26 +0200
Subject: [PATCH v2 5/6] gpiolib: switch the line state notifier to atomic
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-gpio-notify-in-kernel-events-v2-5-b560411f7c59@linaro.org>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
In-Reply-To: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4156;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q03bW6eyBOMt/E/qq9Du/B83t4iIgrEc2Jdh/e3KSKE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnB5oHqntgTP9D3GRBLflqkJjoa4tgqazn3xsg4
 G/OwOJGX5CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZweaBwAKCRARpy6gFHHX
 cvPDD/9Ik0eOYYJZbp+zkQrkn9NONoXJK2PKerMqcD83cWWnZ7Y7Qrn9NJnLv2Y2WrK4H/u6fzG
 p/Csa+5KLQkxwKZAOjs9xqhswL7sOtc4t1ROjuncQADKNEHseWriisvGsdgZIEwSMHOyHYVonBd
 HBvoHur5hAAFjybhap4idMToqe2JysZYGdGSs74zhTxDCVgmhZfss62uChi7heOlrpy5cF/j3aN
 ICPlANAsajmm2iw0iFTvsl9mO2vcUqZ7n0edZehxzCVoksXW9zdKWSl8ht1gFUgJKtX8ToFH2Rc
 E8fURcreYxIYpfz6gech/st9Slg39/xTVLSkjqmpO3Q6DbBNBWYM6djSz120O+Vlp9acpTPZBQD
 kwmNEUypsaCzbBEZwX1v7P74mY9veus6Tk8Tj3+6z0QMgeqF60c8VkAMNnVJ6MWZEeONs+nd/Ml
 NI4zEkxGyHfrkGEC8tRBfemImPJCl9LKVxm5LzwQvF6iDIkfAuOxkgmwoNagJQTVaRFFoeaFn46
 IPsPmx3vGy3rBk4+JqE7TVvr48FObFhHcPu5ujx1DfRJX5wDBWPg63J2UF6EQvBPBC3N8vUmyWY
 DbilOiqpuqqUYibh4xmm6mYEMCxtU5HR5BYYuFiGvVAv/1dbVwyxWJ/XqS75eRtp5FEYVSTHvQS
 O9oCwfKy46HK/Xg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With everything else ready, we can now switch to using the atomic
notifier for line state events which will allow us to notify user-space
about direction changes from atomic context.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 22 ++++++++++++++++------
 drivers/gpio/gpiolib.c      |  6 +++---
 drivers/gpio/gpiolib.h      |  2 +-
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 2677134b52cd..7eae0b17a1d6 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2673,6 +2673,16 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	if (!test_bit(gpio_chip_hwgpio(desc), cdev->watched_lines))
 		return NOTIFY_DONE;
 
+	/*
+	 * This is called from atomic context (with a spinlock taken by the
+	 * atomic notifier chain). Any sleeping calls must be done outside of
+	 * this function in process context of the dedicated workqueue.
+	 *
+	 * Let's gather as much info as possible from the descriptor and
+	 * postpone just the call to pinctrl_gpio_can_use_line() until the work
+	 * is executed.
+	 */
+
 	ctx = kzalloc(sizeof(*ctx), GFP_ATOMIC);
 	if (!ctx) {
 		pr_err("Failed to allocate memory for line info notification\n");
@@ -2837,8 +2847,8 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	cdev->gdev = gpio_device_get(gdev);
 
 	cdev->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
-	ret = blocking_notifier_chain_register(&gdev->line_state_notifier,
-					       &cdev->lineinfo_changed_nb);
+	ret = atomic_notifier_chain_register(&gdev->line_state_notifier,
+					     &cdev->lineinfo_changed_nb);
 	if (ret)
 		goto out_free_bitmap;
 
@@ -2862,8 +2872,8 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	blocking_notifier_chain_unregister(&gdev->device_notifier,
 					   &cdev->device_unregistered_nb);
 out_unregister_line_notifier:
-	blocking_notifier_chain_unregister(&gdev->line_state_notifier,
-					   &cdev->lineinfo_changed_nb);
+	atomic_notifier_chain_unregister(&gdev->line_state_notifier,
+					 &cdev->lineinfo_changed_nb);
 out_free_bitmap:
 	gpio_device_put(gdev);
 	bitmap_free(cdev->watched_lines);
@@ -2887,8 +2897,8 @@ static int gpio_chrdev_release(struct inode *inode, struct file *file)
 
 	blocking_notifier_chain_unregister(&gdev->device_notifier,
 					   &cdev->device_unregistered_nb);
-	blocking_notifier_chain_unregister(&gdev->line_state_notifier,
-					   &cdev->lineinfo_changed_nb);
+	atomic_notifier_chain_unregister(&gdev->line_state_notifier,
+					 &cdev->lineinfo_changed_nb);
 	bitmap_free(cdev->watched_lines);
 	gpio_device_put(gdev);
 	kfree(cdev);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 839036b116a2..9b10f47832d5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1026,7 +1026,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		}
 	}
 
-	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
+	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
 
 	ret = init_srcu_struct(&gdev->srcu);
@@ -4089,8 +4089,8 @@ EXPORT_SYMBOL_GPL(gpiod_set_array_value_cansleep);
 
 void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action)
 {
-	blocking_notifier_call_chain(&desc->gdev->line_state_notifier,
-				     action, desc);
+	atomic_notifier_call_chain(&desc->gdev->line_state_notifier,
+				   action, desc);
 }
 
 /**
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index d24cd9e8b17c..2799157a1f6b 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -72,7 +72,7 @@ struct gpio_device {
 	const char		*label;
 	void			*data;
 	struct list_head        list;
-	struct blocking_notifier_head line_state_notifier;
+	struct atomic_notifier_head line_state_notifier;
 	struct workqueue_struct	*line_state_wq;
 	struct blocking_notifier_head device_notifier;
 	struct srcu_struct	srcu;

-- 
2.43.0


