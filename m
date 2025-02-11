Return-Path: <linux-gpio+bounces-15723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE4A30B43
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61ED2188B6D1
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F3721D589;
	Tue, 11 Feb 2025 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="io664Vv/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB271FCFF5
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275811; cv=none; b=GLfzWBkvvrs2sXJ/BpXysJ49T10drcS9COn6ZssdreMEhYqKpPBy1uedSD8ECCzh3WKapdvCS/4L1w//wo8ndVDOrcFU2hIp/ZCUC8XWil3kx0GuhfVP8VnNPkEBK9KUhfaGrXet41M+HtwBErCl3tv0m6WQ82gvylGMhePDun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275811; c=relaxed/simple;
	bh=rcQ3T4zyuVTiLHp6WubPsE1Ox/Kf0sce+luCScWqL2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNIb6j51gVeyhG4lmzLLXFV+zNNEjmp7iD2zxkPSQEZOg364rRC+V5CMKMI+w7FWhoB1m6trCx2umaGqYvxkmiWGlcPiVcKIuaQX964f/eJE6OGLEjttwdX09XSzjDG0Pj6h3V8B0YTsJUqHX8ygbRt8kHp6N7gsVXO/M0WG3Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=io664Vv/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38de17a5fc9so1108532f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275807; x=1739880607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qv4UcbRwOmRlH2+uAuWjapg2vatXtKfR9XWqAYZihX0=;
        b=io664Vv/LA3m1D+HqphHb7+XixEoKf6cudiFt8mvGfbEfyfrw3jYeAWVTXbuC7Bvyo
         IvFn5o7u81GCqYy/lBEz/cbuAt59JrrdkZBqJvOEqsvTFUqvWTBsrvnUxyYxVivxc2Dn
         h5fQaZ/3fSogacZqGWeOte2jJ4nSmUYgNK8UPOaqjV1gLD1klzEjQ2IKCc3i+74lJ1TP
         NQrYwqa3vpuhWW+uGb5ICo1cwRGQL5D0dzsrFnzCfhQN0GGlz/G/9nr4uzSqfTJQ+OrL
         hiyOodOSJqJShb4ezX958C1039W9ogS+UVFExz02CNVpZw7gAzYFgKH+/JUfas0QJl1w
         rCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275807; x=1739880607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qv4UcbRwOmRlH2+uAuWjapg2vatXtKfR9XWqAYZihX0=;
        b=AMaDu7qS2+nHJhfvIr637nhcx5HpA1qZLHRPWqVHOilBgTnANXL2e84ckyRl/NMQjV
         ew9Hb47xoE+4FTfxekCHqur5CyG+eQaaKdyDW9QCGhregy+EnKvx9caQtesZx0GfPXX/
         zTTw6v5THujvM/91e2Q4GI7YqN6zyLuNPPvzqPnZ5PZbErvWPrWUPRnifOaUJQmTQ3q3
         1q9l4EpgSTch+Kpowq4iBTCwaoNFCe5M9xfzuzLrftCVxatppv9UZLqZ6bZuayQ9q1+x
         QcawbW5i5eI/I8XhLoQD+vyhiTRY5X4l0G2wrzx/BdSKgBw/YfHfZKjvAZDsRYXGjpbz
         AY9g==
X-Gm-Message-State: AOJu0YzzVWymEOLk+gDMYTRItTQNILi2ZyHguSgtw7w+qb4s5x3NtTpv
	m//W5qRDPPON/gJUFLvtb/QQ+v5axSGaHzOsvfbiOmCDeXHeWTB/w4F9PgWRQ1Y=
X-Gm-Gg: ASbGnct2jfqizqxBHgooKOM2d2jWM3S/kUMpjQ1kMCnZSDk8diAKQcyjJRkmxJ8DJ+o
	9NIx0kgp/7yFVg1VQ9s6U0Kqj0ffyQ31CKqGL3d1TiB0WwbBCdKhy2KlMIHYY8nyjrW+G5N+cg+
	36eu7nel6oVu8Qi0IzJ0BPNMOYnn0OuCdShfTjpN3dR6Sq3MOWlNZe/qApPwDJapqTqkekOcQsx
	XaHsQuP50boqvKm6BZMIdpheB8F0S7qFWBpXN9+g9ddlkGwo0s681DeVHt+aal1yeS2BEm32RP6
	RCZICkU=
X-Google-Smtp-Source: AGHT+IHkVqDLdYwsVh8ly6zb88ftBd8nzBW0TKTiQWoX9p36nv3SkqvCkBYK4KMPQa6FfU7orjX5mg==
X-Received: by 2002:adf:e902:0:b0:38d:a90c:d489 with SMTP id ffacd0b85a97d-38dc949183emr10597002f8f.45.1739275807409;
        Tue, 11 Feb 2025 04:10:07 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:40 +0100
Subject: [PATCH 06/14] gpio: regmap: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-6-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2544;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=eWOghmch4gRKbyww4eGVXx2g3hb1VNBqan3sQradlTc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4W+FiAtGlk/jzwkziUhGzXfeS7YMWImGMLo
 ugBDszcM8aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FgAKCRARpy6gFHHX
 cvuVEADUXBlmSbVqQSk4NioNfFKInxWpOcufjfsxrszO9Ck8OJobklQH9VjOqCVLcLSuN6cjU+v
 r5XEifDQ2zV/Ni7oLbexCpuaoykv+k/sZDa83/U4+4FmO7tpzoGZyT8/l7nAR/A8U3OQNzcvFae
 5m+W6ZW9xlKkwShus8lBKm2L4H4pxHJvgVYPall8/hjMf7uIl5mbbi6NQNnbol84ccRpm20YUJN
 lIfsoJruOAu3zjXuOZL5O19BRseTj/YmaAEAzwPVK95WKf27jK74pCFsTiTYUGQCTiWAePioTs6
 jsrklOfEV/aHmjyfIHuCRpMjIqnErvESL8h2yQJEm70lTUkJLCxB42cUSUU227Xsjh4Q5cfQJYD
 vz4Yua4ybr8XSUmH5wT8sK474crHEVFkT4YzHyX8ziXVnBDi2JOhPpxYLUEF6zr1g9gklW0OVW7
 exfqPu8KdmX6LvvhbdpNsUQtdYOObJ6BPTe/hTAODR9cs1XN+nuye0gpDmUwjoFuFKPLIgMlY9x
 Sr8i+nPlJehjUeDDS7q50FxoRtpabE7Kr2p4QAQvED5qMtUKFEdwQ61kLOzEG3UebSVBLi0BK8O
 IMUIj3vHNKEFmYqN1zToGGeqrzf1HW82+rkwGIOF0gQNEK1N+lVH/xzmlyiUlN3bb2wSvBU8Ao+
 rwA2IqRWwaS0xIw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-regmap.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 05f8781b5204..e3b4e392549b 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -81,22 +81,25 @@ static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & mask);
 }
 
-static void gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
-			    int val)
+static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
+			   int val)
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
 	unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
 	unsigned int reg, mask;
+	int ret;
 
 	gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
 	if (val)
-		regmap_update_bits(gpio->regmap, reg, mask, mask);
+		ret = regmap_update_bits(gpio->regmap, reg, mask, mask);
 	else
-		regmap_update_bits(gpio->regmap, reg, mask, 0);
+		ret = regmap_update_bits(gpio->regmap, reg, mask, 0);
+
+	return ret;
 }
 
-static void gpio_regmap_set_with_clear(struct gpio_chip *chip,
-				       unsigned int offset, int val)
+static int gpio_regmap_set_with_clear(struct gpio_chip *chip,
+				      unsigned int offset, int val)
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
 	unsigned int base, reg, mask;
@@ -107,7 +110,7 @@ static void gpio_regmap_set_with_clear(struct gpio_chip *chip,
 		base = gpio_regmap_addr(gpio->reg_clr_base);
 
 	gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
-	regmap_write(gpio->regmap, reg, mask);
+	return regmap_write(gpio->regmap, reg, mask);
 }
 
 static int gpio_regmap_get_direction(struct gpio_chip *chip,
@@ -266,9 +269,9 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	chip->free = gpiochip_generic_free;
 	chip->get = gpio_regmap_get;
 	if (gpio->reg_set_base && gpio->reg_clr_base)
-		chip->set = gpio_regmap_set_with_clear;
+		chip->set_rv = gpio_regmap_set_with_clear;
 	else if (gpio->reg_set_base)
-		chip->set = gpio_regmap_set;
+		chip->set_rv = gpio_regmap_set;
 
 	chip->get_direction = gpio_regmap_get_direction;
 	if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {

-- 
2.45.2


