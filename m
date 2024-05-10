Return-Path: <linux-gpio+bounces-6307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C58E8C294A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 19:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA8D1C21C2C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 17:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023441BDC8;
	Fri, 10 May 2024 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z5DxnAXS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D045182C3
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715362232; cv=none; b=bEtxQEPmWIuzA6wFPfXJHjJJF5v1lMOp+qZxjrhmuYhwF6Sa7pNDFGAkrkiLpVO+SglhH3UvPX0O4PXxwSVK9oJ17/RaHc3BX1Hs7Ds6pVcPY1B7+gF0rYPtO8O+tYdh0P3KmMMmraZyzdhK/iWhpGYxjOlq9rfLGw3EK4ngtrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715362232; c=relaxed/simple;
	bh=hafeYmzmAmpFYvZ7IQk64xn7yeH+cV6NM/sBG+qZIQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS226zdhf3f6PiVZOK3y2h/csnzuD7BZ45hdP2sJuf4gd1VcVX0pH586xabu5UzOgBWRNJCd7T9f+ERQSy6SMMAu7t3wZ1sYSPnmuGzUzRA3CzFpXeob5vPfXQ2ErbgTQ2qHWZaquwUtDB8picuqlwom5g5ds3imbGjgfZwh4JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z5DxnAXS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e4939c5323so27898501fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 10:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715362229; x=1715967029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hafeYmzmAmpFYvZ7IQk64xn7yeH+cV6NM/sBG+qZIQM=;
        b=z5DxnAXSU6ZymtGwCgl7RhDLkoyeQShwzLHeC3oRrI8grVbsrRjD2F6kI0retIwtds
         AzD71/v8wpW+At9wGN1DGlQFgkAlMsd0SoM6zjiG2MPOf6/x93Bwv3z1POy2LdzTW2mj
         iyW+cd3Iyfb/azfhTfaTM0dRtwgJPca7NBF59yrDl9waS6rbioewZNO6JhzFD4ZIwzmG
         wqMO6CUWK87BFc/0w3WRlnKK9hD72Nvck79mb5erDks0Tqk/Rdb78yn0wFwMYcnPc+xj
         6geRr1wHbBAv74X4cdu3ud92F2Q+mRQ0ghdq2zboJD7+vWYq+HxRqOkhBu0eWl1UZ0Ag
         3MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715362229; x=1715967029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hafeYmzmAmpFYvZ7IQk64xn7yeH+cV6NM/sBG+qZIQM=;
        b=A04FN/WRA3RK0aCWdX2EoRr/SIhC8aZu42pbL8wVnFdLB58GJNIE2LNOuvR5rG1SJt
         nX3zE78ZbnnRQa7goUWQxrDQ+Nj8xctfivkKmCMSSg6QE7zu6nfoy5pREQXHtWr2gCue
         C/HDq5uq2oDmKS11iIsgaAhdy/HXXRNrR+Lj8YPsFDV+SxU3ogzobC6iivMvE8u2mMTk
         k8qdZyPylTwL3H32wADS4RwLAYTb5uvAlg3LcftQv+fkAJarBhQcOIaqXjzp3VogSLKv
         StpsMPN9+gmBduRBR2+eRUIoxw+mBKyBKZQH9kntCoIkrSz69oGwYt/Dz0/IDz4p7rkd
         3fZg==
X-Forwarded-Encrypted: i=1; AJvYcCU8fGGsL1adEDFS5m72G851O7MQV18Nlsmf0RY/PvlfvMtkvSvPeR7JAEpsO2c9UkYyE4+PGdnuUw9JWYRsYcT07ht2vFWY473NyA==
X-Gm-Message-State: AOJu0YxpoAe+/JPp1CCufWtGx19LVJzpBKAeuNML9FwTJPQwY1tlYiJi
	ybLfgDvdkwvcvPxj7GKbJWtu2jbMoNG9XzeNcctuNZST1EVCVgUJlJka3/kdgU9x4+mro2ZFSuV
	FRBvWEEeOzMUCF3zlfEpHkJiGewttAYVV/yjmdQ==
X-Google-Smtp-Source: AGHT+IFC5U4tUTLmtZfD1n42fYZlcbiYrt6+0cTV9kidbE7Q74IhQSc8NPztNkj7UmseGnDFT/K2R3KJqoFmdm2dF3g=
X-Received: by 2002:a2e:a40f:0:b0:2e4:a21a:bf7d with SMTP id
 38308e7fff4ca-2e51ff5234cmr33610941fa.21.1715362228679; Fri, 10 May 2024
 10:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240508144741.1270912-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Me3XOy6HfqjxDQBwnSW9pOCtK_Ry7keJ2LiXGFB88t4nA@mail.gmail.com>
 <ZjzWlNdDVVBRD-Ma@surfacebook.localdomain> <CAMRc=MeuAQgos+=GmYr0X+5Pi+foJaRNwuNM0D3b4-FwxoD2mg@mail.gmail.com>
 <Zj5AZMycTCPUoT-l@smile.fi.intel.com> <Zj5B5ONDI7DB86on@smile.fi.intel.com> <Zj5F8tidsVPkDGEi@smile.fi.intel.com>
In-Reply-To: <Zj5F8tidsVPkDGEi@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 May 2024 19:30:17 +0200
Message-ID: <CAMRc=Mfq50x5RUM76yYXG9hGh4vGTO2hTgFeO8Ty1Z0p3oo_2Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Return label, if set, for IRQ only line
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 6:06=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, May 10, 2024 at 06:48:52PM +0300, Andy Shevchenko wrote:
> > On Fri, May 10, 2024 at 06:42:28PM +0300, Andy Shevchenko wrote:
> > > On Thu, May 09, 2024 at 04:23:07PM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, May 9, 2024 at 3:58=E2=80=AFPM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
>
> ...
>
> > > > Fair enough but I would like to know what your bigger plan is befor=
e
> > > > picking this up.
> > >
> > > I stand corrected, this patch has an immediate effect on the generic
> > > gpiolib_dbg_show() which does *not* use the above mentioned call..
> >
> > Ah, but it doesn't use gpiod_get_label() in the else branch either...
> >
> > I want to amend the else branch there to print similar or reuse the mai=
n one.
> > For the latter I have locally a patch to modify gpiolib_dbg_show() to s=
how
> > the interrupt lines as well even if they are not requested.
>
> I just shared that patch, if you are okay with both, it would be nice
> to have them applied.
>

Not for this merge window, we'll see in two weeks.

Bart

