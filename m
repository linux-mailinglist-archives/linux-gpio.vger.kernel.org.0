Return-Path: <linux-gpio+bounces-16931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E189AA4C1A8
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 630073A967C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBB6214217;
	Mon,  3 Mar 2025 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AgGcwQpK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122F52139B2
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007928; cv=none; b=gKb+tkE5t6+ByNrh254dClXTzEp+k9YVf3uiqjV2reC0cCDraOWz51jvU6+7BAjLV6GfTzDTAgdZ3SwP/qiqCJw9RO9gkZPy+4yirabA3WXQKn3ssSWjLTvUM+NBx8jLgzUdOLUekQG6DK31k0apXKZe8JWyyNBm+LP+o158U7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007928; c=relaxed/simple;
	bh=N3wQh8T8R+oyQquFXErkUP6hlk+nCAPLdOcYJoj+EBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjWa8RcUlPjvKnXmG5e7fJ9vTrs/JiR1YBFrbiHuWUOtbDblINTHxImByn6k9hKkLqAOreq6jJN+3ENjFNRV/oPCMMCo6Cmwov1kzup0cGKG0mxmxW8MAglq5FN90EPLOAGv0sYpKmS75fm91BQhwwKsj3o9mb2Ww4XNX92/IEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AgGcwQpK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-438a39e659cso30152165e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007925; x=1741612725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gz+znbWREsKmtzW3OBAmXUrUOCp/yw4x3Y/d/8vV1Bs=;
        b=AgGcwQpKYe+mQ1azxQmPmDBCxDUX1YZ41OESIfHlHsHcCiMMBuvhlABAUiLe7ck8kG
         ayw1+7AO2ztPuGvgC7c1nS3pal0slKg9CevHYN4nl6ULPqqohgw/0VDLU3ImCWRpPVK/
         N2i36bnaEkZP0ogUl+DlbN1xZnuIM3RK5L/XP96WIBklAhC6ipuwEUJaMHAssgKmI38Q
         nrLsX1mkqIRuguYTuDp6+9o1FV6s1/jzUCt+iscnuTqDV5a8VFH6dzd5JvGhNIQgt3uz
         PWCfn6b+0uvosNuA8L+mj/7CtgrZGVJMR/Nsw9toc2HYtkFpmnKe8EtPlH0l+SnhgNky
         4/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007925; x=1741612725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gz+znbWREsKmtzW3OBAmXUrUOCp/yw4x3Y/d/8vV1Bs=;
        b=IpDLI225VdFU/xmj9JfPvLseoQso289yntd6jqmuLzrvOCLq2l7LQLxPizZ9+G5zqj
         2hFHaWSUC6JOFT6alOGB3DzIIsMS9w6zQd/1Fm2KoqLOQmXEprU36Zc5ntV04WK3EjTr
         HnWX7frQXPxByR8rFuPGEafLe0O951wngMhpoRDK0Cpx+rQY6Rn4lFLADL+rmhgoAy1Y
         Vxr6pss0SlLYjsrxNNNEDO0MGV6gMRhGvOreb9tFLP3EslblLP56NxUR6KQ0H8/SXdVx
         0/nojlI9lk6sRUDBVmMHJP8yU49MIjOd2fIfW0y7xVA+IU1fLcoBgEZwN5uUyqGtbbqM
         0OOQ==
X-Gm-Message-State: AOJu0Yw5V3frhXUOa1y/w2dlAH2oVVR0/TUMlUGHx71hki8NErOjPKY3
	4FPbhROnnY+2prDIk794fWptHmxUBga+dDXnWFlNGhVG+IeJlVOn11AOp0tIllc=
X-Gm-Gg: ASbGnctBKiJf4syZZtw7+2/1laglMtHi0IASofkPQISVuTPOP7JPaI39C76La19dIx5
	hUBUJ40QjC/KUrHDSLCHh3A4SE3qWK43ZPgnNayfu8WCo9Mgu3HTOE9pnx0jKye1VlSwtfv45hR
	Kh8fAS0YchR3hbbU2KtQBXr8PW2iVQ0CAk9fgaWAWeVXL95ngHJCOEf6BWUzDb63PWLEJq3qWyp
	ELR2b9wv9XQ3m1GHXF93MJxMzMAZ6yt1aPwdZM+7u98m2KXSmMY80wXTdczugjC9eQZcKhImNHB
	2rOJc5g78qVbS1pphF3ee381i4CISjsUjlhqrQ==
X-Google-Smtp-Source: AGHT+IEQW7YZHCrSLWSEknFmca2KCALoGeG/H70z0XerHtGSCpqthigF58jSy3FNcBdb29iDiMLtqA==
X-Received: by 2002:a05:600c:5493:b0:43b:c3af:3304 with SMTP id 5b1f17b1804b1-43bc3af34c2mr18251825e9.28.1741007925218;
        Mon, 03 Mar 2025 05:18:45 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:44 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:32 +0100
Subject: [PATCH 07/15] gpio: altera-a10sr: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-7-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=92motqkZmcdTqKDZ0pbU5Fpe7KR5fxlrz4Z+U7eO+v4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawqQygDSg3gkaKutuN+SS1W5PBDPQ7axtGpJ
 lUog7E6preJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKgAKCRARpy6gFHHX
 cuH1EACxW2kuBBYKDwQHK83+US5eYzcAEXawXkCLyQoz2XEfFhdxD1QimIFJm1EqYBPUh5CBWOL
 zxkL3aKSAQoJY9jWFS1zvyq4/gZPTJycJKRXlu+HFjzqz/79hvUZXEuHFyTtXR54uhXDFki5Mb0
 4o2PkqsrKtU6lKxwTvH0+TS2/iEM0KOfbz/v95WtFK1jQdXS3aQ4h8CWtCMk38CElYwAVbvkEin
 FUO2PFSqtIULt6+l0Pz2dCU4CyDlX1gtFbx8WCGsAqEZpCVy8auMyCJxXJKdb+OxQLaHuBviW6t
 WYshDG8yH/A4XF8qXXQVjKun41VUgQERbIG39PWLFzBy57Mt2aPTwQK2+++qcUzuu0WOIRqiuoA
 pX58nz5K2Ygn+zXT35ywaDi1a2P0G8L8+ErRo2EuKTZ8Jb20BR8tf7oeKLNu3Bls/15jxGHfaS1
 mO8QBHt3R0bLpwCpgNeRiBtS6N7cLl3iqAqhdn7k21X7n8mvTszallAnm3vrD7sYz9ocWHaSA4c
 CvGPG6EjE+KhtsbPaTm87Z918cA8JFDaq8Ey0dvM2ITRG/Kw7hUBZw7T61YBjIXYTWgun/siEhN
 QHSXI0VHOtUW40UFWOcUyoi9vM6C3GVuTarMHdLs2kvL7JyDDe/b6yX/ILTUitQx3Bm6dWAdZ33
 MEJlJpdfI9kdwAg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-altera-a10sr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
index 11edf1fe6c90..77a674cf99e4 100644
--- a/drivers/gpio/gpio-altera-a10sr.c
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -35,15 +35,15 @@ static int altr_a10sr_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset - ALTR_A10SR_LED_VALID_SHIFT));
 }
 
-static void altr_a10sr_gpio_set(struct gpio_chip *chip, unsigned int offset,
-				int value)
+static int altr_a10sr_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			       int value)
 {
 	struct altr_a10sr_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->regmap, ALTR_A10SR_LED_REG,
-			   BIT(ALTR_A10SR_LED_VALID_SHIFT + offset),
-			   value ? BIT(ALTR_A10SR_LED_VALID_SHIFT + offset)
-			   : 0);
+	return regmap_update_bits(gpio->regmap, ALTR_A10SR_LED_REG,
+				  BIT(ALTR_A10SR_LED_VALID_SHIFT + offset),
+				  value ?
+				  BIT(ALTR_A10SR_LED_VALID_SHIFT + offset) : 0);
 }
 
 static int altr_a10sr_gpio_direction_input(struct gpio_chip *gc,
@@ -69,7 +69,7 @@ static const struct gpio_chip altr_a10sr_gc = {
 	.label = "altr_a10sr_gpio",
 	.owner = THIS_MODULE,
 	.get = altr_a10sr_gpio_get,
-	.set = altr_a10sr_gpio_set,
+	.set_rv = altr_a10sr_gpio_set,
 	.direction_input = altr_a10sr_gpio_direction_input,
 	.direction_output = altr_a10sr_gpio_direction_output,
 	.can_sleep = true,

-- 
2.45.2


