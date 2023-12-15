Return-Path: <linux-gpio+bounces-1521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC0814349
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 09:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F4E51F23170
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 08:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AEA111A9;
	Fri, 15 Dec 2023 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Wmme0D5q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466F8111A8
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4649299d0a0so129746137.2
        for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 00:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702627679; x=1703232479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uiOQSE45YrsMt2KVUIc8OGdSe9niHAgFRBdIZwdjhM=;
        b=Wmme0D5q1nC+/bgUmFXO/37vEf+t0F2vY7vSr0B/aiTk86UdaI0aX2mCbgGIvePv9J
         3ppCAT0qOx1XYtKdYjnqr3+ClyMvWeQy46kK08YO3uddLjX2MmJCMlU0Zjz/Z0I2aJYS
         eUONRcGpic+Q+iIs4jBzn+Vvl8/QeKEMv7Hwpj3FIAeAFxdvEUJzQolBZRSSBPw2CZQS
         wlUdlJ27oGwMUxdM75P3HhZPfYlx0Q7PrHW8c7+T3qZ0buHhLpgzyjP6wjJlVrgNuWu3
         dwWy/l9mm+t1IBMjlg8jRmQPCEbpqiwexrtAEQRwxtSP47kikOWyuHFbFz2qTjTXFl0e
         iBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702627679; x=1703232479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uiOQSE45YrsMt2KVUIc8OGdSe9niHAgFRBdIZwdjhM=;
        b=FsR1fza4yKkMl4m2TCWpKKN9g/vw7nXwHwwZNjyavVTqyXCr6qfjLz1TNOjyq+3LR6
         Vq89MHgQn6jOni7Su4PUKXG8M3y/MIbuCeFMAiYe933t2Fyh3sX8lMCRUrykhVEi+HE7
         BQ+qfa+hzXALuCFfSs6ZMb6gEPYBmZ0tuoT6O6L84AxDfr3sWCpNn0oWdse08x+JZhgX
         f9I2ASKrJRsN9+06ZSrW9X5rgDMSP7LTty8w9hveDyTd4v3d0IiQyufBD3GXVqXotHIa
         HAteHw4aJ49MCjJOTCJfjD5Al20d/+yGLS5Ij+D6pMFA1ic0ncOrco3v7pkH/zR9DY2z
         dthw==
X-Gm-Message-State: AOJu0Yy6IsOlDS/5l0Erbd741/MqybbxTc3aUGIHvLhmqOQEmKRrgCjZ
	AJKX+URSV/OXgVrJcE/iLvF54W9RXpxI8vojJiMWuA==
X-Google-Smtp-Source: AGHT+IEIqDaidt6c6oUTWeM1ZB0w5dbsENV6n6ufHVg8DOM+TS6CWMDUE4h/tcqcmJeb5zSXvj1OUPtNDY4oQr0i8lo=
X-Received: by 2002:a05:6102:509e:b0:462:8a7b:8d28 with SMTP id
 bl30-20020a056102509e00b004628a7b8d28mr7856589vsb.1.1702627678978; Fri, 15
 Dec 2023 00:07:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214095814.132400-1-warthog618@gmail.com> <20231214095814.132400-3-warthog618@gmail.com>
 <ZXsZJ9z7iln8uMf8@smile.fi.intel.com> <ZXsajZoQRw7HgHl1@smile.fi.intel.com>
 <ZXsp8QjxsUMPlZIR@rigel> <ZXswRCsT0OYwHe3N@smile.fi.intel.com>
 <CAMRc=Md55pSWwbKqxO-eHJyn1+vtLMuWmD0d1_iqFT4h7dJ4Yg@mail.gmail.com> <ZXumIX39JRpbYrbw@rigel>
In-Reply-To: <ZXumIX39JRpbYrbw@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Dec 2023 09:07:48 +0100
Message-ID: <CAMRc=MfRs79kkXLV5KiH7ehDYq4BRR=eTNh+WNcCvsu8mg_J+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 2:04=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Dec 14, 2023 at 10:06:14PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Dec 14, 2023 at 5:41=E2=80=AFPM Andy Shevchenko <andy@kernel.or=
g> wrote:
> > >
> > > On Fri, Dec 15, 2023 at 12:14:41AM +0800, Kent Gibson wrote:
> > > > On Thu, Dec 14, 2023 at 05:09:01PM +0200, Andy Shevchenko wrote:
> > > > > On Thu, Dec 14, 2023 at 05:03:03PM +0200, Andy Shevchenko wrote:
> > > > > > On Thu, Dec 14, 2023 at 05:58:11PM +0800, Kent Gibson wrote:
> > >
> > > ...
> > >
> > > > > > > +static void supinfo_init(void)
> > > > > > > +{
> > > > > > > +       supinfo.tree =3D RB_ROOT;
> > > > > > > +       spin_lock_init(&supinfo.lock);
> > > > > > > +}
> > > > > >
> > > > > > Can it be done statically?
> > > > > >
> > > > > > supinfo =3D {
> > > > > >   .tree =3D RB_ROOT,
> > > > > >   .lock =3D __SPIN_LOCK_UNLOCKED(supinfo.lock),
> >
> > Double underscore typically means it's private and shouldn't be used.
> >
>
> You mean like __assign_bit(), __set_bit(), __clear_bit() and __free() -
> all used in gpiolib.c?
>

Touch=C3=A9. But this is just lack of strict naming conventions. :( Another
common use of leading underscores are "unlocked" (or in this case:
non-atomic) variants of functions.

> > > > >
> > > > > I even checked the current tree, we have 32 users of this pattern=
 in drivers/.
> > > >

As opposed to ~1200 uses of DEFINE_SPINLOCK if you really want to go there.=
 :)

> > > > Ah, that is what you meant.  Yeah sure can - the supinfo_init() is
> > > > another hangover from when I was trying to create the supinfo per c=
hip,
> > > > but now it is a global a static initialiser makes sense.
> > >
> > > Yep, the DEFINE_MUTEX() / DEFINE_SPINLOCK() / etc looks better natura=
lly
> > > than above.
> >
> > Yeah, so maybe we should use non-struct, global variables after all.
> >
>
> Despite the 32 cases cited that already use that pattern?
> 9 of which use __SPIN_LOCK_UNLOCKED().
> Sounds like a pretty convincing argument to use the struct ;-).
>
> But lets keep it as kosher as possible and split out the struct :-(.
>

I'll leave it for you to decide, I don't have a strong opinion and the
entire file is your code so you should pick.

Bart

> Cheers,
> Kent.
>

