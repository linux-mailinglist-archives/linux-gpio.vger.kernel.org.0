Return-Path: <linux-gpio+bounces-21632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EDEADA921
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D1F516F0D1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668031F9A89;
	Mon, 16 Jun 2025 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aJ61Zh1Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9591E493C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058344; cv=none; b=Bs/yyB00jMUj931yfaOTlkNTKoPpMAuw0BjiOiQDAYcOTPgEXRnA+9BJPflK5ymUicJ6XjZlWfLEFNFz2JXatquHP1m91Zvrics5w6A66zcAZP0KSjZu0jU436z8RySDSx+kyxDl89PSKYP2MexwsIORxYc7k1JLyzEjXRAuL+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058344; c=relaxed/simple;
	bh=vBIY6MDSAZqxd0wvprVpXG2GeCT/g5H/eGKWlDdO1xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAUGGujlGnI6gh6cE4NLRJEYupQt5BM1MW0MC6pkeq90TWG/rwvX4Ax0/NNbEfy5C/QCEyUHreEDSkiVQSFLS/J5ykTkgIExR2H3mXaXNOOTxhuvR8FTw2AeYB//Yt5j1CVQ+uZapVe6Zdbb7u/DLblVChypnkMxw38GUm3lyXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aJ61Zh1Z; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so54184605e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058341; x=1750663141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFQEt0BhzwG4HODHfj1luH5UGQeZf6dSsvCSdYpA/bw=;
        b=aJ61Zh1Z33Lult0K0RRqJKsKmSkssE6uP+pE97VB4lfmk9HR0ApE9rx9uDOpXnn/sC
         bNX36Gyj6pjn6DJjWZUF+uEhm6+qvlzIZwGdSDZqY93ys988O3ls+n8sWnbecg75u8zL
         WO+FW/IazzGeUSO+zBhDMTCH8Mt4tSnMHwnDcG8qE+Z90A3X25UdpryDMvAjNXr3XMaD
         7/B7Rvw86GOGZ+n1C9aXo3bWVbM3LW0oHQRSVpYHrqSW4XIfCDxC4ZiXPUjZzHJ9FBvO
         4lf7mxpb9e2/mJL7yLI//g7PT3tPlCDXIyj/1cm0BtCicBa3fw79P1C6qGKYpHwEbMtZ
         4xYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058341; x=1750663141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFQEt0BhzwG4HODHfj1luH5UGQeZf6dSsvCSdYpA/bw=;
        b=tX8d1vMJtN0y+1WJVMpDW8okhKo/T3ZOVVakturP/P6EliPGb6ebJrk3WNLnjOjTEQ
         5/Z7moAYoMhzobBDSJm8VDLBZsQQNwTpHcOBtxbptIU3LvMOinYWGqbNOHjEqRFTQISt
         cmLpKVfu9/USLFOdHjTe+39OV9Z24KtJf1Ig5GX42C0Ih5VxPBW8EpQjkclmjuNZT22y
         hnAxDe3KhyAIg4JA442N5zaCAJXuEECFZZezS8eo4Lrx1IUuDDm+dR5BE74Ha+dnL/EP
         F8l2WfgV4vZ952pPUBFBWVsfIW031HDQMvM77H7+mtsGyVSbtmdNXt13FVX65K7FEA29
         6OiA==
X-Forwarded-Encrypted: i=1; AJvYcCVaZNd7alxmlrM6TVXg9gohmw0beGQHiwnviFTO39HrAfLzmWLBbemoALg43PGbhxJEb0MP9ZLG4UMG@vger.kernel.org
X-Gm-Message-State: AOJu0YwJQIng/Yksxay2I9DduHtWKcY2TXVcnMTVg8ibBsB5yRQiiy6R
	g9BYnIvmrY2yJ+uVIqmjaOoaw0qNhjKu5/UIg82h4C8Iv2mVbW1NcXGvbZt+jLbFdpo=
X-Gm-Gg: ASbGncs2aRWJ6B0jWjedd9Ga6glgcm38VcFWK78RMmIibJ/KzfMuiMQklTWyIdU1WYo
	D0DLuZKnG/J4/gnJZogASNucr4wrZtzQJ6J2T/qmLBy/MK3cAzdhUPeYH9/jEOKp0T5/beL+oJT
	XhxtZ9Hs7fCIAEUeeUvnWRZ27LcdYrXr9HK74hiSZSGX9lYKVeBpgXdW0LeiBfTiNEPtKK2E9G/
	lSOvWY1SOhQDIfZh+/BNqQwfmzVwTUnoJRcU8NjAOQl00TzGhnUfu4bkrHt7kASgw5ensQHk0hb
	1gWrBFN4lr5Z5EnlV55/AurvaKhPFXPKGuA9jdMvbQhckbP4LDQ5atpI
X-Google-Smtp-Source: AGHT+IEpeKJ1CCUa4tMKa0oknF2j53B2Vzui9IgtIoBGlg6AY0Bg52q9oEE9EXSypL2qtmZhOC9Vpw==
X-Received: by 2002:a05:600c:8286:b0:450:cfe1:a827 with SMTP id 5b1f17b1804b1-4533cb1a7c4mr85727495e9.31.1750058340932;
        Mon, 16 Jun 2025 00:19:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm10104675f8f.45.2025.06.16.00.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:19:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:18:51 +0200
Subject: [PATCH v2 2/7] media: solo6x10: remove unneeded GPIO direction
 setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-media-v2-2-6825114f18b0@linaro.org>
References: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1660;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3e0iLtDRWFqoc+uvXxn0R7qOqIkpeyOfEDZD1yz0l28=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8VgTH5VeBr4PPOdRetEYlYzMkClEKJWnpxYv
 5hOmlma2lGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/FYAAKCRARpy6gFHHX
 cpv9D/9HcVpm+i5p59mNFTDBR+fpBVwg5ruxCIdKLP39iyUc1w35zJAYAL/Z6hX+PrDYBO5Knbb
 wfGTHGQ+Oy6zpo3AFNZ0QHb2zfP/SfelYTmPZLqAPY4LXmlbso85NRQh873E6FNbMpggqlobjQ1
 fS82HKlxG5AGpbaxCMG5Kiou3LBmwqU4jcT0kQh5G4P1XYnKJJxCch50+aw3AA9jJAiZF6LtTUH
 JlTPLpF9dea21/jtDRqqNu3fbIRt/QdblA5QY3uiF6ySja5U/m5VMydqq8Stf2IrmKPGyiB4Luo
 fJt+sDX3A3b3nAzZkMx64GkKpwdnXbiT85HtSllz2TCZIybHj4iQ79XGnj8kPrcDCD+t6TNCBY6
 9lkdB3o2XhUCLCHNZDMl/f7W6ZYMctXpHy4maauw1Nzzwa3lKFQPD0lVFHHBKI8NtRxUoqZ2LwG
 +vWvXVtum9gB9/j3vSbI0qNd6ryq8I6jy0ugYi+Rc23JUI3xSMyRuFWY2Or5mY5psPKdFvFQBhi
 0Zqyn1DOtPf2QRHJcpj8KQhiIIghiFN2+5K7ejEekVUnkzKs14Ke06isc7+jmlEzC32p20howmI
 Z1WhlD4IYBHkEg8Z5lnMxPQOjPBKNMHv8QpE18VGgDc/WFuez8ngATxPcfl/Red339NcjgV9kt6
 tLfg0topyhg4Bhw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core already handles missing direction_input/output() callbacks.
The ones in this driver also effectively return magic numbers which is
not optimal either (the number accidentally corresponds with -EPERM which
is different from the number GPIOLIB returns and so inconsistent). Just
remove them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/pci/solo6x10/solo6x10-gpio.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-gpio.c b/drivers/media/pci/solo6x10/solo6x10-gpio.c
index 084c30760e459e37cd1800132a93dfb0fc70398e..f51f865c69bd7b04fac7a1f951c734965d8fc993 100644
--- a/drivers/media/pci/solo6x10/solo6x10-gpio.c
+++ b/drivers/media/pci/solo6x10/solo6x10-gpio.c
@@ -116,18 +116,6 @@ static int solo_gpiochip_get_direction(struct gpio_chip *chip,
 	return -1;
 }
 
-static int solo_gpiochip_direction_input(struct gpio_chip *chip,
-					 unsigned int offset)
-{
-	return -1;
-}
-
-static int solo_gpiochip_direction_output(struct gpio_chip *chip,
-					  unsigned int offset, int value)
-{
-	return -1;
-}
-
 static int solo_gpiochip_get(struct gpio_chip *chip,
 						unsigned int offset)
 {
@@ -167,8 +155,6 @@ int solo_gpio_init(struct solo_dev *solo_dev)
 	solo_dev->gpio_dev.can_sleep = 0;
 
 	solo_dev->gpio_dev.get_direction = solo_gpiochip_get_direction;
-	solo_dev->gpio_dev.direction_input = solo_gpiochip_direction_input;
-	solo_dev->gpio_dev.direction_output = solo_gpiochip_direction_output;
 	solo_dev->gpio_dev.get = solo_gpiochip_get;
 	solo_dev->gpio_dev.set = solo_gpiochip_set;
 

-- 
2.48.1


