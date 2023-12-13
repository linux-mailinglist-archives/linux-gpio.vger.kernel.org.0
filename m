Return-Path: <linux-gpio+bounces-1388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BAF8118EB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A00D71C20F61
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD3E339BE;
	Wed, 13 Dec 2023 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jAqjbAhu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8353E189
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 08:15:50 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b9d8bfe845so5467487b6e.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 08:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702484150; x=1703088950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5XWSXMuQI8BI27DjafZ4lKITNNCK67srbDQ/z6mcEI=;
        b=jAqjbAhu40L8XpY/FnbgTCGqyAnN+HRcEw5P40Dqg7bWwuvWF1xU/Wwp63kLyg39wv
         nLB9iSgeytjhW9kT1P0Y6/ewNFM+KJ96lOtDcLcRFWQI82v/WCMUG1p5mgLQ6785rfGB
         p9gsnmZBhkIIWTnqcOaPBSSkyb9xSGogB1yzAmb0M4OO2MhVYDruQoRuwNPiPIt01cft
         5Aor9lLApHt4ihRXGlpL1lReFl36pzAbT916UOidrXNwhmD1OfGu3zTgWh86JsVy6FT8
         IFC/DfkOon7MmaljykrHf/sbNuL4zBzDlcRgknOiAvcikpVZU6EaeB84ZPf6NGnxE0cF
         YgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484150; x=1703088950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5XWSXMuQI8BI27DjafZ4lKITNNCK67srbDQ/z6mcEI=;
        b=wV5VwwdDVrjcR6umtZXuxEIjrLHrrhGlIaVm1WlGOvQZax5DyKof066pKzLXp8YeLB
         KEwIvEQMuucSTVLDvMI/FJMkWygJ/geC18Cy/+JgeFej6CKZLgQVUQPHpdI2lZpC0rH/
         lMJvLAIx3LP/YNyRpoeOS/TKk+OsY7AUcCwbrnPor6Ww+0i30BEpQPei/N9rI9Lqau30
         ewEeUsZNgU0p8Zd4lJkCpmE+kjE64n64h5V7Q3+XRt9FKfl0PXeFLAAkkd20Q2pOpTOA
         vq6abKxHz4QgVnYcJLaoYMIKjSxoDQXEPv3B/FZoOlbUCZuJhsoMkFV2F7hT1AHBQfBs
         lw9A==
X-Gm-Message-State: AOJu0YxhUIK7kGvrkQoswjNiEI8AoHB4BezViLnRW+6a4pf94BpEIfBl
	Pa2yKiGhejK2IA63yGBPjDtkOC0L1fik0bh9tM9uzw==
X-Google-Smtp-Source: AGHT+IFraZO3jsnWkGUMiU4lZ1k+V+8gA8whh3mCPldcM0DVWAezqrzi89KMaZmw3vakQVagqavL7HbgEe41mndYEvA=
X-Received: by 2002:a05:6870:392c:b0:203:13ec:ab01 with SMTP id
 b44-20020a056870392c00b0020313ecab01mr2449120oap.86.1702484149882; Wed, 13
 Dec 2023 08:15:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212054253.50094-1-warthog618@gmail.com> <20231212054253.50094-2-warthog618@gmail.com>
 <ZXm3rayrcvfO1t1Z@smile.fi.intel.com> <ZXm_WsIpgIyOUNHt@rigel>
 <CAMRc=Mfri8K4ZqcHb_eQY6gi+q_-uBZc2wiMrrb-+a7Tric3FA@mail.gmail.com>
 <ZXnU3tMYCc2Rw8Qv@rigel> <ZXnX8jPHxRLW8lhi@smile.fi.intel.com>
In-Reply-To: <ZXnX8jPHxRLW8lhi@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Dec 2023 17:15:38 +0100
Message-ID: <CAMRc=Mfj_4YvQVP=UWkULBwJniDDjapttU+qSgqfN5ZWNgikKw@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
To: Andy Shevchenko <andy@kernel.org>
Cc: Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 5:12=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:
>
> On Wed, Dec 13, 2023 at 11:59:26PM +0800, Kent Gibson wrote:
> > On Wed, Dec 13, 2023 at 04:40:12PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Dec 13, 2023 at 3:27=E2=80=AFPM Kent Gibson <warthog618@gmail=
.com> wrote:
> > > > On Wed, Dec 13, 2023 at 03:54:53PM +0200, Andy Shevchenko wrote:
> > > > > On Tue, Dec 12, 2023 at 01:42:50PM +0800, Kent Gibson wrote:
>
> ...
>
> > > > > > +static struct supinfo supinfo;
> > > > >
> > > > > Why supinfo should be a struct to begin with? Seems to me as an u=
nneeded
> > > > > complication.
> > >
> > > I think we should keep it as a struct but defined the following way:
> > >
> > > struct {
> > >     spinlock_t lock;
> > >     struct rb_root tree;
> > > } supinfo;
> >
> > That is what I meant be merging the struct definition with the variable
> > definition.  Or is there some other way to completely do away with the
> > struct that I'm missing?
>
> Look at the top of gpiolib.c:
>
> static DEFINE_MUTEX(gpio_lookup_lock);
> static LIST_HEAD(gpio_lookup_list);
>
> In the similar way you can simply do
>
> static DEFINE_SPINLOCK(gpio_sup_lock);
> static struct rb_root gpio_sup_tree;
>

The fact that this has been like this, doesn't mean it's the only
right way. IMO putting these into the same structure makes logical
sense.

Bart

> > > > Yeah, that is a hangover from an earlier iteration where supinfo wa=
s
> > > > contained in other object rather than being a global.
> > > > Could merge the struct definition into the variable now.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

