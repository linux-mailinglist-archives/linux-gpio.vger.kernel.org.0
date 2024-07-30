Return-Path: <linux-gpio+bounces-8460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D696394137C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 15:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED4D71C23551
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 13:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E033619EEB8;
	Tue, 30 Jul 2024 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZr1M+dU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B50F18F2FF
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2024 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722347188; cv=none; b=tEDPErhe8XwHC3t2NwwdLewl1r3vIVzWRL45jxAObPA02JIrSxq1gy1eacJ3pBaPyB4Gq3yiI4m4LtjHY7aHW8ggAUIeHZFi5BIRx5oIauPog3CtNzafPZ4ilWJBj1FT6hD9wkA0rjroz0Dk8XOVE0RcN1oulRBho2i8tTIPbrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722347188; c=relaxed/simple;
	bh=02k178Gfr4uqitB3JVqKq9B+OniY+2aR3vq764isv9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tzpanCtfxbYgtDY/mPHip2FmL3+swr055BBKUzRSYfSK0XGDF3DNhqadCoe4yEF5lqcV1b/yDz678xDO+hh0LybS2higqHw0OLPb6X+YWGw2cMc4WJWTrAhtOy7omw7EaFdMof8jd2+x0Su/jV6vsAQ1f9lcLn8vHvNiXPdsaK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZr1M+dU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fd9e6189d5so32724385ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2024 06:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722347185; x=1722951985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/dTU1wbSXgawF+e7xZGPvmXtCZCdnG01itN/d+924w=;
        b=DZr1M+dUt9b/lfBBRmP4wtUhpZOaXdzHm4msEWOXQcgB1rK77hP0DBpfc7gp9Zi/Bp
         Np7c9K8vAKt57aCg+8sgXYcfgaGE8lA0r0R+qP97BWseot8pX4H0BkVxT4utX5/gU/fV
         Hjn/p8bgPkG43Dwu1C99iXrQ8OJ1yknj4MCnQMTUJ+UBDSDTvou2bciPJYIxfVeZVszJ
         3t4kII5VmNNBMw8+3tctpweroIfkXrHqfv/M/feFEtwsiJWqpd4yag90EdderOUIaZwp
         O9S0WLXc5izImflNKPqvnllXAgRiuUsbZLl2jr+dtXc8nYdEXBvPdAH2//hze0rnSqYx
         +pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722347185; x=1722951985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/dTU1wbSXgawF+e7xZGPvmXtCZCdnG01itN/d+924w=;
        b=oB//hdOGfbsM9Pfxr8yl8qy6yFq0qn3ENRHuHd/x+HJGSHv+5LIWtHOk7zu6fR1Gyt
         orawbUSea+SYZxa8wQgN7WoFkLovju/2cbeen+J8vcI+5nsMcRuVt0ddoTdlXCTUXoYr
         zCg9JC0fHENRzHB+4k4IsBGp3wsLLRtv+9U6T2/rL3SAp1JAZ3j/5O8KbpUNWnc8k+6m
         Z329JvErXMBbUQZmt2tH05rR173tqcNOFPWfAMFbVU7EXytd9+N2BO+tHxZYQ5RArtvD
         NGMhiFHXs1QpeLdTb5c10UiAZJR1xxU5eg7TSeD4bl8Z0xdUaEs88FHLl3d8hHFqtEzb
         X+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV456j0lXquNg4+2C3rT36/JLq4myLPDi7DioxYTTXSvEu7verD2/UQNux6r9SJtuVN2z14Fb4r8PBMXhdCRjK+4Yx7T1gtez6e7A==
X-Gm-Message-State: AOJu0YxPcscEcBgMob7l3e81Imv6gaeGQgIM1pN36fA4CBz0shUUiYxd
	NFuuRxcV6obUSY4Hznvv/L0sDCxy/PmuY4FoEwAeLhQp16TEUOozRVwbS1N1
X-Google-Smtp-Source: AGHT+IEAO4zwoeCpe/HNGN3M5lsDwJ0Zo6Z7nHfrB6ixpp4z6UzmuTGxzbBeTf0UE4ieGJe/5wzVSQ==
X-Received: by 2002:a17:903:120d:b0:1fc:568d:5f05 with SMTP id d9443c01a7336-1ff047de437mr104945615ad.8.1722347185393;
        Tue, 30 Jul 2024 06:46:25 -0700 (PDT)
Received: from optiplex-5070.. ([182.66.67.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c8d49dsm102334735ad.50.2024.07.30.06.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 06:46:25 -0700 (PDT)
From: Sai Kumar Cholleti <skmr537@gmail.com>
To: bgolaszewski@baylibre.com,
	andriy.shevchenko@linux.intel.com,
	linux-gpio@vger.kernel.org
Cc: mmcclain@noprivs.com,
	Sai Kumar Cholleti <skmr537@gmail.com>
Subject: [PATCH] gpio: exar set value handling for hw with gpio pull-up or pull-down
Date: Tue, 30 Jul 2024 19:16:10 +0530
Message-Id: <20240730134610.80986-1-skmr537@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting gpio direction = high, sometimes results in gpio value = 0.

If a gpio is pulled high, the following construction results in the
value being 0 when the desired value is 1:

$ echo "high" > /sys/class/gpio/gpio336/direction
$ cat /sys/class/gpio/gpio336/value
0

Before the gpio direction is changed from input to output,
exar_set_value is set to 1, but since direction is input when
exar_set_value is called, _regmap_update_bits reads a 1 due to an
external pull-up.  When force_write is not set (regmap_set_bits has
force_write = false), the value is not written.  When the direction is
then changed, the gpio becomes an output with the value of 0 (the
hardware default).

regmap_write_bits sets force_write = true, so the value is always
written by exar_set_value and an external pull-up doesn't affect the
outcome of setting direction = high.


The same can happen when a gpio is pulled low, but the scenario is a
little more complicated.

$ echo high > /sys/class/gpio/gpio351/direction
$ cat /sys/class/gpio/gpio351/value
1

$ echo in > /sys/class/gpio/gpio351/direction
$ cat /sys/class/gpio/gpio351/value
0

$ echo low > /sys/class/gpio/gpio351/direction
$ cat /sys/class/gpio/gpio351/value
1

Signed-off-by: Sai Kumar Cholleti <skmr537@gmail.com>
---
 drivers/gpio/gpio-exar.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 482f678c893e..de5ce73159cb 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -99,11 +99,13 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
 	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
 	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
+	unsigned int bit_value = value ? BIT(bit) : 0;
 
-	if (value)
-		regmap_set_bits(exar_gpio->regmap, addr, BIT(bit));
-	else
-		regmap_clear_bits(exar_gpio->regmap, addr, BIT(bit));
+	/*
+	 * regmap_write_bits forces value to be written when an external
+	 * pull up/down might otherwise indicate value was already set
+	 */
+	regmap_write_bits(exar_gpio->regmap, addr, BIT(bit), bit_value);
 }
 
 static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
-- 
2.34.1


