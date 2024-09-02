Return-Path: <linux-gpio+bounces-9558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C89684F2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A899A1C22CAA
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0796E1865E9;
	Mon,  2 Sep 2024 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ir87Uqmz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176317DFEC;
	Mon,  2 Sep 2024 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273504; cv=none; b=ePW2U6khEc98OtntH6wyqZ4izZ77cQlIN4bdhYB/ul7ESVbc7yZmnT1v1rdq2GclRLlRsSKMZ+u3CDGxdUKPJRZ3fAipzuUzbcl2HRbhoTDLK2RdhF2TLMVobhtYmURFcvDRWB5LsoDBa1xsmkOwKnZ2/CMlxtxBs/lPBNTHtMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273504; c=relaxed/simple;
	bh=i+viYPU0qK91UKf3nPmpaXNZabo4AKsZNpxfl0lqpzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIn10fzKAZSZfNL3GkD02zi2zMK697Ac4M3yKS5/ha6TiX9H63ou86WX5q8gaSuVgEWOJd4nKsoqZ9cLVgZQvFl6zKpGhUN30vXJmBw5WOJNSpkwkkKfd8Vg9L/3vHAQIs15mE4gE7HIZ9CmJau5gLc03XrInK2yPpWfJy/zORk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ir87Uqmz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c210e23651so4234143a12.3;
        Mon, 02 Sep 2024 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725273501; x=1725878301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksdcTnYAH59tM2Big72l4k+RjOzkiPajKsDKd7kafM8=;
        b=Ir87Uqmze2zuNNzKjFuVSatBUuoanvEovw2Iikid6yipB3JrifWECRKAxZfvye3iTa
         mj7QShAYDb+93IMMi2IxM+ACo6L8yhRLWnmKvXLIWm3rCJTWLXTMnPNT+VxinYJMt0sQ
         x7T0H5AO56l/OX9+dSVfp3I7bn9lMPW0DMekZQkPtLiy2tb0yBrwwlf8EFOOaLAVnXlc
         WcrSW7Fxscx/gxS5jZuNZE6xKWqRftjN7laUVOQwSTtIBd7xIjxyj+RWeH4KOxmpy8pc
         WCeqGu5o3Q+YCCtacT8dOJ7RIFGmJxoNMskvvp6nVeX1Rf3IGzpiug2Q2YPiC02sg4nz
         EnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273501; x=1725878301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksdcTnYAH59tM2Big72l4k+RjOzkiPajKsDKd7kafM8=;
        b=uAv37yWZY7v7LW+UcCfjYLCqlyyujksveTwhLB1a2XmVoD4XF9mpiGiUqLn/hX+4Mr
         tB0wiUQYoVffatjQlQHSosccIwHbuvZIR9pcsCBGHpEQhNKSRwtmsXLQ6yi3/FFdyIOH
         BEgrs80NZgDZynXEkkE+XkESYm8pXyhDu348Nobml0BDbqO6rpdiLqx7ZAyxp3yBWtDP
         Y8tGF9M0Y6CYaWrR6D4jnFmJ9a/Pj+bn1ffxRDkkTc8Bln02i+RRPPJnaybkFTJgyVSY
         6paLTdWaSjFzHeVu1+RRAC9vKDnyVAWfQ3PkcxpZGdk4FTlOp0V57CBTU+/KxGpwUSlt
         gUnA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Nd+vRzg07rJuBDkiDhmrmXqXYTVx4m1lsb+bUBbwNCUXvJ8G+1W+2+t1k6NdXKKUDvGrAcKisiMctiQO@vger.kernel.org, AJvYcCXCIOi2eVIRPIzBSxYMqOb9bPGch3NESLogFV0iz8AC1xF6/4eRGsYrun/sR4mr+K6s3TZHuH5Zx9/t@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6NBWfCQL+epw0YgXxQAjf8WpHiyZg969FChoa3Yfr7V63ynjP
	xtR3lnbhbeXu8+JN7TSLJoYB5RQa3+8jz4o4l930YCpdT/2qCNmUrGHPp0qaG0cujQWFWoKQlH6
	VfdknG6Qjp0ujlXO5ARVjFlO4Pus=
X-Google-Smtp-Source: AGHT+IErgsyayCGGg7UfwSMQvGyoH1oFoE2XgSvI7ZtAK/nKXjNgf9h68FfHcpvQV64QT+dpSmmfTHWk4Tj99xozmNQ=
X-Received: by 2002:a17:906:6a25:b0:a86:b32f:eee6 with SMTP id
 a640c23a62f3a-a89a3820bd8mr789028066b.54.1725273500408; Mon, 02 Sep 2024
 03:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
 <Zsy6pZ9LYDk0LOHs@smile.fi.intel.com> <0187710f-73c1-4ee1-87f9-384101f0c32c@linaro.org>
 <CAHp75Vfq0kEN-VDd=aTycHH+oEkUHt260nH533UWnkoEnGRhjA@mail.gmail.com> <CAMRc=MdGUYQFJ6GnryL51AKPpXOW5FuV+SZxAtqt+moJpvLQ7w@mail.gmail.com>
In-Reply-To: <CAMRc=MdGUYQFJ6GnryL51AKPpXOW5FuV+SZxAtqt+moJpvLQ7w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Sep 2024 13:37:43 +0300
Message-ID: <CAHp75VfCi4x-h-E9b3kw3eoOTDaOae5b=dzBiXo+cn1Tyy-gQw@mail.gmail.com>
Subject: Re: [PATCH] gpio: kerneldoc fixes for excess members
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 1:09=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Tue, Aug 27, 2024 at 4:02=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Aug 27, 2024 at 4:55=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > > On 26/08/2024 19:25, Andy Shevchenko wrote:
> > > > On Mon, Aug 26, 2024 at 06:18:50PM +0200, Krzysztof Kozlowski wrote=
:
> >
> > > >> Drop kerneldoc descriptions of struct members which do not exist t=
o fix
> > > >> W=3D1 warnings:
> > > >>
> > > >>   drivers/gpio/gpio-pch.c:101: warning: Excess struct member 'lock=
' description in 'pch_gpio'
> > > >>   drivers/gpio/gpio-syscon.c:46: warning: Excess struct member 'co=
mpatible' description in 'syscon_gpio_data'
> > > >
> > > > I prefer on per-driver basis, but since it's simple and I have noth=
ing
> > > > in my queue,
> > >
> > > These are so trivial without impact on the code, even if W=3D1 report=
s
> > > them, that it would be quite a churn to handle multiple patches.
> >
> > Even trivial changes may lead to Git conflicts if managed separately.
> > But as I said, there is nothing in my queue (at all) so there are no
> > chances for conflicts.
>
> Is this an Ack for me to take these or do you want them to go through you=
r tree?

I was under the impression that I had sent the Rb tag (there was an
explanation about my preferences which do not prevent this from being
applied). Should I resent it? (Yes, I have checked and it's there,
`b4` should catch that.)

--=20
With Best Regards,
Andy Shevchenko

