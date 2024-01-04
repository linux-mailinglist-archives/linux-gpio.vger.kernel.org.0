Return-Path: <linux-gpio+bounces-2013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 236EE823B90
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 05:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BF911C24B51
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 04:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC54510A04;
	Thu,  4 Jan 2024 04:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azJ/A4da"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F8C1CA98
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 04:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35fff22678eso258905ab.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 20:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704343418; x=1704948218; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SD1TOex58hXkT/umAHtX5LWZKBV8or93zWvxhmj1c/c=;
        b=azJ/A4da8ujIcZ8o+TASjd8FiQBOm5kIfFMSfJuFdeBwfsu/QbzBPkw8FrqssvBm1Q
         11CLVjyy7h4EPoo6qm3u5ODlIZ4KDCvXVnXcMmYSR2PscECsapesb1dbf3BSeHUveLEP
         trAeGfGVeyshKpljGFmnHnM+Q/BUPcZ8jeRBC2T8SbAlXO3VobNeQClobai75IQriJZd
         J7SFestdlxWCCn8pxDU4aioTmXPm0eUOsTWXoq27wZQTI+Tolw7MMTcjvi1R/kwhKX0Y
         6VhgjNsxZv4++IZK9aj8uZFq39KXtRZrhMAtVSIJQV/okWWvmnQiqZUcjPiXTaCVyJiy
         zZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704343418; x=1704948218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SD1TOex58hXkT/umAHtX5LWZKBV8or93zWvxhmj1c/c=;
        b=Z1uilXOtuE1mv8FUI+Ba0k6Ckdqk8NqT+jnoUOZ0W4PJEku8W3IV61M/uy31PppDcq
         sW5uaKtFADZe+xdr/LQW2UQhxsBLaVxBlWoO5L+IdybEYqOSAtjdMhdDJOcNDp37rzyD
         UcCXPif3e61wdotK6TFjjIcDX8sTBcdypoxWonyBXppUKatwiQl/Hb29gFhxPWMAI1sc
         cFRQ6q7IWn6zI68WxdQnCm0sYWgjVfFNx1s5pnzoE0LOmbIxyzw1c9lTKimklmACwAFC
         gt1uTWbRW2TfLFnY1S3YApZ+v4xzAcGfZ7PmkcLnjZRqC4qKRb+nxPNslhM9uyTMg5Rt
         2zgw==
X-Gm-Message-State: AOJu0YxxnJVcUNxa/DxdYyK5M9+oRM1U+fjxS3ANMPG9/aDvrFufiZG0
	i5Ve2L1LveXgALgMZ5af1RDH2/JmIf4=
X-Google-Smtp-Source: AGHT+IFBCgyfiVTV/IT0d53A1QolLzW2jAg+SqGUtTfIDLLdu3iWbhN9/7mBtk4mPJBotsbYZyy84A==
X-Received: by 2002:a05:6e02:180c:b0:360:e6b:bc18 with SMTP id a12-20020a056e02180c00b003600e6bbc18mr76572ilv.9.1704343417906;
        Wed, 03 Jan 2024 20:43:37 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id p21-20020a634f55000000b005cebb10e28fsm1956192pgl.69.2024.01.03.20.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 20:43:37 -0800 (PST)
Date: Thu, 4 Jan 2024 12:43:33 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: Some thoughts following a brief test of libgpiod ver 2.1
Message-ID: <20240104044333.GA25151@rigel>
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <CAMRc=Mfmf1pPnkGkyZZKmucOprq4cLnnfxSLaSxSB3Ra_3iYeg@mail.gmail.com>
 <CAJ8C1XMySRzbM1Unj+7LhY9_0AiSyAjoJC-qMQvUAPQfBcu5Wg@mail.gmail.com>
 <CAMRc=MeyHkHyK7YVx_5YpPxvgY4b2XTBtNVHDrC3FNxiEg4Bjw@mail.gmail.com>
 <CAJ8C1XMsjLNdRFS8dDCua7=zha+LnuOcWCy-7W_uU5+LWgqpxQ@mail.gmail.com>
 <20240104001532.GA5165@rigel>
 <CAJ8C1XPTK9K-oMhPmAVm1U==QAfMcCDJ7ujMJ2mCV_0QOtiY9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ8C1XPTK9K-oMhPmAVm1U==QAfMcCDJ7ujMJ2mCV_0QOtiY9g@mail.gmail.com>

On Wed, Jan 03, 2024 at 09:22:25PM -0600, Seamus de Mora wrote:
> On Wed, Jan 3, 2024 at 6:15 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Jan 03, 2024 at 04:09:01PM -0600, Seamus de Mora wrote:
> > > On Wed, Jan 3, 2024 at 12:35 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > > >      [ snip ]
> > >
> > > So - does that mean that we're going to have to wait for version 3 (or
> > > 4?) of libgpiod to get something that provides persistence of GPIO
> > > control?
> > >
> >
> > And there is that tone again...
>
> That's a logical follow-up question to the statement. Perhaps with a
> tinge of the frustration I feel over not understanding why this
> problem keeps getting bigger - or more elusive.
>

The tone is unhelpful, and you know it.  Yet you persist.
You could've just asked when that might be available.

You think I'm not tired of trying to explain the same thing to you over
and over and over again?  You've been told how things work, and why.
You've been told what is being changed in the future to better address
your use case.  But you aren't satisfied unless things work just the way
you want.

> >
> > No, AIUI this will be added to libgpiod or be a separate component.
> > No API changes involved and so no major version bump.
> >
> > These things always take longer than you would like, and the gpioset
> > interactive mode is partly my attempt to provide an interrim solution
> > until the daemon is available.
> >
>
> That's reassuring, but I have to say this: It's unclear to me if we
> even see the bottom of the well yet.
>

I don't see how this comment helpful in any way.

> > > I apologize if this sounds "short", but if we cannot agree that
> > > persistence is fundamental to GPIO control, then I'm at a loss for
> > > words.
> > >
> >
> > I would rather focus on providing a solution to your problem, whatever
> > that actually is, rather than arguing over whether the existing options
> > are sufficiently persistent, or what persistence even means in this
> > context.
> >
> > The underlying issue is that the post-release behaviour is not clearly
> > defined across the GPIO driver interface. IIRC there has been some
> > discussion on signalling to the driver that it should not alter the line
> > post-release (on second thought maybe I'm thinking of the reading the
> > input/output buffer distinction), but if that were to go ahead it needs
> > to be done in a way that is backwardly compatible, all the way out to the
> > ABI, and involves updating ALL the drivers to suit.  All that is a
> > non-trivial task, i.e. you are looking at a butt ton of work.
> > It is therefore worthwhile to examine the alternatives.
> >
> > So, what exactly is your problem and how does that that absolutely require
> > "persistence" to solve?
>
> Are you really asking why persistence is necessary?
> Or are you asking why I'm not keen on the command line options needed
> to get persistence?
>
> If I need to answer the first question, I'd like for you to first
> explain how you illuminate an LED without it (e.g. imagine a warning
> light telling a driver he's lost pressure in the brake lines in his
> car).
>

Sure, and, I would have a process managing that LED.

So where has your app that manages the car gone?
Doesn't that persist?  Or does it magically appear when the pressure
light needs to be lit and then flit off back into the ether?

Why do you insist on managing everything, including your car warning
lights, from shell?

> WRT the second Q, all I can really say is that I am pretty
> simple-minded. I need/want tools that I understand - tools that
> operate like all the other tools I use now - or have used in the past
> (e.g. tools that don't refuse to exit after they've completed their
> assigned task(s), and tools that don't have to be coaxed to 'do the
> right thing' by adding "options").

That is exactly the point - when gpioset exits its task is done - and
the line is then free to revert.  And that isn't what you want - you
want it to hold the line, so now it doesn't exit.

Having to use options to get tools to behave as you want is too hard?
WTF.  I mean really.  Seems to me you just want to vent, not actually
solve your problem.

> Before libgpiod tools, I used a
> tool called 'gpio' - a part of WiringPi. Perhaps you'd like to spend
> 30 minutes to check it out?...

It is Pi specific and has different contraints to work with.  It plays
with hardware directly, quite possibly in dangerous ways (it does nothing
to prevent contention that I am aware of), and due to the architecture
change does not work for the RPi5.

You could almost certainly write something to emulate it using libgpiod.
I haven't personally had any need, so haven't bothered, particular since
up until now wiringPi itself filled that niche.

> I feel it's the essence of simplicity,
> and quite straightforward to use. It did many things that libgpiod
> tools are not required to do. I liked this tool because it operated in
> the fashion of all the other tools I use. In "my world", with tools
> I've used previously, setting a GPIO to High to illuminate an LED is a
> very trivial task - by that I mean in the overall context of a project
> I work on, turning LEDs on is not something I've ever had to spend
> much time thinking about. Yet here I am today - explaining to the
> libgpiod s/w developer why persistence is important?!
>
> Apologies to you both if I've said anything that was offensive, but
> the more I talk with you about this - the more confused I get. I think
> I'll give this libgpiod stuff a rest - maybe I'll have a revelation.

Seems very unlikely at this point.  <-- gratuitous snide remark ;-)

> One final request: You've mentioned this "microAPI" (??) several
> times. Is that a document?; if so, can I get a copy?
>

It isn't microAPI, uAPI stands for userspace API. So its full name is
the GPIO Character Device Userspace API.  It is covered by gpio.h,
though that really only describes the structs, not the ioctls or how to
use them.

I'm endeavouring to write up a more detailed textual description
of the ioctls for the kernel documentation, but I keep getting distracted
with other things, particularly the kid in the backseat asking if we are
there yet.  I've already sunk too much time in this today.

Cheers,
Kent.



