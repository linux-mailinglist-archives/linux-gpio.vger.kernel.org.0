Return-Path: <linux-gpio+bounces-1902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE9481FC81
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 03:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 850C9B23D20
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 02:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79303137F;
	Fri, 29 Dec 2023 02:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKkciIWe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6EB1369
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 02:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-28c9d424cceso877661a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 18:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703815448; x=1704420248; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F3UCfZzNh1MVKcc7RqNxhB8gp2ck9aNYEEE80HdgcT0=;
        b=lKkciIWeLDPDhYLDsKWNPSUtczGui2iptsOkjg3X3jD1QtmEJb9QkWwRPiLbeaymCJ
         zvjKoUXa1uTWuxoUByHK9Rr4UrRhHaUlr/2jnEQz6EQtrt7hWd+4y2rB38JiwkWiHwiU
         bg+JoXBxqFq3ojZLQJh9Ls7IolVoi8HbOTr33N2Y1SjTedeLRjc8xml/ThBx/EubP3TL
         gtsdT8JUyIXpI6SyeYzO6hxlQLskUxnl2R8ZaIXlidhTWZ2gxZ8nzlzKmiGMIdgRJtmQ
         0Nuephj5uCen24fCBj9T3fmBPTMbWWW2JLDjUYdmdUgn0si54/DOD+Z+/Dj8sjAv/1vs
         SBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703815448; x=1704420248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3UCfZzNh1MVKcc7RqNxhB8gp2ck9aNYEEE80HdgcT0=;
        b=wwZBY3GSXXQ+m2clRbrdsrXD+f8O/LdH1bONKwTrziy4dhGkij8evQH2hQXrHDLw8H
         ePQ73oOhO9TRyvEGFfh65z+JXCzxmaD4q9kkEgPEV6qGVPsweKKxFEysc9dY21uofAk3
         4MVHU7Tsy9hJbqqn3ncoaXk6Ey1D1VE/Rw5997XPmovWOMdn55+NQf86JoIZJz/jUNp6
         TaIhKUwkwnmSgXKCl/oQLfAS2VfZnbd9+kBRUtCU9K2XygewlQ2Rah2zAZBvEm1dXneA
         AaWxGSebBd51CrVhMTAY/1rZHhO5LdXcLZh4Az/P8vxiZmsfeh2KyuHuXJXr3vlOkUpu
         Aa0A==
X-Gm-Message-State: AOJu0YxsVcbl5trmCUknm7LT2aA3I+XafvDxa0ECWylfwXpOZspe56C7
	LJrR7weNByCBgwYVy4uzM6c=
X-Google-Smtp-Source: AGHT+IG4aUkZCxM6uyB0mlxL7SLkTqWleftEVB9u8+EAC1An58rUQ6eJGJTY6jVWqXLq62D5wsE0Dw==
X-Received: by 2002:a17:90a:5207:b0:28c:287b:b875 with SMTP id v7-20020a17090a520700b0028c287bb875mr11098043pjh.8.1703815448177;
        Thu, 28 Dec 2023 18:04:08 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id on11-20020a17090b1d0b00b0028bc1df95c7sm14881925pjb.4.2023.12.28.18.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 18:04:07 -0800 (PST)
Date: Fri, 29 Dec 2023 10:04:04 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver
 2.1
Message-ID: <20231229020404.GA13858@rigel>
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <20231228092915.GA67274@rigel>
 <CAJ8C1XNXSHXpRcsBWJmrGRa2dg2VxBVo1BG6KC8mio7keYy_tg@mail.gmail.com>
 <20231229013248.GA10291@rigel>
 <CAJ8C1XNP1L_dJcV9BG13y3KSws7cs6HukxO9sUWY2hLRSAE=OA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XNP1L_dJcV9BG13y3KSws7cs6HukxO9sUWY2hLRSAE=OA@mail.gmail.com>

On Thu, Dec 28, 2023 at 07:41:21PM -0600, Seamus de Mora wrote:
> On Thu, Dec 28, 2023 at 7:32 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Dec 28, 2023 at 07:01:10PM -0600, Seamus de Mora wrote:
> > > On Thu, Dec 28, 2023 at 3:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Wed, Dec 27, 2023 at 07:19:54PM -0600, Seamus de Mora wrote:
> > > > > Hello,
> > >
> > > Thanks for your response, Kent... but really - there's no need for a
> > > supercilious remark like "hope you feel better soon"; you could
> > > improve your communications if you'd drop remarks like that.
> > >
> >
> > I am well aware but sometimes you need to compromise and work with what
> > you've got, and given the mail I was responding to your comment is a bit
> > rich.
> > Happy to give it but not take it?
> >
> > > Anyway - I'm still wrestling with the "persistence" thing, but you've
> > > made some good points.  The view is still a bit hazy, but perhaps I'm
> > > seeing the "bigger picture" now? And I finally got around to reading
> > > your post on SE; I made a comment & asked another Q.
> > >
> > > One thing I'll comment on now is wrt the 'gpioget' tool, and the '-a'
> > > option. If you want to create a tool, and call it 'gpioget' my feeling
> > > is that a **read only** behavior should be the default. I'd recommend
> > > you consider making that the case, and use the '-a' option to mean
> > > "adjust"  :)
> > >
> >
> > That is your view, and I don't care about your feelings ;-).
> >
> > If the line is already an input then it is a read-only operation.
> >
> > Another view though is "I wanted to read the line as an input, so why
> > do I need to provide an option just to ensure it is configured
> > as an input?"
> >
> > That was the default for v1 and there was no feedback requesting to
> > change it for v2.  And, depending on your views on API stability, that
> > means it can't be changed until libgpiod v3.
> >
> > If that doesn't suit you, try an alias?
> >
> > > I'll follow up on the persistence business later, but just in case you
> > > can't be bothered reading my comment to your SE post, let me re-state
> > > the question I posed there:
> > >
> >
> > Perhaps improve your communication skills, or can't you be bothered??
> >
> > > I skimmed through your reference to the [GPIO chardev
> > > uAPI](https://github.com/raspberrypi/linux/blob/rpi-6.1.y/include/uapi/linux/gpio.h).
> > > I noted that there are several deprecated 'struct's in that API that
> > > were part of ABI v1. QUESTION: Are these deprecated 'struct's used by
> > > the `libgpiod v1.6.2/.3` - i.e. the libgpiod that is now current in
> > > RPi bullseye (1.6.2) & bookworm (1.6.3)?
> > >
> >
> > I've already responded there, but to reiterate, the deprecated v1
> > structs and uAPI remains until the transisition to v2 is complete.
> > If you are using the v1 uAPI then you are using those.
> > You can still use them for the time being, but new developments should
> > use v2 and existing v1 users should migrate to v2 at their earliest
> > convenience.
> >
> > The kernel can be built with support for both in the meantime, though
> > v1 can also be compiled out if you are building a custom kernel and are
> > sure you don't need v1.  That will probably change to be the default
> > sometime next year.
> >
> > Cheers,
> > Kent.
>
> Kent,
>
> I am genuinely sorry if you took offense at my language. It truly
> wasn't intended to be offensive, yet you seem to "feel" that it was.
>

I call BS.  Refer to "just in case you can't be bothered" above.

> Given our inability to conduct communications that seem "civil" to
> both parties, I "FEEL" we should terminate this thread.
>

I'm happy to answer any relevant questions you have to ask.
But do stick to the point.

Cheers,
Kent.

