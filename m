Return-Path: <linux-gpio+bounces-16305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9716CA3DB4A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF5917A7C63
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110161F8AC0;
	Thu, 20 Feb 2025 13:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nRZeRb63"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39368433BE
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740058075; cv=none; b=mPf5IPkU2wSUA/9sG/GS66kyhmjQiutmj00sSskCe4HaNDXngAVw+obNFP9ISRTWwlgnCUFAWsBsmqaQHBspw8PSXX6OOatieIvRUZwOBuBZFYeCu9ZkB4vYIm017zAPNEgHp8i9ecutYu/sHrci0QCNBkYq/BWhq1xI8o3rCHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740058075; c=relaxed/simple;
	bh=6BkBI5Gd2bF1hdg12e0QkK7DeXVoF4QW5+2hQ/uruDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6tLWSKJS9HkmjhN1YyKiK5OQ3rX62VKtDBIE6GWwOrlx2+h9dTEbxAVAwHKsiDEOcmf2u/YvjssVcZRaucIhMa/0puDZPJv9uBd8Gi1zpBRAzlvZr0ass4YlWYix4gAnl4l/aJjOgJ+QC3enqeGbOinvzelpYtHZfR+rG4ktDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nRZeRb63; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5461f2ca386so824507e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 05:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740058072; x=1740662872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPGM0Dy2UNo1ssIZ8BTfYzSP17FQ21N+lE91j18vuXw=;
        b=nRZeRb63Uc4UKxcbuxnbHDuiNgJraaZS2tpWtvJb3HFYsiqAKLNTLD2QM9UoYTAvSH
         TSxBfOkcsRqJtqhetdxLPAlxinKRxXD9Zu8fEctrxpAKogiMnSjyAloYu1QwZgXoeNjv
         S98MHhQ6coZS7XocqMDJrM01Do2mQNRbmhDYAsFb3/rBEQDI948XeiFZ1JQ/d6CTIVzS
         Slvo29yUfWeGbTMuzGlgzSoYx7jVyYgcvDq225M9QeU9hMhmfjq0ut/d6WIH3nxKim1N
         QWWMsWKdSP8FgIBY7+nYk0Semh/GZtASpxoXy2m/y8rBlaz8B0k1NmaRJf7/I0JKhsr+
         djiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058072; x=1740662872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPGM0Dy2UNo1ssIZ8BTfYzSP17FQ21N+lE91j18vuXw=;
        b=jQ28Fjm4tsJshXGuMlMMVmbrPgUjCNmN9acKtZMte6t2atRMrXq0I8dlLDADP5xEba
         1p3c7qr8f2/+6PRy4nwfPcmE+RRCbBSfIHK+c4G0/qLyjCZU/BYnZ/H4YssxHd9VEzaS
         RfIKmP/k1Lla/ie7k7SVPu2VapK6FA3gNslz1dyBvptBIl1zfswY0V5yenDXS7PGWDHu
         +X+srtZTvrcJpVulEzTa6XY1ch3XtaasNBcDKAhw3arZGJrBzxQsH1kb8D5E/UYQD0xq
         Rk4c2SS9kP8zcmUFofMBJgefKvdlirD5J0yRMb6bUoHg9daFbe9upjGoX2uT/qiZWuD7
         yNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVO5JOD+qNqzLsz7uCuEM9BtedFEi+zOUZ/hiCSyaC0KBS6eexdOaU4NbWZJbd2dVKt1f/g2Tz3PdJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxtkdNDrGVt8r/MyGqVKL2nsbP/uuJlX+VQ6FJ7Oh7n9agv2xIj
	Ehm7mNY0LT43NCAdSqbWLLAv3cQH3/EgCCgaCFe81gmTIOd7xAmO8ROt+Ohrj9T/4uJTGsys0mr
	cVZqrGma8fB4EhEBVpXGdll8rIarjOU83SOKdqw==
X-Gm-Gg: ASbGncsdDsEE2wETQeZPwlj0iUdxcy0N8ebc1yXhq/stnEENGX5yvPdpShj4HLeMd4u
	doaaT83WI9Al1qwhN8ms6vVZBM8W7LYF6qt4sQbOJA1knn/EUzbR26igMJbJDaGuGov37piZP0q
	4nWKyjIEJoITstjmijapV1fFRxxIM=
X-Google-Smtp-Source: AGHT+IGSZVfzxxbFXkY8BozGTpomSzvXO/Nkzfje3a6QIEJGJaDDJkb3Ug0/D7QG4zLAD6dqGwsP5Tj8aQGydHRLk+I=
X-Received: by 2002:a05:6512:a8f:b0:545:576:cbca with SMTP id
 2adb3069b0e04-5452fe2ef99mr7309914e87.8.1740058072195; Thu, 20 Feb 2025
 05:27:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218160333.605829-1-koichiro.den@canonical.com>
 <20250218160333.605829-2-koichiro.den@canonical.com> <CAMRc=MfmG0okVjV1nH78Aw18dFcoOAZ-UwU-iFc1VKb-BVcTxQ@mail.gmail.com>
 <CAMuHMdULzDfdg-7HBk1f-Z+AZ5L2WGUEiPMqtvk+bNSkLb38BQ@mail.gmail.com>
In-Reply-To: <CAMuHMdULzDfdg-7HBk1f-Z+AZ5L2WGUEiPMqtvk+bNSkLb38BQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 14:27:41 +0100
X-Gm-Features: AWEUYZno3M-1ByREZhBH_WKPV6W6h7A0ywwN3um7MfD1bLyCpNDJS6PhbZWodPI
Message-ID: <CAMRc=Mecp9se3dTLkS6AokP3N=GHJ6CRNCuYipMfjd3crYkNWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: introduce utilities for synchronous fake
 device creation
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 2:24=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Thu, 20 Feb 2025 at 12:06, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Tue, Feb 18, 2025 at 5:04=E2=80=AFPM Koichiro Den <koichiro.den@cano=
nical.com> wrote:
> > > Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> > > platform device, wait for probe completion, and retrieve the probe
> > > success or error status synchronously. With gpio-aggregator planned t=
o
> > > adopt this approach for its configfs interface, it's time to factor
> > > out the common code.
> > >
> > > Add dev-sync-probe.[ch] to house helper functions used by all such
> > > implementations.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
>
> > > --- a/drivers/gpio/Kconfig
> > > +++ b/drivers/gpio/Kconfig
> > > @@ -1863,6 +1863,13 @@ config GPIO_MPSSE
> > >
> > >  endmenu
> > >
> > > +# This symbol is selected by drivers that need synchronous fake devi=
ce creation
> >
> > This comment is unnecessary, please drop it.
> >
> > > +config DEV_SYNC_PROBE
> > > +       tristate "Utilities for synchronous fake device creation"
> >
> > Please don't make this available for users to select, this should be a
> > hidden symbol only to be selected by its users.
>
> It is still useful to make it visible for compile-testing, i.e.
>
>     tristate "Utilities for synchronous fake device creation" if COMPILE_=
TEST
>

I disagree, this will get plenty of coverage being used by three
virtual drivers.

> As it does not depend on GPIO at all, I think it should be moved
> to the end of the file, outside the big "if GPIOLIB ... endif" block.
>

Indeed. And eventually I'd like it moved to lib/ but that's for another tim=
e.

Bart

> > > +       help
> > > +         Common helper functions for drivers that need synchronous f=
ake
> > > +         device creation.
> > > +
> > >  menu "Virtual GPIO drivers"
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

