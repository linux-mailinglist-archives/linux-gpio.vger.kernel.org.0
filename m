Return-Path: <linux-gpio+bounces-16610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A792A45B70
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 11:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A55C03ADE70
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 10:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EEA269CED;
	Wed, 26 Feb 2025 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wtjJgX6m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5722024DFFD
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740564761; cv=none; b=ZZtiP3qStWeSZ1NgAUjBL2WHZJ9FMB6bGpdBekX+7nJmTOjo4PAIjdMNFu0bxJXFjsahCXggw6PyW6EUiBe8nUSY1BLHjDdughHXaCrqplA+WBqibxicsmo1MNk2uJy9GHVRaScqFQ/1qgHVAWTB7gctLpaLbMvcyPMe2Yv9jfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740564761; c=relaxed/simple;
	bh=yl4u373flK8LJfjWUsP2xVHNgE+51/Hq8Uvf8MU1tjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sR5SPr+uGCyeoAJiff6Ya1yY1fF6EaZzzN5iYqavWO+OWd1t+4oNjZJC64o6WN6psUDBmrIVM0/YZHbZ2W07kHgX2Yl8PukStNP5D7AdGcE7Cv5RG3PbtPofcAl1z2VdI+GgDuauudaHSYHxueKmV5zZm0mCLaomb5ZodTFJzI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wtjJgX6m; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f5fc33602so443971f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 02:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740564757; x=1741169557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPAblM/ytVXYD0FxHSQbshSRnztgL04mI7LHXRwbPuA=;
        b=wtjJgX6md7DIvKYdLF3LoVXjcgfHU3tZqcbgkecSlYGXl8ZH5XvK0qWW56JVKkdRM5
         JxdPB6TljzOEIPdp2Ld8yxscRBXiBwuKudcAZMeMS9PE3QhyP+gvsblTS0VaCqh8iMOC
         k/ksTbs54Ay6a7oFjFrTjcuaHYip5jEDIyE9JgD3LctGQaWmXmMCgSWvhQfw0FbJnGo1
         Urcr7q2wU55BkxcstEOZh5knSroCNwDfyaXDMIANuADlPFm3wyw3bq+GilP0krtWdg+0
         6+O5m9FfMYUP9FmZqnzWgsK3YnUXqvuDdsvTD3dn56uf45THamdQrOd0as0VTJXkfmKO
         i42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740564758; x=1741169558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPAblM/ytVXYD0FxHSQbshSRnztgL04mI7LHXRwbPuA=;
        b=dJtAGmKWbg7zV8vUbLYZx81ljX779qux6JG+gqDjpBE1RsKZfW+4N3yzG3rVTMGfAL
         Bp4J9FQb8tdHRuAtJMWty3yzYy3WCDdvmSXe9c+sgiOlY8W0jmWNhJGilIP/z3Axm1JQ
         lWoxSFrys/lmVFmC8i0R+ke/XqwvUb+FTFosvgqKGQkjylT+Vj4brKRZ92iPYEyaId91
         bpis9f9CVBvH034t91FNUmV1OIDT3k/tQ7CrFFIEPer2KjBLo7hmRjPYroMT4FgXcPpu
         uJCaPjTEW3Q5rti+NlvV7MH+XtF2YZuwomB7LK00dEpetSStwpVuvtAzuS4lsl1lgXWu
         dYHw==
X-Gm-Message-State: AOJu0YyvAxzW2y5RD8yqOKmVsE5Dg/+fx2iLKO21HCLJwSQIIuQ1hyDm
	XKb3WNEDLAd06JFb9tRWsJdDrzEWyDt/pKSSAGbPWxriyhxhueC0F4XD3z/k7xI=
X-Gm-Gg: ASbGncvTUMskfC0YjY8mQSD5rMx95QGSQP87JQcbu59MtBfMq7jiVm8zh2FbljA4U6G
	eQ3xpM/Swd1SmrU1/mq0IHpVWqEn0r8l0x+7Z8gUpdeMtyC7VFZsHHqqEVz/iAYp2xXdt3UfM7e
	+UOE0npj9ttzqkf4z07bP+1h/T/GgZ7OfpGstzqWgamaFCiI9yVHk2IV7Aeg+G1DY+aCsvh0utP
	XeNHe63lDwdoDyd3k1JIR7Nf3cWUBUBJm7364xnBEj1TfE4jiWptlIPLfDqljsOLa94Kz1vzkHC
	59V89QAh/Pf3HyjC
X-Google-Smtp-Source: AGHT+IHw+bfS7gpMnzsf2DgNmUri32seSJz1+dPSYtDo9d0ITkyKGqVomiEoZhjVURuzeKQ9X02AOA==
X-Received: by 2002:a05:6000:1f87:b0:38d:ae4e:2267 with SMTP id ffacd0b85a97d-38f6f3cd3cbmr15942757f8f.11.1740564757589;
        Wed, 26 Feb 2025 02:12:37 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7d02:26:5770:658c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390d649cd17sm1483971f8f.79.2025.02.26.02.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:12:37 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Feb 2025 11:12:31 +0100
Subject: [PATCH v2 3/3] gpiolib: don't double-check the gc->get callback's
 existence
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-retval-fixes-v2-3-c8dc57182441@linaro.org>
References: <20250226-retval-fixes-v2-0-c8dc57182441@linaro.org>
In-Reply-To: <20250226-retval-fixes-v2-0-c8dc57182441@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=L6UhmUffsmnJ8WOjgKKZG7Z+1T8Z55OqnZX+P3gqo14=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnvukRT1APi8R4HYEl7lqYNlvJr3sIjTg26NOQz
 pE42xfJ8FqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ77pEQAKCRARpy6gFHHX
 cl8fD/4kEkdnFtjtgtYKMBJ0MqwAAwprVYwFXpEpoVTBWEnrkfRVpJPuscxNFGLE0z1ky5ASyge
 5bV3S+XTmZ6qJquvkExLqpl6GprNOr9xfWC5dYJogA7aQCi4AEMvUYFuI2AIwJubMSnq4eHsEwz
 sZYCMag4n0Eu3oUCdN+zgnj/0S2zUFfNAsKySLJ2/lEPYXH2BXfIqrZTKEfetM1OJo/TFJF4vay
 0shro278EkfnTIES3lm8kMqv56JS2SZrh4XkIS1CdWnrrwOb1NhkytzVlpt22KEwaPBy1Q2KE8e
 vVSun3el3Sb7yatNIFY+vfY5BR68/lUvxgCmSWPsky7Pph8aQ6EiQJN1SVNUFcoVBUBuhbnrogt
 sEhZVqVcsvdCCloKBNC1Esh7v7COwScYUFmeJ82Jg+Zu4tR7zGtTODVho/IcOY8YLUECD+R60v/
 g84tWR6ajnc+c6V8iGMQD2oVqlTns9Nc5AwdM5JFYRtS+OF/nxKt3x4++QRhTaG29ZVzD0gpdKI
 15hWMGowbXB0g5NW6QtiiRii4opyvLN6q7eWf+d66hQQk61gfIU321GIBavGvoCaiitsAvhFNvh
 XmilhYkNYq12CvIO+5vx6pkZ7Fs+jnELcGpZuFaHmKjl41ovKGP0CXTB36JuvRpkHvAvQ3XxTGk
 J0yNwM83f2Sr48w==
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6f4efab237e6..855373eb11a8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3167,9 +3167,7 @@ static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
 
 	lockdep_assert_held(&gc->gpiodev->srcu);
 
-	if (!gc->get)
-		return -EIO;
-
+	/* Make sure this is called after checking for gc->get(). */
 	ret = gc->get(gc, offset);
 	if (ret > 1)
 		ret = -EBADE;
@@ -3179,7 +3177,7 @@ static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
 
 static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *desc)
 {
-	return gpiochip_get(gc, gpio_chip_hwgpio(desc));
+	return gc->get ? gpiochip_get(gc, gpio_chip_hwgpio(desc)) : -EIO;
 }
 
 /* I/O calls are only valid after configuration completed; the relevant

-- 
2.45.2


