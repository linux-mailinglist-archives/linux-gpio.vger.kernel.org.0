Return-Path: <linux-gpio+bounces-1923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC35820342
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 02:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A83AA282963
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 01:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069EAEC3;
	Sat, 30 Dec 2023 01:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWCS5ilm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9212EDC
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 01:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ccf4f6e42cso2401901fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 17:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703901059; x=1704505859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cALgqTJ1mC2UXYC1EdGjCF5RxHxKRo7bA3pRwZaIF0c=;
        b=VWCS5ilm4V2xc3cshDCbb+ZhjtKp+KoS7cvT19IcDrID5TRqeBKbNBWWfQ+jFfZhJi
         RQIvE1l9X1vf0gjAzujP0TrGIaJ+0m+wMBuZo7ztOY5LnWKjxEk7134kE5/S+9gg2WJ2
         uhMa153DtUQB3wxipQZCLsRZdfGgpoQswrMwtLNYsYfvyCnTVSsaMjyLGQ6KTCZ17zXc
         EIxS2fOM6SCEwu2vSmP1B5oHCLTCam4+7Pr6UeaWvCip12nph4/jebPYAeEoFlQMe4Jz
         z5oqW9V6rvNOaAlkylhh2bKYpvYEzrLXvFhmUVtHx2Kqi0hpxSdqLp2M2RWbS/IbL1pK
         5r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703901059; x=1704505859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cALgqTJ1mC2UXYC1EdGjCF5RxHxKRo7bA3pRwZaIF0c=;
        b=DjwQks3VxDaCS2n8FH0X9G6Wwls9/HXBeegRfggWG3dPc/upLxIod5LInIbeClLrSu
         +biaY88FSVYWa0FhihVoNWtSj311TSqyeUIx4ynUuDmdI21/90uhCTBeiG85WBx6MtaF
         MBydeD1hScYj0ZwJN39jZjrITpVItM/bnBy5W6zU8G4dSaZkLwsmxyc1UqMepMthtrK8
         b8WIsmcPh37THbQFGLRNaa6bNg/pyMBo+8J7LHsWeVeNLAxVWhqiMO18ndhBYkFrDk9L
         mzCnlJi7hy+hndq6006VEWrgzpxUhYoI9mYzik6yHURbyWXGyCdre7RNJ2idxoFXvqq2
         dK4Q==
X-Gm-Message-State: AOJu0YyRNTwu3Pw4h+qsCjJk8hvew+OOW7Ti0u3cIax0keAXps0fzHZk
	2eMzA+jpQWLLtxKWZO5SDr9yDxGLckli8xrTmjuy5xTZ4+U=
X-Google-Smtp-Source: AGHT+IHAzuBvSdTb9V9I2551eu6OUoF7LYFRIxyfeSGTj8xly17T+b3mfxkTvDK/+DJ4zEDuVBiGa9W8vyDkCX3NFXA=
X-Received: by 2002:a05:651c:825:b0:2cc:cb39:157e with SMTP id
 r37-20020a05651c082500b002cccb39157emr4332186ljb.17.1703901058387; Fri, 29
 Dec 2023 17:50:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>
 <20231229155837.GA103278@rigel>
In-Reply-To: <20231229155837.GA103278@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Fri, 29 Dec 2023 19:50:21 -0600
Message-ID: <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 9:58=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, Dec 29, 2023 at 03:14:04AM -0600, Seamus de Mora wrote:
> > I'm trying to add the 'GPIOSET_INTERACTIVE' definition to 'gpioset.c':
> > I've installed 'libeditline-dev' and 'libedit-dev' via apt; each
> > separately, and then both
> >
> > Can someone explain how to add GPIOSET_INTERACTIVE & compile successful=
ly?

> You don't specify your platform and what you've done to get this far -
> you provide the output you are seeing but not the inputs.
> It is apparently a Pi, but the distro and version would be helpful,
> as well as the build commands themselves.
>
> Have you read the BUILDING section of the README?
> How are you performing the build? I would expect autoconf to choke
> if it can't find the required headers before it even gets to the actual
> compile step.

Yes - I read the BUILDING section of the README. When I initially
installed this, I was trying to follow "the RPi way" of doing things,
and I used these commands:

$ ./autogen.sh --enable-tools=3Dyes --prefix=3D/usr/lib/arm-linux-gnueabihf
$ make
$ sudo make install

This was done on an RPi 3A+, running "raspbian/RPi OS", release
"bullseye", kernel ver "6.1.21-v7+"
Why '/usr/lib/arm-linux-gnueabihf'?
    Because that's where the older ver 1.6.X version of 'libgpiod' &
the "tools" were installed.
Of course that had no effect on my issue, but just so you know.

Also: I was trying to re-compile 'gpioset' from the
'~/libgpiod-2.1/tools' folder, using 'make' - as explained below.

> This works for me on a Pi, both bullseye and bookworm:
>
> $ ./autogen.sh --enable-tools --enable-gpioset-interactive
> $ make

That option ('--enable-gpioset-interactive') seems to have gotten the
job done. I had to back out of 'libgpiod-2.1/tools' to
'~/libgpiod-2.1', and let './autogen.sh' take care of the '#define'...
instead of me trying to add it manually to 'gpioset.c' via '#define
GPIOSET_INTERACTIVE'.  I do have **all** the packages you listed below
installed, so why my manual addition didn't work is still a mystery to
me - but not one worth fretting over.

> That is with the following packages installed:
>  autoconf
>  autoconf-archive
>  libtool
>  m4
>  libedit-dev

Thanks for your help!   :)
~S

