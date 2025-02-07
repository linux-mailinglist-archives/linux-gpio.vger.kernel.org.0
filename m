Return-Path: <linux-gpio+bounces-15537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D96A2C3FD
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 14:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22656162FA6
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 13:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48FD1F55F8;
	Fri,  7 Feb 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IgMMk9gZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D871E98F4
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935817; cv=none; b=szOHMHqsM7cOT3gdDgBmhXM9YHDhSc2rPI02VWqMMxmj4ThhE/0tvDsqc3XA0Jl9QKNTwkgzzHrRX4yuPibGzgkMaIPEfIeUqNOnJaW1+e43cp+4EaLZt3BAuJ4bsTSdsh/pjHnqYJVfmlq4GqtCB+m5glduvnKM/qNH3GygbPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935817; c=relaxed/simple;
	bh=FHXUInqL1mERxxhyzNOi52kx1FixifBEqw9FLbgO6ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1FJ+aslPOhL3KvImfJ4izra6vcvRCyESWVPnqa17yhb7WKxBkdNdeoMwAvmOmS8CSMIjKC+40EkTPr2UOcAyyI/IFmSRRs8Lm2v4NsTs++8CcpMjFugnuDinAGqHDR/lVIDcaZjIrAZVtRWg13BqrY5zn7jRdX6qyLRV9FSxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IgMMk9gZ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-544fe4f254eso429122e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 05:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738935814; x=1739540614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKsA6ABCoqBy1+Rb3r5XpccEe89AQ7e2K8/y7ck82Vw=;
        b=IgMMk9gZ3JPUYBx/vOP6SoETaTqSSkg1iVoaSrvoZZRjmyVPTR7uXLkUyRJDBh+44C
         9qH7Pget8/lMo7QlJ5039TV/rRiAmCZjmf6T1kTLFj9LLmU1r8bD82X+VZhoRkxeFQzk
         S4EzUikNabl4jDWsojT5NDw19aIKyyL43ZRfliLt3xbgM++6w6ctXEnK5PSbou2gbSSs
         9FDKZXi551DRgrMNvxqiezx6uriDsxNl5omaxXV9rEluB3kAXq1lLVeGb2yrrZZ45QnG
         9T9J7kcqk4hsBI6odtKhrT1G1RF4CeR0o1rPIgpE7+l58xgbHZjUifudEsiROt4twjaV
         lAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738935814; x=1739540614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKsA6ABCoqBy1+Rb3r5XpccEe89AQ7e2K8/y7ck82Vw=;
        b=hYbmQ/5Uy3PPYLDf4d3YMadwTraIPWgLBuWd0t0F26A9Up/Rs6CSykeeJaOasIfReI
         dydl0Bu6E36vDzo6kulrXwPsnWBOWhNttwBC8hNNzB0p6Wk1vF6sxRODmPvmh3ikZEKt
         8FsPxAjmxAucP4eY4QHRUOIj6JbuIj3zYLrvEh3jWq19Pmmj/TDlOwxeqaDuWdjr9lrH
         +OcmdFdpTottsiEc1R7TbUklYGyhaN/WJQB3dK6pcgEH4PW8aTRw51Yz5OaEwW0dCfyn
         9XdRuh6RA6YLezMgF+OvFHXG2VOIGjiIqpz+hI+BZRD1SdR06/pgKw7LwJsku7PgHluk
         7YlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUOYoKOnszQRjfu4hBbSWhOv7UNkZUmk/IzQjoS4Y45uHPKzycZ+8dGls1JwO9H99obsxB1BMVx/iy@vger.kernel.org
X-Gm-Message-State: AOJu0YxIFWmSKmv1UcCr/QG8r2Zq9XgVxYJdTQNKFU6dpExic9frEN6n
	Rv8X57LGUjJ9mjvyYCZqkBt2HzyK9xdiqVbi6Vwd1/08frdXrtCUT9+1VAffyGTTRSBAbeBkgHj
	sBus5yTMuYcS4qB5Y9pUE/8KaU/JYMvoSUTERcw==
X-Gm-Gg: ASbGncsE3ALMiYo9gjPL4PfBfFDAhv+BtXEQ4cJgM+wXq0wHYcIYipI7405MXbfEkih
	PNGE9h1Ie793ugm8HNwspUOWHK/qeh03L0rfsmmMHQRtBHut/uRMsKf3DYuTfb+dnquPzySlIv0
	Ya06cbUxa7aSkkX9xHiTCGQYhJF7M=
X-Google-Smtp-Source: AGHT+IHks/1sa0KdRih+/AWLyA7Q3wgROj+ap1j3UX5UezETpT6I8+u4s+rJOBhjffLIcT1QtpxoyyrTQqGKdpXxMKw=
X-Received: by 2002:a05:6512:31ce:b0:541:3175:19b4 with SMTP id
 2adb3069b0e04-5440e643812mr2557388e87.11.1738935813528; Fri, 07 Feb 2025
 05:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204175659.150617-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeS1gCP2aNKs9xydqLQQnVbWHbVoSqTyLzVcENDFZYM=g@mail.gmail.com> <Z6YMDwflaxCFdnoc@smile.fi.intel.com>
In-Reply-To: <Z6YMDwflaxCFdnoc@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 14:43:21 +0100
X-Gm-Features: AWEUYZn4w0AFhjUVVaaPzWXSUburvcZM3FGt7u2UBMubmSEsv8i14THnw7uGdr0
Message-ID: <CAMRc=McATQEVKrh=Pi6u8tSgQac85YoT=U8X6WrdRW8mXgUSyw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate some code in for_each_requested_gpio_in_range()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 2:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 07, 2025 at 09:46:31AM +0100, Bartosz Golaszewski wrote:
> > On Tue, Feb 4, 2025 at 6:57=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > >  /**
> > > - * for_each_hwgpio - Iterates over all GPIOs for given chip.
> > > + * for_each_hwgpio_in_range - Iterates over all GPIOs in a given ran=
ge
> > >   * @_chip: Chip to iterate over.
> > >   * @_i: Loop counter.
> > > + * @_base: First GPIO in the ranger.
> > > + * @_size: Amount of GPIOs to check starting from @base.
> > >   * @_label: Place to store the address of the label if the GPIO is r=
equested.
> > >   *          Set to NULL for unused GPIOs.
> > >   */
> > > -#define for_each_hwgpio(_chip, _i, _label) \
> > > +#define for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)   =
                   \
> > >         for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
> > > -            *_data.i < _chip->ngpio; \
> > > +            *_data.i < _size;                                       =
                   \
> > >              (*_data.i)++, kfree(*(_data.label)), *_data.label =3D NU=
LL) \
> > >                 if (IS_ERR(*_data.label =3D \
> > > -                       gpiochip_dup_line_label(_chip, *_data.i))) {}=
 \
> > > +                       gpiochip_dup_line_label(_chip, _base + *_data=
.i))) {}           \
> > >                 else
> >
> > Can you add a kerneldoc here as well, please?
>
> Sure, but it will duplicate the above.
>

Will it though? It's a separate macro with different semantics.

Bart

