Return-Path: <linux-gpio+bounces-24357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC60B24964
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 14:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09E33177B7A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 12:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FDC161302;
	Wed, 13 Aug 2025 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FodqAVTp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2691F126C1E
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755087479; cv=none; b=JXZU8u0CVWxPlyA75icGApTB38DuIbwhhE4WStvECOHK9KsWu6cB/b7CJ+I/VB8v93r2NmwA052j9gKFit7Kpc9bYEEMY0OOB83gcCntUVebsMJTXMYN6FNoK7KJSxcbCFqfcRdRjmpV6ed27fgx1nbRHcMUQY4szme9Y+gVG4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755087479; c=relaxed/simple;
	bh=1cH04e2Oc/QH+aCdf7w5ZRGldfu2U5FseIBrJdftp88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFcjnw232sCRtsL1A4JeuKpv7xWfLxFelFu2CTZO+vRKI8X78r1dX/RMGSLVhhCx1Gmxj7kw9/pPaWIbZ7tzKLBICGs1m11zIE5ol1Sz+dNuqc353PwZMGcLVhJJxHLDM666qXvniIzy/ICgOAGSV3EoBxIuHtJp9TNGCA9cbYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FodqAVTp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b10594812so7926192e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755087476; x=1755692276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cH04e2Oc/QH+aCdf7w5ZRGldfu2U5FseIBrJdftp88=;
        b=FodqAVTpFHPGgW7t+m1Ha//QDYdjOJpNPk0lRDsUhRyjGELC9645FP83xVvJ6HpCtr
         j/VOcXa7Hd5RoXisuDYz/vuCs68CN+CY5v3pH4LqgqPkUeBZ8wsI7Zf0jWljPdcmy8Db
         8uLmXiTiy84t/BYeptW6vPuGWah6HidhHBSE8yfbrJAVFzqJj7vK8fpViL1U+d/QpXYg
         UHAZ2i4pqg+uE2U8xkiYvr7tE0pxbT0CiBjwG5TeWra65NL7cuFapLQ4Y7T9UCg7ktIn
         hpDbT/gT28VGLLW3sgABCfXIEs6EpS3G+ZjLn4X/L4inlsTjVOXtOCrs5KlWZk+ZJwld
         wK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755087476; x=1755692276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cH04e2Oc/QH+aCdf7w5ZRGldfu2U5FseIBrJdftp88=;
        b=DBABB422+5IK+7ge8Y2BvOV6HDlYJbYNHNGNbki6M4mGaVV9QzyvTEaSWyAvrPz2mx
         U8QNEbecovIYARXF7jRRlBphMmkmrzzwXIE8LlTxcVZabMrUBHjjOODaW6jP+oRaUEdB
         KZYVB+43MN7Y3uk2AcF3wKdDlY1jLYVTS1H9QxodFB8tPk1ZB6ZcVFmfyNguIrdyWaud
         1uD92PdhenV+bVQQ5M2bkPSQZPZMrd7SxC3CCHhhQXOqZ96QaIS7l0ut+ssXymvB1q79
         leea0BvxZSpu4gwthzJ7/qrKniJ7Vr/ZQeJHXEgeOs7ajpNfAUOJHDQYJypJAZfOWOBf
         9L0g==
X-Forwarded-Encrypted: i=1; AJvYcCV9KWUQcFrkyJQ3PtkxQqP4mWE6blKKnmvCdYMPxjk0yPYhECOt39pG7jYlwa5deoQpuRlp6BeHWrPx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9HLoHD3FebRWQpCmk8nyIOT2wm021nZfCTRQ0kMDlsTht/OyL
	kiPdtt9WINQi1FjrSrHylzqzSCcv5/WCBLxWA4nBYgI6rC4P+CdVvfw1WtrxCvhhxZZXqjGRfpF
	gB5DldW2iYPwnOIiZ5lRUKcnrXPJ3hyVfxaE9TwYk3w==
X-Gm-Gg: ASbGnctnQKuF5MBNCV3Yej+HNdy+j10IoesWJ+ziJaIlbHJ7OKIhMhOjpn/8jGPPxUS
	Zox+KuVXKpDWDol2/FIF9EsCecYoX42aBV6RH1G9rcCIK0sJt/DHmpUpTq3sYIQ19NMIhH+HOVD
	55wYBD5xHQH1MHS23VZhjJUh9bxbiHlHuaSdgbK2maFTLiw8rPf5RdPT1Sdv9q1zned6FIprSvo
	LHg7jObzTrHlNPEtV95nD7gqbdeks54UXkp8EA=
X-Google-Smtp-Source: AGHT+IH3C9U0eYsCFvI8kkfdfssnyrzdUjfVfc6a15px5VWt6D8qUZOfCj6ffdEyh3jqcXWbSWrzSRsy9kJOIF/gB3k=
X-Received: by 2002:a05:6512:238e:b0:55b:95a1:9734 with SMTP id
 2adb3069b0e04-55ce03827a5mr918796e87.26.1755087476045; Wed, 13 Aug 2025
 05:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6837249bddf358924e67566293944506206d2d62.1755076369.git.mazziesaccount@gmail.com>
 <CAMRc=Mf75cangdeg7T4E0nAhJs_BTdLyCu6GcrCL8vJzzAkFWg@mail.gmail.com> <CAHp75VcY9JWGH3+HmmJQQtLLTLPvaZ1RJzmPZ1wFBM+gqRiTHw@mail.gmail.com>
In-Reply-To: <CAHp75VcY9JWGH3+HmmJQQtLLTLPvaZ1RJzmPZ1wFBM+gqRiTHw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Aug 2025 14:17:44 +0200
X-Gm-Features: Ac12FXyVAFRO6OystSFRGo57RJwsOc4Fo0dBwvlnVDvDepxqo_CYSYRRGPnekck
Message-ID: <CAMRc=McL04Sk9YRmimKAALyuDJc75vSJJuZQGWOP87Jv=o7cyw@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: bd79124: Add GPIOLIB dependency
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Tobias Sperling <tobias.sperling@softing.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Esteban Blanc <eblanc@baylibre.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 12:07=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Aug 13, 2025 at 11:40=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > On Wed, 13 Aug 2025 11:16:06 +0200, Matti Vaittinen
> > <mazziesaccount@gmail.com> said:
> > > The bd79124 has ADC inputs which can be muxed to be GPIOs. The driver
> > > supports this by registering a GPIO-chip for channels which aren't us=
ed
> > > as ADC.
> > >
> > > The Kconfig entry does not handle the dependency to GPIOLIB, which
> > > causes errors:
> > >
> > > ERROR: modpost: "devm_gpiochip_add_data_with_key" [drivers/iio/adc/ro=
hm-bd79124.ko] undefined!
> > > ERROR: modpost: "gpiochip_get_data" [drivers/iio/adc/rohm-bd79124.ko]=
 undefined!
> > >
> > > at linking phase if GPIOLIB is not configured to be used.
> > >
> > > Fix this by adding dependency to the GPIOLIB.
>
> ...
>
> > > I am somewhat curious why the failure occurs only at the linking phas=
e?
> > > Wouldn't it either be better to have these functions
> > > devm_gpiochip_add_data_with_key() and gpiochip_get_data() only declar=
ed
> > > when the CONFIG_GPIOLIB is y/m, to get errors already during
> > > compilation, or provide stubs?
> >
> > Providing stubs is not correct for sure - a GPIO provider must always p=
ull
> > in the relevant infrastructure over Kconfig.
>
> I disagree with this statement. The (provided) resource can be
> optional and hence the stubs are a way to go.
>
> > As for the former: it seems it's
> > a common pattern for the headers containing the "provider" part of the
> > subystem API, you'd get the same issue with regulators or pinctrl.
> >
> > I don't have a good answer, I'd just apply this as it's not a common is=
sue
> > from what I can tell.
>
> If the GPIO functionality is optional (not the main one), the user
> should be able to compile it conditionally, in such a case it's either
> an ifdeffery in the code, or separate module with its own stubs.
>

Honestly, it makes much more sense to factor out that optional
functionality into its own compilation unit that can be left out
completely for !CONFIG_GPIOLIB with a single internal registration
function being stubbed within the driver.

Bartosz

