Return-Path: <linux-gpio+bounces-16553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7293BA43E8B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 13:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A757A425612
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 11:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995742686BA;
	Tue, 25 Feb 2025 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KwSkPt55"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707AB267F57
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740484594; cv=none; b=i9HdfmiYSJfKi+wjRm67w6x+CXibfJ0G30wYjL8BtLsq52zP/73oQPEcPlXdKHY/Wm9DOPHOgTPkqFTTXPj1KdeAIKsgLbjaYf7g0KxacaJexmiOkbNch6jHGQgyXS9OXEoFbUYoi4NU45fqhCYB/jHEhi2ho8GVMytqhNgLCmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740484594; c=relaxed/simple;
	bh=Mti7N7TampMJEA85fEFqM/SWyPHekb4T8hMC5Q9KEIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nr0rnkwwSF5M+YbeRNXKBw1OrVvenH1bySIMu/WTbHsGZbKxIbMYNp7pj48u+e0ypM8ahDBz26QWLJvdUsgf8F3GT7/YC6v+3++/U2CmXuWCvprag83+5eExPMPsMwSM90RQRjNL6tkxNeNMVZHsdeu7vpSI66U7e9N4tg3bZPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KwSkPt55; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so3988481f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 03:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740484590; x=1741089390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VXUEb/ixDS8VUxbNTLQP4mnGoLEwCu+P5iIlLIClao=;
        b=KwSkPt55zD8GpgiTHELk3OCn6SOVqmR0IowNtdRHohS1Uz4l8Vbr6V9s721KB+VJ7j
         /J3xkEYWda7X0jRevxqYr3yb50HqF6EgpOa+SMQRdFNQDUWjLqAiOAlIhs3SNuEPQPQe
         fx89DKthg+lpayiVwf6k8z1KcNOZc1j2Coh+OomI4Ya8Za+cnjD6nId88QSN7eU9jXLM
         weACdEqBew5y3/+BB+tHJPsqI2CijFvhrzOqUn7gHF0ouNYIVmPfqm4BAsSS2ypx8WLX
         R7hzaUfHv+Z5sj6f5dPTg0aQVXutORkfHlZkM9e9QStafrGykvuSZNgbTwD1GVZ5VtDc
         z4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740484590; x=1741089390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VXUEb/ixDS8VUxbNTLQP4mnGoLEwCu+P5iIlLIClao=;
        b=T3HG3KNGQVh9RbHmUyDLKhnxflkwGAi5QSERyHWRhDNbCJVyzmsBjGVO0W3aoT3oXZ
         UZ7obY+DLY6ih/EnduuOPwZ9URfiiEgsoKc/CIrCclLINhCas9JV+Uc306vi2JL3dM84
         ODfBdyKjhEglLgrmYVsDlrLugnhE5v3VJTHZ3Z+goe/IOWJQZnQbcSS/b1TG+qdX2J8L
         /SbVdKrR7lhP8yApokQyY+cHxrgDHePVrgteH2jMF7kQxuZrBTj0nX1f1pYgmgSqeCv5
         QfBn1Q40Zanex1kYwwiNpTN23NgR7/YhyVmgHpmxESFGe5Xn5CHMEtgIuxiacPpaPTag
         KXGw==
X-Gm-Message-State: AOJu0YxVdeJAKIZsKws+QVB7AOSbBH5L0uf/KhOE9jjmWWrRxtQVOt1d
	N7JEG1qDbv8BuWQ0fnvMnRPlY/rKq1j3Yquky2UezGh7+5Ww2ji+DtcI+wanzts=
X-Gm-Gg: ASbGncvmEUVfM0sn8nORv+DNwAn0z2ZeP7nzfZzeyojah+hPwgFjNiQY99NAYgTZ36G
	xH4OQHLOltBI+pGL+j+QWLmkmGAYZkQVll9Ev7bflF+HOaLtQGe6y8wJplRjPCtPm5DFn4I67Rt
	Lv+u6cJo0eWqWK/4Qze7wI+yrCA76eSYfEXAoIwsBtsNT75MAo/fMoI3wFULJbQZMJmFgLHTcA9
	UUpM74RfKA1zpqhe7EioBL0VJwWxOeTB7os4TdVYVH5MUmr/Vc4Z1I9Czzn25ZXpL+uvBSfvYrA
	IN9sRH5Rd5VHyVm7gqQ=
X-Google-Smtp-Source: AGHT+IGhNAzd0cwvKJlCcUBz4fFnTGPxFvxtGsmUDBHWAvkZ/S5MMekNH4MM1kJfOrBEzZienQf0IA==
X-Received: by 2002:a05:6000:186e:b0:38d:e572:4dc2 with SMTP id ffacd0b85a97d-38f70826839mr16768704f8f.40.1740484590445;
        Tue, 25 Feb 2025 03:56:30 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:15ae:2cfe:447a:4a32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd883521sm2058054f8f.56.2025.02.25.03.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:56:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Feb 2025 12:56:25 +0100
Subject: [PATCH 3/3] gpiolib: don't double-check the gc->get callback's
 existence
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-retval-fixes-v1-3-078c4c98517a@linaro.org>
References: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
In-Reply-To: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6atFFEarXWb+TlxXxAZ8zvN/XwNKSrTyBdSfh9C2z2g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnva/q/AmJ17Wymqe4xC7L2pemu0T0vkY2LjS/L
 033mY+Bz6uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ72v6gAKCRARpy6gFHHX
 cqegD/96DdPjR+YM/W3XOgAGfDVn4rpB1amn1VB167231QWyCHnDLZcC1GA0i3dBcu8oLunOygq
 ud1Yh7DH821xcPFiYkURVHaM/1UWGDkF91NgroW10LLpCzG9QtxczwyRqVn3Iyx82pvjcm6dt+z
 5H/KlXAqJDpX5jvHh74if1UQ6z+z4Wk3jYq7CGCbSSWJhgheKUenVFxqnMdOFO4cbXZz8kZ8/tW
 9gYBMKLIVhI1wLvVxxxwVRv4AEn4szanmnxSwaR5+oPpzDdOomLNwbmfvzsicjMAfUlmgM6h99E
 fRYX1DX/jZiORTaZS+zGepDSj0jpcRwzY5I1RmdoC7PUdrkon7XeBxgjuF5nqSCDN7A9EQN9KZY
 jYhJE8Obxj6o4WIS6IEm1YsD2bcQMpuJhV4XO/+rLHSRQwGVEgBg8E4NWCqCSD/xtgi4FfR+kpJ
 vkybu+DQLYbPPpA0cnl2btyb4s2b2x9SyA5wUdFz1Wubv0hi8ZtzW6kz3Q2VgYE3qwyct9tdZCA
 CYGGp6W9+y2BPJAnZ3o8PBGH9BAV5fH/1K0ScP98J8lbjvu+WbwbJg+e6U8dYBrwuCKMXuZU8AU
 sKnm1nHNyZv/O+p33x0glx437P59HBdzjAaZDcYyHSwX/8bqmUQHEsyNMy8VcpFmoDPiraXAXKN
 mH9qS4d1LgjjOwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpiochip_get() is called only in two places: in gpio_chip_get_value()
and in gpiochip_get_multiple() where the existence of the gc->get()
callback is already checked. It makes sense to unduplicate the check by
moving it one level up the stack.

Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::get()")
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Closes: https://lore.kernel.org/all/Z7yekJ8uRh8dphKn@black.fi.intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d076b2ec633f..b8f10192f27e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3158,9 +3158,7 @@ static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
 
 	lockdep_assert_held(&gc->gpiodev->srcu);
 
-	if (!gc->get)
-		return -EIO;
-
+	/* Make sure this is called after checking for gc->get(). */
 	ret = gc->get(gc, offset);
 	if (ret > 1)
 		ret = -EBADE;
@@ -3170,7 +3168,7 @@ static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
 
 static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *desc)
 {
-	return gpiochip_get(gc, gpio_chip_hwgpio(desc));
+	return gc->get ? gpiochip_get(gc, gpio_chip_hwgpio(desc)) : -EIO;
 }
 
 /* I/O calls are only valid after configuration completed; the relevant

-- 
2.45.2


