Return-Path: <linux-gpio+bounces-2012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D446823B15
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 04:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BF081C24B3F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 03:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96760522A;
	Thu,  4 Jan 2024 03:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MH4BIHiW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F9F11196
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 03:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cd20d9d483so1186591fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 19:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704338583; x=1704943383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmKudvyRYHDpKyg4wSasa/se0ntcHf3jE/HR3F+biGU=;
        b=MH4BIHiWlNEzq+Ai+SHf/Q4rHeaDdotqa2YXH4WEIKYyIEq/pGAMEM70HMmvem1+W2
         +QBwl+139tAZlk7pleREdzwQ6N4zBi2zanqdrPwiCP4xYjMO1ZqlRjbDN+7cbqhvceTL
         s+sj1vdoSWluQU87miaESqM8zEpjg8piAfF4w/tLFNBueya5FGoJUqzwWevM45tWHTyV
         aYZBkl6aTSkiDoa357IN2lu1abK901Ysr13Z31BsxH1onSzSgJ1jqVT31KLNm6z3diqb
         UQ4QCuvikHsOcilsuCwgcN2A5n66hq4979g3fttHqg6vfSpvVqewjhSUTbhto8lB+N3f
         UBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704338583; x=1704943383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmKudvyRYHDpKyg4wSasa/se0ntcHf3jE/HR3F+biGU=;
        b=oUDfYWZ7673nOEtaNwkMNCVA8Qw6tr7pesdFeOcqjJWlmcxDgRfK/XHtxd6ZHkrc5v
         dMYECalV0i6bDJpkI6Oy/s5H8XVAF2XKnOTjODea5k+9toU62Daus0RcdZLYGSomAFbr
         cgSSonOR2irOTVHUgXeilIvcWT7hC5CjBthUJCoVb828CYy395NLaoSTE7wQ2SUZPMtR
         Wiqj2cSHWTp2XlHiUKodoyYxWN7ri3SWdmku+0mcHS5P1i6XEQqHuXhzERP103242nqr
         7ks/SqZPXiysPHAabuO+jV4QfjHDM+NCr+0CZUoq9ehWJzaJFfOKpQXbJe/epL9D0P2o
         ipyw==
X-Gm-Message-State: AOJu0Yw+jnbM7iZbtOPOhcYEloM9sM7Xtu1vAVLKuv0E/CY7+KZcXMIU
	zKkqADXkC6SrfMLCoV4zJdPpK40jmfiKrr2EYjiuPwWbWTo=
X-Google-Smtp-Source: AGHT+IFTbO3j3tfBjxRaE8eS13V8LumJF4usoVypsamH7+79fHW5ILQ02UWUS2pTMzUCqRyoqbdIs/ET3TBwqI1jADk=
X-Received: by 2002:a2e:7804:0:b0:2cc:f135:8d60 with SMTP id
 t4-20020a2e7804000000b002ccf1358d60mr4117407ljc.91.1704338582401; Wed, 03 Jan
 2024 19:23:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <CAMRc=Mfmf1pPnkGkyZZKmucOprq4cLnnfxSLaSxSB3Ra_3iYeg@mail.gmail.com>
 <CAJ8C1XMySRzbM1Unj+7LhY9_0AiSyAjoJC-qMQvUAPQfBcu5Wg@mail.gmail.com>
 <CAMRc=MeyHkHyK7YVx_5YpPxvgY4b2XTBtNVHDrC3FNxiEg4Bjw@mail.gmail.com>
 <CAJ8C1XMsjLNdRFS8dDCua7=zha+LnuOcWCy-7W_uU5+LWgqpxQ@mail.gmail.com> <20240104001532.GA5165@rigel>
In-Reply-To: <20240104001532.GA5165@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Wed, 3 Jan 2024 21:22:25 -0600
Message-ID: <CAJ8C1XPTK9K-oMhPmAVm1U==QAfMcCDJ7ujMJ2mCV_0QOtiY9g@mail.gmail.com>
Subject: Re: Some thoughts following a brief test of libgpiod ver 2.1
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 3, 2024 at 6:15=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Wed, Jan 03, 2024 at 04:09:01PM -0600, Seamus de Mora wrote:
> > On Wed, Jan 3, 2024 at 12:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:

> > >      [ snip ]

> > OK - that *sounds* like a different story than the one your partner is
> > telling... do you guys ever "talk"?
> >
>
> Formerly, once the user releases the line it becomes unowned.  That is
> certainly true from the userspace perspective.  My interpretation is
> that when a user releases the request the line ownership reverts to the
> driver, cos in reality that is now in control of the line.
>
> Sure we talk, but we can also have differing points of view.
> You clearly have no problems talking, and I still take issue with
> your tone.  Where is that damn hatchet?
>

I understand that... Like you, I also live in the real world, and deal
with people that sometimes see things differently. No need to get
tetchy again.

> > > >
      [ snip ]

> > > I'm sorry, I'm not sure what *that model* is. Gpioset has no role in
> > > persistence because it's merely a wrapper around libgpiod which is a
> > > wrapper around the kernel uAPI which - by design - offers no
> > > persistence.
> >
> > Well - we're back to 'square one' it seems. There must be persistence
> > in GPIO control. It gets back to my example with the bedroom light.
> > Do you agree that persistence must exist in GPIO control?
> >
> > > FYI I understand the need for a user-space GPIO authority that's more
> > > centralized and am working on a DBus daemon that will become exactly
> > > that. However my cup runneth over so it'll be some time before it's
> > > done. :(
> > >
> >
> > So - does that mean that we're going to have to wait for version 3 (or
> > 4?) of libgpiod to get something that provides persistence of GPIO
> > control?
> >
>
> And there is that tone again...

That's a logical follow-up question to the statement. Perhaps with a
tinge of the frustration I feel over not understanding why this
problem keeps getting bigger - or more elusive.

>
> No, AIUI this will be added to libgpiod or be a separate component.
> No API changes involved and so no major version bump.
>
> These things always take longer than you would like, and the gpioset
> interactive mode is partly my attempt to provide an interrim solution
> until the daemon is available.
>

That's reassuring, but I have to say this: It's unclear to me if we
even see the bottom of the well yet.

> > I apologize if this sounds "short", but if we cannot agree that
> > persistence is fundamental to GPIO control, then I'm at a loss for
> > words.
> >
>
> I would rather focus on providing a solution to your problem, whatever
> that actually is, rather than arguing over whether the existing options
> are sufficiently persistent, or what persistence even means in this
> context.
>
> The underlying issue is that the post-release behaviour is not clearly
> defined across the GPIO driver interface. IIRC there has been some
> discussion on signalling to the driver that it should not alter the line
> post-release (on second thought maybe I'm thinking of the reading the
> input/output buffer distinction), but if that were to go ahead it needs
> to be done in a way that is backwardly compatible, all the way out to the
> ABI, and involves updating ALL the drivers to suit.  All that is a
> non-trivial task, i.e. you are looking at a butt ton of work.
> It is therefore worthwhile to examine the alternatives.
>
> So, what exactly is your problem and how does that that absolutely requir=
e
> "persistence" to solve?

Are you really asking why persistence is necessary?
Or are you asking why I'm not keen on the command line options needed
to get persistence?

If I need to answer the first question, I'd like for you to first
explain how you illuminate an LED without it (e.g. imagine a warning
light telling a driver he's lost pressure in the brake lines in his
car).

WRT the second Q, all I can really say is that I am pretty
simple-minded. I need/want tools that I understand - tools that
operate like all the other tools I use now - or have used in the past
(e.g. tools that don't refuse to exit after they've completed their
assigned task(s), and tools that don't have to be coaxed to 'do the
right thing' by adding "options"). Before libgpiod tools, I used a
tool called 'gpio' - a part of WiringPi. Perhaps you'd like to spend
30 minutes to check it out?... I feel it's the essence of simplicity,
and quite straightforward to use. It did many things that libgpiod
tools are not required to do. I liked this tool because it operated in
the fashion of all the other tools I use. In "my world", with tools
I've used previously, setting a GPIO to High to illuminate an LED is a
very trivial task - by that I mean in the overall context of a project
I work on, turning LEDs on is not something I've ever had to spend
much time thinking about. Yet here I am today - explaining to the
libgpiod s/w developer why persistence is important?!

Apologies to you both if I've said anything that was offensive, but
the more I talk with you about this - the more confused I get. I think
I'll give this libgpiod stuff a rest - maybe I'll have a revelation.
One final request: You've mentioned this "microAPI" (??) several
times. Is that a document?; if so, can I get a copy?

Rgds,
~S

