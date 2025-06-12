Return-Path: <linux-gpio+bounces-21448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5FFAD7179
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C80853AF4AC
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826AC246780;
	Thu, 12 Jun 2025 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="J1jxSmsB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33659246327
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734127; cv=none; b=BsZivo9BW/3zIE/hb832f2MS8cSYD2Lz2Q8gN/yOqxttSQYzDpbu8RGdHdGLwKgXJ/xQebvR9OP4sj9Pg3IIgkfWnwGq0kryCMeO8G3HswexgmlLUe8CDEgsAIf+em/GqELOq0MS2JMsByuGa9aiqhryhql0rltigBnZlFjGINw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734127; c=relaxed/simple;
	bh=ouf2Msmzi8BBHjiroC26wEHH+x9bWRaKtDQmEzjftt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TiThf5v8JccUtOZ947rO2Q7jL1JxwNa982+yQvDSe+a0Gr20WBaJIE8x/91yMawFQe0wUOzRn5k3Vok8AuJogvs6R6gMUkQqezSgI8ZyOZEP0kR1gCR8GB8RjyNXJXfNArhKWSBEFDS/feepCi5XGvpXtFxFC3UmiSFO+foji94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=J1jxSmsB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4530921461aso8099755e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734123; x=1750338923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raLE52k1FOP5xc4vn5Fhz2KPLej0BIrS83cEFgVPEbo=;
        b=J1jxSmsBCcGJvCr3Sl2fLQVWwm8dbmivNaCdeZre1mFF3BFOgVvQY0o1VpDdR7OsP9
         5OqqAEORycqP7hieb7+2Xk19S700uVvH1o+mRMPzh1RY4EQYZvXRj1WPpjKtgiGGf/Xb
         1Fb1On05LM+OXH50P3Q3v8z58VyYJD7j6rXf0AlOtYqEIsQLIZTYBF9/Xb9JgwVPqYu9
         A0zW2oDLE/XVfe3CEh3AaLelqmElfDH3yh2GcB9ZW5sHdgpijMB0+BeEfTXPE1KMcABm
         lIp5WQRjc7lSBhyEHE/bj+evINzy7E2bWHr0+83rMdvIo7P/YQBDrDz0nSJQKlxHRUlQ
         Gdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734123; x=1750338923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=raLE52k1FOP5xc4vn5Fhz2KPLej0BIrS83cEFgVPEbo=;
        b=C8IULx8ITs/h4xekQk0OPi9OIQ8USGyuv9BgQpBJl6nqxNVI5EhE3jvYZ+dGOy+oMw
         NTip8xJkUl0/vyM1KkHjxg6A8AbB4qmtVyQmA2VF8qazF9O9xUGFfbHvvpk+TylMUFA6
         bF4hWCYb9RfswxCzFRPqiSD6ROqaCuGxhQ5AKol+b6G6GmGhxFFu8Xwetti8xYKjqvVJ
         BP9Ygy8f3WjU9/TqWs6+1bCcDSmTNbLJGEpeoYKDFeNdJUeDEMTzS56XlRRe+sxWNQlP
         hrSAieMh+TV8jSu6QMP3/fpfdjWO7F7lRcvsPw3iLHM/6jK/X6Lh6RgS49M8yAhftb6I
         5eJA==
X-Forwarded-Encrypted: i=1; AJvYcCVprdMCld5GO/2q32nqPDheiR+MVCMkegGdWFzzl2SLqxfY6JEPwTNBQ5+0ESJzImXWxY6ZxfPZdsZ1@vger.kernel.org
X-Gm-Message-State: AOJu0YxZbOCfJHvXV+jLn0CmplZu1lyPqEAxELGJ3hU81cWN8T3PzaqT
	H8Ih0JmhHMuSHjK2d0d1+xbFoxNBkEzz61rnOCWRINJpMKEEHNRcJHnRfN2eouj/47Q=
X-Gm-Gg: ASbGncsXSou8YQaqXAfKyQ93f4+rB0SkVuoj/16TbgvLMDs/qllTmL+XKIOSnk0mnUW
	EnsmfM8GA7Ej/SDdcQ3uTo/481e+VEU45NQNRFiv7HMtLz1Ynx9Nswb9pVtBjPosHCnVSsPg4xh
	ujLhObf9MAo1m8kbmGnMfyWyJWdw1sSy8vZnWcSiQigMGRjkhOM3ebwFHD7YMqFxZyQ0ref3OrF
	dFdyAwr4DJMf2wBjPkMV73yoiNKheMtMSH58NTEkGRRk0VOFWuQdp4W06C4Mqdmah0ojiu0IfrP
	xRkSs3Q4yoIOd9Bs5cst2ZVv/xfn2OO4x/hm9X6trV6fMTWNtFBuyAk+85LiEw7aiw==
X-Google-Smtp-Source: AGHT+IFhdHOEFkYRXt2aGfqR8yUbaKu71Wss7a74LOAwDEENbVsdkagshqU0KdML5k1g7zcI8+VF/w==
X-Received: by 2002:a05:600c:8719:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-453248f9836mr73550665e9.18.1749734123425;
        Thu, 12 Jun 2025 06:15:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:11 +0200
Subject: [PATCH 02/16] pinctrl: st: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-2-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5oB62agveNry6MooKoxev/dYplc8gqfDNeN0pMdLmAw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLk2dgnIHTbMZddeUKxRSqft05VFU92x1VSm
 HYQEZ9FQymJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5AAKCRARpy6gFHHX
 ci90D/4nF341GcBLvs7mN4+c32OAiw+FWYJXPAOuwi/EUKU0s3AT0CdFTJYUDtLgh4tTL1kGiOc
 0afStrGNH+AilQUqqVnZA54B4xB/xitGdZyKn1L2FMY95sTWY2DLazI9FaWGDJHzYr32Is4+/Od
 ApDWy89r3ZqJPsu/AqFA+u/WL1GS6eGHjsGaCqOJkJOxCd12CtopA1Sa9ykgrwOCvflKi35tefo
 c1EdnStWa+4dhBA2u4ImkGdepns6dNSsrR0sIlxPxCYbNjcxD3Cw12K4Kzh28PwDa+5M2rjPZLV
 HCn/H8EY5ZYroSn0pCawU/zDxL+JoWLupRE7O0mCGnMOV3L6bFSoydD3Y5hmzalmzvIDGwpG4Po
 daXmD8lwASgyWOmQdEnPotm7B+8+RK88tsKCp6fRHo6gvcWj8gFb/VqlGCxUU4ZGBWtI6ugA4ij
 1NELeINA4u8yjj7X3/a1UBo2cKr5zrP4WIqCQVR9Q29kLfEpOdoiGJz80VL03tcvUFTye2QsEdv
 +xncjx3Gsp+H9v6sMKbar5HUNDMfufe29u4+gPeU9LFwHb+MMQBz8jHlI1Qu4+zMgbO0dRqaYXF
 XLFoAR2ELXErj81QGwg+WTGD19Aoxi051lXMTTQ/eYD3HUrw2H4T0XHfaLFlBSW+sOOPBmL3S2V
 +yvayW/ehrmLRwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index fe2d52e434db8cdc03d61ef3f4df95cbcc9c513e..fb5d72a6826ed730f5a10a817e9a46f9fe319b5b 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -711,10 +711,12 @@ static int st_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(readl(bank->base + REG_PIO_PIN) & BIT(offset));
 }
 
-static void st_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int st_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct st_gpio_bank *bank = gpiochip_get_data(chip);
 	__st_gpio_set(bank, offset, value);
+
+	return 0;
 }
 
 static int st_gpio_direction_output(struct gpio_chip *chip,
@@ -1470,7 +1472,7 @@ static const struct gpio_chip st_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get			= st_gpio_get,
-	.set			= st_gpio_set,
+	.set_rv			= st_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= st_gpio_direction_output,
 	.get_direction		= st_gpio_get_direction,

-- 
2.48.1


