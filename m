Return-Path: <linux-gpio+bounces-16939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA94A4C1C5
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 373AB3ABB59
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C3A215F7C;
	Mon,  3 Mar 2025 13:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LShH7kHX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED321577E
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007939; cv=none; b=H90UR9Ct6Yo+RxPExCRw48AS1GdOUBvajeL+0e6bxvoEL9BIRTRLxhkjbNhXALsxJdzuCMj2iFwsjjK0lFmusJk6t13BQHdK3BN7m9Tp0fApK6Mj/G/eZBdXoe8ba227DFHR+SHGDicfygPNLESoei3kk7JvEkU6djvkw8llHhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007939; c=relaxed/simple;
	bh=wmxkqe1vFjcLK2jMM+NTo3KMs+4giqwo4Tu94x6rZ5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RnOCNhseO7zxO2WsE/0QsxmHUGcSw9tYCi43avgFX0w4kWpvfvOQ4fX8ItNb/sFUcXb7qD73ncBgZrl8PGfY+9vK4ill1mNnqUm75YfmRADrEAAyPN59WEgjX997TytjTBnLO7bp59JCG4Cpolu/viaeNXjiYOtYDKBnqALd+MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LShH7kHX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-439946a49e1so28175725e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007936; x=1741612736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYy3OxmCTfeXmKWW1VbewLs6rP6H3oG1fco894i6r5M=;
        b=LShH7kHXmNlqf3fu8ym+f1rFLE08mRQ2xXbmsVZYGziaWTsfyeSYIWsA3cpZ1/PmuU
         jdexayHHhJcOa6t/4RZYk4f1A56R0BC1w8paigKzJXkWCmxTMzRU5X6xxOm79PfmhtX2
         OOOu96YJkMSOADEEdGN7XoKCYIWsL8dTFwOlAkcp+9XM8fJma7gkoWaUWKIUzR1nAPUs
         LqATWxDmmFjuUkKO0mezr5jdt59VEcxGVtMK1eb7KvmfaDmt9WcthKEQCdv5unD0OcUl
         8sz04IZZ1qsoq9O/bvs1VHCpCWWRZ5EFAura1CzU6WFU0fIvqUkdSwS5b66/Z++DfSB5
         vx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007936; x=1741612736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYy3OxmCTfeXmKWW1VbewLs6rP6H3oG1fco894i6r5M=;
        b=tDBDPAahdZItum15n8Y/DJyd4zJNPrseFMo0P5thKbILDNOlgglt5d3mHDApmr0Qyp
         1LC1VDPBCTecS+ufIOCknguk9XRabzZEl8tFr5jNJwjZm1BEBjA+LJHglQiWt9KGgnJI
         R9ec3rw62K6BtL/QdmZf9GV2eUN3x6b0hoW4zc3lMXOkiwnxIMgQ4BFVBgbxi159Mtfv
         /i6IzSBu7qfxOKfZ9bjK0y9q2FUBYf4kJYyqM90GdXRZVsM6SOB6sCK1YM7mdp2ZjR6v
         oUz0eSzhxbwKmkRa+yF4T/55F2iEHeonFlKIgnVZPpqUMQMQUK/F++ereXSkizHDixmv
         312g==
X-Gm-Message-State: AOJu0YwCPzZoMxsSKC5seCbPeBUAeC2YlWGHAfzFbxYt4gq4g1LCsgJr
	VAEairwAJeZX6O/QPY8TaLzsGlQbvSvAUlaNBC23RnoBDh/kcNGW6lm6ihbOVkY=
X-Gm-Gg: ASbGnctyI5mgz1fsLWg9gzhyD31uFyuoC449sj5hEsjT/T8rQP/BW8gGBZNrO1p0nMs
	X6JQPJfwLRLSYFvJIFd07cfivSmcbuAklFvxfb3/RxC2LK3BrW8wOpQeRhvH5Pm5rr/GBBYp3f8
	J4OygkJI44+zQONH8OIOv8Pxe+DtxNa43DfHQvirMgEu3x9l2EWxIhZBuk7Brs8V1zZxHo8JOO2
	nec68uJcVNRf9f9HVDDVrFIIHOKrAC0yuvtfakw8yHM3SD9drAq8tragpfTAuzlCxnIvB4Qs8Kx
	+C8crpScCCpuvIO+RBmVd8cywWZ6Z/ghHVL3GA==
X-Google-Smtp-Source: AGHT+IGrzVhEnfUuDCVxi9rV1+Y2pAX00HYe4ND5tnilxpFNSHjqZm+Q1tO//4HTCcPKf55lo23WTw==
X-Received: by 2002:a05:600c:4ed4:b0:439:98ca:e3a4 with SMTP id 5b1f17b1804b1-43ba67475aamr98841885e9.19.1741007934650;
        Mon, 03 Mar 2025 05:18:54 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:40 +0100
Subject: [PATCH 15/15] gpio: aspeed-sgpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-15-1d5cceeebf8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o1RQkjcxzC+TGloaGMTPuFJzidyh+RPMXxMLz3aV4DI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxaws57keqtznwsHgFtxTpm4rRaKKUe8Z3RX1S
 ld6SfCwJGCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsLAAKCRARpy6gFHHX
 ckXIEADQhVFh09Iq4tEU1jISNlnEkfP7k1ELSZ2IXMcW2dvNP7VqR81V0ZYPQcclqaZcCttaM/0
 1t5g/NVwoezK7o4qVsmqkqEYmN/nvkOX0UsVySyJw/0dXUPT/CQHlKIC/erIqkDom3R1svtUd31
 J8c4lXQO8LVXCkp4nJAkRYT4Pp8L7ABPoI8raUIP2VV8rjcwdbiVm9WCmlKM4tWAcJUCSL+WNdq
 P08bBozKKrLOq69Uc92O0nJlOwBqmO4bFPrWVqNuqZLcX4lyWblxe8aftcHYJPVLMNkJ/VGuhSd
 scoDcPInDpwb45deB+pQKPmVX+r5jj6vzMfSsD3gtmzzVSbaRkjTrA9B2rqjxRO5+w1AwLup7eD
 dcPbHDmqiZewAlMFEyYu18B6DBXl0+p/kcCHFQHuX+RX7QW5f0TyiwikwKokqYPCvwXVRCDPUUW
 8Ro4zYv2Q4eoLzFPK7GbnD8MQO83Fy90ZIxjT4Hsw21lBZiOmicK28b5uSHvoAziBQurQ/M9+r9
 tMPeMyCpRPfCCwKF4H7RofC7RJGan9UoZtnZ66gpzw7ne2jNJ0rx2YSXzVoxYEwFv+RX2NRP0UD
 SxJc01SMF9zx33J3w0C77IRMrapFhhJcw6Ls1/VbuDECgOkpKtB9qH0Cr/4U9XQuMfQ3uo+w/Gt
 pwY99gL8+uSpR2g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 5ce86de22563..00b31497ecff 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -209,13 +209,13 @@ static int sgpio_set_value(struct gpio_chip *gc, unsigned int offset, int val)
 	return 0;
 }
 
-static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
 
 	guard(raw_spinlock_irqsave)(&gpio->lock);
 
-	sgpio_set_value(gc, offset, val);
+	return sgpio_set_value(gc, offset, val);
 }
 
 static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
@@ -596,7 +596,7 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	gpio->chip.request = NULL;
 	gpio->chip.free = NULL;
 	gpio->chip.get = aspeed_sgpio_get;
-	gpio->chip.set = aspeed_sgpio_set;
+	gpio->chip.set_rv = aspeed_sgpio_set;
 	gpio->chip.set_config = aspeed_sgpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;

-- 
2.45.2


