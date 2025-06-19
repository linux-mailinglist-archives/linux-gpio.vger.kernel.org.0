Return-Path: <linux-gpio+bounces-21844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF9ADFFD1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78E2219E1238
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49276265CD0;
	Thu, 19 Jun 2025 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NA2h3asH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6C4264F85
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322013; cv=none; b=qWcoaihbJcxq5oXcGeiokhBT+vPPEndNkVhbCYDRcXdT46lJv1CiMZUJEZp7Vkbw3mHWb4gFoUunyzeawYD/qUnik6aZfKRP78cmSulGAqQ2/s7fueZ4u2zUkr7rg+VW2LlQdYBBnnHG/AZxYWsuztGR0IrZCmp/EwL4kr+5wmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322013; c=relaxed/simple;
	bh=kEfiCA9+OheiBriw2pdL33nAXF823N9SCYa1haJTgFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJCAzkcEKPH5sUW9pwSQcUK+RgtGxmgaU3p9yEfUiVqcCNqHF8f6y2kfXapqPjkxP8xPfyaTP+FFaSIBIe5mvAGUHjD1w6kGEoCBV7ZG4tzlqHfaC2VIJBDru60ETXEXZoas4fa7nqKdFtX+DPUe6WHg1UsdI84hjvvUbU5WUdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NA2h3asH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a589d99963so524142f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322009; x=1750926809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=;
        b=NA2h3asHbxEWG0dXYV57Zwo7DzfDvtxtyH22ft091dMRYnrxFmGgMHTHh8ctJCjSU6
         voo47AO8lBLHLojbyYxr1888wPeVKeQmtayI4KukIqwMA0yf4q5kVPAaimuRKCl3W1BP
         eW54mgTTN8O5jGKZmZztPhIk+I9n8oT/UM7oLxBj7QXxgd5n7cqBVNM1DjyGsviyZ4iO
         L2YMj09KLXx5brVphtdEX/I+MPTI9bGhjNu64gLQwcLrMRAYmZaeGz0wQSr4E8bf3Nqb
         sRm1PMocNaRQa7KYTyNSWbpsop30NCLfFwJJ7pzh5lsSiwyWzinN5nGbkLzuq6T6uKKZ
         H23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322009; x=1750926809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=;
        b=JBeTu1KxGuQSHTJEBuroQwKhb+J/CM1UUTJdoelzSBIG+zjt0FSrDV7GPdCraV27aC
         gNEai4sMK9DtxJcSAIxe6+c8veOgSKKGe3OrDwzR7YGm055FydiT6e3x48xX2YMJeuki
         5f0/Z4hdvU+I7uOrsBSlrv+UZPBUGa+TstxkdX/cImWArv3+tq4xvYe9g1CWK11BH4fX
         +cI+ongzTvTDvybIXnSQ/PCVmoFBheQYJ6XHeKiN6AdOQr1dRxwSSGcSIDBbFExKP30T
         BPkNZnLNjorNLDZnAcCOdHLYmwQ8aARmS7PghQsM8QxUyqPcawTG9ksaFeoZkDxtXCkd
         1+ow==
X-Gm-Message-State: AOJu0YwhzoZGzehRFkbIBot2FILXONmDGf4hY0SEdYF4vfg4uqeNA3C8
	UD0jYZ1bj1R0P7KQNcvM3vbmRWAgNpI5GdOQhrDKn+h3/a/wI9VcENuDRgYHDwr2MQg=
X-Gm-Gg: ASbGncuc6QluoQ0IxzMH0giLA5uNBDixbvh+ujzgoSlAbcYOM5yAencASCOYhn55yLr
	hmHrmSE5UbLuXeHxCfwuxw76hjEwtpepuLrZDzIGjlySgllk/HQVHw7WyoDh7jwTVoJfWWOrzT+
	WnT7ARkHm7cnf5Oblv+uAxKTFYkSrDUCRawZEt6UCWmR3ss7jtfYK/SS33OiHW9jVHNLY7axLTW
	vuhXrR4+MeS0RbuKv9aaRKxm/jEBqgwnC/pORwJeG8Sp3aCrNxIPBtVt+/gk0ZHOtNkaHvSPP2U
	pH5SbKfK7VyLN2B2XIIAMge9AnD+5wYgSezo5Cl7ng0eAu1SuhAlbers
X-Google-Smtp-Source: AGHT+IHPLcB8/29mYtkUt8iKok7FC37biZwWB/Q/SP56+aQt/F1bk12ty9NxJOh//CgnB0DvwIlwFg==
X-Received: by 2002:a05:6000:2884:b0:3a4:cb4f:ac2a with SMTP id ffacd0b85a97d-3a572374884mr18221393f8f.21.1750322008719;
        Thu, 19 Jun 2025 01:33:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:16 +0200
Subject: [PATCH v2 03/12] gpio: pch: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-3-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mZa8mgQmqtI4o68XMiXnsHjV4blkeihaJT265+ul6Aw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tRA5Lt5tCecOg14IUXcT8lEaMqPIFkzeDus
 xIhrJVliUeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUQAKCRARpy6gFHHX
 csRrD/0X4kU8CvgNicRwRcPWkiYI5uyEKdHA44BuqB296GSDxiSMQlry3tpH3bDB615ncgTzJma
 OeW1E/h2/kWDyXb/rNf+JC8p6+Vp2CybgFfPoOITgwBlsGU94i2zsJVj59QgKSr+zQy/72qvBHn
 30sFm5mbKzrutIuUP6hJcSCzDOlVbid1hEET+ln/VekIRRKHcacMTBTUZ0WWa/nfcUZRTZzAX2L
 tFfYnE55xhV5+Ol+XjM9Z9Mq/lCTwzhN2RBjrgLNtGizgzogE7BB3D1HB+DnRNGG9MY4m9dVllv
 3OxtMEmV0j6XpjJIYQjMNDJFdRJgoMbELkgGEgBPprC6VEPHwtkQVpt8lk+IxBBa/qHDuyusXaf
 7ov5BUaSMqQwsumEzkNW99h2bcqbJ/5v+eU/7YJeMAed+Ayi4yN2/UGvuQwxTH7gPEhgYLrlwzR
 8UCVpkgDo5KYQ0WCsn+HvBworLov88KlUpjNIBrq/cV+Xmp95zE7w2JscdCfsFoclXHa1JsL4+i
 m1+oxV36y02XpfZ2aTxmzR4poQQrGV7KNVIehnHYTNdmNfXIhcHi6ksh5yv3TnZq6PtvyGM7wZb
 L1a0SsyjT037zulwfvX0arMDLrHDEDL4AFJENcGpmVSVfgEDcvQNQ3jHDR/tmWO3BUf6Lz+Se5A
 d+JfGKVb7WYgPOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pch.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 63f25c72eac2fb98156eb7682e780247a893d7e7..c6f313342ba06a1386d8ff8a882c9344a9e809e7 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -99,7 +99,7 @@ struct pch_gpio {
 	spinlock_t spinlock;
 };
 
-static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
+static int pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -114,6 +114,8 @@ static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 
 	iowrite32(reg_val, &chip->reg->po);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
+
+	return 0;
 }
 
 static int pch_gpio_get(struct gpio_chip *gpio, unsigned int nr)
@@ -217,7 +219,7 @@ static void pch_gpio_setup(struct pch_gpio *chip)
 	gpio->direction_input = pch_gpio_direction_input;
 	gpio->get = pch_gpio_get;
 	gpio->direction_output = pch_gpio_direction_output;
-	gpio->set = pch_gpio_set;
+	gpio->set_rv = pch_gpio_set;
 	gpio->base = -1;
 	gpio->ngpio = gpio_pins[chip->ioh];
 	gpio->can_sleep = false;

-- 
2.48.1


