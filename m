Return-Path: <linux-gpio+bounces-25530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CAAB42668
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 18:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 337131BA4AD7
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 16:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75ADE2BF3CC;
	Wed,  3 Sep 2025 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3A2Dc5jf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7DF2C027B
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916094; cv=none; b=On+8FYM1shkpQ3LFBkI1Pc2KoZEAHlFgS/fAAhtTZ7sd0UHf73VseEUVdO3E33HVF4Elb86/Q1WJ/G1NHy88rE0zvcUhivELHELJasMdf6nWtDI0tTfax90FR1y/1nR2oKlfDONJSSNarbtDfKzGRLDZFsVY5w2gluK81FSQXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916094; c=relaxed/simple;
	bh=wJggNzf9A/vgtU9l7tcShbzgcQHCA0vCwHYJ1RNzbAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=haXuVJYyIF9iFEBrkvJ7idRCyuZZTJ30WnRfEqe3IxDW7Yg7WmyfcDlW5u8P0rWsiFkd2teB4yLZ+tzedbW3Ck01wbCfPpN6lb9f828kaaxFw1pqHXG8ub5tU4RPfq1wasLehnvtxD/n5eFtpeYN7lVHhctqguypyJHUAdgdonQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3A2Dc5jf; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so4635990e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 09:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756916091; x=1757520891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjKN0U25Br3FtvU+oCN6aTZaMOV6BZcMe11X4TvFP/M=;
        b=3A2Dc5jflUgvBPR9uPOnD5rdXXP8pETwyLpHPgv6GSkd7eY39VRi7bRWYHkTuEaBXA
         PV5euVQcE3QjfGZXW9ENePLbBC+CEgV3PunsyYBoBD/0Mlnosr93GgwJVCkySR/3/0Ni
         nXARJiAVgb7ik/4howXCm2QzmR6VlciNJVdNnWzU5uR4CeLzDZgPK8oM620p0Le8HKAi
         /NccYRfJ6RoeklShMqbT/qcZ9aK/VKyupO6nEwYLHLue3sviM/S14W3Ohtr5O81QPW/J
         xBPPcEdTnba9zl2nZ0mO305ZqRCqlnXZxwXhUQyc6dUQPEzsKuQREX7n5vsjbUu840+2
         Blog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916091; x=1757520891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjKN0U25Br3FtvU+oCN6aTZaMOV6BZcMe11X4TvFP/M=;
        b=m6uPSa6xDvCfcNJpEDfwNj+UvyFbkTK7YaChV8qOHKSviVdnQocktdv+LYloYDWoBe
         8Lu4fdI6LAYXFmeDgRB/wdv1I7yFcmQhVRNuQ/IjhwH4TuYLpPl6ooGtGPVOuH08kCJI
         pPtUnYM2kabqBAMKwHd6wO0FCjW9b6Bx8t2LCbC9xKK+q8mwel6mNvAG4KMLhcmEo9sf
         YiipO7LGm6w6iIo3DZCuu/nExa7rF5g2ahpJ/L5WhHtdqkGybT51vJ/wUEkoTW6YMbBD
         FOFj4tBNWaMPbgzaNmk5QuKVuxz0s2TYKGkcQrctUfRAY4b4vumAxp7BEmx5CaBG9SP4
         XUHA==
X-Forwarded-Encrypted: i=1; AJvYcCXP536vdIV8UTRsovJjGfwHIyW0oeOt4DQin3ZNSbCpjeP7uJ/3jDmMk8MHXF9m6STjVfZlPpxZV1Ts@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnjr70w6w/96rBl8mahrc/j+FRS8d51Xf5N6QZxXR0pJsvXeic
	MCDDikjudTmFPmGHvXdSBH6yXCJ0HfEMBXvu7S9J6tBpOKXwTbtth7IXnnfc3yH5pFzShZI0hp0
	zXWTmEOmaAdGeS+EhWChhd+AxUsssKT3RZhPR3noglA==
X-Gm-Gg: ASbGnctUIsLsPgGNQGiLSNScZZicaCTjp4W8OrwrIBmjBgSkPQKlhzO+BaqJtUtMIxk
	zE7PcDvRosmNIy3rePqKV9FPy+jAiFiK/s9+Ph0/WPPLxapuWlizMymGxYA+wQrVSLzL1KTbVMI
	yXLD3kSZCpNcUPVgO8uFkNw3j5/i5HYBoqTHeRoAJcmEZEGhpAfDEu8Y7g9BFL2AA0j+3v4xYLc
	rUjpl1I2Goe3vCZkWEAxUrp8ltOIgTyB1fhJ7TOMV1DitgL5g==
X-Google-Smtp-Source: AGHT+IEYSoT9PG8aDYwGOjTAyyVLf8UrHyR2tnQVPp7h/U/Zc10Xoq9OuXixYnOi9MZP7jxzk7HWZjPy8zIrFh00r+8=
X-Received: by 2002:a19:6b18:0:b0:560:827f:9ff4 with SMTP id
 2adb3069b0e04-560827fa6eamr2023502e87.27.1756916090513; Wed, 03 Sep 2025
 09:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-7-356b4b1d5110@linaro.org>
 <aLhie72v1T9Bw1vx@black.igk.intel.com> <aLhjOAttpdT--tW7@black.igk.intel.com>
In-Reply-To: <aLhjOAttpdT--tW7@black.igk.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 18:14:39 +0200
X-Gm-Features: Ac12FXxw2HgYwqaw48OzmEBdzdirvLd_j34-_oFlC6LOY6De-1zKdNxJynwFI20
Message-ID: <CAMRc=McKc9PR-gDs5PtLJaibouwjm96Fiy37s_DC7_f_pdebpg@mail.gmail.com>
Subject: Re: [PATCH RESEND 07/14] gpio: ts4800: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 5:48=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 05:44:59PM +0200, Andy Shevchenko wrote:
> > On Mon, Aug 25, 2025 at 11:48:48AM +0200, Bartosz Golaszewski wrote:
> > >
> > > Convert the driver to using the new generic GPIO chip interfaces from
> > > linux/gpio/generic.h.
>
> ...
>
> > > +   config =3D (typeof(config)){
> >
> > First of all, what's wrong with the pattern used in the kernel when we
> > explicitly show the compound literal? Also we put a space before {.
> >
> > > +           .dev =3D dev,
> > > +           .sz =3D 2,
> > > +           .dat =3D base_addr + INPUT_REG_OFFSET,
> > > +           .set =3D base_addr + OUTPUT_REG_OFFSET,
> > > +           .dirout =3D base_addr + DIRECTION_REG_OFFSET,
> > > +   };
> > > +
> > > +   retval =3D gpio_generic_chip_init(chip, &config);
> > >     if (retval)
> > > -           return dev_err_probe(dev, retval, "bgpio_init failed\n");
> > > +           return dev_err_probe(dev, retval,
> > > +                                "failed to initialize the generic GP=
IO chip\n");
> >
> > Second, can't it all be hidden in the GPIOLIB just by passing the point=
er to
> > the above initialised structure? Yes, it will take a pointer space in G=
PIO chip
> > for all, but I think it will reduce the burden.
>
> Okay, it seems the motivation is to make it in align with, e.g., gpio-reg=
map.
> But why not simply convert the drivers to use gpio-regmap instead?
>

Because the goal of this rework is removing the gpio-mmio fields out
of struct gpio_chip and also I can't test this conversion
functionally. Out of scope basically. But if you want to do the
conversion, I'm absolutely open to it. :)

Bart

