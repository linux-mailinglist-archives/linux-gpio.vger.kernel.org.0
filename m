Return-Path: <linux-gpio+bounces-11509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A969A1CD7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 10:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 321491C2733B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCC01D61B7;
	Thu, 17 Oct 2024 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q2wqJCy+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46C81D5CD3
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152876; cv=none; b=uIn1nuujchXa/d2DT+g8SyneANdrp/yZfCmhHAvNf/+cwt9HW+c1m90dgMP2bibZkS3c9NLlB9UiXTug2/sNdzKmsOcTldGW7/FK+Xb0F2UUqqQ7Vq6sKL3mpz1JdGoVRZuty18hlGrd3h6obzZ7JW7Ds7nrK3Y6hLZkWYlMBZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152876; c=relaxed/simple;
	bh=Jc6C6BtaJP7y1Wa50WUZYA4CGv0mhlupt88QoaGx7vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mm4fa3oYLhdX+JuYpMRN21p0z6RjNPVnH67i/R9BpBL6k7DPyi0nTv62YE1Ep+7sUbYTnc69ZHKKNFO6mLOqE2cKnWQkuayDp+93ZIzyMsZj+kKpUO2PSzqicX4+VMBSyefbVG7IltTGrIvTidWKhXfU20+JokenGCRbPKKC/9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q2wqJCy+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315baec69eso2900735e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 01:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729152872; x=1729757672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REHoi0BzREleJqZ/Nl2V6XA6vWcoShbFDJgBvOZh4is=;
        b=q2wqJCy+ST2HNlBv/obGdcSBSjDfqppbAEhMtEKt3K6UJJ98VDndT4C7ylllzfkF/T
         arBTIK54iBMOSNbizskFDQMrIElqYyzNcOaDZdLJRRhSmLcNj0ocykWlpM365Ze7A5pE
         7/XgrZbw0Gjj5XaqV/Rlu9L+vPmvijdT9MstzdvgS6bdP28kRixX/0nI3NACHUchmc8K
         n6SZw+OAT070RrysOBaayaHVUdmTXgNmCAVQnWwwB/Bqgv6NGsFJd/+uIhsGKyeFBUTS
         SLwF9GChGRtGHJrDieL1+MVF7VE2iOIDtuC15XHT9rDudrPsNtTJKiqPuChvSmP47XCM
         xygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729152872; x=1729757672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REHoi0BzREleJqZ/Nl2V6XA6vWcoShbFDJgBvOZh4is=;
        b=EXUQrqi7ksZXvIwxzAzGyF249ulxNmAMlXxlaI0Yh+nRVVCev9QUeN7H0Fj3Bve+p9
         uk+finUQ0N8htJXDXg4kW0rXDzHW53x/YqmUMcSnhSd7+nNHio4Y1YhPcj1PuEQihnEN
         gO4v2eQynsRZ4iZTTswVRT1OXmJpG6YutQzl02mQOhGeoCOxan1cmIRp/z8g81Pw3HgR
         fSb6+/k+haQ8uxxc9KlZSSDK2wg1tF/xxQ27LmhsNFU4gpxDwHYDKz9AXYuWFeL0vjrS
         vT3kocOgIBsF/vMAUmhMvBwWPdHfDtaDw0XH1Fx8cz8955QBFXvC+AVPA/UrKNJc1r5k
         y/ZQ==
X-Gm-Message-State: AOJu0Yw+MmMWg2n0PDNINGh7QIDL/CktNlewSVToeLEKUv6jqJrk7ZYH
	RZTvpE9fP9x+kSHFlxbRM2G8NRrej1JmxGJlnQdovKHvL5NMqiDY1o5urZ88jNA=
X-Google-Smtp-Source: AGHT+IHl1IrDyN4qqCTCX3GhdMHOxw0XgQiPW7XFdlWOXaoZligJ9HpEzZe4yEk05etTo9uqWBs9iA==
X-Received: by 2002:a05:600c:3d89:b0:426:5ef5:bcb1 with SMTP id 5b1f17b1804b1-431255d55edmr144095315e9.6.1729152871940;
        Thu, 17 Oct 2024 01:14:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c61ae2sm17855695e9.46.2024.10.17.01.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:14:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 10:14:15 +0200
Subject: [PATCH v4 7/8] gpiolib: switch the line state notifier to atomic
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-gpio-notify-in-kernel-events-v4-7-64bc05f3be0c@linaro.org>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
In-Reply-To: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3446;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JremVAHUv8l5XF85K04PimL7Ca9vBLgcOvsxmUmBC6Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEMdeqvCdrahsiwFUY+YJY5Bs2rgQfuM6FNsvE
 zxyuHeRTdCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxDHXgAKCRARpy6gFHHX
 crg1D/49zyA6qTTp2Dqj9QWMfbL2YIIIFAYQk7boqVgR6QyXwhLN0cEsB8CVh8donSyhFIcpjW1
 5hd+QyR468qYZyhGqo/pgyh1zanCyhQaeJvz+JhV890kP2AZeWgdJmJGeG7sVQCKizznvmWKYKP
 BOTl3WtDnznfVYou2hpH494gsxQ24S5GUw/XZcY0fJGC3ACAPLEZuU93bRJh20YiPfdeCNQhAEd
 AhYXj7We+kBEnc4h++/WT0zV9qom3ebd9sOj2dfm2/Si55EBEnjkUIdhq74ZKOvJJR/djQHhyzQ
 xYJcmewAVrUI169+6FMLOIr9mppoLNmWqPvrK/x5nWrQnjzhwXLhEDtYtWKTyottFqfE1DMIWgo
 W6X2QleXGjtbpyPUZp4mzRVnJGU6hozS/lFiibLcm6RwoUdJuLhZSPrXbSmCtFaTvit20JEj8pK
 VNzS9L4FoyuHbNOIJeafE+BeqSgZi36CWflTTmvTzPnagMbVreEid/TTVfL11FyTMc2XZbaAXZZ
 cWW9p3EPj50ZrYP3CHmQk2cuQ45LaMz0zbhoSBf+joxVDus1ZNf9MK2YFV2aA85rax6I+pOkOT/
 QL01TesybaBamBBgKABF88kq0RBH6auLqt6WhiYhq4bM2+YFH1QplLofHHVgmTbZ9fqN6LIsWui
 h5za3umPvLuXlLw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With everything else ready, we can now switch to using the atomic
notifier for line state events which will allow us to notify user-space
about direction changes from atomic context.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 12 ++++++------
 drivers/gpio/gpiolib.c      |  6 +++---
 drivers/gpio/gpiolib.h      |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 7759dca92f8b..cb4fb55e2696 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2729,8 +2729,8 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	cdev->gdev = gpio_device_get(gdev);
 
 	cdev->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
-	ret = blocking_notifier_chain_register(&gdev->line_state_notifier,
-					       &cdev->lineinfo_changed_nb);
+	ret = atomic_notifier_chain_register(&gdev->line_state_notifier,
+					     &cdev->lineinfo_changed_nb);
 	if (ret)
 		goto out_free_bitmap;
 
@@ -2754,8 +2754,8 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
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
@@ -2779,8 +2779,8 @@ static int gpio_chrdev_release(struct inode *inode, struct file *file)
 
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
index 807bee86afd5..83e85dbfdeed 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1026,7 +1026,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		}
 	}
 
-	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
+	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
 
 	ret = init_srcu_struct(&gdev->srcu);
@@ -4098,8 +4098,8 @@ EXPORT_SYMBOL_GPL(gpiod_set_array_value_cansleep);
 
 void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action)
 {
-	blocking_notifier_call_chain(&desc->gdev->line_state_notifier,
-				     action, desc);
+	atomic_notifier_call_chain(&desc->gdev->line_state_notifier,
+				   action, desc);
 }
 
 /**
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 8737e1641278..a54be597d21a 100644
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


