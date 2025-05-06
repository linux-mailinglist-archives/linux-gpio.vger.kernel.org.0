Return-Path: <linux-gpio+bounces-19668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C52AABE22
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 621454E64D2
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770F826B08C;
	Tue,  6 May 2025 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PfTp06xu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495EB26FA51
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522125; cv=none; b=JXlk+T1srlHvlv6OOVBGk5PQ2+FImBEx3xJ/m5sVc+UQD/iizCekSo2GKg6wE9eyZkLqlheZUXCNcunSXESmmUXxOLVu1sWRSemkHgyGKNlojnuyV6rpds8R/22lkT/VD1c6oWNuUsy0SwFOXWoTY39uyBFRIM/Vu3vdWwZumcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522125; c=relaxed/simple;
	bh=Ecb96MKrbu/U0qaUA60xpSbdiSPpwxoaioMHdflsb+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3soNcERMH1tmpYaGTv79dtMIvcY1v7iC8d9nGwCvUtTTYXRw/YTtoDnm3KYxtL1GNYKrDzBMeGF15+P5a9yM+ap7gJUDsl3gbXUEMlcnywHdarPv6gwbY714DN0wNBo9gdSgB8FmykDc+jVT0UF47ORjaxs/JeufrjeNxBkmFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PfTp06xu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edb40f357so27383945e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522121; x=1747126921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u71xXPv2Cn7JbdcKCIhenriwZi9FR0pSz159YD5Hm9o=;
        b=PfTp06xulO890+cmpTi6exzsccago4kvTVni/qKSxagGopI/Arlz6r36ovftl0Ihfj
         qrnKX7SNtfBF4Q5omsvLxVSod11lq8/1QKUQrxCpO7wsnEq4o2kmMd6kGnGFdNZammpJ
         HHLWkM75dAYIa9SMrWl/NQLlAmAyErzR7P7qfZP9l4FAvcPbrbXk9VcrSq3w0CBcu+WJ
         3l4Dfdp0lKSf8d2Wea+E99629NjY43wfvBXabaauqCzHltA2WfRFfiLg1lQuQx2Bnk1r
         GIOLe6zRGwUDA9PCRwNl7G72YpRjj4IOrCaxAjsToETm+3n+TYcrD4doobxlFjIi9VsW
         xaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522121; x=1747126921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u71xXPv2Cn7JbdcKCIhenriwZi9FR0pSz159YD5Hm9o=;
        b=oyPx7+LIurqLvHD62uiYaG+dPyKv+1y2JNkuuE3bBY6WMff5BF74FyePLuMNrkRk8D
         TDem/OWROSF4dU0sNV3yNG3DjSkrS3935jdQ8yOp8Nhzwe8AcCkATUPX9N3wAQ0W50IB
         18T1Se8zn6IYIOPCDx+jdGfQdbTfQNjJUJaXbuXOveb1Vi0zFAVO7liBLfpa5ObeP77r
         i+24k9TEZZd4aJzfdI2fL/iBOqAzjCwMnIXIs/6dJ0Fx0ndUbDGfQeGE6r26MG3EW7Xd
         g7qJR3A0tV8JmVwcQwVCw+TU0cZ28WBapLORFHN0rViRT0EGkDO7Zm16e3WE+d9Sq9a2
         oMcQ==
X-Gm-Message-State: AOJu0YwZ8RmwnEfkqezaTO058NyIOQKFBIL5BbWK+VUxQ6iElnhMw7Fo
	QQjtrqNxVgOqU6alTHKEGmM0OxGwRYnDrOFt5kllWYWXhXRPMHX3S+iNlgsJK6E=
X-Gm-Gg: ASbGnctaPubCksrTwCg0Hd83ZyyKpXoT5xCrLLVq5Ks3ds/c11K3TlgoNtgbhkjSVlI
	h3fzNMFGjqVSFZhsvXBznEhN6V0acTUOZGknhVr8GTDP0qLTC/0Y3S8Y15jJ10rvSm5Bj2yYiYR
	7RBw6y6gug0Z6FnSZqLQk/OchFpbbTbMyfttChrTrjLwRfDnJDhL9SrrglE3gQNN5xRTi2P1l3m
	fCp19g/51e5LjSFZcFeNTR2fwjYNmXPMmyuEnnXdfptPlHTQalWIigRggb/r5yYPWuD0DMz7/Me
	DP2QOKQbKp+Y0xEJ9HhaOvy5EyJdfxwUnSw=
X-Google-Smtp-Source: AGHT+IHXB3gkSMrAkiaEdkZgfwPUxM31hHCvMRRqx1aDQWE8PbU/eLSpr9sDJNShzozwei4n8wZn6A==
X-Received: by 2002:a05:600c:4ec8:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-441d0fbd494mr16499275e9.3.1746522121626;
        Tue, 06 May 2025 02:02:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:51 +0200
Subject: [PATCH 08/12] gpio: max732x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-8-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+ZH07YfdYJrmGtGKxfVboFth3KKtcaZ+GSxu05Ln8Qs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/+lvgMQ4oQLj/Eaktuwp8Im+zWEzU1mIo+f
 E1B/S8mAleJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/gAKCRARpy6gFHHX
 cuuSEAC2pyP7juGwnu8AnZibZ0/xjMAmnRTRcL04Pm0UhdkxVpm+6aQ8khE/D7bgVXSp3FccL/3
 2jYnQ9XYJM+/AHIAlPbtcIpl/Ep16qBqdLQFAZJyudTQw5emHdDNCpAJL6WVcUy7tScevv+93Cq
 +sLanICe0/iy5Eq4PG1Rd//mpz3FIPbR2IfU6aKestqMvnonexknwOY5yc9dTsXlqpxAPVxV88l
 mcYWutkd225tHOYT1MR6QYIDmEK18C+N5qFE/MQWrZWIA7ixLDoPTbW8KSn7u8SKARs3yEF02Z0
 1XrDaB8wlkmlme34eU79hg89bscEmb9ZldhoPAgkpTHlL1+hR+pPCSoV1pVVOgB1GxOjLP1HSsu
 kMrYNPOiO+pauSJaHd3nYHL8CIeLj0yIBT0r1PlOO3ISM0fdlFZYzdZS5Bufh2kCRh2SzYf7nzG
 elYIUetSzi/RDeR5vHN9geaeW1Zi5jF4jldlXsqki83hz840gy2ribrdaj224iQMLfkoKFgbKLc
 ZNkHwV7FZ12U6lT9vuIn0kFyzmtcyeLzkM7MRJgwsQela8SVqVmbud1Q34yl+qyZJvGgaI5gdLs
 Y9jumqWY5pjlx8BSNrkkuR2ZRJU+JE07KiDNkx4YXP4E089iCHnMW+5GQ2krp9kKz5ElnqUFCwi
 +RcqvFGksZTkCqg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-max732x.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 49d362907bc7d..d5ffedb086af4 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -225,16 +225,19 @@ static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off, int mask,
 	mutex_unlock(&chip->lock);
 }
 
-static void max732x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
+static int max732x_gpio_set_value(struct gpio_chip *gc, unsigned int off,
+				  int val)
 {
 	unsigned base = off & ~0x7;
 	uint8_t mask = 1u << (off & 0x7);
 
 	max732x_gpio_set_mask(gc, base, mask, val << (off & 0x7));
+
+	return 0;
 }
 
-static void max732x_gpio_set_multiple(struct gpio_chip *gc,
-				      unsigned long *mask, unsigned long *bits)
+static int max732x_gpio_set_multiple(struct gpio_chip *gc,
+				     unsigned long *mask, unsigned long *bits)
 {
 	unsigned mask_lo = mask[0] & 0xff;
 	unsigned mask_hi = (mask[0] >> 8) & 0xff;
@@ -243,6 +246,8 @@ static void max732x_gpio_set_multiple(struct gpio_chip *gc,
 		max732x_gpio_set_mask(gc, 0, mask_lo, bits[0] & 0xff);
 	if (mask_hi)
 		max732x_gpio_set_mask(gc, 8, mask_hi, (bits[0] >> 8) & 0xff);
+
+	return 0;
 }
 
 static int max732x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
@@ -580,8 +585,8 @@ static int max732x_setup_gpio(struct max732x_chip *chip,
 		gc->direction_input = max732x_gpio_direction_input;
 	if (chip->dir_output) {
 		gc->direction_output = max732x_gpio_direction_output;
-		gc->set = max732x_gpio_set_value;
-		gc->set_multiple = max732x_gpio_set_multiple;
+		gc->set_rv = max732x_gpio_set_value;
+		gc->set_multiple_rv = max732x_gpio_set_multiple;
 	}
 	gc->get = max732x_gpio_get_value;
 	gc->can_sleep = true;

-- 
2.45.2


