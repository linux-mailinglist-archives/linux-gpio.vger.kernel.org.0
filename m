Return-Path: <linux-gpio+bounces-11133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FDA9981A5
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 11:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72ECA28248E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 09:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26C91BC09A;
	Thu, 10 Oct 2024 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XVJQeAiy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E461A0B0D
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551439; cv=none; b=sOWMD/QFQ0o1jDfXEnlF6THf0dC+1plLbVWdeAXOMI+yf9fZczjBxjsVAg/OmmE5LvC0IOzjfIKW+mEUx6Lgwierve2rqMhHtQBF+uxZ3oCSDvVfMbXnIZIPrhY28GuB1pBPhSewaIWpt8KH7Tq/UbcA9X0vtZdEvCjEnFTcjMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551439; c=relaxed/simple;
	bh=Md/Hr1eDm9gZYFElgpFpc1dlcVMo6FQJMk2O8wt4kIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sMVTt7wi3uWMmzRRdWtmLJfUX/fwVAM+vzYsCdzU/l7XopPcl34hp2sP0xpaWWrjaMwxNZomtG9NOIAtr/C3TNx9HA1RfOBV23mOwfXT5UjfiycEZTaTLd6vysSO+jKygXmtDZlNrTBbBw8Hn/DygNpFcb+RbJX99n6exgxyWxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XVJQeAiy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb806623eso5812155e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728551435; x=1729156235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2U+DP+Po3cvK+C6hThGA3u/rzX4mk6Ylhzlg9JhIjgE=;
        b=XVJQeAiy00Avhx9JhO4zlrjYQR7CwYBDPcnnJPBNTairgjUmAtXoiJi5nf5ztcBYcn
         YeX4mi8ZxyS/uX6QtU2rmHJIcQhTyIExqFoGZVL9g0TRz2sE1BwQ3im7MRe4GHxwc1NC
         0N7Vmnqh5zQSwB7dFKXys+ub7xhbcRohswVK5Mhufs52TszWewmSzYcI2t86+++EuyKU
         Ojck+tOeeblGYeu+obXpEJ3ELy/Dsfv8YSt6BHtIzontQnJsi4Tyg7xEG2er1g/IRb9j
         d6YSdnQyUHcW82QUfLL8Pc09+cK9XLm/zms336dgcjlRl3gp2FdoE77AtP1tohLbJc+2
         tR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728551435; x=1729156235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2U+DP+Po3cvK+C6hThGA3u/rzX4mk6Ylhzlg9JhIjgE=;
        b=FDCBT4BJ/0ZRVN2QmFpEXd1FfMvIGuXgMwuBuK6A6TWAtInjjEjN7TYMSfgxlNukkA
         AGE4ekGsR2hautjjQVadn6QVfOk3+PRLcTpER4YcImfyjoznXS0COKSoR0jBwmtSEKb9
         DfSGj6KaklsXK3i8cCB6qqOECQATrGFpSywFsHJDoDmj3qPVowUkyhqT5p3h3tVKNIo0
         dbkNKJIV99wRziJGX7b6/YCepPfYgA5+k9HNDBPlUfCofIC9a+NucbQDrrNnQa8Jhiue
         DxTlTjLtDCNK26SrSE32dqMHrhhZHVGZZPZrWD1365VGf4ZLd1N+0mhtn5U8qFoDVKV+
         h5mA==
X-Gm-Message-State: AOJu0YwZCXz5N44iU9XiMhQTgajvAIRMV9ONwgH8fzVa42jzkekFPsyv
	8J2KPMAAXgD/s/PbmQspG6PY2bqGCc3yHutFRWl5LhdLMHWfkkjcwgD8ai0zmohg2F4qhUxN8ie
	/
X-Google-Smtp-Source: AGHT+IGfYH5TMRPFMNDfM7MKJx1q8rzTx6kEhvkJP3Xs1zFlvZk3XQ747bwhNr1VAbjBZTXKbKv8Zg==
X-Received: by 2002:a05:600c:1c29:b0:42c:bae0:f05b with SMTP id 5b1f17b1804b1-430ccef6313mr52014515e9.1.1728551435094;
        Thu, 10 Oct 2024 02:10:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5e5d:bfca:20cc:60ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff785sm9913305e9.13.2024.10.10.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:10:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Oct 2024 11:10:23 +0200
Subject: [PATCH v2 2/6] gpio: cdev: prepare gpio_desc_to_lineinfo() for
 being called from atomic
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-gpio-notify-in-kernel-events-v2-2-b560411f7c59@linaro.org>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
In-Reply-To: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2675;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hJXOR0yJYCJfsL+TmH/jw016J3uAhH62oK/KOdi1k0I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnB5oGjSwEYXib+XZ21p/SuNORc1oC0p1EE0/8J
 drAnwmFJVKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZweaBgAKCRARpy6gFHHX
 cutVD/9gzcyiCBHbwNEqZFcoHr14MA1mOkJnkB2Rp7I2Y8AKcoBpD69jha+emJQO5FcolxravSe
 /8w/w6VAKG9oyG99STzDtyF+bBgT5uoNPDbgGfU82WqKKgH+6mnbOFvZyEXmFovpkhDtcU3SCwN
 DLb1Ar3klfSexGW1k1pt1dVThBx2kmexzeCHgtFFaqTJksXPjyCp+BGIRjJXaW5BdoKTUlRmL6J
 Y9j5jZkMGNKPgFohUp9+5W6hy2Qch4dIJh9iOBS/VAX6KHboD+1VM7kjTKUBPX7EsQUzcO4BYCO
 Tqnn+cFBzb3Kf/iCDj6zT/422IGOK8IWVOnNnkROXYpv+Kr8Ng0mQqYaiupGxRu4IYy2uTYqWJM
 si7GpoGbrmf2DL/84lb3cLptpOeycWGKHVlRx+QkQ5b40nHVrePDh8uWTicxNqPgxDKmAHsn+Dv
 s3ozdcWPGRDld8ncE99rx1JHkAlILg9tiDfIy5a0BakXLbsrIVFUw45j/Ap6WienPNSYC4gEqZZ
 V/SgXUXVdNHwz0eUCjCikEAWoMY4wl5XmXSqRPdWnU0RbuKMBN5ALUjyU7rx95YZslhp1svKK08
 qNLi0Zozzo7YZAZFc9ZfbG3vRIPKu5Lrc4VEpnBG8I2gpdvZlVO5hCjKFOcX1+9ESx4955RBHTZ
 Vu45kdUpjcIod1w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to prepare gpio_desc_to_lineinfo() to being called from atomic
context, add a new argument - bool atomic - which, if set, indicates
that no sleeping functions must be called (currently: only
pinctrl_gpio_can_use_line()).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b0050250ac3a..8c48a53b4fa8 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2361,7 +2361,7 @@ static void gpio_v2_line_info_changed_to_v1(
 #endif /* CONFIG_GPIO_CDEV_V1 */
 
 static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
-				  struct gpio_v2_line_info *info)
+				  struct gpio_v2_line_info *info, bool atomic)
 {
 	unsigned long dflags;
 	const char *label;
@@ -2402,9 +2402,13 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	    test_bit(FLAG_USED_AS_IRQ, &dflags) ||
 	    test_bit(FLAG_EXPORT, &dflags) ||
 	    test_bit(FLAG_SYSFS, &dflags) ||
-	    !gpiochip_line_is_valid(guard.gc, info->offset) ||
-	    !pinctrl_gpio_can_use_line(guard.gc, info->offset))
+	    !gpiochip_line_is_valid(guard.gc, info->offset))
 		info->flags |= GPIO_V2_LINE_FLAG_USED;
+	
+	if (!atomic) {
+		if (!pinctrl_gpio_can_use_line(guard.gc, info->offset))
+			info->flags |= GPIO_V2_LINE_FLAG_USED;
+	}
 
 	if (test_bit(FLAG_IS_OUT, &dflags))
 		info->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
@@ -2502,7 +2506,7 @@ static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
 			return -EBUSY;
 	}
 
-	gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+	gpio_desc_to_lineinfo(desc, &lineinfo_v2, false);
 	gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
 
 	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
@@ -2539,7 +2543,7 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 		if (test_and_set_bit(lineinfo.offset, cdev->watched_lines))
 			return -EBUSY;
 	}
-	gpio_desc_to_lineinfo(desc, &lineinfo);
+	gpio_desc_to_lineinfo(desc, &lineinfo, false);
 	supinfo_to_lineinfo(desc, &lineinfo);
 
 	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
@@ -2632,7 +2636,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	memset(&chg, 0, sizeof(chg));
 	chg.event_type = action;
 	chg.timestamp_ns = ktime_get_ns();
-	gpio_desc_to_lineinfo(desc, &chg.info);
+	gpio_desc_to_lineinfo(desc, &chg.info, false);
 	supinfo_to_lineinfo(desc, &chg.info);
 
 	ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);

-- 
2.43.0


