Return-Path: <linux-gpio+bounces-6284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC78C1125
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 16:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93B281C215F5
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 14:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA6715E7F8;
	Thu,  9 May 2024 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xe/5+FUO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AB115EFBF
	for <linux-gpio@vger.kernel.org>; Thu,  9 May 2024 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715264609; cv=none; b=e6nIAGdMpvC909QVwOJ4w9BJWEF9QzICFwCrhpXtUcxgxWuUUSp8J/5GZ9sOCavBeXVgKnlAmKEOCXo125XERbu16GTb44EbHCdfBC8ZHQDDA+xL2fXZx8K0aqrsXCr3T4iUIenJEbI4nb4/ANAIbqsUuSF8T+UEyQc0PQn8atQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715264609; c=relaxed/simple;
	bh=x8YbEvJ5Rrjoz438wp7iJllu4zawNPBe8f8Blg9DA5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCn6MFjNA1W39Bn8Vo8wtzVApZSlpgWuyZuSOmThgDXXPNNQZsjwXvQit8kVAJGVys21yUvBdk/DX7prhFZBJl6oBHl04iMMGCBtUOmt2tlvsS/iGg7mOP6H7slICVcurTRBzkc1VGgHISEqW1lh37LFUdwGqprIneWhZgYlobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xe/5+FUO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51f1b378ca5so1609557e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2024 07:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715264598; x=1715869398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVjc1LjrqmSxdG//sxnlz0JVmp1Vm2I+bz3GC1JYLVg=;
        b=xe/5+FUO1TYcu0T2LUugFQZe2dIigZv9T/eHqjfhQCZx4aOdgpp2lKIL960mgn+Q44
         0RYhb4pJcEV2BHiy9BuMN4r3Q+/jKzHIb/M5WmDWtGKnOX1fCRkCCZoh1AHSAHmV9Ern
         DwbcKRZ+g4OB6JkI3+CRjzEMn4t2T8XX4+sdhealOsKmphmnsPBop40/TG4vQyusp0Qp
         +F64nECrYdutcBzu61RF29NFF+CYpY2blfoPw+7xWepCjrEwi0VbFAwu5eb3r44fbgqk
         cj4Y5yDtSdvew0GqF5sFyfhgNkBS/lCedYTU07JzCS1Bo7GM+gHsvWc65FXsea12tK9e
         VwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715264598; x=1715869398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVjc1LjrqmSxdG//sxnlz0JVmp1Vm2I+bz3GC1JYLVg=;
        b=NYVeeAGnf+pCWsYHiXPEtRAAUS348RZmqv8z8PTQwXRohnrL3H18d7rwbawZqrhF9h
         mC+Pr8XwMMVir9gNd8cuWyqUBcNGfH4govgOW4DrUD/0ys/Jnv4/zEAyP8j1xaAQrEIq
         8GH+V7oSWJr1JbXzLRgqFniKmgWQ4UoZ3a/CSGO7RIc3CRfc0X773VUYy9Cfu46Fymcj
         aeb7eKIGIhMyjS9vzLP5u/PVpYB+RQ9v+OOXxluGgx9iRKUE0Zt3HHqGU8elhwp9c+Qr
         eGR1ob58Ephe9s9U14TZ/ZI5o2GwK46bRZt+zlOtGgEEHC87r4tHDOpWcCXCgefyRmHN
         BXlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXutZTnT5mL70izP4qHGo8bhtxVz2cT1MtvFQQ6+JZL05y/YkzibPJ/2IRYFP5EJhJ3BrQOrer3dKPr//ajulVsNvkCwF9JJv6B7Q==
X-Gm-Message-State: AOJu0YyweV/7+BD3CCA0VyDa795qdHtzEOUsYAX5X/MQ5Mu6oBpvLaay
	BLl1YQaEGbPPqkLI2mvyUZUQMA9pHbWe/M+83VB3lpITQdYjLtNkqFBwvDo1JSiusoSbZq005Xi
	0kFpOfcETZI4FF55B4Qbn1Afh3xo8c6CWcvh0BXbemESfYq3y
X-Google-Smtp-Source: AGHT+IGX6/N3LlaCiHP0N1FQCU92d8rxIA1spFAp+CcWnfaynpiH3WCoUzbuAETcuxcjhLgGErA/HmCKRZxrF6Zk7Vw=
X-Received: by 2002:a19:e012:0:b0:51f:5d1a:b320 with SMTP id
 2adb3069b0e04-5217cf3cbf8mr4685787e87.68.1715264598280; Thu, 09 May 2024
 07:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240508144741.1270912-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Me3XOy6HfqjxDQBwnSW9pOCtK_Ry7keJ2LiXGFB88t4nA@mail.gmail.com> <ZjzWlNdDVVBRD-Ma@surfacebook.localdomain>
In-Reply-To: <ZjzWlNdDVVBRD-Ma@surfacebook.localdomain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 May 2024 16:23:07 +0200
Message-ID: <CAMRc=MeuAQgos+=GmYr0X+5Pi+foJaRNwuNM0D3b4-FwxoD2mg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Return label, if set, for IRQ only line
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 3:58=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Thu, May 09, 2024 at 03:15:05PM +0200, Bartosz Golaszewski kirjoitti:
> > On Wed, May 8, 2024 at 4:47=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > If line has been locked as IRQ without requesting,
> > > still check its label and return it, if not NULL.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/gpio/gpiolib.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index db536ec9734d..1f1673552767 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -105,16 +105,16 @@ const char *gpiod_get_label(struct gpio_desc *d=
esc)
> > >         unsigned long flags;
> > >
> > >         flags =3D READ_ONCE(desc->flags);
> > > -       if (test_bit(FLAG_USED_AS_IRQ, &flags) &&
> > > -           !test_bit(FLAG_REQUESTED, &flags))
> > > -               return "interrupt";
> > > -
> > > -       if (!test_bit(FLAG_REQUESTED, &flags))
> > > -               return NULL;
> > >
> > >         label =3D srcu_dereference_check(desc->label, &desc->srcu,
> > >                                        srcu_read_lock_held(&desc->src=
u));
> > >
> > > +       if (test_bit(FLAG_USED_AS_IRQ, &flags))
> > > +               return label->str ?: "interrupt";
> > > +
> > > +       if (!test_bit(FLAG_REQUESTED, &flags))
> > > +               return NULL;
> > > +
> > >         return label->str;
> > >  }
> >
> > What good would it be if gpiochip_dup_line_label() returns NULL for
> > unrequested lines anyway?
>
> Then it should be handled differently in those cases. So, consider it as
> a preparatory patch which doesn't change current behaviour.
>
> (Yes, I have some hack patches locally which do something useful, but the=
y are
> not ready. In any case this one looks to me as a good cleanup on its own =
for
> the sake of readability of the code and reduced amount of checks.)
>

Fair enough but I would like to know what your bigger plan is before
picking this up.

Bart

