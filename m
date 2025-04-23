Return-Path: <linux-gpio+bounces-19175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92437A98056
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7501940516
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B297F26AAA3;
	Wed, 23 Apr 2025 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="P3fFGtB4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084A269AFD
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392530; cv=none; b=jgUiQmkWRUpWQ1gS+5i6vYoqxXBHq2dh+kWvlGg+bklq++ZMObVYXy2JRRhPuKXIA9kywlKnsgg/M7ntUj3HOalvRZFZtFjtCZakNc7XKwl3aLFWogwJxEoZLhjZhtTvewI92bY3ee6zrGMrUtUyZecjjkbWSehjq98h5q/NcXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392530; c=relaxed/simple;
	bh=yRgnB6XWkeKpphZU/tcz+wQT2+c1lDPE3YxdJdOW1tE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VomuvAZQo95M6rXjuznGaRqdyUyKxuImot4cccrkyUK7x/bxX/3iVru1dYmM/J6ITe5mGTOHeslpC61KxMy3frUhi7zjCrg231KlNy6AAGXdukgV+5g7h/HoGBR3fuPW51VQpqsE2UI9RcUXS/aBA+VoKy7NU0lpGQJWXIoNOdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=P3fFGtB4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe574976so44625045e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392526; x=1745997326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dUpHlzVQ0Nluzp3HoN5pgyga3apGsC9qYfohIDy0Rw=;
        b=P3fFGtB4ANhIVG8Z0NzPM80l8PdifjL0rHGg1JbqJD6wGxTsXgsVjycMQcump9s7v9
         SCP5emATpJgIFMUn7f05BoDvo94ghnO7ntX5iqZ41+o58CAvDfvozBqrSiSbM+h7ELqn
         xr+nZA41n2wDt+f0rbJTfeIePG8LMV6haqfxwhdj8wBUJQAvltQoakIrfs+nVrXuAGN3
         D+w6+kJXSuMUk1FslpnIOgSDex8WNd12qvPr1Ef3d2Rd4tvR491xh3NK6PBzgGqbipVy
         0tXiTMk/ooFEcaIbPtSniApteBCas9bQcW0xzuK2cD1jPVxJrJVQotrx+rNWG5Z0dsC/
         nlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392526; x=1745997326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dUpHlzVQ0Nluzp3HoN5pgyga3apGsC9qYfohIDy0Rw=;
        b=nvIKv6P0epMPxsF/4qNqIVL28pITKB8dXQ241sMqnnt06Vjz8YW8+bQd4iGuAzHqTo
         CSL/p6pDApzbKz/kNaafeJXUWoOd9IiGSYPQDB/LFKt29PbwTR43H5jCoBJmrfxh1oVv
         cDETSK01AOPBdM0BZoWTYivYee3W0Gob4Gj4CCm9vTQ/QQhCauJozVY9HOx6Q0uGtn3t
         n3Aw4qAhXM2HrXqrTsMbK/HLN9830pKiZU2YPjiCCzNr0ERgHMuaNuS4ARuyzcvi4UJ6
         CrRxifn+xVHWKqfUsxUkKBnli+sYl/cLtVP6LXim446c+HDhYwZXtf5WRsLThL+rMkzh
         8yzA==
X-Gm-Message-State: AOJu0YzuImApWBXUvZA8IBbrA+6oJwjn4qwOFCgGUyENv2296/VnUWqK
	7GnkzMHUwH+pEzf9arLcsLUo2h9af2QDaub8cJX3zPNpfYFO9Wfp7T6ayW8PTaQ=
X-Gm-Gg: ASbGncvNTUo6le+u0vmk2KBeya0DxOf7T69DEZwZFLacr2FQ97frPYb4tS8VvWMFRZz
	awGP1hhb703fvZAJaW0hiVnNkN0qCISkRDaOenFpz78D18W89VI1LHVaZunMGHVoyNCuiG0qBTF
	eEGLGy4/avqICOEbb69mEOyOgIEvv4hhD57MlK+9DiX4m2bKykj+stOkWhxmDr6ulVuDDnpeXBQ
	+HIgTNW0BiIdWZdcN1RGvGTPmB+IyZ3uXoM2MgaNycy+tHzuWjBTh24R5on8VQk7lfXlQ+YtMH8
	XuEuZRp70w6HYD/ue4ZhGLSDj7Y8mB6/1DljNdnZyq9X
X-Google-Smtp-Source: AGHT+IH2MsdDNILYCsPMW1ySHRfLwTlUNKKijfetG6ax3upZnauWSGQaIMu5VBaZHo1H5K5p/SAe6w==
X-Received: by 2002:a5d:5983:0:b0:39f:ef3:b51b with SMTP id ffacd0b85a97d-39f0ef3b57amr5697581f8f.32.1745392523690;
        Wed, 23 Apr 2025 00:15:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:09 +0200
Subject: [PATCH 07/12] gpio: kempld: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-7-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GEPnmbXoB7fEIW2iO7oP13YH/mpOLXVRPH64FaTpdkA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOCWLqOVcCM9B5CKNnljLn3XvSwrTZkEt5m+
 EdjAfGiBV6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 crz5EACpKy3hnh8x/i7lz5DRdTzrevhdTvj2GHcaNqpC9nMq/9jQxcxHyV8D4Aa1c4sEmS55ux0
 xEHbzaaP+jMTCuDrvmgZYLuXPnj0ff1cVBdlqgXoat5CuZYIhFGjUHZu8TIXRyE98MOmXtM+zpf
 KR15+MKLF/MFgGPf+pFiFnhZQgiIdMTUgGuYDND1XzyytYPoDWairH7zw5gkYcUMo4PtKwu8hzm
 ki47tNZZCvyhrwVSrSavZMGN3WH7RrbZakehUkRbsf5zUihpWT8G0DNnMLd/8HjNkj2ljjlEpaK
 pFUx4muqwiDLXH0i1ggHXDG/c4PJKLo9i+xdghac3TQd6m6LQTA+qNpZ3jl8cwch1hf06Je/l95
 c/9adIpl0RriXYQFD8+djuJBhz9g0QNW4pa1Hd9Apr9fbLFjJmvHyyky+yoivb06oIgC7sEImX2
 LRyro8kke7ChteD4VA1/U23BKFJSg51Zb6NZRS34JKgO05v8l7VUQf41tUrl+ZTacPXjSJ9r/lh
 pqjbObBMXu+TTSIsK0AVAf8FMw9eSndey7MuOkQR0sLiabTOSUvbKhO+UgZqkbWRJkZ9VPwQ86w
 Mq25Am90HWAI+h3TYxDI0hf4uOnIAjD5tyAAygo1CqvmeiCnPmza0EgnN3nD7OTQsBXACgi2MTz
 oi0POfIjKW5cr4g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-kempld.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 4ea15f08e0f4..e38e604baa22 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -63,7 +63,8 @@ static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
 }
 
-static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int kempld_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
@@ -71,6 +72,8 @@ static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	kempld_get_mutex(pld);
 	kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL_NUM(offset), offset, value);
 	kempld_release_mutex(pld);
+
+	return 0;
 }
 
 static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -166,7 +169,7 @@ static int kempld_gpio_probe(struct platform_device *pdev)
 	chip->direction_output = kempld_gpio_direction_output;
 	chip->get_direction = kempld_gpio_get_direction;
 	chip->get = kempld_gpio_get;
-	chip->set = kempld_gpio_set;
+	chip->set_rv = kempld_gpio_set;
 	chip->ngpio = kempld_gpio_pincount(pld);
 	if (chip->ngpio == 0) {
 		dev_err(dev, "No GPIO pins detected\n");

-- 
2.45.2


