Return-Path: <linux-gpio+bounces-11508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7BC9A1CD6
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 10:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F182F1C2731A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6561D3185;
	Thu, 17 Oct 2024 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GTwMu2rx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFDB1D54D6
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152875; cv=none; b=YRWFuYyWN5bh6uzQB2WfsqkeQTv4cCRiDwmSlbs7F4qyFAmUP6v+mSwlk7E+9csi6h4lNxyxD4zeXcRYsA0cfiDqFwfAGn2TU1SMHiaAaNQ5y/y229lRNlN7Dq7XknvWTEDyp663hUG/psWAYeSwEHK9PfBECb8Pkrk7opWocXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152875; c=relaxed/simple;
	bh=ShKnfVnA13yZAURxSbfkTfcYBLmCdqbi8FWGA7M737A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WMjdrs3ZoBMOYYZX8UnqG019NX6cnWrxJrQhCNGPpI1X6IrG1THJUsgcwayiuXmoNwzqVL+YzSlvFD6BkWntV4GsOmNEO69XdQ8FpZZ9RIa8VbFythRhL/t78cB7kXbp7w6D1yeAO4kUh0pkIigu868SzWBmonXzytNV+Ka/Tv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GTwMu2rx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43055b43604so7269815e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 01:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729152869; x=1729757669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0tIf0jtJWFltu4ODvVnK3F2kIEgN0qMoeq7qRt5Wac=;
        b=GTwMu2rxDD2gO/6jJjiZ8eoFRQ5zG6r0m/jb67a7KIKYrZek/qE00hT/k59q5nxUze
         MoT1Ft/vNeEkadbafCeva+e5fnSC5qmIDEnvz9FJlAAAe8vSETSOVDqhXCIyAVb3pqRG
         HQFA9LzIrIJ8KCBARZnAu9vlxtwkDsAQUbrGjUl+aouB+O/3ZxEqTzSiaq10bd/Pw8Fw
         7ecHNG9WghLHHwvEpreCJRDiO6OBCNnIQxGsTG6fXEjITbQPL78nECY6rVM5w02sT+kk
         OkxaeJs2Sf/cA4N4MDCDJUHO9ca5SDr5idc3q+Cd3jVx2O3109UywMKjFndMkBH9Ut9F
         RCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729152869; x=1729757669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0tIf0jtJWFltu4ODvVnK3F2kIEgN0qMoeq7qRt5Wac=;
        b=f9vPl7mvx+qsyRAkVmF/2V6l999fxwx3qo1Nvy8oWLwdx94UquF4k26TJ4+4TqGmza
         L1MtT2angYg6MZlpcpa11Us01Sac+98Gt9S19oJTRtcLXB2XkimdNGzh3zlAUwPBbxMw
         1bxT8ZxRu6AtLxNDBD3mnGWLD+RrB12QE8DKifEMlE/cgtKg06UNiX6dJ1yqxlihPC3l
         jLEYKEI+qw5uAHt+ODKzDnvfPmDwzzj9r9ue9ZWbMNJzFe7oEwNerZvLAyW35GfU7+5R
         ePvE0XBcRkDeT3Qy11GzBp+kJJzruZd8SoMND6jBmHn36GhyAr37GGRCWTjGfZDHtyw4
         xuWg==
X-Gm-Message-State: AOJu0Yy/PduWL8gZUETqLdcgV0KKwIPEoiJxysImPCrFpxy02wWgDz24
	PyuIdYj8BOjr1aeBtjLw+pbPtvT3ORY5VIe/E6OrWBnjko54DHacTSuwYKdjNH41tx1OHtgrZkg
	x
X-Google-Smtp-Source: AGHT+IGMTAgLIra3AwC4js0TpQefOyARSjB66JJbjktTXIzzaEulPCK8EZEQPJ+r+DlSkK0sB46KMg==
X-Received: by 2002:a05:600c:19c6:b0:430:54a4:5ad7 with SMTP id 5b1f17b1804b1-4314a295480mr58184505e9.1.1729152869469;
        Thu, 17 Oct 2024 01:14:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c61ae2sm17855695e9.46.2024.10.17.01.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:14:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 10:14:13 +0200
Subject: [PATCH v4 5/8] gpiolib: add a per-gpio_device line state
 notification workqueue
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-gpio-notify-in-kernel-events-v4-5-64bc05f3be0c@linaro.org>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
In-Reply-To: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2506;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0P2NY394anUazMVeFpGs/9LRMhoWr2qMp3sLio3SuhQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEMddVOmN85FNOqbwEfYAB3HukIVwmEvIMEHLF
 B9/yJf8WlyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxDHXQAKCRARpy6gFHHX
 crDmEAC4/89OesDABkpdoqYlHW2PfH2sn5oG7KRFR6qFTp3t+zpvYXzRCZ3KSOg+WxuFTkMCjdE
 WxSJ1BiaA8TlB+kGKCP37xD4HuzMrtd52hp17AkFYV/4giuJAwrdeSrB44Lvqj1oav6Wk7RRA27
 LFQzd0vnWSPytvCq3awxuUriJ9eMWSz9XWfzGplHlT3kAokxiRZnd1rTEJegDPMcLzdgkstZ0Dx
 ORlmkBmK62iKsW31zkGdBhsVJ0+tMJkYv6ince22DmpKULMe8llCRWgFH8Eq44rR727oST7rA4O
 nGEx08FDtwXGc4C0LcBd7ned7i8ei6CQ+8TfFArV5UDYpgWpFYg8my5ezJYWkkvo15X+Vw//PO8
 K+wCLDq7MdqBfLOpxDi753gpXrcG0wFmg1xJMbfoBxi+fBPZvJR9dywonDOJ0p5C4iqEdSZFa0N
 2FQtTqvW/xbVSLXxOoWn4wcCrrJ2EcHot0jb23igDjtgAS/i0YFYdPrdNUTLyhc65Etqv+dRxU1
 TM3mMlYGLS2zYslBhHXrcfCY5ipKGc0PsnZaS5N1i0/XMp48lQI+ea2khElxFX2EJJEVH9WIHQB
 Q/Kv8Qnx7reGIbHWSqXIMApnRG/c40yMcrb7a0iE4F5IA2s6vqz6V+rhwDD5PgY6BNgjOj0fs6M
 TXbNga2uxdaIVrw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to prepare the line state notification mechanism for working in
atomic context as well, add a dedicated, high-priority, ordered
workqueue to GPIO device which will be used to queue the events fron any
context for them to be emitted always in process context.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 6 ++++++
 drivers/gpio/gpiolib.h      | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 0cba74381687..b242fdb1ad28 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2749,6 +2749,11 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 	gdev->chrdev.owner = THIS_MODULE;
 	gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
 
+	gdev->line_state_wq = alloc_ordered_workqueue(dev_name(&gdev->dev),
+						      WQ_HIGHPRI);
+	if (!gdev->line_state_wq)
+		return -ENOMEM;
+
 	ret = cdev_device_add(&gdev->chrdev, &gdev->dev);
 	if (ret)
 		return ret;
@@ -2765,6 +2770,7 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 
 void gpiolib_cdev_unregister(struct gpio_device *gdev)
 {
+	destroy_workqueue(gdev->line_state_wq);
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
 	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
 }
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 8daba06eb472..8737e1641278 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/srcu.h>
+#include <linux/workqueue.h>
 
 #define GPIOCHIP_NAME	"gpiochip"
 
@@ -44,6 +45,8 @@
  * @list: links gpio_device:s together for traversal
  * @line_state_notifier: used to notify subscribers about lines being
  *                       requested, released or reconfigured
+ * @line_state_wq: used to emit line state events from a separate thread in
+ *                 process context
  * @device_notifier: used to notify character device wait queues about the GPIO
  *                   device being unregistered
  * @srcu: protects the pointer to the underlying GPIO chip
@@ -70,6 +73,7 @@ struct gpio_device {
 	void			*data;
 	struct list_head        list;
 	struct blocking_notifier_head line_state_notifier;
+	struct workqueue_struct	*line_state_wq;
 	struct blocking_notifier_head device_notifier;
 	struct srcu_struct	srcu;
 

-- 
2.43.0


