Return-Path: <linux-gpio+bounces-1881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16581F649
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Dec 2023 10:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D959B20B4B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Dec 2023 09:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B1563B1;
	Thu, 28 Dec 2023 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6LyGZY6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A156A6FA1
	for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bbd38715f2so180393b6e.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 01:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703755759; x=1704360559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqOE20uD7U82mzFAZpUesVrQZ9xKQxNKdger4eq5eos=;
        b=g6LyGZY6OyPvgrtdQI80Uzvw96v2BCmBImr5Sm6yGAC7/QHYw9uhi59yW5NktKeyEG
         klK+TBZgR+m8aEVdfOMCKDwIaRsjCNysBbpDCauWZZ4mNa0d4uAeyabkF3Hkuwm+2udd
         IjKflKGWUF235DKh3A3Q3l2Qmi2oRC3lfvPtxna9IQ0LPVu4dianfPeATvBHPI4ZBsbg
         aHspFY5B4Aa/N05PZN479h3y4q7DtqEoE2TAjCulMdxSNAqKj71FVNw6h+rBSw4tccPt
         t3gNVF49QuSBBZaecOfHbL65rkK6ZMPrfI9qGKI9qKb5Cs64I//xtCGuI2r2J2KrDO/E
         2Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703755759; x=1704360559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqOE20uD7U82mzFAZpUesVrQZ9xKQxNKdger4eq5eos=;
        b=FDi82KTMU6eQ5SmZK1K7UNYfHiHvvi8oINXYVHZp8leItRdCYgO6p+3IaKqhbIMAv9
         NH3TRhfSvZZWMPHQoPQODiw6pnTHqxUtnMvbEn4ThEk7gWNFYYseWkyKxtWuh4XlHCxj
         cHUrXvKHMRvhKJ078gH1/2/itRmRvDPGjZ1sX73Am4+iSZrfrgBY4ZZ8QhSQObhUKRcF
         33yoKt3vMu5fflgIASkEcQonb83/LKoNvMTfwdEHOGxX3tZMY9/2M1dNnvLQ8+whM4HB
         Nb2bZEIglvTmpRZfBDoI90w0ngX+SQpvackDeXus2u0rYgtYXNstaMTf90fIwlwiioVd
         aXSQ==
X-Gm-Message-State: AOJu0YyMnRTqBlj38yYb51izMCMyyTX1mkPps38lBFATc3Nv8JWDttvb
	LD5Nm5ZxRWiKl7hq04WsINc9nGX8R5M=
X-Google-Smtp-Source: AGHT+IEX1OSd12maTVqMNjk0ipqi74FVFEAJE1AivrnPNeKwD0JA9ZP+xpmPJcPiOJ3UOlsFvEFrdQ==
X-Received: by 2002:a05:6808:23c5:b0:3bb:c56e:7f69 with SMTP id bq5-20020a05680823c500b003bbc56e7f69mr3030959oib.53.1703755759472;
        Thu, 28 Dec 2023 01:29:19 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id h9-20020a63e149000000b005cd835182c5sm12595719pgk.79.2023.12.28.01.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 01:29:19 -0800 (PST)
Date: Thu, 28 Dec 2023 17:29:15 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver
 2.1
Message-ID: <20231228092915.GA67274@rigel>
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>

On Wed, Dec 27, 2023 at 07:19:54PM -0600, Seamus de Mora wrote:
> Hello,
>
> I've done some testing/evaluation of the 'libgpiod ver 2.1', and I'd
> like to share a few thoughts from that experience. By way of
> introduction, I have a degree in Electrical Engineering, and I like to
> experiment and build things using "small computers" that run Linux. I
> have zero Linux kernel experience. I did my testing on a Raspberry Pi
> model 3 running a variant of Debian "bullseye".
>

Then you might want to update your kernel - the kernel device driver was
changed to support peristing [1].

I get this on my Pi4 running bookworm:

$ gpioset -t0 GPIO23=0
$ gpioinfo GPIO23
gpiochip0 23	"GPIO23"        	output
$ gpioget -a GPIO23
"GPIO23"=inactive
$ gpioinfo GPIO23
gpiochip0 23	"GPIO23"        	output
$ gpioset -t0 GPIO23=1
$ gpioget -a GPIO23
"GPIO23"=active


I can confirm that the line values output match those reported by
gpioget, so the gpioset is persisting.

Btw, that device driver change should even be in recent Pi bullseye
kernels too - I just happen to be running bookworm.

> 1. I do not agree with the lack of "persistence" - at least as far as
> it seems to be practiced in the 'gpioset' tool. When it comes to
> "turning things ON and OFF", there is a long-established paradigm that
> says when something is 'turned ON', it remains ON until the user takes
> an action to turn it OFF. This seems simple and obvious to me. Using
> the light switch in my bedroom as a simple example, I cannot see the
> logic behind a Design Decision that requires me to keep my finger on
> the light switch to keep it OFF so I can sleep.
>

The issue here is one of resource management and ownership.
gpioset cannot guaranteed the state of the line after it returns as it
no longer owns it - the ownership is contained in a file descriptor
returned by the kernel, and a process' file descriptors are all closed
automatically when a process exits.
Ownership then returns to the device driver which may do what it sees
fit with it.

The gpioset documentation mentions that the line will return to its
default state, which is typically and historically the case, but this
is not strictly correct - it is up to the device driver what happens to
the line.
And, as demonstrated above, with the current Pi GPIO device driver the
allows the line state to persist.

I ramble about this more in my answer to a related question on
StackExchange[2].

> When I was in school we studied 'state machines'. I felt I had a
> decent understanding of them - they were useful in designing automated
> systems. Yet, in 'gpioset' it seems the concept of a 'state' has been
> turned on its ear! We can 'set' a GPIO pin to a state, but that state
> reverts immediately (a single clock cycle?). There seems to be an
> underlying thought/theory at work in 'gpioset' that demands that it be
> kept resident in memory to maintain a 'state'. There may be hardware
> systems that demand continuous software oversight to function, but I
> know of no such GPIO hardware systems. Also, AFAIK previous
> programming interfaces/libraries all had "persistence".
>

> I'll make one final comment re. 'gpioset' wrt to the '-z / -daemonize'
> option: First, this option seems to admit the failings of "lack of
> persistence", but beyond that lies a question: How does one control
> the daemon? The only way I could terminate the daemon was to search
> for, and then kill the process. At least with '&`, one gets
> notification of the process id.
>

The -z option is for a set and forget use case - the keep the finger
on the button that you mentioned above.

If that doesn't fit your use case then don't use the -z option?

If you want a simple daemon then try a script line this:

#!/bin/bash
# Example of using the gpioset --interactive mode to create a simple GPIO daemon.
#
# Other programs can drive the GPIO by writing commands to the pipe,
# e.g.
#
# echo toggle > /tmp/gpiosetd
#
# or
#
# echo "set GPIO23=1" > /tmp/gpiosetd
#
# similar to setting with the deprecated sysfs interface.

pipe=/tmp/gpiosetd
mkfifo $pipe
trap "rm -f $pipe" EXIT
# as bash will block until something is written to the pipe...
echo "" > $pipe &
gpioset -i GPIO23=0 < $pipe > /dev/null


> 2. Why does a tool with 'get' in the name write/change GPIO
> parameters? Would it not make more sense to relegate 'gpioget' to a
> simply **reading** and reporting the state of the GPIO?
>

You want the -a/--as-is option.
If you use that, and no other options, then the electrical configuration
of the line will remain unchanged.

That isn't the default, as historically the expected and desired behaviour
is to switch the line to an input (which is always safe) and read the
line.

And the other options are there as you MAY want to change the
electrical configuration.

> I'll stop here. I don't really expect a considered reply because AIUI
> this (libgpiod) project has been going on for 5 or 6 years now. I
> assume that there have been other attempts to inject critical
> thoughts, and they have clearly been dismissed. I felt that without
> expressing my thoughts here I would fall in with the silent majority
> whose enthusiasm and support for the present design is assumed... I
> can't have that. :)
>

Cool, hope you feel better soon.

Cheers,
Kent.

[1] https://github.com/raspberrypi/linux/commit/022689f0973d87956b2e5e8aaa0c29803cdb2a71
[2] https://raspberrypi.stackexchange.com/questions/136479/confusion-with-libgpiod-and-the-gpiod-user-tools/143016#143016

