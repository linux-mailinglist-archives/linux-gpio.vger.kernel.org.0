Return-Path: <linux-gpio+bounces-17033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D01A9A4DD30
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9B1F3A96DA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94A61FDE2D;
	Tue,  4 Mar 2025 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avZwp6DA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45BE1FC7F8;
	Tue,  4 Mar 2025 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089354; cv=none; b=afW7hHtpjvHneIbE5B3lFSQc8Y8THeUIk84ta3EPG7lwRJftn4tkLOxEzxlqog3x4Zfrm4lDDgkQjsTJbolWPQkcAKD5pVjOw75/LTQOrCprhIIOiUEYTyDL8jEGUpvIvE8g8QDJPKWpVfadxuo36HouOuORRuZBdZvS014ybc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089354; c=relaxed/simple;
	bh=k8AeePF8aGjADlzhnEd1krK8gPuB2mc/X/5gvUtOCEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbdwiVIzwHNgDhbISXwBd1BZ1YIPpZCoafadgYR5h3VmH5unv5S5+f2U/mxYcTdm82esqYYo6Q+D1MlpKNH2BkylQcBK0ZXwZmigK1+sLornBpgmII/tE9PZhza5cM2xozA58Yu19iJdSOMY+W9DCQH1BMvg7jB4BrJdOCKhCFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avZwp6DA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7430e27b2so914080766b.3;
        Tue, 04 Mar 2025 03:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741089351; x=1741694151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9k5/kUhkHRqlZnA0OW1zTWkTBSUQGJS0XZ/fsldyH8=;
        b=avZwp6DAR1MHm9pGz9ThFiwNgs6ORfABYTAFD9Go7Fm9dqiKWveckjqbMszKgBxTFE
         qgaaC2TeTp8KKE3d+JUJwUuaSRLzmrF2H7O/b12UqSJ5z2hha8B8f9a1DlRfAytAokz0
         agkFkZP5dlz8alxDHoWF9hQ80S0n8Zpf/ZSuGOXFGzDsp6AQUTcT9Yf32qtZzjdCBPWz
         7gkZja5kQ8vNlYt919J9Helo9EvqMnjItSvDrGLvtMQCakVJs6R1tORh5H9lB5U4bnMG
         zcXtRRn+V9RdEDzQn5CKs3lit0pkGzc4QfawTa8/VomxFPNUh4ZfMYd6R1mPDMklESBi
         O0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089351; x=1741694151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9k5/kUhkHRqlZnA0OW1zTWkTBSUQGJS0XZ/fsldyH8=;
        b=fPI7wKbpfJHAKDxLi4Vp9KTdmfTrJv9Jsqq8zPs2DWMKUbvgosVGMl4CfsOUNxnLol
         +ptMA0Z9JwFn3G/VkmfUnFZt5PWr+IGRqVeyUPfkZMKTH627Fw3snAksIq2NRaT5LS51
         gyiJygUzxDcUomrVd7wndZv3nvlHFfx6wwC8yf3o2IBp+/VDM0CM2mHlWI9XdHw6dfMz
         nGKMYYD8MdysSqN7Z4gqB87GMG3ef4eUB9B9nlsU7wnlKXmGHp2co/DZXoAdBXF4zqHb
         YjtIylDa0RTBuDG4Bs4gsg/yuuMFnxHifymhVy34zQ9ZOJN4HbQTy1mAyGzniTVwk1td
         2W8A==
X-Forwarded-Encrypted: i=1; AJvYcCUOV8F4pvDkv9Ho1RjmhKGH7E74n9Y5wcjorVBlKJMeTHPH7jWDy4YeskoZ9iwwN72lLuCh4YzBaUc+@vger.kernel.org, AJvYcCVpZyIfL5G0kAs5E9msfBjp+BOCdbWC5kANbFRYn145NC+7NvSUVPSQDwwuiMjSxiRIYeby7TVwAyuFIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Pt9D95igRJCLU8kFNqYAuyFsxlaTD2DRrsUElepsig6j4ikX
	IRM2KbKPTvYofYValnYwboZG0Yi16pZykYOBOyLOo8pL3HBwxlS0vDRD7GBDLNXeYFzQo+N4KRi
	gkGK96iakvsJEjr1M5UTcs9lFUs6noBQTaDQ=
X-Gm-Gg: ASbGncvIYG/qH3MseD7dWJ97WGatzstcWpTCK+Zt7yfs+PL7oT6ubkcvEUCKMZqmGvU
	tcJbqjLkUrz0yVRgbQby/f/LTmOPnKn4uvjzvgHBckLefb6vV8WpufPec4zwCFqMs5sGNtdsiJA
	ThAgQyFz1uuVqzH4EGCQNQnkDXMK4=
X-Google-Smtp-Source: AGHT+IFgGAsUVgJIA5JzmB+7xP1D6l7zaAdTgHmXNkaGuJ8wiLfcOqhl4lZQy2tzG1vv5Li5WHNpRCx5CMeLsPc/Dzw=
X-Received: by 2002:a17:907:7f89:b0:abf:7776:7e29 with SMTP id
 a640c23a62f3a-abf77768955mr840626566b.53.1741089350626; Tue, 04 Mar 2025
 03:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
 <20250303074552.3335186-2-zhoubinbin@loongson.cn> <CAMRc=Mfr5PCuad28dL19iZrpA-qkL7x0W-4Lt3SZyVfXPP-ipw@mail.gmail.com>
In-Reply-To: <CAMRc=Mfr5PCuad28dL19iZrpA-qkL7x0W-4Lt3SZyVfXPP-ipw@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 4 Mar 2025 19:55:38 +0800
X-Gm-Features: AQ5f1JrQwQmbnnM8V2KqYQZFYKvFMDIRmYh0FNy89y2SOvhJHCUGR-jvA0SPok4
Message-ID: <CAMpQs4+5165E35oO_p-pE8zDNo2rPT-gBqueA_ynW8FYJHV18A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz:

Thanks for your reply.

On Tue, Mar 4, 2025 at 6:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Mon, Mar 3, 2025 at 8:46=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> >
> > The Loongson-7A2000 and Loongson-3A6000 share the same gpio chip model.
> > Just add them through driver_data.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/gpio/gpio-loongson-64bit.c | 51 ++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loo=
ngson-64bit.c
> > index f000cc0356c7..a9a93036f08f 100644
> > --- a/drivers/gpio/gpio-loongson-64bit.c
> > +++ b/drivers/gpio/gpio-loongson-64bit.c
> > @@ -254,6 +254,33 @@ static const struct loongson_gpio_chip_data loongs=
on_gpio_ls7a_data =3D {
> >         .out_offset =3D 0x900,
> >  };
> >
> > +/* LS7A2000 chipset GPIO */
> > +static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_dat=
a0 =3D {
> > +       .label =3D "ls7a2000_gpio",
> > +       .mode =3D BYTE_CTRL_MODE,
> > +       .conf_offset =3D 0x800,
> > +       .in_offset =3D 0xa00,
> > +       .out_offset =3D 0x900,
> > +};
> > +
> > +/* LS7A2000 ACPI GPIO */
> > +static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_dat=
a1 =3D {
> > +       .label =3D "ls7a2000_gpio",
> > +       .mode =3D BYTE_CTRL_MODE,
> > +       .conf_offset =3D 0x4,
> > +       .in_offset =3D 0x8,
> > +       .out_offset =3D 0x0,
> > +};
>
> The naming convention here is a bit confusing, can't we have the
> naming of variables reflect the compatibles they refer to?
>
Emm...

I named them that way to be consistent with the previous naming.
Of course, we could name them something like
=E2=80=9Cls7a2000_acpi_gpio_data=E2=80=9D, which might be better understood=
.
Also, do we need to rename all instances of =E2=80=9Cloongson_gpio_chip_dat=
a=E2=80=9D?

For example:
ls2k1000_cpu_gpio_data
ls2k0500_cpu_gpio0_data
ls2k0500_cpu_gpio1_data
ls2k2000_cpu_gpio_data
ls2k2000_bridge_gpio_data
ls2k2000_acpi_gpio_data
ls3a5000_cpu_gpio_data
ls3a6000_cpu_gpio_data
ls7a1000_bridge_gpio_data
ls7a2000_bridge_gpio_data
ls7a2000_gpio_gpio_data

> Bart
>
> > +
> > +/* Loongson-3A6000 node GPIO */
> > +static const struct loongson_gpio_chip_data loongson_gpio_ls3a6000_dat=
a =3D {
> > +       .label =3D "ls3a6000_gpio",
> > +       .mode =3D BIT_CTRL_MODE,
> > +       .conf_offset =3D 0x0,
> > +       .in_offset =3D 0xc,
> > +       .out_offset =3D 0x8,
> > +};
> > +
> >  static const struct of_device_id loongson_gpio_of_match[] =3D {
> >         {
> >                 .compatible =3D "loongson,ls2k-gpio",
> > @@ -287,6 +314,18 @@ static const struct of_device_id loongson_gpio_of_=
match[] =3D {
> >                 .compatible =3D "loongson,ls7a-gpio",
> >                 .data =3D &loongson_gpio_ls7a_data,
> >         },
> > +       {
> > +               .compatible =3D "loongson,ls7a2000-gpio1",
> > +               .data =3D &loongson_gpio_ls7a2000_data0,
> > +       },
> > +       {
> > +               .compatible =3D "loongson,ls7a2000-gpio2",
> > +               .data =3D &loongson_gpio_ls7a2000_data1,
> > +       },
> > +       {
> > +               .compatible =3D "loongson,ls3a6000-gpio",
> > +               .data =3D &loongson_gpio_ls3a6000_data,
> > +       },
> >         {}
> >  };
> >  MODULE_DEVICE_TABLE(of, loongson_gpio_of_match);
> > @@ -312,6 +351,18 @@ static const struct acpi_device_id loongson_gpio_a=
cpi_match[] =3D {
> >                 .id =3D "LOON000C",
> >                 .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls2k200=
0_data2,
> >         },
> > +       {
> > +               .id =3D "LOON000D",
> > +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls7a200=
0_data0,
> > +       },
> > +       {
> > +               .id =3D "LOON000E",
> > +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls7a200=
0_data1,
> > +       },
> > +       {
> > +               .id =3D "LOON000F",
> > +               .driver_data =3D (kernel_ulong_t)&loongson_gpio_ls3a600=
0_data,
> > +       },
> >         {}
> >  };
> >  MODULE_DEVICE_TABLE(acpi, loongson_gpio_acpi_match);
> > --
> > 2.47.1
> >



--=20
Thanks.
Binbin

