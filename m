Return-Path: <linux-gpio+bounces-17500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C1CA5DC5D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 13:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21173168A28
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 12:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F946241689;
	Wed, 12 Mar 2025 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flylkczT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18B123C367;
	Wed, 12 Mar 2025 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741781461; cv=none; b=bJIY0l/gDQ8kG9UXzVafKK5yLMXzcgUOgko83alsMdaXzDCV3bm+LjKDU6P2Lafka5QSpM9RSzpzSYXWjuZQbcA4uIOnipLLrIB6MSrfYC+W5lmCbkyi3rnIZI+0oLJ7vJ+h+FAb34MM9fHWdJMsKsRno2zrASFYOsQ/MXOz978=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741781461; c=relaxed/simple;
	bh=G3OqaY1Gicv/x4SjV6Vd/Pl/al4g9sI8+gDB7w0RZ/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfHoMhjhz84464XPEiBgj3WI5H4LngL9a21NdgJCFz4qS6kflloB86H9CaNHBp5GuKV3y97qt9h17/sKN23u7w52zs5K+a2NSZVNuHm5fSu3sFMx4SvJaVqWOQqgzhchtZZyIe4RPENMbYvhLZcSNY/9+Ee3Jo/dkIbNN2b7GO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flylkczT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so9684354a91.2;
        Wed, 12 Mar 2025 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741781459; x=1742386259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t9vjbuAgqMI9GnyLKDVz7Tbvm0vj9IFr9mKzPfId+Hg=;
        b=flylkczTk9mMQG5ItLCtdLZx2jhC8o7ZNSLuNKv3oQUEQO1KIF/MLOVzMzTh3GlWl7
         WQksGIE4v7ooZTCogzYgANA6YAHpu0iQPCBggO0Azmb4gBedvMtmzw53cGI1rdnuH4f3
         YnKtySzx4jy4NcTUPKy+pKZXx3F0Iaxoeo3XxP7NXPK5AMse7TXFQL4XQgHkPGJ97++T
         fCarllkyKbpRSYOL7ddNCh9atetQjIkaBzYqqVTWcNcnTj6PjD1qgO9vxL2HHu5Icw6U
         2CdFxL+ESAYxEGBlXpyAI7sivKjS9KUMsDRyYJtWF5YsF2kML5mDAHjyjQvpj8AWacM3
         FqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741781459; x=1742386259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9vjbuAgqMI9GnyLKDVz7Tbvm0vj9IFr9mKzPfId+Hg=;
        b=HND/zkixD8+LZ03J6YPaJkfiVJa+fmXtMIymuRb4Ir+SAJuBcRxrsNR0t14my4AXOn
         Ec0/dnnltNPuxanL8sbvaTlgJU2aU3ebdwikGrWWrtIUA2lQY5IKVew8ty4cg1ITBWiV
         gorv7BAVd4DY/9GyV0bOrsEOfHb8uMocwyqMRGgmX0JtTE8Lt4s1Zwv7/D12ShfO8U0I
         9f7hElZiOSxqhFxIcZM19NLxV3xd33hJmOItxKD5Opi3ZLrkX1E95cNPSrGMrlyzJlrZ
         3zs/nOZOE6nal/ioB5aXWy+0hqWmSePfDKP0BN9vkkuHUCbSst4vfqpy0JwAXfV2Xzbc
         fDUg==
X-Forwarded-Encrypted: i=1; AJvYcCW+dGltspE7ym+tof66W9Cli92XJsiF335jsFMd6r8tFjBIwJ1/XOhnztFvTUz4/SFRbx2VUTZIOrhR@vger.kernel.org, AJvYcCXm4xLeI06I89EwKmdmCUFGhj9TXnY1iD/9Y6o6pRe93cDukpoAVD5jZoclVbS0m4/in3XGH76KD114UqXu@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPyJLuQgcwOLhkYZKuNmdYx7bvGvtOuyZhi7nHbMXJUzJgnEt
	QC0a2kvEfiZZteZq8c3vLBcV57tuG0gN6/Vd/8NHujrPKVPjDloe
X-Gm-Gg: ASbGncsXsYGwHNZFfUVwTGrMoc4xAwCCqNisQSa+f4uDyDEHJPXnvP3HMllF4WEdjBo
	2Rk3HQOP8H/tEkKn8G1jnZcG+4fd5vBOWH0l307JZH+AvTuzc6VSrzT9tflXg/99AmrRVnuxHZm
	BQyDEd0dYf6j2R061ampMh66Lq0zO0rvYzKwcjPcuuL5SwZG4YW4sZw41tgaC2pt9YaBuzYcn7d
	FcjuCkswBxYrUIxpfyAmeENJu3XSWN9OBlUsQupn/WpqIeD8kswLxlupH28OS2ZXlgbCkt8D/gB
	SYWwe+22z8/apGuUYIZbGFbBN1oFkJ33VFJfMw5a6S3P4moJkkheRKrJVUJNPoByouJm
X-Google-Smtp-Source: AGHT+IFMb1nFJh0Qb+5WSWxAfc35Vv8vdN87tpMqjEEUuMtALWohiO85EyZHCxIC5I+xXtlHAFsm/w==
X-Received: by 2002:a17:90b:164f:b0:2fe:a0ac:5fcc with SMTP id 98e67ed59e1d1-2ff7cf3e3eamr25087822a91.34.1741781458872;
        Wed, 12 Mar 2025 05:10:58 -0700 (PDT)
Received: from rigel (27-32-83-166.static.tpgi.com.au. [27.32.83.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011821816esm1585981a91.5.2025.03.12.05.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:10:58 -0700 (PDT)
Date: Wed, 12 Mar 2025 20:10:53 +0800
From: Kent Gibson <warthog618@gmail.com>
To: David Jander <david@protonic.nl>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
Message-ID: <20250312121053.GA132624@rigel>
References: <20250311110034.53959031@erd003.prtnl>
 <CAMRc=MeWp=m1Bi_t_FCrxFOtiv3s8fSjiBjDk4pOB+_RuN=KGg@mail.gmail.com>
 <20250311120346.21ba086d@erd003.prtnl>
 <20250312013256.GB27058@rigel>
 <20250312090829.5de823b7@erd003.prtnl>
 <20250312091056.GA105343@rigel>
 <20250312112401.5e292612@erd003.prtnl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312112401.5e292612@erd003.prtnl>

On Wed, Mar 12, 2025 at 11:24:01AM +0100, David Jander wrote:
> >
> > Ok, if the issue is purely the name -> (chip,offset) mapping it is pretty
> > safe to assume that line names are immutable - though not unique, so
> > caching the mapping should be fine.
>
> On our board that would be fine, but what about hot-pluggable GPIO
> chips/devices, or modules that are loaded at a later time? I was thinking
> about libgpiod in general...
>

Indeed.  A general solution suitable for libgpiod is a hard problem.
It is probably something better left to a higher layer.

> > The kernel can already tell userspace about a number of changes.
> > What changes are you concerned about - adding/removing chips?
>
> Yes, since the patches from Bartosz I understand that is indeed possible now
> ;-)
> No special concern, just thinking about general applicability of caching such
> information in libgpiod (especially considering the old version I am using
> presumably from long before the kernel could do this).
>

The change notifiers you are referring to have been there for some time
- they were first introduced late in uAPI v1.
I was also thinking of udev events for when devices are added or removed.
Though again, not something core libgpiod should be getting involved with.

> > > If this had been this slow always (even before 6.13), I would probably have
> > > done things a bit differently and cached the config requests to then "find"
> > > the lines in batches directly working on the character devices instead of
> > > using gpiod, so I could open/close each one just once for finding many
> > > different lines each time.
> >
> > The libgpiod v2 tools do just that - they scan the chips once rather
> > than once per line.  But that functionality is not exposed in the
> > libgpiod v2 API as the C interface is hideous and it is difficult to
> > provide well defined behaviour (e.g. in what order are the chips scanned?).
> > So it is left to the application to determine how they want to do it.
> > There isn't even a find_line() equivalent in v2, IIRC.
>
> I think I should move to v2 as soon as I find the time to do it. ;-)
>

You certainly should - the v2 Python bindings are much more pythonic and
easier to use.

> In any case, I also could reproduce the issue with the gpiodetect tool from
> v2. You can visually see each found chips being printed individually on the
> terminal with kernel v6.13, while with 6.12 all chip names would appear
> "instantly". Hard to describe with words, but you could in fact tell which
> kernel was running just by looking at the terminal output of "gpiodetect"
> while it was being executed... my board has 16 gpio chips, so you can really
> see it "scrolling" up as it prints them with kernel 6.13.
>

For sure - the close() issue is a real issue.

> > > > Generally an application should request the lines it requires once and hold
> > > > them for the duration.  Similarly functions such as find_line() should be
> > > > performed once per line.
> > >
> > > Of course it does that ;-)
> > > This board has a large amount of GPIO lines, and like I said, it is during the
> > > initial configuration phase of the application that I am seeing this problem.
> > >
> >
> > Good to hear - from your earlier description I was concerned that
> > you might be doing it continuously.
>
> Thanks. Tbh, I am quite proud of the efficiency and speed of the application
> itself. Being written in pure python and running on a rather slow Cortex-A7,
> it is surprisingly fast, controlling 16 stepper motors, reacting to 26 sensor
> inputs changing at a blazing high pace and continuously sampling several IIO
> adcs at 16kHz sample rate, all with rather low CPU usage (in python!). It makes
> heavy use of asyncio an thus of course the epoll() event mechanisms the kernel
> provides for GPIOs, IIO, LMC and other interfaces.

You can do some surprising things with Python.

> So you may understand that I was a bit triggered by your suggestion of
> inefficiency initially. Sorry ;-)
>

No problems - I've seen people do some silly things and just wanted
to be sure you weren't one of them ;-).
Glad everything is working for you.

Cheers,
Kent.

