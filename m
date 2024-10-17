Return-Path: <linux-gpio+bounces-11504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23D69A1CCE
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 10:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC59C1C272A4
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E721D47A2;
	Thu, 17 Oct 2024 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hswZcMdZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE8D1D043A
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152871; cv=none; b=IlPCIiWHB8FnRMQLTsPvaTeLI3/U8l4wINu6WxIAikmOZ0Di4/lTGqXE+Oqn02tniUf/Y/joAw3MUuUdp8Petoxuu531izjof5lCBGB5sO9oKgeC99sQmt7uWitr4jjXohOm8gcK5cHdYUEl6xJTsRlKrhrsyYOcnUrvBTVOH1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152871; c=relaxed/simple;
	bh=ND47jIbOYDmJs8MpSoNGSSJKSen6G5z88AQQSxF1llA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/ivHz7g5VX5jtH+v7GYcfKeZ09tJMDc8G7dDmljrDKnyliI/0xhPjTdt7DEtIj87oMzcK8057beFkY44KwtEyzCUUHPlEVWcwJEuwZRP5ICNnFNlhh88jHQYMAksLgZEB4LH4SmOGCpYengnsaVNn1vB27APnB2SyCgSwVWvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hswZcMdZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431195c3538so5768205e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 01:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729152865; x=1729757665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLpytUujQtrQRxKwGItE9MBF3PBkf2ocRMe5UxADIfc=;
        b=hswZcMdZDg6hFDe6alxWVTtCmypqu68euJ+95ao7Rz+pRYOgIbkKmiF/w4+3cb11Z+
         78vbBHe7s5/9BK8rDrtXUk21UVSlNrT7jT4TBi3ng8DWPw6huE/fBM8ilwiwTIbUfJ66
         j42rkwXra2k9U73tya8IqMnj1DwYl6FX7IhePwZFF4NZjIjvRRT8FJRNGYKKAXuk0Km7
         2iWB73yA4zlt89BcuKsK+mESOrUBmSfPBZmcfQgwsZdxUycDcBIMX4mcE2frH+LjgQQ8
         KNwbCZvwyIqh2C7mzDNRsw/T0E/03U8tK+bVTd9V9y/k54HlR5GW1ssG1DOHbbMeQKk3
         1EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729152865; x=1729757665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLpytUujQtrQRxKwGItE9MBF3PBkf2ocRMe5UxADIfc=;
        b=qptMGBAHHjhjuOKv8ljhSBl66Z1J2+GP6T2/23Tol54WOouSEvLdMZGXSR9mngSQrR
         udolne1L7iZlqvoN4vuf9dSQoaivIySnjFQWH2MlPP43VVFAFgjWeF5x5Hul8E712b9e
         wP6gk1zcvABe78B+ATYc10lPXTs3858p4d1ZKjQuMyswRwVNt8MnhhvSY8CC0nQbER2A
         l9nccIidQo8fbSQ5juwU4wxhr3i7Fs/oNUEHyIDppDLY6yFJJWPPKTi0DOfs3vTK7rg7
         A4qfGIgud4al0X9u04IFTdV+ma15/GRsCHXJFKhRSoATNyj9qUeXI8mIQhUCeKmkTH7c
         4J/Q==
X-Gm-Message-State: AOJu0Yx6h0vLCibCYDC4cxhO5MrNCgv4tWhV0Ow4JsA7IP7pdtiKyTwB
	qVK4cDHdq/+wlTx+4KyGg3tIadD6VTw0ZUGM41rdPQ3RIcGJ8m3V4zFU+LGxH5I=
X-Google-Smtp-Source: AGHT+IHzF2qT2sTor36rFrvkN3Jdnog6ETuCHp5zH8opv/EtydEdzHVKUwFbUeojf/ZStUGQnKNYmg==
X-Received: by 2002:a05:600c:314f:b0:431:52c4:1069 with SMTP id 5b1f17b1804b1-43152c412eamr36318205e9.8.1729152865107;
        Thu, 17 Oct 2024 01:14:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c61ae2sm17855695e9.46.2024.10.17.01.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:14:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 10:14:10 +0200
Subject: [PATCH v4 2/8] gpiolib: unduplicate chip guard in set_config path
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-gpio-notify-in-kernel-events-v4-2-64bc05f3be0c@linaro.org>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
In-Reply-To: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2395;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5bkoQOmE+e79NCUZkE2hkqB3kJJTpG+Rd7AZwxRE2E4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEMdcC3OI1Ir1Rau9V0RSZUWiGg3TGO6oiTtTw
 F6cv6JTpD+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxDHXAAKCRARpy6gFHHX
 cjU+EACP3LgjIItD0S2u03ccGO+2y1ZSqg0lUrZM8TUzO903niSMQUprfHC6Jx8nrNXMnLPSA4J
 JwJIrEBTfgzgohscQGfcDX3N6PBccujjHsScvu1L8oA1SNDzXj5vomZ1PKiQU+mm86h0k36EfRQ
 eQjQBSVxoCKQAVuOYnaiaugxv6dIA3DaHZYnO+1XgTH0Hlyn8GcWhh6t4SZ3k3EbUyhNnpNNiBj
 zJuAm7eyRm1/hSDrXoEF+jhJK5tgEb54n2Ev/eDolo6xClytxATDy/d9HiBt/cA+fa3Ih7/vq8+
 UKaJSEhqrkEckWS16uzwPDWx9b/y786y2a0lvGwMcSxXxWzdS1eU+2LBPQmhDAW7FqW0+6AzfKU
 h2mlFiOlAzYEkyFNe/hdJR5cFOfzV435FDH0q3jZxQ6fMyL5/cuDh8Q73Xw/toVvVnt0pUGRVaL
 QZx65x/kJgje9LKVa9YTn5iMWB6tKYKT2SOGdaAgu6g4UUNbGLqxvxR2N473U/ieg74CYCzNs1b
 fieV78I4ek9ic4e6Qi+gC07CZGd12EfaQUFloxbphdmN9+MoiTfoZCDmijZhTkYzTMYJx4jHcuy
 UZaI5nAhcuEB2PY4MGbK4p0sqfSXKYmR0MxF2ZgWSnejtiEaVQhpPnyGpSIpOADGW+UwH0eAwV6
 b/iqhtolvtslxQw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We don't need to guard the GPIO chip until its first dereference in
gpio_do_set_config().

First: change the prototype of gpio_do_set_config() to take the GPIO
line descriptor as argument, then move the gpio_chip protection into it
and drop it in two places where it's done too early.

This has the added benefit of making gpio_go_set_config() safe to use
from outside of this compilation unit without taking the gdev SRCU read
lock and will come in handy when we'll want to make it available to the
character device code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c09464f70f73..b1ce213d3a23 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2562,13 +2562,16 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
  * rely on gpio_request() having been called beforehand.
  */
 
-static int gpio_do_set_config(struct gpio_chip *gc, unsigned int offset,
-			      unsigned long config)
+static int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 {
-	if (!gc->set_config)
+	CLASS(gpio_chip_guard, guard)(desc);
+	if (!guard.gc)
+		return -ENODEV;
+
+	if (!guard.gc->set_config)
 		return -ENOTSUPP;
 
-	return gc->set_config(gc, offset, config);
+	return guard.gc->set_config(guard.gc, gpio_chip_hwgpio(desc), config);
 }
 
 static int gpio_set_config_with_argument(struct gpio_desc *desc,
@@ -2577,12 +2580,8 @@ static int gpio_set_config_with_argument(struct gpio_desc *desc,
 {
 	unsigned long config;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
-
 	config = pinconf_to_config_packed(mode, argument);
-	return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+	return gpio_do_set_config(desc, config);
 }
 
 static int gpio_set_config_with_argument_optional(struct gpio_desc *desc,
@@ -2944,11 +2943,7 @@ int gpiod_set_config(struct gpio_desc *desc, unsigned long config)
 {
 	VALIDATE_DESC(desc);
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
-
-	return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+	return gpio_do_set_config(desc, config);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_config);
 

-- 
2.43.0


