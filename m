Return-Path: <linux-gpio+bounces-17443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C1A5CCEA
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B615A7A92DB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 17:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8332627F3;
	Tue, 11 Mar 2025 17:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G0nIZ1Km"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C55D1C3C07
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741715805; cv=none; b=u8Gzc0WF6DJYAGDn6yfJrh7MN6erCE8y0D14Cxk84bpQefVnaqbm8FgiELVh3IKh+ETt2YfbGHDqg8967p7w2n6bwCJFO9FqK9UMEDe+n3ssm9qoH5TcxiXRbjbYscUWE2pvqpwdmy8V/Xsv7+08IsvylG8G2QYYy2UHNVpG7ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741715805; c=relaxed/simple;
	bh=m+E4x6BESOvidyJ6BzlnfN57DWpXekcwokm9f0yqX8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pzBLkV7l0Odo+RbknjvrKhGqWB0E6BbgWi4Wr/MzqYzyBm3Z0cjLJgA3t7TEyTV8zDXkafGyJloHEGgcosVuOeQL5eTjEP5fxdEc1R9jl8WdlOJFJVGOMktVhm2hkU1pfRmMa248qNUFqr6S/MjpZspdhMM8UsCJnlVYOYDW0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G0nIZ1Km; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf257158fso17870985e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 10:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741715802; x=1742320602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hYTLWKUhmky2iO/fcuHYIl1wOvlVQaoKuMWD5eXkddc=;
        b=G0nIZ1KmOG8EhUiYm79XNXYhdMTJnXpWGMJRbeELjUnDrIRRfR9ZL11yG7h3qx4E5Q
         ocLDZ+0c+E8xwSMNJ0WObZaGyIZXKNnIw4l4YuIV3nVKbro2IGUiyJEH0i6Rw39SSqUj
         5uMPESxPhbHrW4tWdm3A5/+owdK3PzSJicdru3EmfXHdAjUYRdV1M1I/ZHlKUxEcXysh
         R4Puisx5oVlgOic/YxzuT0yujIyLUOYe7fBWwS8GtxWZu2DZ3/pgpRXvhevB1R9jlbSa
         BpOMgJBQ6dBNeFoVs37Ywuli0r4/66gTiDJ54PLMZ5XWuQ3/3YiCcxPT9O3j+43C+e38
         jewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741715802; x=1742320602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYTLWKUhmky2iO/fcuHYIl1wOvlVQaoKuMWD5eXkddc=;
        b=R4lFAR8pUOn4DtMa8wFXRo9WqeB1F7IS8/Yak7JYq5mHni15WcRoFiQl0+rqSZpQM2
         0WuClZ+ZZ6RaScueDen2d0v+3Er4IqtBjsUuTLbnBSs3hq+dcuH1r8o4fv0CpWIDGClq
         l6z4wm/zo4BFdaKl13KnKUMKNIxklSsdJYHy0UFsbdXYhNcnVrBRJfoPZBgpY7tk8u5/
         PMnP1qYHIM0bQNDVX/lFZPrHblEcL6MVXBJ0F66XyoArtYn5aFtaYcXZbtsz8HSobl3d
         0iA1Ekp5rRtqBkU4eteHHC8nwh/9L45mXryllKtGFglPpT0eefk9mYvcc7VH+Ka4uKs8
         rdiA==
X-Gm-Message-State: AOJu0YziQuxMleKJcGR+dn0eebsj6UUHe9CGtcfwSi3zJJNW1vrtCPfS
	hlHauHxSnMOToQsqtC9ALIR0XgiZ9OyVEhqOnhnMhKgdMHMmn5lZEniCe33k/nU=
X-Gm-Gg: ASbGncsLgrbnhZ4pggx/I8WeC28HnMRA7KeHa9ffBokfWCvi7gioZqCyhGEXKpvVKql
	Rlpux/NoTkZHC8sLWYzbHNSg0Q4GVmbMWeMVlQwL1239Da6Tl4a9ABuWyI2D9zniaedg2mR5By1
	Tf7J8kyyrcITbtmh/b+JDTXDRk5C0Uffuvmzk5cP9BZtVXafyoNxYnn2zcVRIYu6RSn8mOuPKxF
	2UrCB5h5VQ3ydORgP0Y6ThQt+KbqPaI0P47x2b8BGgJ5yNGBg/cstb5mQLtRpyvV1JBVdBRuUdP
	2+jVKhDHkjnOrcyLw0QjDtdZPLb7qD+/1j9+mKVcM9s=
X-Google-Smtp-Source: AGHT+IFqNxNbNzW3a+bcFj3Gqczzv+XM9uvQIRQPwUJUsJPD9b8ikMTcbzP10W5a+LHdkzOVRocdCA==
X-Received: by 2002:a05:600c:3b94:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43cf8fcf902mr87027045e9.4.1741715801708;
        Tue, 11 Mar 2025 10:56:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf82f790esm81445215e9.10.2025.03.11.10.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 10:56:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Genes Lists <lists@sapience.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] gpiolib: don't check the retval of get_direction() when registering a chip
Date: Tue, 11 Mar 2025 18:56:31 +0100
Message-ID: <20250311175631.83779-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

During chip registration we should neither check the return value of
gc->get_direction() nor hold the SRCU lock when calling it. The former
is because pin controllers may have pins set to alternate functions and
return errors from their get_direction() callbacks. That's alright - we
should default to the safe INPUT state and not bail-out. The latter is
not needed because we haven't registered the chip yet so there's nothing
to protect against dynamic removal. In fact: we currently hit a lockdep
splat. Revert to calling the gc->get_direction() callback directly and
*not* checking its value.

Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/81f890fc-6688-42f0-9756-567efc8bb97a@samsung.com/
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/r/20250226-retval-fixes-v2-1-c8dc57182441@linaro.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
This commit is in linux-next as 9becde08f1bc ("gpiolib: don't use
gpiochip_get_direction() when registering a chip") and was applied as
a fix to commits e623c4303ed1 ("gpiolib: sanitize the return value of
gpio_chip::get_direction()") and 9d846b1aebbe ("gpiolib: check the return
value of gpio_chip::get_direction()"). Becuase the former is queued for
v6.15-rc1, this fix was never applied to v6.14 and sent upstream.

However, the warning it addresses is now queued for v6.14. I've rebased
this commit on top of v6.14-rc6 and would like to send it upstream. Once
merged, I'll pull v6.14-rc7 back into my for-next branch and fix the
conflicts.

 drivers/gpio/gpiolib.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8741600af7ef..de708d081858 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1056,24 +1056,19 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 		desc->gdev = gdev;
 
-		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
-			ret = gc->get_direction(gc, desc_index);
-			if (ret < 0)
-				/*
-				 * FIXME: Bail-out here once all GPIO drivers
-				 * are updated to not return errors in
-				 * situations that can be considered normal
-				 * operation.
-				 */
-				dev_warn(&gdev->dev,
-					 "%s: get_direction failed: %d\n",
-					 __func__, ret);
-
-			assign_bit(FLAG_IS_OUT, &desc->flags, !ret);
-		} else {
+		/*
+		 * We would typically want to check the return value of
+		 * get_direction() here but we must not check the return value
+		 * and bail-out as pin controllers can have pins configured to
+		 * alternate functions and return -EINVAL. Also: there's no
+		 * need to take the SRCU lock here.
+		 */
+		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index))
+			assign_bit(FLAG_IS_OUT, &desc->flags,
+				   !gc->get_direction(gc, desc_index));
+		else
 			assign_bit(FLAG_IS_OUT,
 				   &desc->flags, !gc->direction_input);
-		}
 	}
 
 	ret = of_gpiochip_add(gc);
-- 
2.45.2


