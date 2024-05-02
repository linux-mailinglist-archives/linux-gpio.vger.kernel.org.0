Return-Path: <linux-gpio+bounces-6019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DEC8BA0BA
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 20:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21BF31C21B2A
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 18:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B49A175551;
	Thu,  2 May 2024 18:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPfrufKy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0F816FF52;
	Thu,  2 May 2024 18:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714675684; cv=none; b=qedRDjAa2Rk/HOdhILApkWQkvCiaRCkmAUOmdh9kY6vVe+jm2l9Q0nitIX34Fb/r5SqQ8GVO5QqjnOgeYlnxRMSwjJuIdZAXJ+DXWT80ImCjbzf3KM0qOMeTqEqqLrQNZkESd6Fpoc2sa4kLMNUoDbe41gt+arAwiNr7Mal6EYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714675684; c=relaxed/simple;
	bh=rXsmCi8M31YPmrEQyyzF+qHWrbZsO0Rt4PesuTqbcCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSS8tsdksrWO/s1/lcqB1YW9EMXB2cQgEl32I9zOMcN7zjUH1KiyVnUbjThfoKGlewkhZeNN0Vz2clAJVAOtgNywBwSzrQAWsF3wdw6vjaCgHp1FkPCAPcA+CVmPso1fFuLaz+UcLSF0umPCtdr896OJ6OXuBf0kBOVZieSB2RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPfrufKy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a595c61553cso271955666b.1;
        Thu, 02 May 2024 11:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714675681; x=1715280481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ptcMrkNICz73eAQABExX63Kj/ICN/L9qU5c/PqnqoE=;
        b=YPfrufKyx3VDRgO+Z855ja/Jn9qQkeVEx/+RTcfvthn2QxC+tFkJVf6G4BGth1BTf/
         surJ0tndN77MXyW+G5es9eE1/7lg2gpPcXgV4L0nG54xuOKPH4pEEYWXnhIMVWX0EhMD
         FBeIlV9+nnnufszdanD/V0vSqMNufKfY3URe2F21zuENkuhEpz1q3MlIEOhPaP91hqzt
         uC8iS2LPOE1u6USpRID4WYF9IUGneXMyI+qPaEMFyPrHiB7tsojvxqEHVgsDNG665bPM
         r/XUR6W4NYL74EUuD17UMR5FHWa1JwqXb+fd9iVPF6E/HuH9PSgI0U/6XJ+BE+5rChw3
         gx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714675681; x=1715280481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ptcMrkNICz73eAQABExX63Kj/ICN/L9qU5c/PqnqoE=;
        b=XdgIaSrgxcwBANnwt8uu0P0Uu4aBPVCW0p1lGnNgrrHIY6Z9jZaaRNSDYRDzIpkfil
         +w+IsXBnDaDgj672SC/vgORcz8twYf+fnzB1x6o7BMRoxl9oLia1uQnRipYq6U1qBuxk
         +mSiGSHFa0huFWK3CZ2PZ1mg/47K9C/O2bjjeqsyfYNya/CjISZGGjJTgY++5Afwid9A
         J4XHXZBMCOEOjm3uX88uOhBURcD4WURGgWAhD7R8f2m79cckkJutrmeYNYUEqIW99D8a
         qmbmVUBLcIujdxkbgleBy1U+aFIG2RO2k8Ek4OXJpcws8YCeqnI0hwrToI4vW0smxSSO
         pI2A==
X-Forwarded-Encrypted: i=1; AJvYcCVb2WeEGsoiaWesD/sQ/oQJMPvLPm1vXiqfI6TdUped58xJzhVil/ix/ExALUddoVu5PobKkhyW94wUUcOakCNklq+AnBixQM+PGZE74WLQr23/MftLisj3aUItrFF4ndKOMGu/x2K1W7IdTb8g5iTI7Beumyc/WjSYyxcbgtm33K4UPsgR
X-Gm-Message-State: AOJu0YwyyLkkwEWG3SdhB95HbIWFc/KegsQumQKlN/pDDBil3xtHeRPY
	8Y9jjbZXz3fW2xeT2K70dpo2MJLbeTQrK3kG4Y/a5cYVPeKDW+1XK47ybrET5SvQCCxmOIuDZZR
	S8/S/o7pRf0GuTgtcJKkF9Z2Ew88=
X-Google-Smtp-Source: AGHT+IFbES+v3k94VbHdMqiFlPW3sCkNwAMB0n3v4VQ2cEEzJBmZIXQvb/xZ0tM78GX8eDF/qAQPpRvtVtWRT5EFBsA=
X-Received: by 2002:a17:906:71d2:b0:a51:fec0:23ec with SMTP id
 i18-20020a17090671d200b00a51fec023ecmr222077ejk.25.1714675681214; Thu, 02 May
 2024 11:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430115111.3453-1-kabel@kernel.org> <20240430115111.3453-3-kabel@kernel.org>
 <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
 <20240430160507.45f1f098@dellmb> <ZjELmaD3aQEuEa5K@smile.fi.intel.com> <20240502184005.fsdbwrbzmv5gshxh@kandell>
In-Reply-To: <20240502184005.fsdbwrbzmv5gshxh@kandell>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 May 2024 21:47:25 +0300
Message-ID: <CAHp75VfktKyGUNBz18TUQknF-5YZDOTgh2WLJhTs-_Ay-wgQoA@mail.gmail.com>
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 9:40=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
> On Tue, Apr 30, 2024 at 06:17:45PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 30, 2024 at 04:05:07PM +0200, Marek Beh=C3=BAn wrote:
> > > On Tue, 30 Apr 2024 15:53:51 +0300
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Apr 30, 2024 at 2:51=E2=80=AFPM Marek Beh=C3=BAn <kabel@ker=
nel.org> wrote:

...

> > > > > +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bo=
otloader,
> > > > > +                                 u8 version[static OMNIA_FW_VERS=
ION_HEX_LEN])
> > > >
> > > > Interesting format of the last parameter. Does it make any differen=
ce
> > > > to the compiler if you use u8 *version?
> > >
> > > The compiler will warn if an array with not enough space is passed as
> > > argument.
> >
> > Really?
>
> Indeed:
>
>   extern void a(char *x);
>
>   static void b(char x[static 10]) {
>       a(x);
>   }
>
>   void c(void) {
>       char x[5] =3D "abcd";

>       b(x);

It's not the example I was talking about. Here should be a(x).

>   }
>
> says:
>   test.c: In function =E2=80=98c=E2=80=99:
>   test.c:9:9: warning: =E2=80=98b=E2=80=99 accessing 10 bytes in a region=
 of size 5 [-Wstringop-overflow=3D]
>       9 |         b(x);
>         |         ^~~~
>   test.c:9:9: note: referencing argument 1 of type =E2=80=98char[10]=E2=
=80=99
>   test.c:3:13: note: in a call to function =E2=80=98b=E2=80=99
>       3 | static void b(char x[static 10]) {
>         |

...

> > > > > +               omnia_info_missing_feature(dev, "feature reading"=
);
> > > >
> > > > Tautology. Read the final message. I believe you wanted to pass jus=
t
> > > > "reading" here.
> > >
> > > No, I actually wanted it to print
> > >   Your board's MCU firmware does not support the feature reading
> > >   feature.
> > > as in the feature "feature reading" is not supported.
> > > I guess I could change it to
> > >   Your board's MCU firmware does not support the feature reading.
> > > but that would complicate the code: either I would need to add
> > > " feature" suffix to all the features[].name, or duplicate the
> > > info string from the omnia_info_missing_feature() function.
> >
> > From point of a mere user (as I am towards this driver) I consider
> > the tautology confusing.
> >
> >       ...the 'reading' feature
> >
> > may be a good compromise.
>
> I have rewritten it to use another dev_info:
>   dev_info(dev,
>            "Your board's MCU firmware does not support feature reading.\n=
");

OK! As long as there are no two messages in a row for the same error.

--=20
With Best Regards,
Andy Shevchenko

