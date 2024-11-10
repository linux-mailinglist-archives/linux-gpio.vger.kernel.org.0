Return-Path: <linux-gpio+bounces-12784-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BFA9C348A
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 21:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2D77281296
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 20:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0AF13B280;
	Sun, 10 Nov 2024 20:17:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C9318E1F
	for <linux-gpio@vger.kernel.org>; Sun, 10 Nov 2024 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731269834; cv=none; b=ZYMuFh6J+92ql3GSBufDX3INqJJoW77tQPWEiXW5oAFAnCtPltSwMweiS74ejnAMiIV1/7FYM2UVc8on4QP8oL1VCGbe9w6UpJApmpKWrik3z2VBopRPbbwILY9M/+7hyMtm5zU6Tk1QEx4zo5D4y+qN+yzk0L52WrsCZC0tT8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731269834; c=relaxed/simple;
	bh=NGIScqIeeFRYfnwjF1bTumgir2LtoUL83VTSB/cTw5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3gObdDfIt/z5He7FHhCc4bIcogMM6uV9noS53kChJaQh5VQjl9hEVVvAXtkS9L9TTYUDBOA3Uw17I9TGe5j1ICbnfL9+Eo948m9765FnIsthZf1saYEsqxt7iPMSAlcmiStK+/kOeQk1o2QSDqOMDMJ3TxC4beblPdKZkQKGmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-24-75.elisa-laajakaista.fi [88.113.24.75])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id c33b8ed2-9fa0-11ef-a0b4-005056bdfda7;
	Sun, 10 Nov 2024 22:17:09 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [resend, PATCH v1 1/1] gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)
Date: Sun, 10 Nov 2024 22:16:15 +0200
Message-ID: <20241110201706.16614-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.47.0
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

resend: mem_is_zero() is now part of the official kernel

 drivers/gpio/gpiolib-cdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 83ebcc8c83eb..40f76a90fd7d 100644
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
@@ -25,6 +24,7 @@
 #include <linux/poll.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/string.h>
 #include <linux/timekeeping.h>
 #include <linux/uaccess.h>
 #include <linux/workqueue.h>
@@ -1215,7 +1215,7 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 	if (lc->num_attrs > GPIO_V2_LINE_NUM_ATTRS_MAX)
 		return -EINVAL;
 
-	if (memchr_inv(lc->padding, 0, sizeof(lc->padding)))
+	if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
 		return -EINVAL;
 
 	for (i = 0; i < num_lines; i++) {
@@ -1629,7 +1629,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	if ((ulr.num_lines == 0) || (ulr.num_lines > GPIO_V2_LINES_MAX))
 		return -EINVAL;
 
-	if (memchr_inv(ulr.padding, 0, sizeof(ulr.padding)))
+	if (!mem_is_zero(ulr.padding, sizeof(ulr.padding)))
 		return -EINVAL;
 
 	lc = &ulr.config;
@@ -2411,7 +2411,7 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 	if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 		return -EFAULT;
 
-	if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
+	if (!mem_is_zero(lineinfo.padding, sizeof(lineinfo.padding)))
 		return -EINVAL;
 
 	desc = gpio_device_get_desc(cdev->gdev, lineinfo.offset);
-- 
2.47.0


