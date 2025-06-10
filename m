Return-Path: <linux-gpio+bounces-21215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D436FAD3857
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A659E17BECE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 13:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703C52BD018;
	Tue, 10 Jun 2025 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fj0ZfVgE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A865D29899B
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560337; cv=none; b=T/hRjZ2msnNvzirfDOl+Mc043950RNYyrZQT+s6nXBA7xbKcv2ky5HLNwYpLOvWqWMSRtsmDuw9b4MxKgBzYmZ7V3BdPV/OxO4SjgOYAjiDLuHWeMTwu7ObI0qHETq8Erhrn6fYI0ZMpaANRa5tkodKOD40DaiViZi98v1MZ58k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560337; c=relaxed/simple;
	bh=dg7NTbAf068nkPAyseuYOJ95j/6EnHMv20djyj9AJ+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QoCexCHUxtv7Ug7De3uEQjPnaYWzOZ9o7eVtX7xMaRXKPGqAQGzpG1hevqrj7i9E0jYOe8dcaBuw+qb/6PPqq3ijta2GDi0UM4bcrN4NNVw3wMvvRBMbxozmz4Jw0hx/F4Dhm4IyPaMPCfqRH6UUIwO08SMPoPVdJUJHd5IEqj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fj0ZfVgE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a522224582so3326292f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749560334; x=1750165134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjtG0M1yLqqaJE2dvBiQ0tkCCMrIQMLQEJb8hOYQ7U4=;
        b=fj0ZfVgEShJLEF00AfWncm2gyeOEm0n9F/myoJW1I+ZuqA9uI1Sq0BvP3SGBB5Ypg0
         pzyYnEPEGakniXZq0UoU+4l/5bHAkm/fBLEODf6LJ5oU1e/8O6r5BY26q3aJTbdWCi7A
         Vcax/tc4MYgy2j3ikTHoJHBSTMl8+1P8sbj174uozirS1PgBtFlhFTB1WriKRINEDziX
         F5ufMU1Y3VV7zuVJOTIp6B0AJAP09qHed1vEQTar3wcjNPJrEb7EQcUD/mzmerwAMmOQ
         bK+E+mSc5qJtM1KlKfONzdDsgEkuujTsUKb9dsnZYivyaiHm15ruy+ETZrgeTP69zCtL
         A0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560334; x=1750165134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjtG0M1yLqqaJE2dvBiQ0tkCCMrIQMLQEJb8hOYQ7U4=;
        b=cTn3sDU8628JwNB6jfFGGBbEkj8KkZm+WFrLaSiTQ1ix1ioWS832LV4A05A4RjCSAW
         Ok6FoAD7obeHJ9pwoH+xR/3pQilN3GkiRlxUtu2Uxoy0w9X1DarBLNZ4c3fWjEReLZDX
         UC7vgVOJM3kiXZTlbVs0UhC5Chi8Fq9SKJWty8A5X42whFYfYSfTsqsjd9QmYHJpEMAM
         Ht5BAkAEvBHUY79OdIcC9IpbJOSuUOqbHL1fUOTTsdvtmydb0oGDXGRBUzh7GOq5EZzP
         +mvzH5wn2lZYMMg9L7ca+HNRg3MNco5a9IU0ek7SGbGxcaRTb77h9oQng4o5jPM4otS+
         cM7Q==
X-Gm-Message-State: AOJu0Yw3t1kBy0WNqm8g5/3Jt7pDcRYwPYKiZs5f5Uc80g0AKN+inbZ7
	FHDj0XSORTHIyq/G0UC90+G9xqAQGvFSW2WzXHW8HReZ8t+33SwxFGKFODhYVIc0CUg=
X-Gm-Gg: ASbGncvMjM5YtfjlcQR7SWu6uUC1zjaVArSinRLwVYN7TsfdMe2A1QbSNbEcH8CkPa4
	Mq/ohrbHNhDbayPWabiJCm5ng8oXBOhepJjfHVibqZNPbgSx/jVHEQH6mxURAzUDJeLjz/jg1zT
	zMc9Mi5OCKC6n0fBOuiqdbuZU7c7kxKPnbz6HvWO30SUmB+ihj+DbajP2NfPKMMcXh+x0EPgvqY
	iQ7Biz6seWyVVubOZuZA4EHwzJrYowwL4rMx7tESiUlDyur8bpLrZ60FjRPQueEDbl6LdQ5dOmb
	kpLbPjU0yUV8Bdsn/K6oV2HboSKyv0h3w0J7CoFCCoRpo4Ojx6WGlQ==
X-Google-Smtp-Source: AGHT+IG9PzUqyoN06LxiZpOjCCdywW8bf+fgtQ2tu92Z0cLy0kTBBzQ8suzPDSLtmma55Nz49ZsvWw==
X-Received: by 2002:a05:6000:381:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3a53189bb71mr14507284f8f.23.1749560333951;
        Tue, 10 Jun 2025 05:58:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce17f9sm143671135e9.11.2025.06.10.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:58:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:58:47 +0200
Subject: [PATCH 1/4] pinctrl: baytrail: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-pinctrl-intel-v1-1-d7a773ff864e@linaro.org>
References: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=b/W4ziaIZgNvt2gfFSTw+J+YlxD2KTxq4CHCw9mjq48=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCwLGwnzqVkLfUS1V0SOYonbSmRblxE+rHBQp
 gKdYAYGONyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgsCwAKCRARpy6gFHHX
 cjyLEADFOQ54jPSO1HZsx7GXyUdHxTSOgbMwKyCsouhFb1ic9GsIv81XFtVmDIlfLe42EIZPsrq
 YzhuHu1Z1uBlqSN20j6lzNUTZDEElUoGkF02jXUQtlEu14Ses7HTX7UWoKQjR2UFrKbwrJtAg/C
 dH+dIi7HNmOvTFIz6hP9Ucseb5X/qnk3YJxK++l45GkykXw6y56XAl1CRRoQzL/UpzoDkE5RfbZ
 1AfQ6jOirYN7jhtpG2k26WLHbdBjzLRtPTe3XvH8VkHbStlh3rXsRODdT4x6lJ7L+Q9yfTaZ4Pb
 BCLiIDzYCfbDsiECjaGAdJkntnGMsf95nWF7A6B931P1zSaHBvBeOTyvU/KUviN+C2SUsWADSfn
 K7cL5wHQOBKXS1f+zrKIs04FPoZGOywEhuQ9VwCTgBa3qm+thDcXSX8DwromAtJ962uqvWrMc7o
 /T5v1SXV0njvWlp1OR991KWFw62yyasWyl6pUrc3me+xV/9MoPcJIh7DyZ2OLBYiGOISTY/IRvS
 1beiSF4cisCm2OWopR8NuNzxg5YWIhegNmoBVxgD3z75FUm229GTK8Nr7jf86dZdolOJQmnDsPJ
 wI/oEITFoAMMtytOHl+G0ao7Z4P2TrY1VuvM2vmqHobdVWbrRxyMXG5m5j87og7gwNzHJHU4biY
 JisDOVmnzXNNhgA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 969137c4cb0659fc66bf461bcbcdc60fb2d0dcb6..6eb649f1ffd6e09c0a8c99704eb165dac58d9736 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1045,7 +1045,7 @@ static int byt_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BYT_LEVEL);
 }
 
-static void byt_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int byt_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct intel_pinctrl *vg = gpiochip_get_data(chip);
 	void __iomem *reg;
@@ -1053,7 +1053,7 @@ static void byt_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 	reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	if (!reg)
-		return;
+		return -EINVAL;
 
 	guard(raw_spinlock_irqsave)(&byt_lock);
 
@@ -1062,6 +1062,8 @@ static void byt_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 		writel(old_val | BYT_LEVEL, reg);
 	else
 		writel(old_val & ~BYT_LEVEL, reg);
+
+	return 0;
 }
 
 static int byt_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -1229,7 +1231,7 @@ static const struct gpio_chip byt_gpio_chip = {
 	.direction_input	= byt_gpio_direction_input,
 	.direction_output	= byt_gpio_direction_output,
 	.get			= byt_gpio_get,
-	.set			= byt_gpio_set,
+	.set_rv			= byt_gpio_set,
 	.set_config		= gpiochip_generic_config,
 	.dbg_show		= byt_gpio_dbg_show,
 };

-- 
2.48.1


