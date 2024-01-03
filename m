Return-Path: <linux-gpio+bounces-1997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C17823490
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 19:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE341F2502F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 18:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D101BDD8;
	Wed,  3 Jan 2024 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ye011TIU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B181C698
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 18:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4b7a3189d47so423766e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 10:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704306928; x=1704911728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OV3rv5Mhf1Yf5Hva/rKIG3fd796vqiDDqmQoJ1yCIbQ=;
        b=ye011TIU8X7WKRiaqZi9gxGfjLFHVw9A4bh3tsl3wUlA9g4B4q+e1zKi+SXRECwcH8
         8cWKD7LAEQZSzTjz2JvT3/13sAxW2wBM44biCl8gfLINdEIRmKhMX+ukPADgY8UYeVqK
         YnM0OpokmJKHx/vFi3EBSRI1l8pjYBCgo1Y818un+Gr7cjWqF0PrUjEAx5RZw8LHzpRx
         /Vdu/fycg9cpvYPcCH0Lj7+sBUlrKvvpT+BoiDIXKbPodz4Z5nf3+4aekyW0foGNaZTb
         CaHaKiw2SLJTeyWHa192i+dseBjpXHkKLAx+aPBSuzV3YdPkha1TSzlETuKsz5HO4zls
         QbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704306928; x=1704911728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OV3rv5Mhf1Yf5Hva/rKIG3fd796vqiDDqmQoJ1yCIbQ=;
        b=ZBpt84N6SS6r7tInV8DmqqMoFgAki6i2q5Y1nbv0ugT6EB3375KvjWlrBHax+MIY3R
         zr+4x6hyZpykUUyAnqVEnrT71WM304jM7Qjz62l+Hbl4wEZK4VB1nYZsJwpHz/WJ4Fwo
         Gf+EHcUW0xTW+XpyYU1qacHo8OmO0yaBWw5fStiD6Pf4XHEFceh7ypuRl22oXeHBXybK
         cjbn4p354lTAPVcsnZOscoK8bxDo8AHyYhRyuP4tJ19B3F3X3Cy11Nj2dMndF9M4JTWR
         QZgQuo7kxlNWsyz9FlfJyqssX6jHjgguMT2YPtEeGRBk5Kv4G5uGkW9audFafZLWr6am
         6Q0A==
X-Gm-Message-State: AOJu0YzFvpfZJDcrvDkntUWxDvzdOcCJ8CfxMFIObalF8pgip5TnP/TS
	qyLyhey8DLv3UQr27Aa6R1DXQ04tYbhfckf6EwBX/qkTrB1+jw==
X-Google-Smtp-Source: AGHT+IEGHSHt84x/2P/f8NakMgMWM/na4uWQGJ36qPDNBdNLn4Ve0rO/IxWWViUkUUr3BR2/y2qOje1qYfPSZALyBWI=
X-Received: by 2002:a1f:fc4c:0:b0:4b7:e07c:57b6 with SMTP id
 a73-20020a1ffc4c000000b004b7e07c57b6mr424081vki.7.1704306928434; Wed, 03 Jan
 2024 10:35:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <CAMRc=Mfmf1pPnkGkyZZKmucOprq4cLnnfxSLaSxSB3Ra_3iYeg@mail.gmail.com> <CAJ8C1XMySRzbM1Unj+7LhY9_0AiSyAjoJC-qMQvUAPQfBcu5Wg@mail.gmail.com>
In-Reply-To: <CAJ8C1XMySRzbM1Unj+7LhY9_0AiSyAjoJC-qMQvUAPQfBcu5Wg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Jan 2024 19:35:17 +0100
Message-ID: <CAMRc=MeyHkHyK7YVx_5YpPxvgY4b2XTBtNVHDrC3FNxiEg4Bjw@mail.gmail.com>
Subject: Re: Some thoughts following a brief test of libgpiod ver 2.1
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 3, 2024 at 6:53=E2=80=AFPM Seamus de Mora <seamusdemora@gmail.c=
om> wrote:
>
> On Wed, Jan 3, 2024 at 4:47=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> > On Thu, Dec 28, 2023 at 2:20=E2=80=AFAM Seamus de Mora <seamusdemora@gm=
ail.com> wrote:
> > >
> >
> > [snip]
> >
> > >
> > > 1. I do not agree with the lack of "persistence" - at least as far as
> > > it seems to be practiced in the 'gpioset' tool. When it comes to
> > > "turning things ON and OFF", there is a long-established paradigm tha=
t
> > > says when something is 'turned ON', it remains ON until the user take=
s
> > > an action to turn it OFF. This seems simple and obvious to me. Using
> > > the light switch in my bedroom as a simple example, I cannot see the
> > > logic behind a Design Decision that requires me to keep my finger on
> > > the light switch to keep it OFF so I can sleep.
> > >
> >
> > This begs the question: WHO is the user? Are you making an assumption
> > that the bash process (and its associated UID) that invoked gpioset is
> > THE ONLY user on your multi user linux system? When gpioset acquires
> > the GPIO for exclusive usage, it becomes THE user but as soon as it
> > releases it - anyone else (with appropriate permissions) can come
> > around and re-claim that GPIO.
> >
> I thought this issue of line ownership had been resolved...  i.e. the
> system driver would take control of the line once the user's process
> had exited? Maybe I'm confused on this point, but I *thought* I had
> read that somewhere else?

The driver is just a low-level interface between the core GPIO code
and the hardware. It does not typically take control of any GPIOs
(unless it calls gpiochip_request_own_desc() but that's an internal
detail).

>
> Nevertheless, to address your questions: No - I didn't mean to infer
> that there's only one user. I understand that you (library developer)
> need to account for different users. But GPIO control is not a unique
> issue in Linux (or any multi-user OS). It is the same if we were
> talking about control of a serial port/UART... how is that arbitrated
> between users?

It's exactly the same. The first user to claim a serial port (be it an
in-kernel serdev or a user opening /dev/ttyX) takes exclusive usage
and keeps the port until it releases it.

>
> WRT a GPIO line, I'd say "the user" is the one who issued the gpioset
> command. In the context of your example ("When gpioset acquires the
> GPIO for exclusive usage"), why could gpioset (or the user who issued
> the gpioset command) not 'make a claim for exclusive usage' of the
> GPIO line? If other users/processes subsequently attempted to claim
> the same line, their claim would simply be disallowed - unless they
> were `root`. Is there a reason why this model of ownership could not
> work?

This is precisely what happens though (except for root being able to
override a regular user)? Or am I not understanding this paragraph?

> >
> > To use your light switch example: you turn it ON and take a step back.
> > The light is still on. But then your friend walks by and turns it OFF
> > because you were not actively blocking access to that switch.
> >
>
> Granted, I did not take the issue of "light switch ownership" into
> account in that example.
>
> > > When I was in school we studied 'state machines'. I felt I had a
> > > decent understanding of them - they were useful in designing automate=
d
> > > systems. Yet, in 'gpioset' it seems the concept of a 'state' has been
> > > turned on its ear! We can 'set' a GPIO pin to a state, but that state
> > > reverts immediately (a single clock cycle?). There seems to be an
> > > underlying thought/theory at work in 'gpioset' that demands that it b=
e
> > > kept resident in memory to maintain a 'state'. There may be hardware
> > > systems that demand continuous software oversight to function, but I
> > > know of no such GPIO hardware systems. Also, AFAIK previous
> > > programming interfaces/libraries all had "persistence".
> > >
> >
> > If you're referring to sysfs, then it has no more persistence than a
> > driver that requests a GPIO and keeps it requested. You can imagine it
> > as a central GPIO authority - a guy holding the lightswitch whom you
> > tell how to set it. And your friend can tell him the opposite and
> > he'll gladly comply.
> >
>
> No - not referring to sysfs... and I'm not sure I'm following your
> argument here. But the only point I'm trying to make is wrt
> 'persistence': First, I'll assume that you are saying that gpioset has
> a role to play in persistence, and that it does not delegate the
> persistence question to the driver. Under that assumption, I am
> suggesting that another model for persistence is as I outlined above.
> And I'll ask again, "Is there a reason that model could not work?"
>

I'm sorry, I'm not sure what *that model* is. Gpioset has no role in
persistence because it's merely a wrapper around libgpiod which is a
wrapper around the kernel uAPI which - by design - offers no
persistence.

FYI I understand the need for a user-space GPIO authority that's more
centralized and am working on a DBus daemon that will become exactly
that. However my cup runneth over so it'll be some time before it's
done. :(

Bartosz

