Return-Path: <linux-gpio+bounces-18361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC18A7DE2C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 14:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08CA7188FC94
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 12:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BC424E00C;
	Mon,  7 Apr 2025 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oU5PXqDW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEB524888D
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030182; cv=none; b=s28S+u5fimS9iJby3k2nzPaM1mAzbZz5QmniJ+bLoVvYbfcJKoT0h2ceQM6uQ+xwYU9Tk7OTKHgYiX0BGiNGtNBuigwdirvjn+F/0oVH3CaEfPy9Nywkig5P5R3+GFGrQpPXHlDOFHjT7DX+jrzWRxEusClV4IGQaCW3EKoztjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030182; c=relaxed/simple;
	bh=5Rjt0OmOgyBh0Hk9qKotl7Tw8k0MIV3Ui8TfkTavLRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxJHf5qbqBmmBlxSffP72ELO2tW5FCczrk79yydI/iNcctU5nXVfAZwOHUwbeAwRC9HpDow8k5M1nEbL/BN62XwNaPmHy9Z5v2k7mexjbpqYZ4xy4vX9wKTIJnATEhiLtrAm6Ph847JEDfoYQDVeRAV+BN6U0aAaD5Mjan0nloU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oU5PXqDW; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30f30200b51so3664991fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 05:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744030178; x=1744634978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cG8Bhzh73CareWikA5dmwBfOw2vAqPOPb9zdHSUnIjw=;
        b=oU5PXqDWcEMJ9U9C5nhuIuBWipWV4ck9VrbPmBiIjTQdYYDiVRtB2RevUJc8uPSrss
         sWc50/eQ7tb/u36jy8/rc/vbcJG+gVIHOSmzyL4XMeB14QVL+NpuYx9t6S3N1zssjGs2
         QKlV0nsYLiOKfI1/32vbyADpcHp/mNQv2ncQI9JdFDuhzlUal/UlXV6Ch+9LbjEx9/fe
         MAv750DMedC0jN08BbCYnW9YkvV/0hdmfPmCDWiLv1GODldPFa3vvqpkisxtv+gds/cM
         wpFJuRP3iPMzPr2vRQDksXtu5CfiVpWrgMjw2e+9a6Ze0KfcPvFR9+9XJ+M5EVjZRwxP
         +pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744030178; x=1744634978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cG8Bhzh73CareWikA5dmwBfOw2vAqPOPb9zdHSUnIjw=;
        b=TCZeQd0L9ItOgbYRijpevlPfCzp1EbMIRdtB5YPXxHhrwZFCxlFPVh7HPuh3aSoa1M
         NnOPr6L4Nam9oIoJgApsM92XCC7BlBFxnG+JdhoEyRwnOL7Io9TmCqljwahZAaffTIWk
         wsz5iN8KFQTLAedj7GJsm/1dWdashnjhIl/GTL79txFpveGRebLIddtjCpTNG7ymZDP0
         zForv3hBEWzKIlXPTWhGbyIPqdXvQruf53SdVjxnZVe5RmLi/1i6MDuVO14wrr8yV2Nd
         gq25Ajr2If9YcZEbmuuwmGVzA1jB2Gbm5qt9XNiqdsUxNLazAk/vgEzUwfM0x98E/FaW
         ZKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkZnBItaQ4BLnWV13Bm7wnAayGG80RC62d2zhftdgX4U03xQmYTcJ5/tAQ+uwbhZqH/L55qIrCSRiY@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQgKMGyvCla115WYJTNzS5IgTsGW5Ql5bv2JBfO6uhKj6H5wC
	TkFveO9/DN4VkeQLsKXh7ypc4ogQaJASGrmfXgoncLd+aAl4zW1se0ForfuiJDDwAyAynJCy7Rv
	kievgKzXI97xsENNX34cy70rNGgpxKj5JTV4xjYZ83O1S87KE
X-Gm-Gg: ASbGncvlskj8ApV7UWA/38oKhBlVm+ZQCxNRABw2zfS9jmtyRr+L6/71ZhEyhGwzIjW
	f7x1nwlsrj5pw2tv7s3R9AbfCwfKUEni9SIpBZfnN97O0Bq60foVAS63QND4zgxp4e1+IvecSj5
	We59YUNGd+0A2h+6PnQ5g4XqfhZnTFsf+59xcbnDnB/bVYkhO8IvousNJuTQ==
X-Google-Smtp-Source: AGHT+IFyk5MBLzW+HJxDNWm25Qd2OJklXuf9B/7SyoM0ktCHQBbFPpai+73EoGhyTZSFIUdntbI2hMp+pXO45Mpy6DE=
X-Received: by 2002:a05:651c:989:b0:30b:a185:47d8 with SMTP id
 38308e7fff4ca-30f0be05e8fmr31888031fa.4.1744030178422; Mon, 07 Apr 2025
 05:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
 <Z-5BHzTEed607Afz@smile.fi.intel.com> <CAMRc=Mc12B-b-w6bJeOgwFvzbmaqzL+uT7vJssVYN4tMu3YpaQ@mail.gmail.com>
 <Z-5uJxij4jmhint3@smile.fi.intel.com> <CAMRc=MdPiz_YD451Arrm4mT-SwU_OdK1U-WozPxsvt11mHsLZQ@mail.gmail.com>
 <Z-6Lm_Aqe3-LS4lj@smile.fi.intel.com>
In-Reply-To: <Z-6Lm_Aqe3-LS4lj@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 14:49:27 +0200
X-Gm-Features: ATxdqUHDB8wRBWK_IOb2X8iX7ngS4W9_fJCR7LfAjHD5CevMDBBHFxmwamyJr2g
Message-ID: <CAMRc=Md0gD=XPEkb=C6JJcRvDpBbcJb5Xv8fE-v94iT=COHw7A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 3:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 03, 2025 at 02:23:24PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Apr 3, 2025 at 1:17=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > > But this encourages people to get sloppy and just ignore
> > > > > > error pointers returned from gpiod_get()?
> > > > >
> > > > > From where did you come to this conclusion, please? We have many =
subsystems
> > > > > that ignore invalid resource on the release stage, starting from =
platform
> > > > > device driver core.
> > > >
> > > > The fact that many people do something does not mean it's correct.
> > >
> > > And it doesn't tell it is incorrect either. We are going to conclude =
that there
> > > are pros and cons on each of the approaches, but I don't see much a p=
oint in
> > > yours, sorry.
> >
> > My point is:
>
> I understand your point, but I disagree with the omni appliance of 3.
>
> > You get a descriptor with gpiod_get_optional(). You can get three
> > types of a pointer back:
> >
> > 1. Valid descriptor: you can use it in all GPIO consumer functions.
> > 2. NULL-pointer: you can still use it in all GPIO consumer functions.
> > They will act as if they succeeded. This is expected as this is how
> > the "optional" functionality is implemented. Had it been written in
> > rust, we'd do it better but we use the tools we have. It's very much a
> > "valid" value to pass to gpiod routines.
> > 3. IS_ERR() value. If you try to pass it to any of the GPIO consumer
> > functions, they will return it back to you and print a warning. Why?
> > Because it's an invalid object. And there's no reason to make
> > gpiod_put() an exemption.
>
> No, the release is special as it's used in error paths and there often
> it is simpler for all just to ignore invalid pointers rather then put
> a burden on the driver developers. The gpiod_set_*() and gpiod_get_*() ov=
er
> _assumed requested_ descriptor of course should fail any attempt to be su=
pplied
> with an invalid pointer.
>
> > You never could have used an IS_ERR()
> > correctly. Look at what devres does - if it got an IS_ERR(), it never
> > schedules a release action.
>
> This is again unrelated. devres is an upper layer and we don't care about=
 its
> implementation which is logically correct since we assume to put on the l=
ist
> only _valid_ resources.
>
>
> > > > Many other subsystem scream loudly when that happens, so I would be=
 ok
> > > > with adding a big WARN_ON(IS_ERR(desc)).
> > >
> > > I disagree. This is not that case where passing an error pointer shou=
ld be
> > > an issue.
> > >
> > > > > > Also: all other calls error out on IS_ERR(desc) so why would we=
 make it an
> > > > > > exception?
> > > > >
> > > > > Because it's _release_ stage that participates in the cleaning up=
 of
> > > > > the allocated resources in error paths. It's a common approach in
> > > > > the kernel. I would rather ask what makes GPIOLIB so special abou=
t it?
> > > >
> > > > Just because it's the release stage, does not mean you shouldn't ca=
re
> > > > about the correctness of the consumer code. Passing an IS_ERR(descr=
)
> > > > to any of the GPIO APIs can happen if the user ignores an error
> > > > returned by gpiod_get(). That's not alright.
> > >
> > > Have you ever seen such a code in the cases when it's okay (like in p=
latform
> > > device driver users)? I do not. So, the above is based on the hypothe=
tical
> > > assumption that somebody will make silly things. If you _really_ care=
 about
> > > checking the error, add __must_check to the respective functions.
> >
> > They already have but people do the following (like in the affected SPI=
 driver):
> >
> > struct driver_data *data =3D kzalloc();
> >
> > Then elsewhere:
> >
> > data->gpiod =3D gpiod_get();
> > if (IS_ERR(data->gpiod))
> >     return PTR_ERR(data->gpiod);
> >
> > The data struct now contains the IS_ERR() value. I don't think it
> > makes any sense for it to carry it around and I don't want to enable
> > it.
>
> It's up to the driver developer.
>
> Again, if you want the result of gpiod_get() to be tested, mark it so.
> That's why I think your initial point is mistargetting.
>

It's already annotated, I said it before.

> Ask yourself, why we don't fail kfree() on a NULL object? (from kfree() p=
.o.v.
> it's an invalid one) Or if you want to be more precise in analogue with t=
he
> gpiod_get_optional(), consider
>
>         p =3D kmalloc(0);
>         kfree(p);
>
> and this is valid code despite p being not NULL!

We're discussing an interface returning an object, not a simple buffer
so it's a bad example. Try feeding an IS_ERR() to regmap_exit() or
numerous other deinit functions and tell me if that works.

I explained why I believe this change is wrong and I will allow myself
to not accept it unless Linus is very positively in favor.

Bartosz

