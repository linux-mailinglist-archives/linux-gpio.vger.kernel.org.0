Return-Path: <linux-gpio+bounces-1996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 111078233E4
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 18:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C8762867D4
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 17:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA12D1C2A3;
	Wed,  3 Jan 2024 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoehwiND"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC921C684
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 17:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ccec119587so48766681fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 09:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704304408; x=1704909208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRPwVslEJ4eVjc/BcF+xrWsDYv5hAm71/mCV1jJpyCk=;
        b=XoehwiNDpFMObbFz0BHqfobG3G9IPSI0kqcPEDyGOCo3eM8xHg6gN1gYrR+qnlgCXl
         Fu+G7Krge80yuJoGAYHrQrSzM/qr5yU/tjFwK7EprYzYw0jEg5a3Z/QkVu2A5+PDezVT
         P6MA6FKHDAVAMMfeV2UjSPXCq21A417hSstD0Gn8Yl8CQ6Bx+6pdRvGjgg2QQku8z1KI
         mzHnU4fVbcoOoF5bdX48buXz7L1+aHVhjrrRmJKztNJj9+YR3QGnK04gaFcnC+vokg0X
         qzVB4nbbI80rULQor/PO3uXMac3r5rUnGrNXWygOmfCU1Coyuwh9qTPyWQ8NiwEKvaJX
         46IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704304408; x=1704909208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRPwVslEJ4eVjc/BcF+xrWsDYv5hAm71/mCV1jJpyCk=;
        b=ppblR+VlrPj2NZDg+BOKb20uWRqvtHKe5j6ivxuqPXmbRa7YGB5bIs1oC7lxHfDhUv
         lkhDFBOPsLQDxQOpz6Ewa02NrjLDlm9CzV4wzWp4HBN7eL9lgkTnaCQPd0blUxij84qo
         /9TPXKAtE70rjYlji9pId4u+Ift4+aeDLRY6e4FtUvn9TYBpXQAykc/oMplZuqOMKNqI
         OtT0wdBIeGX5UXn4bE3dfIRnCseAJrqhhE5bweK0tx6PukG6rFJbaGqLgu7ATpC9ajXr
         Mpveu4FEkpIna9xH8gsACT2VRe8YpdEHT+PO70PotFNW75bwtszxgPNdx3lwlZsdULQQ
         VgYA==
X-Gm-Message-State: AOJu0YwOnfxCEpyKqsDf3VhdnD+e4QgaJvdvW4V0vlyl+R9GmRDFxrCa
	rgDK/jKnEqRlpCRrwwjfgUIf4XJ3a4fjcBF/y4bac1+7oXk=
X-Google-Smtp-Source: AGHT+IG1l1rIi+CEZLhBWqlSoeHfhGpB6ekiYXqadaoI2uuvAv+RMgZJw9dYbfa61/DFn2bXXhnCl9JE+RG9rd5mKgA=
X-Received: by 2002:a05:651c:95:b0:2cc:31e5:7c5b with SMTP id
 21-20020a05651c009500b002cc31e57c5bmr1255390ljq.107.1704304407616; Wed, 03
 Jan 2024 09:53:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <CAMRc=Mfmf1pPnkGkyZZKmucOprq4cLnnfxSLaSxSB3Ra_3iYeg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfmf1pPnkGkyZZKmucOprq4cLnnfxSLaSxSB3Ra_3iYeg@mail.gmail.com>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Wed, 3 Jan 2024 11:52:51 -0600
Message-ID: <CAJ8C1XMySRzbM1Unj+7LhY9_0AiSyAjoJC-qMQvUAPQfBcu5Wg@mail.gmail.com>
Subject: Re: Some thoughts following a brief test of libgpiod ver 2.1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 3, 2024 at 4:47=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Thu, Dec 28, 2023 at 2:20=E2=80=AFAM Seamus de Mora <seamusdemora@gmai=
l.com> wrote:
> >
>
> [snip]
>
> >
> > 1. I do not agree with the lack of "persistence" - at least as far as
> > it seems to be practiced in the 'gpioset' tool. When it comes to
> > "turning things ON and OFF", there is a long-established paradigm that
> > says when something is 'turned ON', it remains ON until the user takes
> > an action to turn it OFF. This seems simple and obvious to me. Using
> > the light switch in my bedroom as a simple example, I cannot see the
> > logic behind a Design Decision that requires me to keep my finger on
> > the light switch to keep it OFF so I can sleep.
> >
>
> This begs the question: WHO is the user? Are you making an assumption
> that the bash process (and its associated UID) that invoked gpioset is
> THE ONLY user on your multi user linux system? When gpioset acquires
> the GPIO for exclusive usage, it becomes THE user but as soon as it
> releases it - anyone else (with appropriate permissions) can come
> around and re-claim that GPIO.
>
I thought this issue of line ownership had been resolved...  i.e. the
system driver would take control of the line once the user's process
had exited? Maybe I'm confused on this point, but I *thought* I had
read that somewhere else?

Nevertheless, to address your questions: No - I didn't mean to infer
that there's only one user. I understand that you (library developer)
need to account for different users. But GPIO control is not a unique
issue in Linux (or any multi-user OS). It is the same if we were
talking about control of a serial port/UART... how is that arbitrated
between users?

WRT a GPIO line, I'd say "the user" is the one who issued the gpioset
command. In the context of your example ("When gpioset acquires the
GPIO for exclusive usage"), why could gpioset (or the user who issued
the gpioset command) not 'make a claim for exclusive usage' of the
GPIO line? If other users/processes subsequently attempted to claim
the same line, their claim would simply be disallowed - unless they
were `root`. Is there a reason why this model of ownership could not
work?
>
> To use your light switch example: you turn it ON and take a step back.
> The light is still on. But then your friend walks by and turns it OFF
> because you were not actively blocking access to that switch.
>

Granted, I did not take the issue of "light switch ownership" into
account in that example.

> > When I was in school we studied 'state machines'. I felt I had a
> > decent understanding of them - they were useful in designing automated
> > systems. Yet, in 'gpioset' it seems the concept of a 'state' has been
> > turned on its ear! We can 'set' a GPIO pin to a state, but that state
> > reverts immediately (a single clock cycle?). There seems to be an
> > underlying thought/theory at work in 'gpioset' that demands that it be
> > kept resident in memory to maintain a 'state'. There may be hardware
> > systems that demand continuous software oversight to function, but I
> > know of no such GPIO hardware systems. Also, AFAIK previous
> > programming interfaces/libraries all had "persistence".
> >
>
> If you're referring to sysfs, then it has no more persistence than a
> driver that requests a GPIO and keeps it requested. You can imagine it
> as a central GPIO authority - a guy holding the lightswitch whom you
> tell how to set it. And your friend can tell him the opposite and
> he'll gladly comply.
>

No - not referring to sysfs... and I'm not sure I'm following your
argument here. But the only point I'm trying to make is wrt
'persistence': First, I'll assume that you are saying that gpioset has
a role to play in persistence, and that it does not delegate the
persistence question to the driver. Under that assumption, I am
suggesting that another model for persistence is as I outlined above.
And I'll ask again, "Is there a reason that model could not work?"

Best Rgds,
~S

