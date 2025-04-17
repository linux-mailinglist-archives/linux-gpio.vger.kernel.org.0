Return-Path: <linux-gpio+bounces-18999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FEDA91442
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 08:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1F95A2887
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 06:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D83A20A5F5;
	Thu, 17 Apr 2025 06:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5GZxjam"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E49205E2F
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872141; cv=none; b=bEcZSiEQrwOgxIa2FCgGpYEDaon0ERt+ukCoHDQ6gNPI29NQlST9ijyOnQmOpc59HZMpZZOsaBgJzq3CLQ8HbveUYoAdy3I1LYlF4DKoS+DGS+1F6aGAfftWpYpmDEUr7Qk55TeSnOthe+JwQknhlywAipttRitt/9umroHtz0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872141; c=relaxed/simple;
	bh=HAa5MK3MthDMPQcfWVF6XuiMcrrT9amfqYJR+OXWJMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XU+ojmKK9rs63oC6EbfiqlHVNJiCq2zBMeZLKXVP7Ny96Zap2ps3XCohHDwegvtTD/mOMi0nxnEzg6u4gb9GL/ICqy7UT9p3HnpdmGFVBgjUbmVQJqQL14kr8nORNzNF7z5q/xeQwC0OArz8Fz7i1cBjZHjAfnHyG1rKI1g+YMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5GZxjam; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f490727a11so710638a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744872136; x=1745476936; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dhOBMdnj48blKw6YV7gc/9oneYA+xqS2pjcS4PzI4lw=;
        b=k5GZxjamvB1VlpBLHUxLbpp0Xxii78JsqYyhvfNsrpXNhc31zOdEwFtdvCO1NCpH92
         6h+asjjM8hdIoipjTZAJoq49gSFyY3/zq5BA8z7Tu8bFELFqF7p8tIOnF2hBRchHvKdQ
         TYYNSWv/MRz6YBrp0U3UXODXWGUSAN1PRJnFN2gXh0NNCwSMJY3x/OyQGFjNCpwOv/j/
         nj3gdWacYJ0h3yMygb/u8TCjfozASmTHT6X89IeEgEFnWbLCvMpCwznwe61lhujtpjqR
         tj79ZA/YMz722OH3bdV2DycL1HL/dKiabBIYPHaoQ+g67XAyzRx/iO8MCWCZHoJ44ntK
         4b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872136; x=1745476936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhOBMdnj48blKw6YV7gc/9oneYA+xqS2pjcS4PzI4lw=;
        b=nmZ60sU0SlPekvClG4JtkUqEMc/akZByenp7wPJ6ry3sZXMyn43QlCHXQLbg7HC73f
         hi464xXGxK8cMw83y606kat8V93f0v4DAcB7lcouv1pRWQIhsmzotfcQeetwbYQtck0p
         f3lCOgFc2pSbLEufOxB1lURaeashyyx3e0VfHEfAxZ/MgGZkKv7Dt9wibJtyaXxDAWbF
         fSz3ZD8Rp7Dw9cy0jWx3Cc5WISCkx3RJRWNCgB8Ce9MM4PkDVYN3Do5Eiq1pDjB/HHI3
         i4Vr1Xbauo6kdKDZEnI/V65f0mI+XHdUIfe10zPcEre8kCUuXlc4Suvmd4sjNERmtOAi
         0YMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxqz5CjzN6FxyQH+ZsM2/WNuXburMjmfzf9n5LLPkRb3eYS6fLaKN6JGyHIEJXBzHtSaroXCYtMi7u@vger.kernel.org
X-Gm-Message-State: AOJu0YxZUhTOHCYuHKUszZsCH4N1PncpS3swnz+LaD5Fow9z8yFMph+J
	RASwyKJFmLHHy1hi8xngNTcwP69fHHKzkcYn7P8aPa8EX1PbPFqT0pNVpOqrmfuF5o5snLVbcE8
	UO1i/xLRQi7XIVd83Cr+aVwkX+a8xob/5LZeNHg==
X-Gm-Gg: ASbGnctvUT6FtiVokmuxu3J1mT/ZdUEaRyh7ZuZ5kNyjscrK2rF67CdMARauvJTJvQx
	ySyUA+4vM0eX1D46IYqR5AsQCagyYa/YjIV0iWhMpEsxso0aGB1CCILoXcdLov4LKvb7gf755LA
	QL1g8X2aqjEEo6FmFcf3K8hzI2bUw1wI14Ndnm/thw/QSvrdeCGT59OQ==
X-Google-Smtp-Source: AGHT+IHwQmW4uLoxd4O86s85PWQDVE6I5QgHoOdxvS68frFgXriQWYv526JyoVIGGquD0xEBBdrZTykIPd6kRqLVJVs=
X-Received: by 2002:a17:907:2cc4:b0:abf:4bde:51b1 with SMTP id
 a640c23a62f3a-acb4298011emr405993166b.21.1744872136202; Wed, 16 Apr 2025
 23:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org> <20250416223706.GA3230303@ax162>
In-Reply-To: <20250416223706.GA3230303@ax162>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 17 Apr 2025 08:42:05 +0200
X-Gm-Features: ATxdqUEdk8B4qOm49Z3JjfkRT6lA8RuMaY_llvKtObT7Pr4tgUtNyFqCuqU8FYk
Message-ID: <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with COMPILE_TEST=y
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 00:37, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Bartosz,
>
> On Tue, Apr 08, 2025 at 09:17:44AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Increase the build coverage by enabling the sx150x modules with
> > COMPILE_TEST=y.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/pinctrl/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 464cc9aca157..94eb41bb9cf2 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -541,7 +541,7 @@ config PINCTRL_STMFX
> >
> >  config PINCTRL_SX150X
> >       bool "Semtech SX150x I2C GPIO expander pinctrl driver"
> > -     depends on I2C=y
> > +     depends on I2C=y || COMPILE_TEST
> >       select PINMUX
> >       select PINCONF
> >       select GENERIC_PINCONF
> >
> > --
> > 2.45.2
> >
>
> This appears to break allmodconfig with
>
>   ld.lld: error: undefined symbol: i2c_get_match_data
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
>
>   ld.lld: error: undefined symbol: i2c_smbus_write_byte_data
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_regmap_reg_write) in archive vmlinux.a
>
>   ld.lld: error: undefined symbol: i2c_smbus_read_byte_data
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_regmap_reg_read) in archive vmlinux.a
>
>   ld.lld: error: undefined symbol: i2c_register_driver
>   >>> referenced by pinctrl-sx150x.c
>   >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_init) in archive vmlinux.a
>   make[4]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>
> I don't think this change makes much sense in light of this error,
> unless the driver was converted to tristate.
>
> Cheers,
> Nathan

Makes sense. Linus: Can you just drop this or do you prefer a formal revert?

Bart

