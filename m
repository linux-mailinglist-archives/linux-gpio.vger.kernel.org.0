Return-Path: <linux-gpio+bounces-1604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6875E816B3F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 11:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0F09B20FF2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 10:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90695154A9;
	Mon, 18 Dec 2023 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d/lXs4H+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FCD19442
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7c51d5e6184so859280241.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 02:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702895716; x=1703500516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKrnhG/k4CH/2ssOYwTqTZAwFSpFGjNkbLSrYXrswEY=;
        b=d/lXs4H+VsuQXiHUHncv2NCoIJF9zEWJCzMtZ4DW54/07yG7QJs3ttqAFuS/eZHA0t
         ZCaamwJ0AkPSK6D+APgDTdA+74ou4d2oo/Fz5ovSL3vsFibdJlejNL8wEmdmvyzdLYfA
         GpxROGVdd/sWRUD3EOEFD65Cb7YBtvzgLOz5Au0bvOJY74N6BSdpnkDGFhxE/ybEKnGV
         EJ/Icl6g34xcjbZcNppu262HcxgMOODHOLGIxhlfeQSCryK/gCnxIHukc24iBA/eOyFp
         B1RapFlHO4xh3MhtnKnZuHiSTG0uUCzbi9YTQqeLqo2OIfBKlugQ8q4teRF595ik5qbQ
         WZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702895716; x=1703500516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKrnhG/k4CH/2ssOYwTqTZAwFSpFGjNkbLSrYXrswEY=;
        b=bFfEb+R88C/Evp4JN7oH+cnQCw2/Zi/Vcj8z3NnskmmJorAugJE0Y6LOCn2z1CVd0A
         v2QV/TUNnjATDfjmRzazeN7522TucAgwTrCQke0TtiWmtpw6MRiesS1+nzbzZNDvWIA0
         KizWw1tE36NwJLSD9CXFSE0ybW8S9k0FFjZLVtXFpq7Hf4fYSDxC+YLVYJiP5WtWth8f
         0yorhFOw4L7seCQJ86V2S6WitHRgtsz1SR/AYBhz1sHf0gHH6n+mLiySi2J3cI3HEV9u
         jgfvXQ7Du+BtPsXikYUPtSy7C10rUP+cNEFck3qlxn0tTaHJoG029VbVieSS7vACMOBi
         o2LQ==
X-Gm-Message-State: AOJu0YxQXGeVUbjLsO98rKxcS2lRXtm6swG1EcAsPkj5Oti57y8IIPuX
	NusI8cNHM2N577s+O9OX2FPciwEBn6XVEqnJ+js5zg==
X-Google-Smtp-Source: AGHT+IHmqH+3qSJ/Y7dqSyKgdHLfx6vJ7fuT6ziEoB4me/46MgTAYdahXJV2j8MGtNt5cOiJSPrCVM+uB2TQfZcZOE8=
X-Received: by 2002:a1f:7ccd:0:b0:4b6:b8c7:2bcf with SMTP id
 x196-20020a1f7ccd000000b004b6b8c72bcfmr837498vkc.0.1702895715966; Mon, 18 Dec
 2023 02:35:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231025184259.250588-1-andriy.shevchenko@linux.intel.com>
 <20231025184259.250588-2-andriy.shevchenko@linux.intel.com>
 <2023102624-moonshine-duller-3043@gregkh> <ZTpbMVSdKlOgLbwv@smile.fi.intel.com>
 <ZUPBVMdi3hcTyW2n@smile.fi.intel.com> <CAMRc=MeV9ZyOzuQFEE_duPTHYgfmr6UZU6bpjDPhrczZX4PHpg@mail.gmail.com>
 <CAMRc=MdSpk_OszeDCyA5_Sp-w=sL9DHB2gGCOFP+FCiobm2cbA@mail.gmail.com>
 <2023111513-stinky-doorframe-8cd1@gregkh> <ZXHUat2Xo1VcAxN2@smile.fi.intel.com>
 <2023121512-breeches-snaking-74ad@gregkh> <ZXxr8LD1P63k-xRV@smile.fi.intel.com>
In-Reply-To: <ZXxr8LD1P63k-xRV@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Dec 2023 11:35:04 +0100
Message-ID: <CAMRc=MeBh5Uq1YTvcnGugnvOFYh+rqc7fJpZrSvfmHbwh3SKXw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] device property: Implement device_is_big_endian()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 4:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 15, 2023 at 03:49:38PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Dec 07, 2023 at 04:19:22PM +0200, Andy Shevchenko wrote:
> > > On Wed, Nov 15, 2023 at 03:21:29PM -0500, Greg Kroah-Hartman wrote:
> > > > On Wed, Nov 15, 2023 at 03:58:54PM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Fri, Nov 3, 2023 at 10:08=E2=80=AFAM Bartosz Golaszewski <brgl=
@bgdev.pl> wrote:
> > > > > > On Thu, Nov 2, 2023 at 4:33=E2=80=AFPM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Thu, Oct 26, 2023 at 03:27:30PM +0300, Andy Shevchenko wro=
te:
> > > > > > > > On Thu, Oct 26, 2023 at 07:25:35AM +0200, Greg Kroah-Hartma=
n wrote:
> > > > > > > > > On Wed, Oct 25, 2023 at 09:42:57PM +0300, Andy Shevchenko=
 wrote:
>
> ...
>
> > > > > > > > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > > >
> > > > > > > > Thank you, Greg.
> > > > > > > >
> > > > > > > > Bart, would it be still possible to take this into next?
> > > > > > > > I would like to have at least this patch applied (with the =
first user)
> > > > > > > > to allow conversion of others (I have some more users of ne=
w API).
> > > > > > >
> > > > > > > Okay, seems we missed v6.7 with this, can you then prepare an=
 immutable
> > > > > > > branch / tag with this, so other maintainers can pull in case=
 it's needed?
> > > > > > > (I have something against tty already and perhaps something e=
lse, let's
> > > > > > >  see.)
> > > > > >
> > > > > > It arrived too late in the cycle, I needed to send my PR earlie=
r this
> > > > > > time as I was OoO this week.
> > > > >
> > > > > Greg, will you take this patch through your tree and provide me w=
ith
> > > > > an immutable tag for this cycle?
> > > >
> > > > Sure, let me catch up with patches after I return from Plumbers nex=
t
> > > > week.
> > >
> > > Hope Plumbers went well!
> >
> > Sorry for the delay, immutable tag can be found at:
> >       git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git device_is_big_endian-6.8-rc1
> > for anyone to pull from now.
>
> No problem and thank you!
>
> Bart, can you pull that? Or should I to my tree and then push with other
> GPIO patches?
>

Ugh, this is rebased on top of 6.7-rc3...

My tree is based on rc1, if I pull it, then it'll be a mess.

Andy: How badly do you want it in v6.8? Can this wait until after the
merge window?

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

