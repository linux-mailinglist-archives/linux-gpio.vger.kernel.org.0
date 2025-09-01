Return-Path: <linux-gpio+bounces-25308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB5B3E1E9
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 13:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AABBA16E282
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 11:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642EA31A063;
	Mon,  1 Sep 2025 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xX5CwXFr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F233126B8
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756727082; cv=none; b=A+TrvI7K/D6lE8NinYQYh92gWEkW+Q+3s6thq/1OXChDUD4Z/8xsVh39TkMwr4AC+mHKLcE6BIJQ7GZQn+bb2Y1T5jrd52CitSSxk+i0dARl2CkzU5aHO6b2R0pQLcVT5hi4vbR68aIwKfNwHHkk0t6Gd/1qXk4y+pjFaDVrx1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756727082; c=relaxed/simple;
	bh=4VTO7CuosNZS6gYD4T7fljZ87tb27yjDlvWIasBY4aA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0TNbvtjMhKuyV3TJCpAZ/yjcb+2hxo8GxNSwndf5fqPc88Q2pfvO07H0fyoavklJYmLhiKdzl3SkxIEqrzIp1nPU2XblmxgfChAiBQPFOk8YGyKBDy7eUQfsmQXJ4NjjSTJpZgGQaJDrlM0GcATvnDp5Htg24g8zThuUEwGLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xX5CwXFr; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f6017004dso3839453e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 04:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756727078; x=1757331878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OFvV7SQIP1kCtikysf6z3ht4YhehrNRG0T9y62J5/A=;
        b=xX5CwXFrYnSBXFS6Bww/hvjwTck4y6JvzeWdPnh04tQPOolh9uGOvUTKOkCrXFCmDA
         h7b2dMqtQ1Yg03YFf8cN+gQlVvUaTiT+MRieQZmkI3LUcrwjTz/13P41RwwQZMBLqIm/
         kqF1+2e7Brs1AjmLBZscT5XZn5BVN3OzVFsxzxqdVCXu7BglN1OJUjiesoCrTS9F4nvO
         Aq8Pwjcj6aTag/Z6OOfxViynFJZP8QJlFYVeWDII0OOmvq7tC7uSaCacJcVH071MCUUY
         gDupotsZtOHYX8uCDNtEaX1xXsf35PD+s2tQI4rFf2kFPCQakvedHIxC8zSQDhorRlan
         Bv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756727078; x=1757331878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OFvV7SQIP1kCtikysf6z3ht4YhehrNRG0T9y62J5/A=;
        b=mAdB+OkUt1H6VZ49ebY3wrp333XgSAimSCP18Iz2oZgjtapTGcKMlxvqS1ec+4cO9u
         KURVFH/maK9XpxWPMiiEJJ0NZFOBlh1TvVvDmpyH1KMJ+6X7vgItN0nImZzhzMdAY50O
         Rji2WHkrKCiG61aElG1gFedaGSfowYcMc4xJUQM4mOXWbPbnNOfvoyNUZ8bc7nmBIDVZ
         xqwbWMSpNCw5QJgL+q85ldVAMm6LP/5oEOviXMIB5GX36P8z8RJFy6f+9OWl7Lg5uNVr
         LF/Wpe9rIxzdt/CuAOk7SKaxkRfhdolkgFc5TYZpHTLj3ZM0MvXsDE45XMRHLEvfV98B
         aZXA==
X-Forwarded-Encrypted: i=1; AJvYcCVGQJp/aGPoU/4wiSPHeIAf4vgu4tRUdZTxG5Ycu38ObBXM6QLXL573lrOieQdUN2DGxkuSlvNLnPBr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv1wGFUKgpeWX/HfAZCbp9tNgFlcxyC5P1wE2qTcAhL542jqRn
	LjCY+EHuFWHI+DvoEtyyA4lfAZnamyyYhGRFViG0W19fjN/rwVp24LtHyEtJsQwwJ/stCcJdVds
	tdoGhQ1vqDlHwQ5cgWGcLscErRwQF3INlOPILB8Pm0g==
X-Gm-Gg: ASbGncv9xllTyD10B2tB1B5jgPbL3EVeApd8ekgaGoidzJJJYqMVzGOsFLmDJK3s1BP
	MiaqZo+zjdRaXPjmgJzme+LE0wCbmP8Sjwhhdiq0prXkMo0qUgct0M5ooYsxocKOaYeOCo3aXKU
	RwMm0eomH62N9f6HSThWEl2pKHmCn4Fxw2snfVC9WIqFm9vDfcDoJuO29Kta05ifWnjlOxBJ5nw
	MWcMiOhX/Eas3xdiOXvpmyZgeaofr013TRSP9/HC5YzTHflkh59JNw6uE87
X-Google-Smtp-Source: AGHT+IGtLI6rvBfSpE8htFQQQicBzrqgcgvSaqKsCw69S8fhQAnqyxpmOWemgkeyysAfxtYGJkZiX5XHSjspvtn0xNM=
X-Received: by 2002:a05:6512:b06:b0:55f:595f:9a37 with SMTP id
 2adb3069b0e04-55f708ece35mr2216447e87.27.1756727078020; Mon, 01 Sep 2025
 04:44:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726211053.2226857-1-arnd@kernel.org> <20250813222649.GA965895-robh@kernel.org>
In-Reply-To: <20250813222649.GA965895-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 13:44:26 +0200
X-Gm-Features: Ac12FXxgPIwSSpp9eUgR1WdTki5TUVANvw8eRPo8zPYFVF6F739rcWSmPKSsgBQ
Message-ID: <CAMRc=Me1jL3anzVvHWxzhKG+wAQ-TkUVeUht2mCW87DKb13M_w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB
To: Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	kernel test robot <lkp@intel.com>, Peng Fan <peng.fan@nxp.com>, 
	Koichiro Den <koichiro.den@canonical.com>, Lee Jones <lee@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
	Thomas Richard <thomas.richard@bootlin.com>, Yixun Lan <dlan@gentoo.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 12:26=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Sat, Jul 26, 2025 at 11:10:43PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > A few drivers that use the legacy GPIOLIB interfaces can be enabled
> > even when GPIOLIB is disabled entirely. With my previous patch this
> > now causes build failures like:
> >
> >    drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_parse_dt':
> >         drivers/nfc/s3fwrn5/uart.c:100:14: error: implicit declaration =
of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=3Dimpli=
cit-function-declaration]
> >
> > These did not show up in my randconfig tests because randconfig almost
> > always has GPIOLIB selected by some other driver, and I did most
> > of the testing with follow-up patches that address the failures
> > properly.
> >
> > Move the symbol outside of the 'if CONFIG_GPIOLIB' block for the moment
> > to avoid the build failures. It can be moved back and turned off by
> > default once all the driver specific changes are merged.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202507261934.yIHeUuEQ-lkp=
@intel.com/
> > Fixes: 678bae2eaa81 ("gpiolib: make legacy interfaces optional")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/gpio/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> This change causes all of the GPIO submenu to show up directly in the
> already way too long 'Device Drivers' menu.
>
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 8bda3c9d47b4..c48f9badb513 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -12,11 +12,11 @@ menuconfig GPIOLIB
> >
> >         If unsure, say N.
> >
> > -if GPIOLIB
> > -
> >  config GPIOLIB_LEGACY
> >       def_bool y
>
> Perhaps this has to be before "menuconfig GPIOLIB"?
>

Hi Arnd,

This is still broken in next, will you have some time to spend on it
or should I just go with what Rob proposed?

Bart

> >
> > +if GPIOLIB
> > +
> >  config GPIOLIB_FASTPATH_LIMIT
> >       int "Maximum number of GPIOs for fast path"
> >       range 32 512
> > --
> > 2.39.5
> >

