Return-Path: <linux-gpio+bounces-15731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F15A30B5C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95F46188C5C8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685F7250BE3;
	Tue, 11 Feb 2025 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e1wVmPp3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4571FE449
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275820; cv=none; b=kg5Zrc/oGlnxMJr/6PLoy6hLzbPFckASmPYd5+oCiTdQ6eVJNKiZOZvAo+26rbXZn5L5g7A9VzByDLR0bh87wjYZi9MJjdXrukkVDspQ7fAXvCfQpO4cb6/+ncJbyUGl020htmzjrDUKMIbPAQNcFnFvwuv8nLLhjio24OgFex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275820; c=relaxed/simple;
	bh=OvyGL2YeY7Q8iznU+X9mmrIKaFtAa6AYlttV774XVbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbhddpXnON2L3Jm3NeS+6zYbwrVPnLyClJOvQ8uhAyXUUNPPN8Z+1jMhnSimxY59IUDmnVHjjfjdDjDXaWDuBQR87FDt8Ik5tDLBrbtcZCn0ufgQBghQITtB1lekrf7MxYgS/Ek3dJixKdGzG6ranuQQNDyBvf2ljKu/Wfs1Nco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e1wVmPp3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dc9f3cc80so1471773f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275815; x=1739880615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRq/T6GE9bSeX1D1Gt9SuyzuOUWanfcEXtTNwUHWu90=;
        b=e1wVmPp3Siv4FDFOFsvxliqAgDCA0u/iBke5kPGLo6o3Ee6WeBy8K8/YyNz3jeR587
         O0vbZKdrjezlbEq2CL+n4pkM1XMfsqhap/OMuP2rmXQ2CrjG+yaNVSHY2dSZna65hrJZ
         MQbr02Mhj271uj4fzx4Mz4JA2164cJVsgT5NoNa9VktR0NqWlVESPjn8EAzh/QnZK/+r
         CU6ZA7OvBbmn+rg3ZKAvi1G89BcTb+G+XyQXw1Glz5PDJdtZ9bb66iVrzsicEdTBaLeF
         2F7mNIcmYsnQMbk5eXoMm32lEK8dj7pDY5QKb5whPhoaIs2993bY64jvh+iUGzuo47ot
         2zjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275815; x=1739880615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRq/T6GE9bSeX1D1Gt9SuyzuOUWanfcEXtTNwUHWu90=;
        b=Z1Nt7Ng49giWVOn7eh6yyAm8nL1j/LT1CHihrrJWThiRqILDbtDn+rLQeSgEV3+GM3
         iZy3NnihMNhqfLu+ngAK6ifaL4XZPFlx3NWNcSXxqdyh46x17FIWvWA3ipfPYLmyvqGe
         CKzNZi1OdPUUP+mkqQjkmfCStj4X7hkv5b/lkrbZwFg5Tb7atbhAmWyccJnkVc1cU8Ef
         +UsSsmq6UTXhDgLbdEfm5WzAxT4Ai7+nxY3WYi/UuV8GdZnGKA4l5A9q9W9z7TWfN0GA
         r3NMWjFPSocS35+KAVEk+ew0BhfUAPdPh6bJMCpZ1Ro/3kcK0pTxzzsV0zwdIEdPyoM7
         a1dA==
X-Gm-Message-State: AOJu0Yx0pPsElGuBqk7lXO4zYcb6XOYIOnX1Cez2+b/8XypqKkaJMz41
	mZq+d0+BU1PsEeUvKsexjG9VnR5KBtRCNBqJPcGYDIi32qS5Hjd3QbPdbvaIWXY=
X-Gm-Gg: ASbGncvLqdJv5bTkM4i1zilUh2DvzvA/euVdWdhn6Wkx1XEl3LPynRALETvOYLbPrkF
	c4zXd2Qj9805OZbAZUaSxZ4binnPCxW4N0EgJSP7ClBuNMGEWDaLFczdNEZTcCwOCvLIhU5wWVV
	at1ARjCH3afz6cr6OxaTgTj8FDMAn0VQJq6t4Mahsqns7Z2CzDvMa0c3dBlWsmFWaQ5343TuyDo
	DzQFb4MQdTPOztupT13+xqhtgiBb2cMnXeVdCP9oWTWXLPBNj+Vs6GFwENeWqVEMHUTIjnfG9Lo
	rk9N9RU=
X-Google-Smtp-Source: AGHT+IHpk+5B6aVQLxsLSPqsY19+wTs9O8NCp4xKz9/p1TCNTCXaDWyHFV1DSI5SZkQBCHMGhHyv1g==
X-Received: by 2002:a05:6000:1448:b0:38b:da31:3e3e with SMTP id ffacd0b85a97d-38dc90ee504mr14083350f8f.28.1739275815512;
        Tue, 11 Feb 2025 04:10:15 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:48 +0100
Subject: [PATCH 14/14] gpio: mvebu: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-14-52d3d613d7d3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CxAelnjMdbcRuwV9O+C01TbuJn6vA1w0ry/4z1+OR0s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4Yj6qJLPO+UIt+NymYEMJOR8YxigCMSlVHs
 czl/relyCuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+GAAKCRARpy6gFHHX
 csWaD/9mbJ5eKSLEyErL6bqsXcw8l4WAJV6ugzeHQolcyWwGuFbMEcsOmsgbW0weQReaWnpgHtC
 cKaWmRGoYTvghOaPshMV3QLhWJu6CHvTVNE/mYu+NOXoscZQ368Eeaal9X+7MkrD1rtnSs3Q4Y8
 9055WiVqsC+Ws98hWBUs3ydr5dDYMJ0U7JkwI3ky+QLfJlOs/OM44yTRDLU9cXIcujbu65DwiOK
 97wz8+lL3ie4/3bUF2f4Jb4x2SQN1KhCVjEbufOxg9GvfA94Wb+nkni7BDf+UMGqH5uSHcJeD4z
 qJa/Vhhr/jWV/RdgNptcufaav6wK3yZYhPlnZNghO7Bo7mHQSv/PvObxEEPgBoX+QFLn7mzf9V/
 u+TIUwYAcAYmuvaQ5VyY6i1GtmgA/xw1pXnz4El933Jh3WPi+thZmNNKE1zzUaNwUn/6wtsPb+G
 Ebv84adCqb1tx9BsdBwfeUHELnt/KYeFGyba86EGdtsP1AnamQ74ZhHQWaA9EMyYXh0diVzGMfx
 H8T7ymolklssV+IrhKSvWqhruc03x0KUlU4rrGlUWm1SncP7i/qEs2EKQJS7SHC298CV2HfAqZz
 qh5cWxccz8FiDS3Qfn0TbjyD42EXMtJNoaGauxiWM5QQfKz0DJe53sDxCDrl392pYcyGV6LtRMj
 iSI93SL42UVXOTg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mvebu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 363bad286c32..3604abcb6fec 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -298,12 +298,12 @@ static unsigned int mvebu_pwmreg_blink_off_duration(struct mvebu_pwm *mvpwm)
 /*
  * Functions implementing the gpio_chip methods
  */
-static void mvebu_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
+static int mvebu_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 
-	regmap_update_bits(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
-			   BIT(pin), value ? BIT(pin) : 0);
+	return regmap_update_bits(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
+				  BIT(pin), value ? BIT(pin) : 0);
 }
 
 static int mvebu_gpio_get(struct gpio_chip *chip, unsigned int pin)
@@ -1173,7 +1173,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	mvchip->chip.direction_input = mvebu_gpio_direction_input;
 	mvchip->chip.get = mvebu_gpio_get;
 	mvchip->chip.direction_output = mvebu_gpio_direction_output;
-	mvchip->chip.set = mvebu_gpio_set;
+	mvchip->chip.set_rv = mvebu_gpio_set;
 	if (have_irqs)
 		mvchip->chip.to_irq = mvebu_gpio_to_irq;
 	mvchip->chip.base = id * MVEBU_MAX_GPIO_PER_BANK;

-- 
2.45.2


