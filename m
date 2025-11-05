Return-Path: <linux-gpio+bounces-28108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C2C35811
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 12:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2841A20D7E
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 11:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B51311C15;
	Wed,  5 Nov 2025 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPKEWJU+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CA130FC04
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762343559; cv=none; b=LiPODVHEuNa73weiIQYrQRFfQ6uWP4WJkkYkm8w5LAK2tRkV3q0pYsTUjlghkZG2XIiuTWJa7sid7B+B0ilgOWJhkdSWkSt6agHMl0RTVyfTP7JmjspClYwDpJr4tdYSzgepBj6MkjsfDwHIq5jp/6yYS7OgFy1FJLh56nEqE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762343559; c=relaxed/simple;
	bh=0gaX/c8zQfx44tSR/MSzqkw90P3yVYkFR83Mp3kzZfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EroOHoGv0bmdr/+ZOjHvtrCP6mMgWiF24FBZp8+yGb76Ze6LHnYteNz/K0s7xp5RasBy6poDZ7MX+Nw8SpYV2Q1zY5osQtQhHpW67O8NKMx2qX9C5RXVYf/L+M0yY4SIFokPMuQLYt384yhGVQU2UXx+Max4my+9T8bM1mLLHqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPKEWJU+; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b6d4e44c54aso873580466b.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762343556; x=1762948356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iedBfjMEI/BD2OKkcDXb/6esIeABFAFipHLCvBMMLYo=;
        b=YPKEWJU+C7AqAr9dGp2m9epNa1vPnWgPzUHuZJ/SSAMQog/jOaBOW47FKPlCrp2wnf
         rasTWld3p/OiMNHNJ7g0k2vJ7Evm3Y/Eh+o626jDEN5ut+qJKFnSdMNRWE41gpsNsUuY
         pdpbKKpnwwlqlDet4qAUyngYCiMIsJl6sTAVBGaVorv1B9dAkb2LkK/A+T2CgqV7tP/5
         +X7DH0RpQbb1LTr60YBT6v7YUccmExyvma85N5s3vxL4/UQRppdjIgahTMC1j7TbI9f0
         7SzDI25HJRXKpnKQykl1nDvmXLEl4pl6EEzLmKGILe5GtTb9yJtv7g0Xdz5pXLPxRaA9
         Bmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762343556; x=1762948356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iedBfjMEI/BD2OKkcDXb/6esIeABFAFipHLCvBMMLYo=;
        b=B9soYohfVTGZixyS+MvKe4dSJb2DbbGJXbPOE5V7yYsM5u+Olyld7F21XKKLfRpdgb
         /NKSpMJ58uQ9QfwItuTq8Cy0jQB+4ub34uevpSvlzM8/WF/a5AjSoNOZUo0Uj3oav1bd
         Ao/QsaqTxcjbb8SQPkwZACPIpd1qZsrdXBBAHdGoOlkEwtidoTraDKy/G/niP5dynppK
         UBqI0QxjzW5jtx9y5LAuEmKmdmD41M7M9BrPPHf3e3YzZJF8nAPl9BaI/XA+zu2Tt4VG
         UMH0G8VY6Vc9q0mancXAganAKBrhSlZaRA0+oSAZizKL1w+jVyuR1dohNV0q6X5b3+5h
         BFkw==
X-Forwarded-Encrypted: i=1; AJvYcCVbZ+s70f+deY+LC1kcDQ1R0koO2qjDgmBQDHS/sP+8wlm5jAH45HDjAy7jMYqBrV5alFYmk/MfKjkT@vger.kernel.org
X-Gm-Message-State: AOJu0YwdD2nLEozjrWvGyhREjKyLXl5JrwNrStfv3kDdSZ/Irrdj4QXX
	JQGf8zLhfYSS28O8fsImibbWN3Le9T3kaY7OFpYqvqSLuqVgJ+xzEo6qKTNWMHA3kVuOm6dMXo5
	8NLu+7QzUKkrBwTBpyQnhC7eEB6Kxcp0=
X-Gm-Gg: ASbGncvMblJXWo3Ci0+Vjd7zoKwgSGHQ9L/0hupGguMHzYR9+aeN0IsFqz+pUJLgHsz
	dgoe2miST9p3xr8EKW5zv7yjhlN2ql6h8h/sed8u1FGUQ2M4XTLMKfpTcA+7gTc/LFV+BG0Z80O
	6woGkLi0iMAXflqsuXothnjVidgZ8t02HlTnAlXmKJWgpnOi61DUlet2c8jm0rdWWtqiz+sNAu7
	Pknp8zmRXOZit5EPWITknBPKsfBrgq0ry7pluKgSh+fnhkbvvi9zXW+W1o=
X-Google-Smtp-Source: AGHT+IGoygrIy70PnDbuCu7xRhMXI84nNHjqgH0yxEIwACdXUcARjlwvw2mLsCIXLb4xjM/BO2FWbv7wlW3GA0/LjXQ=
X-Received: by 2002:a17:907:1c2a:b0:b70:b98a:278b with SMTP id
 a640c23a62f3a-b72654f6507mr251548066b.38.1762343555520; Wed, 05 Nov 2025
 03:52:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
 <20251104145814.1018867-3-andriy.shevchenko@linux.intel.com>
 <20251105103122.GL2912318@black.igk.intel.com> <aQs3ls1rKgMOufOn@smile.fi.intel.com>
 <20251105115041.GM2912318@black.igk.intel.com>
In-Reply-To: <20251105115041.GM2912318@black.igk.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Nov 2025 13:51:58 +0200
X-Gm-Features: AWmQ_bkmPnmrwZbGmhE1N0VXqG2zD080rJlzcWK6qJRP7OzdovZ0V10GbhzH4ws
Message-ID: <CAHp75VcLNs0EWLED_5Mmr0V3nVoiEdKNpdoqPypy5i5jJCSd1g@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] pinctrl: alderlake: Switch to INTEL_GPP() macro
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 1:50=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Nov 05, 2025 at 01:40:06PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 05, 2025 at 11:31:22AM +0100, Mika Westerberg wrote:
> > > On Tue, Nov 04, 2025 at 03:56:36PM +0100, Andy Shevchenko wrote:
> > > > Replace custom macro with the recently defined INTEL_GPP().

...

> > > > -#define ADL_GPP(r, s, e, g)                              \
> > > > - {                                               \
> > > > -         .reg_num =3D (r),                         \
> > > > -         .base =3D (s),                            \
> > > > -         .size =3D ((e) - (s) + 1),                \
> > > > -         .gpio_base =3D (g),                       \
> > > > - }
> > >
> > > I wonder if simply doing this:
> > >
> > > #define ADL_GPP(r, s, e, g) INTEL_GPP(r, s, e, g)
> >
> > We can, but it will give a couple of lines in each driver still be left=
.
> > Do you think it's better?
>
> I think that's better because it is less changed lines but I'm fine eithe=
r
> way.

Okay, I will try it and see how it looks like and then I'll either
send a v2 or ask for a tag for this one. Sounds good?

--=20
With Best Regards,
Andy Shevchenko

