Return-Path: <linux-gpio+bounces-21176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46804AD365E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 796BE3B8C21
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D107929552B;
	Tue, 10 Jun 2025 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hjsZElK6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68B294A06
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558808; cv=none; b=aEijmpGDRi+bT4AdEixk5XgKn70QLgFlRpR1Jw2frZvSeoqiPYAz/9JbRJ2ZxkOlywv5zRIQbrPuzwU9HZTvVxfYrSnKOzw18BAwYiKNIMk05emOChV7wSAeTBBzFbOoN2D+qeD73MlZpNMpFUkKyf+YOPAuSUAkSoEbPU1cn/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558808; c=relaxed/simple;
	bh=JPSbp5yJtajANs5Kx0BJVfQNVJZOTJjm7ySQemaTVgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DFS9U+gnUAK88Iptmj0H8Lf8MWTsTnxDd9Zyc2Z0YvRz7ppXV/feBRwNyTkRQFAH0EOdhcvtA9rUoEs2EgLd4GIEuNsoplJurPCL+7j9lK05kh4oCzqrUnHUb3Nrk+DkRPwK2KqVkZSQhgqX6H5iDGyfYF79Wl2aXGNDBykgjCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hjsZElK6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-452f9735424so13149195e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558805; x=1750163605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
        b=hjsZElK6LiepTawFD3/tkgssRztwV6biBmiDYWztzsJxY3QtEdycyVuvYScds5v+TE
         i4//7hRSH6pu1o7P7hj6NgQS2grPVYpLfbIuj17xzKmkM9fAjl3chDGv10etYfrNz+IK
         /g4qgMwL6b1DIgfbSrqR34vYL+Fmwd9xjfQaS38cIDQSlcmixZe/EyBeygGe3J+LcL9f
         l+/djRuGSIQ1n4ekO2/Eyaj7Yblx7nhUIwsPsfovmR8dyN9I0eUlndIo31ZKPqrBg3hT
         SmPB48cY9i5JCsjg9cNjmpcsneSkNBcGZqNjkWAX4N2yVO6xwFWQrY/zkdlBJdnePJEW
         k2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558805; x=1750163605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
        b=ala4xBqz6qOak3EmGA9tHA9+3la4hn4dnYIUYdowZ/0KB3C7O8pxp0MT90unGyFhKR
         KjE3Y07lFi0l9YfsoHE+hRshGxAfdSfSX322Zo2TqwMCZ0aKTPXCUR7TfaoQuPjVBpWg
         gKGA8hMc/5HBBVwNneBE/h6LRh15cD0w2dx/Hm58bN2afcRyeMt6v2ZxJfcKrcEs8al5
         X0+IE4XNXbQ2lqfDNoIVAbYqiOYL/N8GGfC/hXZwSWlYsxP3YPrbz5sYbPkHt9/zGrNz
         GTym21Uh5rs5CH+zcm5p+JlCKss3rIZ4aPrvUtMbuJDmFH6/eiTKGKt1pp0MdxU5hptV
         j+FQ==
X-Gm-Message-State: AOJu0Yy4teBb4TN3HNXcas1pL8GwGAzgcqRG81+MXEo/cdVmjKcGqQLb
	F2fF1d1ryUfJOdVVMuJKstBa0mR+q742rdN3Fm96JpF+wrMnwP9fjPvfz24zyOA2ibsBeNVBRJv
	ymnPT
X-Gm-Gg: ASbGncsbNujNbyjueKbR0PBO4R7XwDBIM4R3t420bTpkWY1ZgtX0PSTqb6IVQ95ls21
	LDM/xvt4Chls2Bx4L3gOY6LM2NiINc/Fa8w0xlFo9N6gFjkeoHf8zXhR8CjsOd1E0XQZs4a3laT
	2K+8z92wQtk+4jHUkGzzCSME8ko+xOrNsYLKkkeM6ARB+yurhQForO9xA7AZxjispQbBeQwCRXg
	KQyGE29NZso3uKythGl2xN7USlqc5Jh+dptRfxrvXoBM+fog5Dk7YBuD2ARpC6RAJ/2630lwqiN
	0CN5lke965ZD02AlmC15wHlEZR01ZJ5JB0k6gdi/AiKn5Z18Qp/pkQ==
X-Google-Smtp-Source: AGHT+IFSBusLtZEhcB35bdsLhsIDJKEdI0B2x6nuBuQEbHF1Ukz5MK6AfplwzfpXypgWmTNJf64szw==
X-Received: by 2002:a05:6000:2283:b0:3a4:ef2c:2e03 with SMTP id ffacd0b85a97d-3a5318a90cbmr15138062f8f.33.1749558804571;
        Tue, 10 Jun 2025 05:33:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:12 +0200
Subject: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=h//lpMqxpm+YSvksV4b6ru3A6OjJcjH0LPneHhPANFI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYOyVxQ6f3OBK/aG05w0mHNnvJLnDT+orDrz
 CyfWJIjJ4KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 ciHSEACbAaLEpy3rIEg/INTnqZRSZcKjIFtdWlKQuLFDeybOyeiSxsXh2wVCKE9HyLBM4Pe4aOe
 VeJn1Gr92epXjzFOgr9ljMI5XuvfDKiUaJ+rYkq7/Zs0doHxU2JdVUOZ56W/ksVaQRwyC8wCRBr
 1Wli4N7JwPdD4t/y88MkdyHuplV05Azu8GK/HebhanaJmAdKsKGHxR/A4RYuWfrffEarVVAQ688
 yj7fctEZEtajQVjw+qCP5GBjsONGyfRiTciEzFZk2Eo6IIQCZEYQq3wc8Gd6b/7f7x1mHHGRecY
 DySlDOvl/blSxGU/19Rk59Ji7N0jIHlFGoRdOlEfDYsyxYcQ1YGhBm/EWbwy7C7TVwwmYmhRHjQ
 6U0crUDECD+RHZf8ESHp1fzD0gQD6M87Z2n5Qqj/iXDfT7F3+/E0NCfX2MGjJEoG9D+gFkzNSqN
 ovpcvq/yrRt4BiP+N/+81NwzARAgmNtA4arZxeyh5i4OqTMZtaMMgDsKwlZxHweLeCJzeHU2c01
 Gd0uc8Rd+iWf1vbf/mnnIHTHyTaSYWwYmVxa/FJSj98NsXYkeE2f9VoTVKzBj/b4ltLuEiTBWHq
 cm2Kz0AGsiu4qJ7PmhkesDqXdEvXX8g0I9jum1a/5pvlAwYSlfyl1w9eyBKPjCur8y1vx+5atSV
 t1BHqk4gNTPA4rA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mm-lantiq.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 14ae257834381186faba94446ea326cb3be99ca2..897a1e004681c085217bcf295bd971f3424011b1 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -55,9 +55,9 @@ static void ltq_mm_apply(struct ltq_mm *chip)
  * @gpio:   GPIO signal number.
  * @val:    Value to be written to specified signal.
  *
- * Set the shadow value and call ltq_mm_apply.
+ * Set the shadow value and call ltq_mm_apply. Always returns 0.
  */
-static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
+static int ltq_mm_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ltq_mm *chip = gpiochip_get_data(gc);
 
@@ -66,6 +66,8 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
 	else
 		chip->shadow &= ~(1 << offset);
 	ltq_mm_apply(chip);
+
+	return 0;
 }
 
 /**
@@ -78,9 +80,7 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
  */
 static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned offset, int value)
 {
-	ltq_mm_set(gc, offset, value);
-
-	return 0;
+	return ltq_mm_set(gc, offset, value);
 }
 
 /**
@@ -111,7 +111,7 @@ static int ltq_mm_probe(struct platform_device *pdev)
 
 	chip->mmchip.gc.ngpio = 16;
 	chip->mmchip.gc.direction_output = ltq_mm_dir_out;
-	chip->mmchip.gc.set = ltq_mm_set;
+	chip->mmchip.gc.set_rv = ltq_mm_set;
 	chip->mmchip.save_regs = ltq_mm_save_regs;
 
 	/* store the shadow value if one was passed by the devicetree */

-- 
2.48.1


