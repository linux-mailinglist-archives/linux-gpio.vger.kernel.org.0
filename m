Return-Path: <linux-gpio+bounces-521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7037F9067
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Nov 2023 01:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87C6C281361
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Nov 2023 00:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DBC18F;
	Sun, 26 Nov 2023 00:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LL7Z3CJ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B39E127
	for <linux-gpio@vger.kernel.org>; Sat, 25 Nov 2023 16:06:00 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cfbda041f3so3055025ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 25 Nov 2023 16:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700957160; x=1701561960; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=opwMW+GNV5Lui05BgJ8uZRNMv86PCRLz3Cc1BFgwfXs=;
        b=LL7Z3CJ/ZCG2TpXQXeQH7EHbo7I0l/GM+YuwyHxVbEyp6S7vzQVOGdFNjMyHl2SovI
         B339cytGs79W52pihaJKGW8oNvcnbS/2zKNtUCf5u6OEdDN5b5tT+Mdgmp5EMk9eD8pn
         UhD/Kw+DKFFJdABM/dMyRGtgG4jmsjSZGHnJ1GfXZctpu6pqq6l8nJgXPRp94nz2vLZN
         L8lm3t5oiJAMWMDqGuzgy5tkbCaxu8BOvr4FBfQmegQGpFerOSCuwQebTBYTkw4gVyvb
         sbcs5OlBfCNqBjS9ruC43GGU4UQ6zFXZxI9kPS48HCm80H4rIZviGliY2znTuIemv4Um
         YueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700957160; x=1701561960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opwMW+GNV5Lui05BgJ8uZRNMv86PCRLz3Cc1BFgwfXs=;
        b=RTcfcJx4lv59THuAnKVX8+JyQJ0iWbI74whBskQUak+mFRbeOnyO1ecXzzgCzvjh2S
         s/qH8GZb4SjHO37TTuUgrpb2jZjNBFRE7g3qaFRhajF2T68m0yPvHyFLSCx+27bqIeTL
         zjP10FqTK09SVCOgPZ1vomvgjJplekuuxH9bGlkz/xUZZkAMb68yhnIriYa7JY3uncy7
         nZWXa7NmcaBlanuxOSDWaLN6dvu5l1hgUGtUG8/u3CJFfQLy1g32ufiLyMyoaK342d1u
         h+8hSDlrXp7J2Q70W2G/GTjE5SFF6vfBPTfTxb2BaPUvoaDpC0CJ1L831NF34W1A4l4b
         0Jlg==
X-Gm-Message-State: AOJu0YyFCxDHZryCiCURTOtO/ctEkGRBJ2quZMkdZry8yPDyLdNol1FK
	mZx5jnjgQBRAwEPniSHGs0HzyDM8kwc=
X-Google-Smtp-Source: AGHT+IHW33iLBNWGHbrbh8qJAzzhsgmBLQgWGqJt2ocXf0wrbmMHKtg6T6Fh3upNo6xU3zx8tgH3CA==
X-Received: by 2002:a17:902:be14:b0:1cf:b55d:a0fd with SMTP id r20-20020a170902be1400b001cfb55da0fdmr3230147pls.33.1700957159550;
        Sat, 25 Nov 2023 16:05:59 -0800 (PST)
Received: from rigel ([118.209.207.221])
        by smtp.gmail.com with ESMTPSA id iw9-20020a170903044900b001cf7f0ab8e5sm5483816plb.21.2023.11.25.16.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 16:05:59 -0800 (PST)
Date: Sun, 26 Nov 2023 08:05:54 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZWKL4r9DREwYjnyo@rigel>
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel>
 <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>

On Sat, Nov 25, 2023 at 09:13:22PM +0100, Bartosz Golaszewski wrote:
> On Sat, Nov 25, 2023 at 2:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Nov 24, 2023 at 05:00:36PM +0100, Bartosz Golaszewski wrote:
> > > Hi!
> > >

> >
> > Generally I would advocate for not holding locks over callbacks.
> > If the callback requires locks then it (or the code it calls) should
> > request them itself.
> > GPIOLIB just needs to ensure the desc isn't freed during the callback.
> >
>
> That is quite tricky though, isn't it?

Well it is kernel code, so yeah.
You were expecting it to be easy ;-)?

> Let's consider our request/free
> example. Even if we start gpiod_request_commit() by calling
> gc->request() and then acquire the gpio_desc lock and modify the
> descriptor, we may have a concurrent gpiod_free_commit() that will do
> the same in reverse order. Even if the driver in question uses some
> locking, we'll have time between when it releases the lock and when we
> acquire the desc lock (or vice-versa for free). We can now end up in a
> situation when we call gc->request(), return from it,
> gpiod_free_commit() is called, acquires desc lock before
> gpiod_request_commit() marking the descriptor as freed, we then
> acquire the lock in gpiod_request_commit() and start marking the
> descriptor as requested while gc->free() is called. We cannot know the
> driver-specific state even if we wanted to re-check it within the
> critical section.
>

So you use transitional states - not just requested/freed.
Before the gc->request() call gpiod_request_commit() marks the desc as
being requested (while it holds the appropriate lock of course).
If the gpiod_free_commit() comes along and sees that mark, again while
holdiing the lock, then it marks the desc as to be freed and leaves it
for gpiod_request_commit() to cleanup.
When gpiod_request_commit() re-acquires the lock after the gc->request()
call it sees the to be freed mark and performs the cleanup instead of the
commit finalisation.

I'm generalising here and not looking at code, so the specifics may be
wrong, but this is a solvable problem.

> This particular example could be a non-issue if we only dealt out
> descriptors for exclusive usage to consumers but unfortunately we
> don't. We currently have lots of places in drivers/gpio/ and - oh
> horror! - outside where users just shamelessly access the descriptor
> array in a GPIO device and fiddle with its internals so this may
> happen. That's another problem. But as we read and/or modify the
> descriptors in almost all GPIO callbacks, this isn't the only use-case
> that can lead to undefined behavior.
>

That is a very different problem - another breach of contract, or lack
of contract. And a problem that can't be solved by changing the locks.

> I'd say that driver-specific locking should be used whenever the
> driver resources are shared between different subsystems. Some drivers
> expose a GPIO chip but also an I2C expander or a PWM chip and they all
> share resources. Then we also have power-management callbacks and
> whatnot.
>
> For GPIOLIB callbacks exclusively, I think we should have a hard
> contract for concurrency. Which brings me neatly to...
>
> > The contract for the driver callbacks is not clear to me. e.g. can they
> > be called concurrently (e.g. different cdev requests trying to set
> > different lines and so both calling gc->set())
>
> AFAIK there is no contract. None is documented and - with GPIOLIB's
> current state - no implicit contract is enforced either.
>

And that is the actual problem here - the lack of contracts.

> > If so, are the drivers aware of that?
> > If not, a mutex over the callbacks would seem very appropriate to
> > enforce that contract, independent of protecting the desc.
>
> Not a mutex. Not exclusively anyway. I suppose we could go with an
> abstraction layer like what regmap does. If the chip is marked as
> can_sleep then we use mutex, if not, we use spinlock. Possibly have a
> flag allowing users to disable locking if they are certain concurrency
> is not an issue.
>
> > (though ideally the drivers are be aware that they need to provide
> > their own locking as appropriate)
> >
>
> We should put a contract in place saying: if your driver is certain to
> not share any resources with any other subsystem: don't use your own
> locking. Otherwise, protect only the shared structures.
>

This is why I advocate for not holding any locks during the callbacks -
then there are no restrictions imposed on the driver and no way it can
inadvertantly deadlock.

> > > One idea I have is introducing a strict limit on which functions can
> > > be used from atomic context (we don't enforce anything ATM in
> > > functions that don't have the _cansleep suffix in their names) and
> > > check which parts of the descriptor struct they modify. Then protect
> > > these parts with a spinlock in very limited critical sections. Have a
> > > mutex for everything else that can only be accessed from process
> > > context.
> > >
> >
> > ... and needs to call cansleep within the critical section itself.
> >
> > > Another one is introducing strict APIs like gpiod_set_value_atomic()
> > > that'll be designed to be called from atomic context exclusively and
> > > be able to handle it. Everything else must only be called from process
> > > context. This of course would be a treewide change as we'd need to
> > > modify all GPIO calls in interrupt handlers.
> > >
> > > I'd like to hear your ideas as this change is vital before we start
> > > protecting gdev->chip with SRCU in all API calls.
> > >
> >
> > As above, I'm not clear on the driver callback contract, so there is a
> > good chance anything more specific I have to add would be incoherent.
> >
> > I do have concerns that adding or changing locking could inadvertantly
> > constrain otherwise valid concurrency, but safe is better than fast.
> > But safe AND fast is ideal.
>
> This is why my ultimate goal is to protect the gpio_chip pointer in
> gpio_device against sudden disappearance of the provider with SRCU -
> possibly the fastest sleepable locking mechanism we have in the
> kernel.
>
> SRCU could also be used to check if a desc is requested before
> entering the proper API call in the ideal world where we don't allow
> using non-requested descriptors making it possible to avoid real locks
> in struct gpio_desc.
>

So why allow the usage of non-requested descriptors?

Cheers,
Kent.


