Return-Path: <linux-gpio+bounces-22955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BC8AFE04B
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC8671C41B43
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AE526B973;
	Wed,  9 Jul 2025 06:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jUS8lG/k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C7127815C
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043351; cv=none; b=g1w96Jj66Snv4tmXBEeKVgnKap/Lv534oXEvCkblrwZytoEXVCB/sq74gMKoR/q0rtJICLE/kfG31zbSa66EMOiw2WUR6zQGWe2CyFtLzjSLTSk9o47PKdglrcDWuK3w9s8sdFQtzlzDKpmtZ0f8QOCndlsvKbPTSWuZT+8K7Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043351; c=relaxed/simple;
	bh=eeXTDWXsCLZsGmbUhM959DTFljohJJ1sIN4OdUouAxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZUkrB0ktfdg2qp5fRgPozafchrToJqCJ2CD4ytjf/tc4qlRVOD3NNQchlGarQK96BVNBL7h77ipFpdOln3Kvx+HmUzZVz0k9CRFng5lazUBAnh2BLKsOWmORPsnvSHPTDk30xJtd2QeGnYtWUHl03rHMxn/1VOfA3BbNv6/RDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jUS8lG/k; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453066fad06so37345405e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043348; x=1752648148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhsKsvAkmlFqPDEeR+UcQMmg9tdoZDeEXP7FO3A/Ni8=;
        b=jUS8lG/kWCSnLisQJsjslyLq4gdlZdZjwDltDeN00cMzSaDmn4DHgDsXLg0VKqWlWL
         +41k96VSthO72Wv2bxFnhX6+DG0wE1DRNPlvqzSPVnPr6ARUzQ8cnRC72m7UZH7wthTo
         78v7mUeCehAGfEWM5vEvUjp9KQphydb11zsjnVMD9k5BqMf7c3+bNBJRS68r8/Rb9elL
         Fd7SRsB1XDUczvWNp/LYUaQqheza/4JXFxiiJOEwcuzbzOs0n9kvoZX4usaJ+xzZ9xNn
         9J4WnFzOUL3i5j8BZ4Bt5vwLsEJy+DBKvI5gdaKC+Fs31iAb/5IqD7ZwONrESkCjiJKW
         iQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043348; x=1752648148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhsKsvAkmlFqPDEeR+UcQMmg9tdoZDeEXP7FO3A/Ni8=;
        b=X0b51GCfIdsFTdhdCFbx7yZmeFzuvs38r4UGUI3c7isCE5cR0soO0/LGi9r8YoFH9q
         N8ZLCIFrX7GROLHFr5aQtCtTbBIZzsTf38xICNnJgfLZB/pV/9IMKO3UomRFAnihPZzp
         hQ/3/qSGjqa9FZeeD8I1x95PTdzPXD0XduPvuTPdAGmlCWj/gU3tUODF2thUKfOPA4y5
         F6SY4L0d3IxjWRpMkO5quXoCyGp1ovRypqP7gluRYqclr/TTynU+D+XKfobvQ6aftXN0
         AvNreVrATCGyWicMiqS0bKGo+iSDLBqbqG+NncU2XYTLa4MFzwXvjH19DZwWCJz0BZ8n
         OfSA==
X-Gm-Message-State: AOJu0YzGYcVkZan+cjBva+2agNFvHe5y4u1zR8DNMLct3l+c8/7PDrP6
	q8ccC5gLdwiAYx2/PWKivbCdo3wECoIAo/HEogmACG7Cb9SWz9+ZSB8RHpiq9aoNmKcBSlJQZ1g
	u6toW8iI=
X-Gm-Gg: ASbGncsvrwKSseCrS1fvMTMJ0fFedGHe4JOBUe0zH1tKCm7KeWpPAJGW0Vwn6N1u2Hl
	/zqibmOSK1BBGesA28nOdePUwRSB0dmxaHZSP7gDE6yBHrbZzG/tPFh9eIuTekMGYCpG/Lch+e1
	Zdlgc+ykQlEXQfzbra2T4zUJOndSI/0Eh6nkQiei0zBVh7U5TDxt2l9LZrpGOLsNLz2w98YP6bk
	GYeUjP5N32mQKKzwNAXrpU6kYLh1XBjCVjRrayjpHV2qtUAjhEzE57Ilqg/xik5Yx4+A1aX8ALY
	pmzDhLo5WBLo3jz1ZyNuZDCVUePa+rsBTaC1P3GHOvlw3ySVmNKn2l1Y
X-Google-Smtp-Source: AGHT+IHvpRwL4gyNcss4buc5DbhMISzynWRKsNgohlceWdvTYfvFhoREEpevOPy7ECuUPWfEmr8Qgw==
X-Received: by 2002:a05:6000:4387:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3b5e44ea0d1mr816440f8f.23.1752043347689;
        Tue, 08 Jul 2025 23:42:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:48 +0200
Subject: [PATCH 11/19] gpio: xlp: drop unneeded ngpio checks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-11-b8950f69618d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kX7w+JHvWpXIE/MJI0TmNI75597pjwhk48BNek2A0I4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9DjfalZzeUGBfvdwiGcfrZ171d4K3z9JFGc
 uxBWTNkcxKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQwAKCRARpy6gFHHX
 cotWEACQjbypuFIfdv3rxgS/QD1bm4WGA6KiqvpGj8xTu/C56/kieYtnc7vIzCpcbeScl1T8lE8
 EAitfkS8VLZ6X2UR1nfUyg659eVi8I38KWSCHuxFytaTF9kecqmJ/+OXroJ352In/zKzEFTEfX3
 Rz3WZocW6SdN2vBZaHNUHowmW6h+dRPwrOG9kDgJfduROKO8DTwrUFexaQ1oNahowRxAwiq4BF/
 3Ggo5BU45ewhQpE/xmtKlm1aDtXa2S/xRlfLPlx9aqLeapxAkB5DafjOpWPHkmvMYzjapLiJXQV
 LUEcoCB5t54gENH5mC+sszT2zgyzqGUbWCZDkIRHGji0wyACb1EYl3y6KIVzQxvBySkDL3/B2V9
 eaODg64UDmLTuxh2KnbJU7/opDLQcH+N3h6+2p6YJtwxaFajmW4YLmocqVWPdzllnZqEBy1Mycs
 ao8riuFbfo0wZigCrF48i/d7I6Q2rI+dFFY5TDIlg/OUpz70d+Ruw8SZ2K5YioyWR6ALBTnFG0V
 +z6JEUf9RhOwjc4YAra6bg/uJDbnNlRzvRwsadNg0w1tgtsyS8CAkQKJxi8Lw2jcjxxjAyNlhEQ
 P83OszlX+c6c+eM2yrfpeHs9l970j8D0wETvrH0O6EvlBpH1noVcT1+Gd9Nq0nyz2PUOIrqdVSs
 prGuwSQDyS2j30Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core already makes sure that offsets higher than the number of GPIOs
are never passed to controller callbacks. We can remove the unnecessary
check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xlp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index b4b52213bcd955c3644b4410c2684d77951f03f2..35b376c73ce312df1312ab09b53246fb5905152a 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -206,7 +206,6 @@ static int xlp_gpio_dir_output(struct gpio_chip *gc, unsigned gpio, int state)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
-	BUG_ON(gpio >= gc->ngpio);
 	xlp_gpio_set_reg(priv->gpio_out_en, gpio, 0x1);
 
 	return 0;
@@ -216,7 +215,6 @@ static int xlp_gpio_dir_input(struct gpio_chip *gc, unsigned gpio)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
-	BUG_ON(gpio >= gc->ngpio);
 	xlp_gpio_set_reg(priv->gpio_out_en, gpio, 0x0);
 
 	return 0;
@@ -226,7 +224,6 @@ static int xlp_gpio_get(struct gpio_chip *gc, unsigned gpio)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
-	BUG_ON(gpio >= gc->ngpio);
 	return xlp_gpio_get_reg(priv->gpio_paddrv, gpio);
 }
 
@@ -234,7 +231,6 @@ static void xlp_gpio_set(struct gpio_chip *gc, unsigned gpio, int state)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
-	BUG_ON(gpio >= gc->ngpio);
 	xlp_gpio_set_reg(priv->gpio_paddrv, gpio, state);
 }
 

-- 
2.48.1


