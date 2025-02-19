Return-Path: <linux-gpio+bounces-16223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC86EA3BBA3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 11:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33A767A3E36
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 10:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D851D7E30;
	Wed, 19 Feb 2025 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XTByGZiU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4271E1CAA6C
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960881; cv=none; b=GPCE/9S2/+AHHdUnJ7lVME7P7U+H6MpmOeN0QTZyOyrRpj2xttddeNu8pFEOjQF64EBU5Cp+9bfLutsh+yjR8OXHqQAhXsfAdpAJW3OvOev2no61vFGv7IorYbqxNbwSrBZdlmcMuzMdaTe1VKy/JG6auGmG6pLhTyl4V55D5TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960881; c=relaxed/simple;
	bh=6VKE6e/GxYsDY3pcRKjEGiXCqUCbFBAOACkB4hJUJgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQQ+HjZjXEyqznpngdn9jpQrnRZRohkBaJcxXjbc8dExyA+FHpROpnnOcCmMbF5jReUn/fMW+V+VTy+8wYHkM5KF+FTNOwh+/T2qQvUnLBKRaK6VSLd5pH9B9e6kZgfGOIH99I9r+p2BxSXGf/fE7t3+c0LEVS+QoEcoUmKjBD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XTByGZiU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so3825155e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 02:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739960876; x=1740565676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvFx40Wkz1+EUgvvJu1sZ6LkhHVZr+FyaICn1UZ2ZFQ=;
        b=XTByGZiUC0g6XyQvAMQKKDgZIlICOqthC7lfgHRhLu8hAjbOUzBO2myjzMMTHMEWaG
         jGHMJrXGP6svTrcLcyELnkegZ5uzyU77ssIYBEM/S4AODB4gIrScvxoFnhbwLW8v3J12
         0YUdP/72sMf+v+JJ/cxaSkyt2OU+8tvTszna9xqy/C+/dBPk/En8/syHVAnau+OjYGIk
         mtLnES0xY1gUIKFIGbJmoJZIwEVlBRUT4+JnIlRZ965O78E8kD2sQHMWwoloJj9+Kces
         cUPj7SbUJ8W8fyw8kO2yNsSkDSVwrWafMqAGP3MIf+f9ZNZIvCg4fpUREj9Z9kTJldFj
         b89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739960876; x=1740565676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvFx40Wkz1+EUgvvJu1sZ6LkhHVZr+FyaICn1UZ2ZFQ=;
        b=jbmkiugbUdx4ESDZqV0ivtlRIulIwngxUHVpmzl+xUt+R03nA2Ksl4XPUWILon8OCr
         SepKINbT1XXoekdoqGAn+4ZI4qhD7GOEIogvkU6WaLN791Wa0xed9AhTtx0L+oWMSegl
         VEWmR/TKGaney9yda2ZKFD6Agh5PrUxr36AhUc/RN+OIPg6BMAzKrOhDi6gqQz3Thjct
         YSzQC4qHFnpHcKIZSkmnD3usr0X7Xt3+Pu3kXCl+oKWRjlww3WDu17k3VTiXMwZT7tFV
         x/9aJfo071B+d0PUorLHynzPgaC/7UCUz5KZxD/LutYgC/t2xipnswwLMGLunN8V6pIG
         mwvg==
X-Gm-Message-State: AOJu0YxKux5Ey1qv5HdS8DsFcD7Bs49geIxGwWPcdc5X+UXaFo16HQm2
	ALNWnv6jzsntK2uSQ0QS7iOlmVzXwPt8ppX8EC0e4e1ILZOXomG3SAH+MNnhYX4=
X-Gm-Gg: ASbGncvtrklMmch+YRwE4Hj9ceK+8X8fcUybK0LsT1qqDwoHyfTr8vVVSsvbSFMMdpz
	/p9asMhGXipL5/fSpC7X/xVBpGL2W3jUk0z69Bl2/B0ZgKN0IsFcirjpvDKY5rQnL2keQnSM9XE
	4Szv+fIo+nVO1eYzHfJo7Vb7pcfgdEVKZWxziKcUrgoSKxYfRvHwEc4h19SD4GZwZQcl5DpI/Q+
	y3S3+5STcIUVuGyU4M4qbTxQt/G1C+xa49KrCS+x46WtalZwgYP0ZV9njVFbHeiDlN9XqmUNDTM
	4t35Kb9XhW0Fng==
X-Google-Smtp-Source: AGHT+IFlkOBpfCVx9q6F8niujWCdyL0EtEeWnSdwbrl7CVR7yKaGyBHih66p6S5yCje9Vgk4wUHg3A==
X-Received: by 2002:a05:6000:1fa7:b0:38d:d222:ee70 with SMTP id ffacd0b85a97d-38f57d93168mr2442618f8f.20.1739960874730;
        Wed, 19 Feb 2025 02:27:54 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f0ed:3532:fe6:315c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5f4fsm17492626f8f.78.2025.02.19.02.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 02:27:54 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Liao Chen <liaochen4@huawei.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Mark Brown <broonie@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate funcs from get_direction()
Date: Wed, 19 Feb 2025 11:27:50 +0100
Message-ID: <20250219102750.38519-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Since commit 9d846b1aebbe ("gpiolib: check the return value of
gpio_chip::get_direction()") we check the return value of the
get_direction() callback as per its API contract. This driver returns
-EINVAL if the pin in question is set to one of the alternative
(non-GPIO) functions. This isn't really an error that should be
communicated to GPIOLIB so default to returning the "safe" value of
INPUT in this case. The GPIO subsystem does not have the notion of
"unknown" direction.

Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/Z7VFB1nST6lbmBIo@finisterre.sirena.org.uk/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index cc1fe0555e19..eaeec096bc9a 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -346,14 +346,14 @@ static int bcm2835_gpio_get_direction(struct gpio_chip *chip, unsigned int offse
 	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 	enum bcm2835_fsel fsel = bcm2835_pinctrl_fsel_get(pc, offset);
 
-	/* Alternative function doesn't clearly provide a direction */
-	if (fsel > BCM2835_FSEL_GPIO_OUT)
-		return -EINVAL;
+	if (fsel == BCM2835_FSEL_GPIO_OUT)
+		return GPIO_LINE_DIRECTION_OUT;
 
-	if (fsel == BCM2835_FSEL_GPIO_IN)
-		return GPIO_LINE_DIRECTION_IN;
-
-	return GPIO_LINE_DIRECTION_OUT;
+	/*
+	 * Alternative function doesn't clearly provide a direction. Default
+	 * to INPUT.
+	 */
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.45.2


