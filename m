Return-Path: <linux-gpio+bounces-1506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19228813C55
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 22:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5A3C283699
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 21:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920A7347A1;
	Thu, 14 Dec 2023 21:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e3cHDZo+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CE16DD0B
	for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 21:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1fab887fab8so3193fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 13:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702587987; x=1703192787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crPiDH9/mhEOg/t9pVVthM+Ufb3xJC9KbI2h6yw2zqU=;
        b=e3cHDZo+CZZgILIpUov29tmVsHzNdfShSvlA58t67CAvzN9xoJW75dPPBArm6MT0bs
         O8z/0dQ4GC2d9vVbkOHEvOIBILID+QZ1eT/R01TsGPCreE1RZSdompqHciKpJ8OxJ2tb
         6+yrOe0Ucgy4yoLWfnX0+xZ+CtYKPcdHqCjNPcOaq/if1Gogw0L3a/A7W4+GzKR0Hdkg
         6LefQMBxBo+OVe5ihJ3HrLxa3hdQWjEienMnPr05bwSILTA+V/p4ROwwcMEBert0binZ
         ygzSyKxDZO/ZDPJCjQPVwtBtir1uqPA0fEh2lpml3MfdsVZAHTQYoYaRVNRvJ+qzLVfB
         xdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702587987; x=1703192787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crPiDH9/mhEOg/t9pVVthM+Ufb3xJC9KbI2h6yw2zqU=;
        b=JNnZF1/bdtH2wym9Jcx3nYn9BwEfeI/5Fg6LtJnvsPsokxW1WqbTxiS+hXo39xEIcO
         d6u3avqeHakEVJxekrGlVwbVkmgS3aQcdDU5i49nWvlOi0ji9p5mi0LTaqhX2TTMjS89
         2ISAMSeV68pgYdb5/WAXteE2ibW/CeiN5BRrXcqrym15frFURupuhkV5eqrXYhAZLlfD
         O876nJ7jUeGLhwjDAD88Kudp91Z+askK55Yuzd4EZCmV/b8yEd9FdZH2Ysc5DzZyOVND
         nt5FdQpWwb4rMyJxiQMiygXSa7RUClOb0RdRljbWuWfzHhJSzyE3CpBJA2w1QQwGVejR
         7qTQ==
X-Gm-Message-State: AOJu0YwIwumsUbdR0t7l2f+6yrfidm/DpHS95eSLull8KKkLbyHthDKu
	faMoT9BJ1XfZdxy2KcY9di5ji613TkaUFIxe1OuXqA==
X-Google-Smtp-Source: AGHT+IEbW/pRgBRM2Tbl0EiCqw6habcEinR3uZrs3LL79n5Z6/pJtj4vR8fP0YMhjd29+225jiSzc+QCUtTJIpFZtvo=
X-Received: by 2002:a05:6870:4707:b0:203:58cd:21c5 with SMTP id
 b7-20020a056870470700b0020358cd21c5mr1076743oaq.30.1702587987121; Thu, 14 Dec
 2023 13:06:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214095814.132400-1-warthog618@gmail.com> <20231214095814.132400-3-warthog618@gmail.com>
 <ZXsZJ9z7iln8uMf8@smile.fi.intel.com> <ZXsajZoQRw7HgHl1@smile.fi.intel.com>
 <ZXsp8QjxsUMPlZIR@rigel> <ZXswRCsT0OYwHe3N@smile.fi.intel.com>
In-Reply-To: <ZXswRCsT0OYwHe3N@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Dec 2023 22:06:14 +0100
Message-ID: <CAMRc=Md55pSWwbKqxO-eHJyn1+vtLMuWmD0d1_iqFT4h7dJ4Yg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
To: Andy Shevchenko <andy@kernel.org>
Cc: Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 5:41=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:
>
> On Fri, Dec 15, 2023 at 12:14:41AM +0800, Kent Gibson wrote:
> > On Thu, Dec 14, 2023 at 05:09:01PM +0200, Andy Shevchenko wrote:
> > > On Thu, Dec 14, 2023 at 05:03:03PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Dec 14, 2023 at 05:58:11PM +0800, Kent Gibson wrote:
>
> ...
>
> > > > > +static void supinfo_init(void)
> > > > > +{
> > > > > +       supinfo.tree =3D RB_ROOT;
> > > > > +       spin_lock_init(&supinfo.lock);
> > > > > +}
> > > >
> > > > Can it be done statically?
> > > >
> > > > supinfo =3D {
> > > >   .tree =3D RB_ROOT,
> > > >   .lock =3D __SPIN_LOCK_UNLOCKED(supinfo.lock),

Double underscore typically means it's private and shouldn't be used.

> > >
> > > I even checked the current tree, we have 32 users of this pattern in =
drivers/.
> >
> > Ah, that is what you meant.  Yeah sure can - the supinfo_init() is
> > another hangover from when I was trying to create the supinfo per chip,
> > but now it is a global a static initialiser makes sense.
>
> Yep, the DEFINE_MUTEX() / DEFINE_SPINLOCK() / etc looks better naturally
> than above.

Yeah, so maybe we should use non-struct, global variables after all.

Bart

>
> > And I still haven't received the email you quote there.
>
> :-( I'm not sure we will get it, it most likely that I removed it already
> and it has disappeared due to problems with email server...
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

