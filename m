Return-Path: <linux-gpio+bounces-4489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA46F8811FD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 14:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 115591C22658
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 13:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099BF4084E;
	Wed, 20 Mar 2024 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OIuP++8w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F9640843
	for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710939596; cv=none; b=tp//qb5aG7oWzI2AkLMUtq5omv6Uy16T6baKBiZh9q/8upT+t3uEV0rvyQoTl/Xv0Vn2Ntz6PbdRm9BL7KdjO1KfM/o7enhTX6bdGKmT0FM4oeJQDMX+rq5seiChxCjJ9R4N93GLHY3joX48017LsbrLtUiTpdPAehyGIxUboRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710939596; c=relaxed/simple;
	bh=WypSOPYxZf8hLVFguCB+Z349olHSUiTKhbVrkkbcKio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G51L+Krh40ikavzh0uxaV6KJ1bIbo3PMW3CborqRkwNfazRxCLB5h2hwtf740UgoJP+u15bt7LSQpHaH9jUtKsNdO85JvouCylD0lOb/hu2a02BCJt9bCGOgx2MyMU+Xtztx4m+b1KnlvWtuftexL6mOL83g4d6wGG3/lEVOT+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OIuP++8w; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41467d697a2so10662465e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 05:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710939593; x=1711544393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ydBKfYW6ZA8FirJ5fQQwt7gjzIdS6ifrf5l5yvc5ZqA=;
        b=OIuP++8wZ4sCALWiHC5ERsyFxwPrOEX6diekgkESTi12VlrRFs6ZjUzfMKvAjlFGh7
         IQpF7Oa4DtnzDFvjB4c1zoStl7Me237Rgvyy6o3cAFu+kzOuRRwwocBU11/6xGEKnWYf
         BG2vLtPlZFq/1x1vUM7CUoE/oOKumwkt1QSBDSTnoQy3Lyr5ygnOmoiOXu3qMKKwZvzx
         Gp3upc7mGYAIlzUrKroy+YHoXMDytTs+3kdX6xZtZ/1Cm2meh/gxaIflFRaC4JaxiGwh
         6yGOjG0qJLCgdMd6bM6rgLRHJo/KoiqiRSSEs0kNAag93+nza0uyzGXTPtZfHiQs3x0B
         FmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710939593; x=1711544393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydBKfYW6ZA8FirJ5fQQwt7gjzIdS6ifrf5l5yvc5ZqA=;
        b=m6oEDkHmNL641nHZUMYTp3LAsUycgsci9mhtS252eqUIO02lXraHP9ZtH5Lt/gKerE
         pxxARYdqjntrJqd4HSV8C82DDs+/YPIsz61ugnUC5dAkf5cCFze1bJ/giyDvY7cfxAYt
         E/OBxknDgnLva+Em4DibtCLq+rjZgsGBjl0JaD8/ewLqDtpCUxNrAgU2+DpA6WMYMMHT
         fJMTvgqJzBf0q7s/IAXEiEEnAIH6jIZKqRE42m4mtp9W8y7A4NT4NHgvWv6SbwiXw9n3
         bYdzLlTs86v9bBW0i94IxDASIvsBw8w8oAvaE4HOwdml8WsbwREbu8nbLlVGbnaKRdyz
         jMUQ==
X-Gm-Message-State: AOJu0YxwQSvWzi+Y7bTFbBK7SxPgT2LMx7VSqiR0eeci3XokeBLpEqeY
	0mC9HJT6PCvPJvIsDiGznPFu/NScJhNjSKBHxtiBx5hvs33T47vwnjLitVDc9As=
X-Google-Smtp-Source: AGHT+IFRXMnhrNxcaSUJEnEEn0kFEye6RzrEeesX/kGIx1Evz1foV2hmWTK7tI2tTGmD48zp4D2g2A==
X-Received: by 2002:a05:600c:4747:b0:414:6865:b5bc with SMTP id w7-20020a05600c474700b004146865b5bcmr2892959wmo.28.1710939592851;
        Wed, 20 Mar 2024 05:59:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3d8d:58f9:2a48:529d])
        by smtp.gmail.com with ESMTPSA id i6-20020a05600c354600b0041464451c81sm2135936wmq.20.2024.03.20.05.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 05:59:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] gpio: cdev: sanitize the label before requesting the interrupt
Date: Wed, 20 Mar 2024 13:59:44 +0100
Message-Id: <20240320125945.16985-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

When an interrupt is requested, a procfs directory is created under
"/proc/irq/<irqnum>/<label>" where <label> is the string passed to one of
the request_irq() variants.

What follows is that the string must not contain the "/" character or
the procfs mkdir operation will fail. We don't have such constraints for
GPIO consumer labels which are used verbatim as interrupt labels for
GPIO irqs. We must therefore sanitize the consumer string before
requesting the interrupt.

Let's replace all "/" with "-".

Cc: stable@vger.kernel.org
Reported-by: Stefan Wahren <wahrenst@gmx.net>
Closes: https://lore.kernel.org/linux-gpio/39fe95cb-aa83-4b8b-8cab-63947a726754@gmx.net/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f384fa278764..8b5e8e92cbb5 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1083,10 +1083,20 @@ static u32 gpio_v2_line_config_debounce_period(struct gpio_v2_line_config *lc,
 	return 0;
 }
 
+static inline char *make_irq_label(const char *orig)
+{
+	return kstrdup_and_replace(orig, '/', '-', GFP_KERNEL);
+}
+
+static inline void free_irq_label(const char *label)
+{
+	kfree(label);
+}
+
 static void edge_detector_stop(struct line *line)
 {
 	if (line->irq) {
-		free_irq(line->irq, line);
+		free_irq_label(free_irq(line->irq, line));
 		line->irq = 0;
 	}
 
@@ -1110,6 +1120,7 @@ static int edge_detector_setup(struct line *line,
 	unsigned long irqflags = 0;
 	u64 eflags;
 	int irq, ret;
+	char *label;
 
 	eflags = edflags & GPIO_V2_LINE_EDGE_FLAGS;
 	if (eflags && !kfifo_initialized(&line->req->events)) {
@@ -1146,11 +1157,17 @@ static int edge_detector_setup(struct line *line,
 			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
 	irqflags |= IRQF_ONESHOT;
 
+	label = make_irq_label(line->req->label);
+	if (!label)
+		return -ENOMEM;
+
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(irq, edge_irq_handler, edge_irq_thread,
-				   irqflags, line->req->label, line);
-	if (ret)
+				   irqflags, label, line);
+	if (ret) {
+		free_irq_label(label);
 		return ret;
+	}
 
 	line->irq = irq;
 	return 0;
@@ -1973,7 +1990,7 @@ static void lineevent_free(struct lineevent_state *le)
 		blocking_notifier_chain_unregister(&le->gdev->device_notifier,
 						   &le->device_unregistered_nb);
 	if (le->irq)
-		free_irq(le->irq, le);
+		free_irq_label(free_irq(le->irq, le));
 	if (le->desc)
 		gpiod_free(le->desc);
 	kfree(le->label);
@@ -2114,6 +2131,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	int fd;
 	int ret;
 	int irq, irqflags = 0;
+	char *label;
 
 	if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
 		return -EFAULT;
@@ -2198,12 +2216,16 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	if (ret)
 		goto out_free_le;
 
+	label = make_irq_label(le->label);
+	if (!label)
+		goto out_free_le;
+
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(irq,
 				   lineevent_irq_handler,
 				   lineevent_irq_thread,
 				   irqflags,
-				   le->label,
+				   label,
 				   le);
 	if (ret)
 		goto out_free_le;
-- 
2.40.1


