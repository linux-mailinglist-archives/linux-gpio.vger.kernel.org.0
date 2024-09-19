Return-Path: <linux-gpio+bounces-10275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE0B97CA80
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 15:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBA201F23385
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 13:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298F019F110;
	Thu, 19 Sep 2024 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v4gZkMSE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F3F19D09A
	for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2024 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726753872; cv=none; b=JrNVSR3IriqEPHTK6C4hAoYhJ6ClgMIhXVU7G5kCFcTC9B9TjBRIY9wjs88b/AnPn9aDmUaZl2XBIiQgd46AcTAfqHL6Js7PdXqtUIaND0y0RRRBnA0qmNLWrJb8EB+w0JWCX4O8pBLYg6jXVqsoCi4TxQBJ3phPbVBmb1grvGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726753872; c=relaxed/simple;
	bh=Kpz1+usHgjJU/8VmgUtQ8ArrQyQsIl8J4vMP1G7iaYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NH+MrpU53k++J2jChsJwf6a2UnTKJWjT56ttZ0njV8AUiYkpeUuR8TBWnrUSMWCBeey0arxcGq1+w83HI2mIulEYHH6Vxp872q3tbN0oEjXBQLZ/2C8/NxG9V6g8kADNmMz4zDn2MzC6LeyM7+SL7t/rhyfvwciqaQjMa0zWLUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v4gZkMSE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so7528895e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2024 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726753868; x=1727358668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0PslU454aJ3lD1WuDQmVWdwungDho/+ZyzmQbd/e50g=;
        b=v4gZkMSE/8WW3/oskhlmt7GV1L4yKOMc2nkAntcV3yOmd4nC+DGTNDoaPELlKxO3XB
         0VLi4wHEljPuYE4ynuVKJEfmtalPKLmVijM5NQwijH2Qmymwagnxz9R36q0YcwZF7i07
         6ZHZOi1dBfFChs5cLXPR/9bPBYPjfmDIoJw4VxA7XSucFYfAYgDEcnGHb5xFaFBGydYK
         BBt76JilgpGP7WZ8Z9X+rPeH0jiHqyQPHUQNtdzTPiPr920iZA0JQA+9yZFqjYCX3BwI
         mqVNe62oB8yn1l9Pm8rVMevUDsoqnzgw2zj59WXMBeyYc7UlIfXetckR5cW1IPV5Qqsv
         Rzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726753868; x=1727358668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PslU454aJ3lD1WuDQmVWdwungDho/+ZyzmQbd/e50g=;
        b=oR9/XRANPzo0ECEfUYfAQay29XY820tllnUCJd+Ljc80VgDw5vRF62OPSPIYAJWMri
         vqv/n7BGD45NZ0ECc6mJnsr64Rl2DAHiohmVeAIJoYo61QL2bf/2ji8PsQxS70Ql1ipU
         lZDKuDhX0JuVFhMOvqrCsYkDQzeCKzLwUYekidKpldUjMDgN5AAuvxzVNimnfU9gFia/
         GaKSSFEyGTaNeXdGyV4kMKZCBBxJ/GznfZi0/wVUP5MsyrCx0VJ3DzQ2tWnZFk6O/HBz
         Jqdf2sgtBleyAJLh2zSml3KghUXZS+YWxh56ImUPNwHbVHHpM7bkAcm3hMuXTBAuHWbz
         W8Iw==
X-Gm-Message-State: AOJu0YwXwi9KjUeXXO74/BKirC7zi3uhWgIJ1PEIeZ8Zrgg/O+RqxEDw
	WFPwMOLsDZ5Kk4CUX6Lx4uZfRkYswcTipZhO0LzRFg5Hp48xKjvjqyrbxGUD1ns=
X-Google-Smtp-Source: AGHT+IHcEYpRlGgX+oWQx+eeC3m7K7Or5mirALPBtvRtHLw8dsmINQWFi4rbEZudPYl9jNXi14ScEQ==
X-Received: by 2002:a05:600c:1c85:b0:42c:c003:edd8 with SMTP id 5b1f17b1804b1-42cdb531938mr208074395e9.6.1726753868332;
        Thu, 19 Sep 2024 06:51:08 -0700 (PDT)
Received: from brgl-uxlite.. ([185.44.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e75408abasm22767005e9.6.2024.09.19.06.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 06:51:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Herve Codina <herve.codina@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] gpio: free irqs that are still requested when the chip is being removed
Date: Thu, 19 Sep 2024 15:51:04 +0200
Message-ID: <20240919135104.3583-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If we remove a GPIO chip that is also an interrupt controller with users
not having freed some interrupts, we'll end up leaking resources as
indicated by the following warning:

  remove_proc_entry: removing non-empty directory 'irq/30', leaking at least 'gpio'

As there's no way of notifying interrupt users about the irqchip going
away and the interrupt subsystem is not plugged into the driver model and
so not all cases can be handled by devlinks, we need to make sure to free
all interrupts before the complete the removal of the provider.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- we should actually take the request_mutex to protect the irqaction from being
  freed while we dereference it and keep the actual dereferencing under the lock
- add some comments to explain what we're doing

 drivers/gpio/gpiolib.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c6afbf434366..16c16414f721 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -14,6 +14,7 @@
 #include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqdesc.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/lockdep.h>
@@ -713,6 +714,45 @@ bool gpiochip_line_is_valid(const struct gpio_chip *gc,
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
 
+static void gpiod_free_irqs(struct gpio_desc *desc)
+{
+	int irq = gpiod_to_irq(desc);
+	struct irq_desc *irqd = irq_to_desc(irq);
+	void *cookie;
+
+	for (;;) {
+		/*
+		 * Make sure the action doesn't go away while we're
+		 * dereferencing it. Retrieve and store the cookie value.
+		 * If the irq is freed after we release the lock, that's
+		 * alright - the underlying maple tree lookup will return NULL
+		 * and nothing will happen in free_irq().
+		 */
+		scoped_guard(mutex, &irqd->request_mutex) {
+			if (!irq_desc_has_action(irqd))
+				return;
+
+			cookie = irqd->action->dev_id;
+		}
+
+		free_irq(irq, cookie);
+	}
+}
+
+/*
+ * The chip is going away but there may be users who had requested interrupts
+ * on its GPIO lines who have no idea about its removal and have no way of
+ * being notified about it. We need to free any interrupts still in use here or
+ * we'll leak memory and resources (like procfs files).
+ */
+static void gpiochip_free_remaining_irqs(struct gpio_chip *gc)
+{
+	struct gpio_desc *desc;
+
+	for_each_gpio_desc_with_flag(gc, desc, FLAG_USED_AS_IRQ)
+		gpiod_free_irqs(desc);
+}
+
 static void gpiodev_release(struct device *dev)
 {
 	struct gpio_device *gdev = to_gpio_device(dev);
@@ -1125,6 +1165,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
 	gpiochip_sysfs_unregister(gdev);
 	gpiochip_free_hogs(gc);
+	gpiochip_free_remaining_irqs(gc);
 
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
-- 
2.30.2


