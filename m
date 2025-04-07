Return-Path: <linux-gpio+bounces-18279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3DAA7D530
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DC791890AF2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB52225403;
	Mon,  7 Apr 2025 07:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0riiuzTW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69773226CE7
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010004; cv=none; b=Kq6jgqoFFbiHofyvzBIYmPHJLvcND1SDfkN43wxpL1B6QyHXRcsD/eYn0S3lNTxF3LMR/PbFzmkS1RpTqqQA8c1GDiSqcZHekcMrX8RXkedAe511FoM0VC8HxHSf+hy5d0Bh9HcjP7hfTODVbczEultSk8ZFGvK0egv8z3dn6qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010004; c=relaxed/simple;
	bh=VbZuTeEShYmVixzs0kIfQZ57MYY5VstzY1jAzTWwLiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SmxWS58/FYiDi2nNjBilsxVzOjyoFUGZVjqpnc+ukTvyqv8PnZOcswLXRXQqvEEg8jSB/cA3TTp+GT7JdsyA8/x+teEOR20kSC9g+tfPWeau+kdy1tOBub5FgFC0CenPHhTR79gziSQYVRqTr/IXG1AW3ZC2h3e0YiAvuC/Dg0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0riiuzTW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so37129565e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010001; x=1744614801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSDY712S0/Wxg4mzs7difRDaGrtlnIVKA23tPccTlsI=;
        b=0riiuzTWIZrhgp56IlqIG0qCrZIHSCdjtAeA9ugADbOTZXDWPdJ4x4+KgM/vhsMlH0
         lMsbQJ5gO9KUCkIUViznu0MGb0rOa8AbVyl63WfdbA6R9ml23efQWm0da7iiFRarNSB0
         N4ZCGaioBoNutRBin17ZX+9wOjhwzZkEqfZawGBw8skmsAV6yrJ8ixl1aXOVEIa53EeQ
         1uEkhAQfgNbNSyRcuyMZoA4cht3UpLyOj1j60SriPcqizzZaxOWlUOTxL79ezhX0mpKd
         O8ugHOKJopApn9WgZC6Ba77jrxwR76rljgkUCdK5IeCOiLW6cz8i7USPLrFKwOlHJOVl
         hgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010001; x=1744614801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSDY712S0/Wxg4mzs7difRDaGrtlnIVKA23tPccTlsI=;
        b=cct7O3ip0lIaFsvMj4y8vWCBqC04honwDkPRM+RRtPqt314LB21yLrFIiZz57A3d1I
         JiWtewPYWd9gXnkvljNQrYo3eWfIHkOTZ89yHdHzXBAHQm2jeKGGfkzRhcqgRG2I5kFS
         A/vq2+79DVznbEITxMIflUui15HW8vc1tzEMmPQiaZC8LGT4aW5NJrEvjZwGkvX7Ystv
         PNrT/BpYXXjC3eN4dZs1jwPp8wLvdtud6hM7H/im/nR2jt0rwK23sFS53CJK+C6VWIaA
         BKx+hlfyu3Vc/AUdSu2bSF031C5Go8ar0RA4y784NGLGcsfz40bLNRMJfdYoZ/Q96Yl/
         6ZGA==
X-Gm-Message-State: AOJu0YyajuiKMxXsJwTDtO159qGgoG7T6G1iIIhFh29hChez5pGSGAEU
	qtWDMfnRXXfka2l3AZtwbXEniL4MS6l9A+DbQ79Sj/RmdWJ5ezd+J92nsyaiTnc=
X-Gm-Gg: ASbGncvHRwIzrXeVZiWU+6HxNAAN+cTM2UZRNqLooQbDWRojVfJnOxHtVRh2btohmlP
	yujOfyjpePMSTBzApsbRxICcV4NgdRpM8aucQz/MLblH0WSoKYGUcGAZf68ioHI3uberdIkpMd0
	MPfjSTWkNn6Lyc16D+p9ikSv2XMqeUq9mnSFQEJVZA8d5YcFW3WKfOAw9A3ZQDyQUKNCIT4vxwz
	tp41bhq/JQbJD7PR82apbMZZ/vuaQ42z1OMtlhUGUPd9vz15NcSNjYrNholNfRg6XFR5+ErNT5E
	ewdt73lmx6bIykFLzCrMrIkbAGT0LanPE5Py5Q==
X-Google-Smtp-Source: AGHT+IFCPF3WdKv/HZWi0huYb++Hp4umiM8q5PvJ/9SfnEDEYHIn12Tjg/kKEV6/HcpEk87YT6PKfQ==
X-Received: by 2002:a05:600c:a0a:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-43ecf842bd2mr89719075e9.6.1744010000897;
        Mon, 07 Apr 2025 00:13:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:15 +0200
Subject: [PATCH 06/12] gpio: f7188: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-6-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1b67qrjUPm1DOh124uZXcfJBUtrwb+Jww2K8ejW16NA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sJQUhmhYV1wPhQ66erTJWK92WtSnk68vdCC
 H848tLz6NSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CQAKCRARpy6gFHHX
 coM3D/4uh4t6KFMWNiPcBjAHTAxxSutRwdhsxAOrRc903ShzmAwt20DNlXdasFgvS2DONygGWCM
 b/sKbNtOrXL2rxomUKGvZhKYliMxzJN1kw4NaDtWELBEfLGWCjb1EaoL1h5QstUbMx5MsLAmI9k
 Og6hCkTqVrfAvKos6ihvGVG06oINfTtRspW/0zhLVz3uboaSP4NoxEjln/DHiGPtOh23c5Vj/Rh
 LsbA+RlT1FZfMjHzoUm7tMC2HOGwqUi9hpitMS1DO6bHR0CsaAF86fjT01LBJu/iKPAAxVDzhF/
 PNgbFp4VTqdcDi+LIcmn+o8CFKJF635apTB8Z/heElt78ohUO4j5rGUbTPexJvK9LWlDzrYTXJc
 JJlOozod4hWPtSch8qjkQq7ZNYpUEfuF/MtH3c6lz5zvSMKVhCSZwzlrR8EE0Dp87W4WIuqRKLz
 1GlQkCv5MLnsGvpHAvZPJpEvGMHNfSaWwQdMQAD7vGf62ZRGwsKQuVvkdNmYNrcKHV+M4BUC0Sh
 Gj6crCBsmQH/PQy2lBbBoyALEURBT2mwmwyMW38NHdIbcTGlKmP9nqvrx0YYdnDbKQG7e99TPo7
 /pe+YMOodLFD9mYLFDydKk/R3nK3aabXU/OFVZJGDPUtABuUUj/G8GWOC9WjIW9UTopbvaUKVci
 jvsB/2RCKq8EXFA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-f7188x.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 3875fd940ccb..dfcd3634f279 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -159,7 +159,8 @@ static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset);
 static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset);
 static int f7188x_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value);
-static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
+static int f7188x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value);
 static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 				  unsigned long config);
 
@@ -172,7 +173,7 @@ static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 			.direction_input  = f7188x_gpio_direction_in,	\
 			.get              = f7188x_gpio_get,		\
 			.direction_output = f7188x_gpio_direction_out,	\
-			.set              = f7188x_gpio_set,		\
+			.set_rv           = f7188x_gpio_set,		\
 			.set_config	  = f7188x_gpio_set_config,	\
 			.base             = -1,				\
 			.ngpio            = _ngpio,			\
@@ -391,7 +392,8 @@ static int f7188x_gpio_direction_out(struct gpio_chip *chip,
 	return 0;
 }
 
-static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int f7188x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	int err;
 	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
@@ -400,7 +402,8 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 	err = superio_enter(sio->addr);
 	if (err)
-		return;
+		return err;
+
 	superio_select(sio->addr, sio->device);
 
 	data_out = superio_inb(sio->addr, f7188x_gpio_data_out(bank->regbase));
@@ -411,6 +414,8 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	superio_outb(sio->addr, f7188x_gpio_data_out(bank->regbase), data_out);
 
 	superio_exit(sio->addr);
+
+	return 0;
 }
 
 static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,

-- 
2.45.2


