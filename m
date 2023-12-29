Return-Path: <linux-gpio+bounces-1901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0181FC65
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 02:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 973D12858ED
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 01:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC2910E4;
	Fri, 29 Dec 2023 01:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9mN2px0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAC8137F
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 01:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cca502e642so60679121fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 17:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703814118; x=1704418918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9HkmH/dSy6IcUpa56wEtKhf8OswTkKQQZjr473NgUg=;
        b=i9mN2px0Nap3oO3b7cHa001ww6gEa9dmdT+JlwQZVFdxO5UupzR8iqai8ByuaAWlGZ
         oDHCAzNpBZ4djcGBcIxbZx+8yQryVNeM2gx9WNyjFtDuFG23kdvTvSs8L2oHQoR5jjAD
         hpilC5FTIRJAr8ZQ6DM0FYkeCDjE1CH6v8d9aqxRHQA7auSbnXbxnI2g4pubb5PqE1mu
         6QOLkBjUX0F2uWlNXZv4YkEgMRlT1I5AueVo0kqvWmsjQ4hdbRuEMiNqsAFRE2/5qxDI
         Xp51jN2pd9GaJu9U9niVKqU98RcxgOXvLu33eeQqwgn5xvK22EmYuHxWBYNLErFGzCqR
         AhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703814118; x=1704418918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9HkmH/dSy6IcUpa56wEtKhf8OswTkKQQZjr473NgUg=;
        b=ode0GsD0sfhkainanD1VOHzTElJ1SLKnaBV2301S0UbIJHbW/MoPw/FmLK2XXXaXG/
         oUpBelCIh5maamiY29fIkWZeeCMMcl9awLsMAZFza5p3SvSr4ZrDNHY0jOy+vRk2J72D
         teiVnPLMPxLZGq2UvIp8wPZCrUTBw4eeoKivQC/MNe9R89cfU8xdjd4BsIM5ULgqr1ET
         vkRy1KVS7aPQpsmwY+tGJz6gSOGHAiBj2nMkylPPSwEl94cohQ2B8Ztm4tgzUnqbw8jV
         zNKYfHGN2Jxss08YdwesmabKlKVVoebliCtkvnqBOZb0Mkv3ULTYaceEJkMbfB6RTxCV
         cJuA==
X-Gm-Message-State: AOJu0YzbxeYDIHv4c3no3DEy5C/GyVWbAFRN5ZtVsfg2gPyVRikHnBs1
	QzKKbt9FLfd56/jWgqu29ulnx/Y3OazlEiX0bJ4=
X-Google-Smtp-Source: AGHT+IFpVI+pfYn1rJCwobFle+wgI9yh53hJ02jI6vP7Kjm4ojAmLdEBSZAnnb1mgXJ+s0a8CrygaF6m8M8FGFif5tg=
X-Received: by 2002:a2e:9186:0:b0:2cc:6bbf:ea8a with SMTP id
 f6-20020a2e9186000000b002cc6bbfea8amr2152798ljg.211.1703814117847; Thu, 28
 Dec 2023 17:41:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <20231228092915.GA67274@rigel> <CAJ8C1XNXSHXpRcsBWJmrGRa2dg2VxBVo1BG6KC8mio7keYy_tg@mail.gmail.com>
 <20231229013248.GA10291@rigel>
In-Reply-To: <20231229013248.GA10291@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Thu, 28 Dec 2023 19:41:21 -0600
Message-ID: <CAJ8C1XNP1L_dJcV9BG13y3KSws7cs6HukxO9sUWY2hLRSAE=OA@mail.gmail.com>
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver 2.1
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 28, 2023 at 7:32=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Dec 28, 2023 at 07:01:10PM -0600, Seamus de Mora wrote:
> > On Thu, Dec 28, 2023 at 3:29=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Wed, Dec 27, 2023 at 07:19:54PM -0600, Seamus de Mora wrote:
> > > > Hello,
> >
> > Thanks for your response, Kent... but really - there's no need for a
> > supercilious remark like "hope you feel better soon"; you could
> > improve your communications if you'd drop remarks like that.
> >
>
> I am well aware but sometimes you need to compromise and work with what
> you've got, and given the mail I was responding to your comment is a bit
> rich.
> Happy to give it but not take it?
>
> > Anyway - I'm still wrestling with the "persistence" thing, but you've
> > made some good points.  The view is still a bit hazy, but perhaps I'm
> > seeing the "bigger picture" now? And I finally got around to reading
> > your post on SE; I made a comment & asked another Q.
> >
> > One thing I'll comment on now is wrt the 'gpioget' tool, and the '-a'
> > option. If you want to create a tool, and call it 'gpioget' my feeling
> > is that a **read only** behavior should be the default. I'd recommend
> > you consider making that the case, and use the '-a' option to mean
> > "adjust"  :)
> >
>
> That is your view, and I don't care about your feelings ;-).
>
> If the line is already an input then it is a read-only operation.
>
> Another view though is "I wanted to read the line as an input, so why
> do I need to provide an option just to ensure it is configured
> as an input?"
>
> That was the default for v1 and there was no feedback requesting to
> change it for v2.  And, depending on your views on API stability, that
> means it can't be changed until libgpiod v3.
>
> If that doesn't suit you, try an alias?
>
> > I'll follow up on the persistence business later, but just in case you
> > can't be bothered reading my comment to your SE post, let me re-state
> > the question I posed there:
> >
>
> Perhaps improve your communication skills, or can't you be bothered??
>
> > I skimmed through your reference to the [GPIO chardev
> > uAPI](https://github.com/raspberrypi/linux/blob/rpi-6.1.y/include/uapi/=
linux/gpio.h).
> > I noted that there are several deprecated 'struct's in that API that
> > were part of ABI v1. QUESTION: Are these deprecated 'struct's used by
> > the `libgpiod v1.6.2/.3` - i.e. the libgpiod that is now current in
> > RPi bullseye (1.6.2) & bookworm (1.6.3)?
> >
>
> I've already responded there, but to reiterate, the deprecated v1
> structs and uAPI remains until the transisition to v2 is complete.
> If you are using the v1 uAPI then you are using those.
> You can still use them for the time being, but new developments should
> use v2 and existing v1 users should migrate to v2 at their earliest
> convenience.
>
> The kernel can be built with support for both in the meantime, though
> v1 can also be compiled out if you are building a custom kernel and are
> sure you don't need v1.  That will probably change to be the default
> sometime next year.
>
> Cheers,
> Kent.

Kent,

I am genuinely sorry if you took offense at my language. It truly
wasn't intended to be offensive, yet you seem to "feel" that it was.

Given our inability to conduct communications that seem "civil" to
both parties, I "FEEL" we should terminate this thread.

Have a good day.

Rgds,
~S

