Return-Path: <linux-gpio+bounces-9766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FCF96B604
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65AA21C2471E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A26E1CC8A8;
	Wed,  4 Sep 2024 09:07:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E16A146A71
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440874; cv=none; b=ADvvUh00Lsk2WaF5NFWMDAVJB4ICJZDHwTWAqnLQCFKhMiQY2P5KGL+sLyrcUwcRXdCYiWUgsNrz53t8FL8ETWLYq1p5sDUtiQhnChXsSi0+eiS5812RAvmkx1W46+swIgVyJMIERMG9pzHOSWU6gYdR/8C9Do7rI85xGAkKS0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440874; c=relaxed/simple;
	bh=/Wq2OiS6k2WF01NGkH8FPpuRcC7lcfHoIAZdVFy+H8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fVDjYCKf+iYJ9BtGu8WeiswKFGW4FGMngEwDgflwcNH44c7gNcOGsjkBHXBFhXQcWV25/r+qsgcJBhjBkZ/usTr6n9QLo9NFM0VHggPdLaz1X+im22BpJkzCH4D067i2P7EaA08cVrqxhdaovuS7+KyF8jhncxTH1tJcNI3mZyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 25e0064d-6a9d-11ef-abaf-005056bdd08f;
	Wed, 04 Sep 2024 12:07:45 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)
Date: Wed,  4 Sep 2024 12:07:43 +0300
Message-ID: <20240904090743.1204593-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the mem_is_zero() helper where possible.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 5aac59de0d76..e98d75dd8acd 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -16,7 +16,6 @@
 #include <linux/hte.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
-#include <linux/kernel.h>
 #include <linux/kfifo.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -26,6 +25,7 @@
 #include <linux/rbtree.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/string.h>
 #include <linux/timekeeping.h>
 #include <linux/uaccess.h>
 #include <linux/workqueue.h>
@@ -1331,7 +1331,7 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 	if (lc->num_attrs > GPIO_V2_LINE_NUM_ATTRS_MAX)
 		return -EINVAL;
 
-	if (memchr_inv(lc->padding, 0, sizeof(lc->padding)))
+	if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
 		return -EINVAL;
 
 	for (i = 0; i < num_lines; i++) {
@@ -1746,7 +1746,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	if ((ulr.num_lines == 0) || (ulr.num_lines > GPIO_V2_LINES_MAX))
 		return -EINVAL;
 
-	if (memchr_inv(ulr.padding, 0, sizeof(ulr.padding)))
+	if (!mem_is_zero(ulr.padding, sizeof(ulr.padding)))
 		return -EINVAL;
 
 	lc = &ulr.config;
@@ -2516,7 +2516,7 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 	if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 		return -EFAULT;
 
-	if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
+	if (!mem_is_zero(lineinfo.padding, sizeof(lineinfo.padding)))
 		return -EINVAL;
 
 	desc = gpio_device_get_desc(cdev->gdev, lineinfo.offset);
-- 
2.46.0


