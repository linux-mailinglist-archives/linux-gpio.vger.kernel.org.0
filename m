Return-Path: <linux-gpio+bounces-22960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F404AFE051
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F128C7A4F2D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF14C27F4CA;
	Wed,  9 Jul 2025 06:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JfXzU4gZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4DE27CCCD
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043356; cv=none; b=rDgWLhP6lctVN/dJWeKqL9MBC5fZbGRct43f2kwUfvNwDcbqKWQuoD39ryA9/luEKpKlXEd7utkAh5QiWTw2nOLqhCgiAlq7tgDHvpnAzg1lfFpFQ6KzUlFNqE4v44qhtKJS9nSpkfrCGbSbo/pKEaETQ2biiy5kXN9aEJjHMWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043356; c=relaxed/simple;
	bh=Z16Wh+N5kXxDvBxr6DMHdnb1sWANtx5bvYKa90GtsSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfmLEN7J8CBmXAwi75IDyT6GsnYyWwG58lMy0Fg/ZAF6bGZw6HvlTb+27rauxcl8TWlBc9DyfFy7YcyhcjfiQusPJ4dAC5LCr9nyLrq7CLiFHxn4Xm1Np6PGjBxUFV8rE4lqeXO1Dq1CzsYywFAOGCD0icZ63uPa2E4aVyJn35Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JfXzU4gZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so48913975e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043353; x=1752648153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tn5OaSA7pgX+Buq36989f1K2AZy81JVBiD7CPukS9v8=;
        b=JfXzU4gZy4YWkb5W550LefT5evY7AuDMT1QIaONXpv/xO29xXjpQE9lsdWANknVnSk
         I3GMF0uxpDw93jeDFdOflket/4+GSQ7RvHmGvg0Uo7syscSJnHe3PTciKLK6MwM85zP0
         O+8ZB8JBjQ7flGMv3aVk/oYGm6spPO0YfjaoxsFA41Vvpwm9oHatlblbQwufhQ4gkB5G
         D7bUICMe424EJG8BpAPHkpxAg2DQaYFID684wlFKrRjyIYvu+yh8R4GHFPQ3IQUOiHSN
         42Q3CxGkz2l696YZyuSaXB/aoxkA8dZWTEg2s9ZbOppwZuSdRh3A/sZQ/gUDt8tQmjza
         AxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043353; x=1752648153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn5OaSA7pgX+Buq36989f1K2AZy81JVBiD7CPukS9v8=;
        b=XxC+B8d819fSwtb92PsaiSesvqn2S+dArkBrMCEOcScKc9C/31xOweAWYKhTL9+1n8
         3TufIqMd5MdYjQkrbC6+RKHcEPHlylGlYFr49SZ0h1OrgBIsPZgLPqxu0wZ5v6OILDLD
         oL+5879eBhsLQBmCCc6EfQ1ckxjOJTHvehrukuIeO6u1hTGl6EQw/KaddmgUuJOqwB16
         dgVIY2XnZvlgWVG4nHpVXmn6NW7ThyEO6VYiGbL+yioYzyXPUXyzorlE5DQ9HDMlMvsX
         pE93q5b7yUwXhePObfLUfi7tpgYh80fyeEk+oOYFv3/tYlWtJOdn0FhmJs+CgibaeG61
         97Sg==
X-Gm-Message-State: AOJu0YwO5APyB9j3WSGX6SLTHkYXAtqvsqLen9MJV/bmEZe/O24U46CL
	f3Qd/ri2Y8PkGMmDTuIHWL6j3lr4MQREQ/UKi5txJuIrAHXOu74VP1MHB9sRhMYuvfA=
X-Gm-Gg: ASbGnctF18kcapp57ANocCia5GY2p6GsbslW+N+3ltnKF8/rOb/0Bagw+uCa7ZRsXee
	b/1PcutdrdnGf6YaO13NfypveCTpN7EfKFPZRJDQFi5PMa3sQ+biHI7g5hp2NWQNKa50E22LU5S
	TyaddLJ7/w2NGqqfHkvSvvcukkJVRaA5/i2GVOFO0pQ4NwSqmwHZmdTl4Y5DIdLaWcezdOQP8fW
	92mo7NMbHPbUh+FruTWoKQCoGP6gDWBNYzT8AKhaJJmij+xo/0VTffd9h5bFmdCDqpnAUrmnLqk
	X6sMMG0OKo5dJVSMor8KiaJScYbKFVU7GeSM5cYN244vhoMlmk/24hho
X-Google-Smtp-Source: AGHT+IHCZJ76BMC5iAZPOvIZO3R/y4bpK26NWs5OpVLQ8HU7QJFCnY014+kXEIs26M8XIAEwlsTESg==
X-Received: by 2002:a05:600c:3f19:b0:454:aac0:ce1a with SMTP id 5b1f17b1804b1-454d5325fb2mr10408415e9.14.1752043353524;
        Tue, 08 Jul 2025 23:42:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:53 +0200
Subject: [PATCH 16/19] gpio: zevio: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-16-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XJxjpVAEddSlG/MvMeh2gzi/IAd557glLV2SQIYcYKo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9EueEJwmHe+XyFmtP4FA9GXo0KRwJswOqDK
 T0DLaUwyQyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PRAAKCRARpy6gFHHX
 cnbJEACEn7ZUF+EQ5MudtA1pSdv/Gh/JFn+mK4bQ0UyUdv6ibTfVuUV8C3mDGMjP+4fPdF379K+
 qujYuRfL5iufetXWOz/Gn+D8NGHNALZ6un1R8i6quoSxM529YWbjg8VFeXQ3TztEt1jwShJgYts
 jdLzbXs373mTlh8Fa6IkwpSrHIf1+2jfkDJ7bqIEMlhU7gK9H70nTKbuXRgjOYH3eJGJaNdsY3a
 IyLoN23OP/nNBLPWMV+voveftWtuCZvdKcTKmAFAFLtl9syPdIQ1G4tSEOEfxCuQtl9joaHMcae
 4ECm2Tp+AnHf/POhDnu0+o7SygFNaUIXATnQ3kUd9rdY9lwQt56OQW/BeQ/p79WuEIGU3x+C5lK
 XpNLhz3b+l8UpCynS9gMOINaJGMocrU5XEt4fL9RN6XwaBSRBffxSbvUUCRadCtrN3IUDi5zebk
 s9nWpMVFna5J+JOEZ/wevv8irNpo6NLQmqblYI0VUThLFoyNmRNlTE6zI6gxOTa1hp6U+FUBJiV
 v78jLvhMeBp9Yyu8L0KCD4rsjm6Emhws8k1+XbPDv6kE+7daKHFT15tET2KDgD1iuCFHvV35KYM
 WHlUNSWhg4scEvhorLRFf6lByc1fdNu+8jm652odomc9yFGx/lqWUwE7dNUgVBWoqaxy/gma1K7
 9UJuiwSPNmIwpQw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-zevio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index d7230fd83f5d68a9d80352b7a57e12cd21c389ce..0799f79767107d1775b7692e582e9548a6bb38d6 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -91,7 +91,7 @@ static int zevio_gpio_get(struct gpio_chip *chip, unsigned pin)
 	return (val >> ZEVIO_GPIO_BIT(pin)) & 0x1;
 }
 
-static void zevio_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
+static int zevio_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct zevio_gpio *controller = gpiochip_get_data(chip);
 	u32 val;
@@ -105,6 +105,8 @@ static void zevio_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 
 	zevio_gpio_port_set(controller, pin, ZEVIO_GPIO_OUTPUT, val);
 	spin_unlock(&controller->lock);
+
+	return 0;
 }
 
 static int zevio_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
@@ -159,7 +161,7 @@ static int zevio_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
 static const struct gpio_chip zevio_gpio_chip = {
 	.direction_input	= zevio_gpio_direction_input,
 	.direction_output	= zevio_gpio_direction_output,
-	.set			= zevio_gpio_set,
+	.set_rv			= zevio_gpio_set,
 	.get			= zevio_gpio_get,
 	.to_irq			= zevio_gpio_to_irq,
 	.base			= 0,

-- 
2.48.1


