Return-Path: <linux-gpio+bounces-17490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9097A5DA63
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 11:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77E0C3B4D3B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 10:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DB523C8DE;
	Wed, 12 Mar 2025 10:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="wdYszyxw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F4723BCFC
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741775054; cv=none; b=FTkwTQMWL/755ODYdJp+NexWnop8k6OSdEdN6JTXTdwX5i0cChORQPN0mjyD8TxJBmSaowqxmWlIw+skjLzxShIb3NaXyiiCZ8jhseEWKbcScr3CeQuuIZrF5OvT1P6SWAyJdGgAO1DpOzm+UQStg5ipFGemFkSI9Twz4KMiuQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741775054; c=relaxed/simple;
	bh=wV4vvx1epJR1UgaiyVzyyHquG4Q89fi7M1hxEWlpDKw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHy23nDnz5qvl0GciKaTB6gXq1tT7FQAZaADpN/vmcmlh5Y38RfOicMNK+s7fN4Qm6+rXVB6pXKXz9RBHja1YdSBqyC3Lvj7QpciLbwHYekvgIe7WWDrtNRiCedKpOaxXt4B9W0avEMwYSigzB85d5SdGBvCF3PadBFfP60KQiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=wdYszyxw; arc=none smtp.client-ip=94.124.121.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=ob8H5QIH3xWgrc1ssUVcQVrQO0vKzhgN8WsPC6YgYl8=;
	b=wdYszyxw7fASZCRSN8ns6xL+KX+9wNRsS2CByIAia+NEsAXJxPWXUCt+LGDBESoUyloQTGqpF2TZx
	 /A9qIDXJn/DyFeXMavM7qQSd6cFhVKIZE+ngHeKzwZ9pcTdP1xTfCwmVgtNCxvcgv5J8DNiDih+iEk
	 KeEZFhJFjgLEMki4NNSeH+7dfeK2gE+RU++cZZ+cETENg7UO8vmlm9cuszEptPhEigb/qS0NtPaiVb
	 MClyP+I/GOCAU/MtqpOk6T5n1DDC3LqLII657coUta4cq5afVY3TxUxjokSdeWHfSACAQx7wRUioU9
	 4/ao1675TbGOUS7nj79z/25KOgi9Ecg==
X-MSG-ID: 1dfed03c-ff2c-11ef-8b50-005056817704
Date: Wed, 12 Mar 2025 11:24:01 +0100
From: David Jander <david@protonic.nl>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
Message-ID: <20250312112401.5e292612@erd003.prtnl>
In-Reply-To: <20250312091056.GA105343@rigel>
References: <20250311110034.53959031@erd003.prtnl>
	<CAMRc=MeWp=m1Bi_t_FCrxFOtiv3s8fSjiBjDk4pOB+_RuN=KGg@mail.gmail.com>
	<20250311120346.21ba086d@erd003.prtnl>
	<20250312013256.GB27058@rigel>
	<20250312090829.5de823b7@erd003.prtnl>
	<20250312091056.GA105343@rigel>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Mar 2025 17:10:56 +0800
Kent Gibson <warthog618@gmail.com> wrote:

> On Wed, Mar 12, 2025 at 09:08:29AM +0100, David Jander wrote:
> > On Wed, 12 Mar 2025 09:32:56 +0800
> > Kent Gibson <warthog618@gmail.com> wrote:
> >  
> > > On Tue, Mar 11, 2025 at 12:03:46PM +0100, David Jander wrote:  
> > > >
> > > > Indeed, it does. My application is written in python and uses the python gpiod
> > > > module. Even in such an environment the impact is killing.  
> > >
> > > Interesting - the only reason I could think of for an application
> > > requesting/releasing GPIOs at a high rate was it if was built on top of
> > > the libgpiod tools and so was unable to hold the request fd.  
> >  
> 
> Btw, I'm not suggesting that anyone build an app on top of the libgpiod
> tools - I was just hunting for an explanation as to why anyone might be
> opening and closing chips or requests at a high rate.

Very understandable.

> > I didn't want to bother the list with the details, but this is during the
> > configuration phase of the application.  
> 
> The fact that close() was slow is valid but it left me wondering why you
> were needing to do that so frequently.
> It helps to understand what you are doing and why to see if there are
> other better solutions - or it there should be.

You are right. In this case it was warranted to describe the situation in a
bit more detail.

> > It receives many configuration messages
> > for different IO objects at a fast pace. Most of those objects use one or more
> > GPIO lines identified by their label. So the application calls
> > gpiod.find_line(label) on each of them. Apparently libgiod (version 1.6.3 in
> > our case) isn't very efficient, since it will open and close each of the
> > gpiodev devices in order to query for each of the gpio lines. I wouldn't blame
> > libgpiod (python bindings) for doing it that way, since open()/close() of a
> > chardev are expected to be fast, and caching this information is probably
> > error prone anyway, since AFAIK user space cannot yet be informed of changes
> > to gpio chips from kernel space.
> >  
> 
> Ok, if the issue is purely the name -> (chip,offset) mapping it is pretty
> safe to assume that line names are immutable - though not unique, so
> caching the mapping should be fine.

On our board that would be fine, but what about hot-pluggable GPIO
chips/devices, or modules that are loaded at a later time? I was thinking
about libgpiod in general...

> The kernel can already tell userspace about a number of changes.
> What changes are you concerned about - adding/removing chips?

Yes, since the patches from Bartosz I understand that is indeed possible now
;-)
No special concern, just thinking about general applicability of caching such
information in libgpiod (especially considering the old version I am using
presumably from long before the kernel could do this).

> > If this had been this slow always (even before 6.13), I would probably have
> > done things a bit differently and cached the config requests to then "find"
> > the lines in batches directly working on the character devices instead of
> > using gpiod, so I could open/close each one just once for finding many
> > different lines each time.
> 
> The libgpiod v2 tools do just that - they scan the chips once rather
> than once per line.  But that functionality is not exposed in the
> libgpiod v2 API as the C interface is hideous and it is difficult to
> provide well defined behaviour (e.g. in what order are the chips scanned?).
> So it is left to the application to determine how they want to do it.
> There isn't even a find_line() equivalent in v2, IIRC.
 
I think I should move to v2 as soon as I find the time to do it. ;-)

In any case, I also could reproduce the issue with the gpiodetect tool from
v2. You can visually see each found chips being printed individually on the
terminal with kernel v6.13, while with 6.12 all chip names would appear
"instantly". Hard to describe with words, but you could in fact tell which
kernel was running just by looking at the terminal output of "gpiodetect"
while it was being executed... my board has 16 gpio chips, so you can really
see it "scrolling" up as it prints them with kernel 6.13.

> > > Generally an application should request the lines it requires once and hold
> > > them for the duration.  Similarly functions such as find_line() should be
> > > performed once per line.  
> >
> > Of course it does that ;-)
> > This board has a large amount of GPIO lines, and like I said, it is during the
> > initial configuration phase of the application that I am seeing this problem.
> >  
> 
> Good to hear - from your earlier description I was concerned that
> you might be doing it continuously.

Thanks. Tbh, I am quite proud of the efficiency and speed of the application
itself. Being written in pure python and running on a rather slow Cortex-A7,
it is surprisingly fast, controlling 16 stepper motors, reacting to 26 sensor
inputs changing at a blazing high pace and continuously sampling several IIO
adcs at 16kHz sample rate, all with rather low CPU usage (in python!). It makes
heavy use of asyncio an thus of course the epoll() event mechanisms the kernel
provides for GPIOs, IIO, LMC and other interfaces.
So you may understand that I was a bit triggered by your suggestion of
inefficiency initially. Sorry ;-)

Best regards,

-- 
David Jander

