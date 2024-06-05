Return-Path: <linux-gpio+bounces-7203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD268FD62C
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 21:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BA4DB21F5E
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 19:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216D445030;
	Wed,  5 Jun 2024 19:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+OcAXir"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D73C133
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717614255; cv=none; b=KLCNeKqT4s8mTT4A5g9DkvV60PQWnFHdR3OLDEMLJAQQDiy+CEe5yRlq4Aajskl2h8lAt7har+chRvfeeTpn1M372DZvan8M4rr3wG+7kSKjEzQwTcjM5GITv+VRsai4Hri4US+yRdYPL3916UuvCPqUOLS5k0eGeu+ZbUwtOCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717614255; c=relaxed/simple;
	bh=cxPz0mLgERFA0WC5mtFFg/LPxhSxDHo5FdX6jgZRRIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=relbEQa7f7MjFgg0e5fwzHfo0qKdyf9ww4Quia5ekLplh4k6SXuyHPO7IYc+vWO12WnBX/DG4We5Cq/UQbWeR4ROzegEttGqGPqzMORhHNMwreFw2MJNMRcjq/wvXKEdIcXZYVVnMzD59H7PoUCCpmRy58gclJO+m/K3TMC7d7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+OcAXir; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a63359aaaa6so22266466b.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2024 12:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717614253; x=1718219053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh71ZSxxFua5UsJmiWrAn4VvcZX7vPDfF1OxNk1pmOQ=;
        b=T+OcAXirEzG61pQYBjOGgto0g5Rg4WO9jVO2p3cyMCmG4OJKzEUnH8jCpoSbjPdMNA
         LCkxoTbxp0hyqCKD1H/m0j9iq2QZ2ggD1uAANxgcaWpXW3Qzrh/e00GpEkv/dsCk5Wwm
         i4ziwcyuTOXPEvxhLdeXc+qUQki+EyFS0apbcKJbIPlg1QYDoOfwXhsDIMZ1vT6mw++d
         w1AeMGSdYkzoqhsV0MQdaPTrXVKPx/uVeWIPsg2XUBwnvkXOeyiCAIitBnQlvZfZ5ntr
         cnOAF2Dc5Mhz2EANFisIIJUIXO2sDgWpKOq1iDYmo2vm+S9H+yaH2xFnMLMVEOIbd8X8
         eC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717614253; x=1718219053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xh71ZSxxFua5UsJmiWrAn4VvcZX7vPDfF1OxNk1pmOQ=;
        b=LuBWOy0Fx8hrjGcu4fS/YMkUHyd4WFrdpSO1sPmNksUdU2bMcS+zwbqGVJRt3P7ifb
         RIPDuIWYmEaDTNG75nc8EmgBlbE6s0xXUBz5smKMQCTTgoGK2UGWPdF8XKHLgva/jmyC
         QRkaheCL1v5Lh64i2slAyutebxulfu5IoXYzna02hFOIHna4D66Vm95Cz9LXkHY7Bj04
         Fhz09HVz+5/Q3QaVJQNkUil9+alpW83D3BEdfSLZzQrGuDuHJUrONH4Afs3adCGNXMak
         xWjHfXqxJ+6JulB+GE/6SSqSlUvKUjhJOM/t5bNdhUclTu2wvXQ3tZ2Pu8R6giRzVzCZ
         sRPg==
X-Forwarded-Encrypted: i=1; AJvYcCXRukekOuU8uAH1bgFK9oVeO5bAQu7YoxJMC/9b3v4oi+6riZzPgybWCa29XNSA/486cS2s34zx61WmdP6U0FMxbajSsZsVG8R2sA==
X-Gm-Message-State: AOJu0YwhD59cqa6HRtjVeIs7tSMNW8I1dnT0ltT/TMSE4BbeC6KS9Ej0
	5nbfbIJjp33wdlUg0tkLm2O+jjJhZWggOHx71CHbIb2sP6WW3dULFRNt9of5T7UpVeuII7JNRE4
	rOl6g8Yh9Vr3DxCelK6RVr/Pfeds=
X-Google-Smtp-Source: AGHT+IFV7sCTmuoMWxPwMTfZ7pw9ClPnGKlQdVQc1LeidomVOKHdzQe2DOE0iWJKDVSFs9zC8IM4SqejPBDSD9wMOfI=
X-Received: by 2002:a17:906:3516:b0:a68:cc6f:cb5a with SMTP id
 a640c23a62f3a-a699fdfe2abmr224118766b.68.1717614252579; Wed, 05 Jun 2024
 12:04:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-4-kabel@kernel.org>
 <CAHp75VfsUZ=1u4dk-YniFpOSwWVSo6Qg124RBJAikBwu2Hj1vw@mail.gmail.com>
In-Reply-To: <CAHp75VfsUZ=1u4dk-YniFpOSwWVSo6Qg124RBJAikBwu2Hj1vw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 22:03:36 +0300
Message-ID: <CAHp75VfrRMXi2HkVESe7HaLfwNd+6dhDiis_ZvOebUiVzumF9w@mail.gmail.com>
Subject: Re: [PATCH v11 3/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 9:29=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:

...

> > +/**
> > + * omnia_mask_interleave - Interleaves the bytes from @rising and @fal=
ling
> > + *     @dst: the destination u8 array of interleaved bytes
> > + *     @rising: rising mask
> > + *     @falling: falling mask
>
> Why so many spaces before @? One is enough.
>
> > + *
> > + * Interleaves the little-endian bytes from @rising and @falling words=
.
> > + *
> > + * If @rising =3D (r0, r1, r2, r3) and @falling =3D (f0, f1, f2, f3), =
the result is
> > + * @dst =3D (r0, f0, r1, f1, r2, f2, r3, f3).
> > + *
> > + * The MCU receives an interrupt mask and reports a pending interrupt =
bitmap in
> > + * this interleaved format. The rationale behind this is that the low-=
indexed
> > + * bits are more important - in many cases, the user will be intereste=
d only in
> > + * interrupts with indexes 0 to 7, and so the system can stop reading =
after
> > + * first 2 bytes (r0, f0), to save time on the slow I2C bus.
> > + *
> > + * Feel free to remove this function and its inverse, omnia_mask_deint=
erleave,
> > + * and use an appropriate bitmap_*() function once such a function exi=
sts.
> > + */
> > +static void
> > +omnia_mask_interleave(u8 *dst, unsigned long rising, unsigned long fal=
ling)

> But rising and failing should be either u64 or unsigned long *.

Ah, sorry, I misread the use, discard this single comment.

> > +{
> > +       for (int i =3D 0; i < sizeof(u32); ++i) {
>
> In other cases you use:
> 1) unsigned
> 2) post-increment
>
> What makes this one special?
>
> > +               dst[2 * i] =3D rising >> (8 * i);
> > +               dst[2 * i + 1] =3D falling >> (8 * i);
> > +       }
> > +}
>
> ...
>
> > +/**
> > + * omnia_mask_deinterleave - Deinterleaves the bytes into @rising and =
@falling
> > + *     @src: the source u8 array containing the interleaved bytes
> > + *     @rising: pointer where to store the rising mask gathered from @=
src
> > + *     @falling: pointer where to store the falling mask gathered from=
 @src
> > + *
> > + * This is the inverse function to omnia_mask_interleave.
> > + */
> > +static void omnia_mask_deinterleave(const u8 *src, unsigned long *risi=
ng,
> > +                                   unsigned long *falling)
> > +{
> > +       *rising =3D *falling =3D 0;
> > +
> > +       for (int i =3D 0; i < sizeof(u32); ++i) {
> > +               *rising |=3D src[2 * i] << (8 * i);
> > +               *falling |=3D src[2 * i + 1] << (8 * i);
> > +       }
> > +}
>
> Same comments as per above function.

--=20
With Best Regards,
Andy Shevchenko

