Return-Path: <linux-gpio+bounces-10778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ED198EBD6
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 10:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ED251F217DD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 08:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FC0126C15;
	Thu,  3 Oct 2024 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="trZC9L44"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74E38F40
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727945150; cv=none; b=cbDgWrrmvRFuZVku1byEb6E7U3OILlvcMO4vZDqVjLXFijrefqXw704Y5omvdLRA9WUVcLqIySNsgcgLidlnnz5HOgfsf0xpCao7YpnLUdkH4UhyzDoevyhz5OuLYeZ/ChcXAy/5z0eTKkwMvEFJblHy67DLyiNXkPQHZnzdLZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727945150; c=relaxed/simple;
	bh=C35vDfBXY0RRY6OTT7kDHBVQThWOnE6wKXF/Y0Gcs1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JV8ej785MTOi9SV8jasy8XtCAmEgmOdKw9jeChUQVJpYLe8DCzxMPgYpQDI6BwgC6WimDeTjN3X4nz9mk/RKr/eN+OTjBR72Mck+UV9MHVoYMTrtEMMImVN8uSqrMtGLdgn96eOJNTDoV4ZcOshGVZusfSTWK9jWE1AJMtpRPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=trZC9L44; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad15b3eeeso8226341fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727945147; x=1728549947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzaVFI974o6SeZJYJJ7amGJv13vzsID0iQdBTSEktbA=;
        b=trZC9L44LqJCguA6zkiE+d+yUUqxbyEiwT3WEVs7bJjBQfAo/PGTWve1uSr08PjSeK
         YK+HjvafCM0GUpZ+iTs27Gd29IR939HBNZNaJcuyy1/aztzPr+BefuAeovO54CZnwwv/
         HAmntedWVXDQzlG4R0WwX4ruSzk2QrMp210vH1CApKTAuWmgD1H5Kyql5qf0HU+hDD2V
         Ao/+reYtc5qL0l40fhp4p1xYDmhQ6lb6g9rmL2vBBzxuu8ep9VniYFSU1MxELJQR1dwU
         uHbhAG4MGRWfxdoucHRys61/qNHWp1bIfXIWNPBJeiRhf8S71k6iPcJPoaGfsnUDMXdb
         z3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727945147; x=1728549947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzaVFI974o6SeZJYJJ7amGJv13vzsID0iQdBTSEktbA=;
        b=QTmtmWe/NiNeaQ3Yx/rM3ajIh9RQwaCKUDWweMzOeHua6fhxBe0eSTDsNXxKl9D0EU
         FABQA2DfmllD8Tpdc2r1iOcdZvDEi1Fmwdbp+duC7yoJ6Bmnypu6s4hXxhDvr67mnFj4
         Ci5Du/bBAYUrW/GnbYV7vXSSdtlR7TbiHAWUrAhIrPcGwcnYfaO0Ta/EjMoHoX669CEV
         NRPy1zlsyk7B2OA/jbQQ183BRtV2/qYpepSaFUTY+2jRJy4whh0cSq4xXcw0IA0KtXz1
         qKZ9vXNQ6C1N+XUumuciGWaxySqBSC4VI6a4kiABdwcMDzHQDAdTA3cuIayAWvVVUMZA
         T9SQ==
X-Gm-Message-State: AOJu0YxKUwOO6goFdd46RdVW3SCufRYjrR9mvpU/J0p+p2uh5OYUxbv9
	zLuGYl4xS+3t7iip2du9lt2kELWvjc2+/1omae1JVeFShr504OvE0nIb79Ljvexb07BNjLO4UkD
	7JcNXCzCXs9DNpwvIdR5yKSxpRU5Pzg9gxQv5Cpi8ntNAdoFY
X-Google-Smtp-Source: AGHT+IEYF+3kC8hchPS2CaUpIoOte4/zWBrquzMWMlQx0Qhc0a9s6CTP0B42FwQZXU0kIrExVzmngVV7XLOX5nlfAfw=
X-Received: by 2002:a2e:a584:0:b0:2f3:b71a:1e91 with SMTP id
 38308e7fff4ca-2fae105ae02mr35942921fa.17.1727945146614; Thu, 03 Oct 2024
 01:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McgmBnY5vTKySyjS0OX_wFEitDYX-GQVtsaaYEsozPt2Q@mail.gmail.com>
 <CAMRc=Meo2ObyrpeYQ0TGS5Xhy6_hG7SvGdmrOvX_vVz4R7JogQ@mail.gmail.com>
 <20241003032457.GA63612@rigel> <20241003033640.GB63612@rigel>
In-Reply-To: <20241003033640.GB63612@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Oct 2024 10:45:35 +0200
Message-ID: <CAMRc=MfO2NB0jpzhHU-cU00zVesdofM7EUqd11xmE9sCVdBQ-w@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.2-rc2
To: Kent Gibson <warthog618@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 5:36=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Thu, Oct 03, 2024 at 11:24:57AM +0800, Kent Gibson wrote:
> > On Wed, Oct 02, 2024 at 07:50:04PM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Oct 2, 2024 at 3:31=E2=80=AFPM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > > >
> > > > I've just tagged and pushed out the first release candidate for lib=
gpiod v2.2.
> > > >
> > > > It's a big release that - next to an assortment of smaller
> > > > improvements and bug-fixes - brings in a big new feature: D-Bus dae=
mon
> > > > and command-line client together with GObject bindings to core
> > > > libgpiod.
> > > >
> > > > It's in good enough shape to now focus on ironing out the creases a=
nd
> > > > make it available in the following weeks.
> > > >
> > > > The tarball and git tree are in their usual places[1][2].
> > > >
> > > > Bart
> > > >
> > > > [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> > > > [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
> > >
> > > Well, that wasn't very good, rc1 had a build issue in the tarball. I
> > > had to fix it up and release rc2 which now builds fine in yocto.
> > >
> >
> > I'm trying to do a build without any glib related targets:
> >
> > ./autogen.sh --prefix=3D/usr/local --enable-bindings-python --enable-bi=
ndings-cxx --enable-tools --enable-tests --enable-gpioset-interactive --ena=
ble-examples
> >
> > but I get:
> >
> > checking for glib-2.0 >=3D 2.50... no
> > configure: error: Package requirements (glib-2.0 >=3D 2.50) were not me=
t:
> >
> > Package 'glib-2.0', required by 'virtual:world', not found
> >
> >
> > Why is glib now required?
> >
>
> Similarly (after commenting out the GLIB and GIO checks tripping above):
>
> Making all in gpiosim-glib
> make[3]: Entering directory '/home/pi/libgpiod/tests/gpiosim-glib'
>   CC       gpiosim-glib.lo
> In file included from gpiosim-glib.c:9:
> gpiosim-glib.h:7:10: fatal error: gio/gio.h: No such file or directory
>     7 | #include <gio/gio.h>
>       |          ^~~~~~~~~~~
>
>
> Why is gpiosim-glib being built?  I'm not using glib.  I don't have
> glib. I don't want to install glib.  But now I can't build. Yay.
>
> Cheers,
> Kent.
>
>

That wasn't the goal of course. Let me build a vm with minimal
environment and go through each build option individually.

Bart

