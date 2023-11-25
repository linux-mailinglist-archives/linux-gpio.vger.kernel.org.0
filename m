Return-Path: <linux-gpio+bounces-507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6057D7F878B
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 02:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE011B2143A
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 01:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93511819;
	Sat, 25 Nov 2023 01:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foJHI+p0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695CE170B
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 17:29:28 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-35c8e3fef43so212645ab.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 17:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700875768; x=1701480568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IfB0CFSZ3bY5cOFNtsspwISST3H8rVgO61Fd0PSZBSE=;
        b=foJHI+p0xMPexmJeJrsSPq4+KGNu7g7lqhNB8sAGMsyLHB7U1htM1RFIRpl3WT6fRA
         FYLq4wCHSfmlOIcIWuz+qpGxRJBTGLsLhIUD+UDjIVSZB8q4F6nRzCM56HvDDu7WnbQS
         PAHEJr7PS6SEkAOkh9lUzuzw+wZbVHiL8dY7snkaX/SwFvaZhDC9WUia+riF5zhjEupv
         nLAzsNj1CBr0PrRRNIJR8WCQsHFJDbLfFwMAfMlcBaQYxaw3oX5ea0v8eE1WlcMgi67v
         CTtNVr1+qdmiRW9tbjX4exchjYBp+s9BDZ3ru/lRwEfYftcedsYF3ydKrqRHLMkPyl4l
         loEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700875768; x=1701480568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfB0CFSZ3bY5cOFNtsspwISST3H8rVgO61Fd0PSZBSE=;
        b=MEI0NyBgYY8kjMVRIACJufO9j27DeR0aqEjRuLGssWyMc1bKEafhTIyNBz5EGBNptX
         eBzrU6p7ylR8pboTESi6dDoXRZxS5y+XYk2zS2IJ2X+2eeUPfAKVr19kVlU240kDSSdm
         racsmBE8OQIR8pZYF7Dc9pzy+1RfjBQEjWfnAl3Flu/ufm0mOubVqr8y8shzoOYYskzP
         z6KPsYxcc+ZajI6k9vSiUnqy3+mb97YsBMFzKaHHPSaY94PpU8mXv5jlXTCOn4P6ZqCw
         y0gkVNRtW502sCkLE59kXbnAEJkmvuqq2C5mQZRQ8YIeWWBelcK1FtEjZ6u8hm8FuEXR
         yg/w==
X-Gm-Message-State: AOJu0YxM7o9vz/3p3fSzrJbzH5CaV5YWS9Mcg5J/TVEI2zkxurNoqSD3
	BZJU+rW/Lpm9/LH8Q8GKbkc=
X-Google-Smtp-Source: AGHT+IHDf36aM7ew+N1npeV6jHCFdzDK08Bzd9XIJRxHS89B2fVzAaAF4KhhXjnWrvQ3YCnZbKESWQ==
X-Received: by 2002:a05:6e02:1a2b:b0:35b:695:c3c8 with SMTP id g11-20020a056e021a2b00b0035b0695c3c8mr5501737ile.9.1700875767675;
        Fri, 24 Nov 2023 17:29:27 -0800 (PST)
Received: from rigel ([118.209.207.221])
        by smtp.gmail.com with ESMTPSA id i16-20020a635410000000b005bcea1bf43bsm3657748pgb.12.2023.11.24.17.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 17:29:27 -0800 (PST)
Date: Sat, 25 Nov 2023 09:29:21 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZWFN8RVUy7Vx72CE@rigel>
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>

On Fri, Nov 24, 2023 at 05:00:36PM +0100, Bartosz Golaszewski wrote:
> Hi!
>
> I've been scratching my head over it for a couple days and I wanted to
> pick your brains a bit.
>
> The existing locking in GPIOLIB is utterly broken. We have a global
> spinlock that "protects" the list of GPIO devices but also the
> descriptor objects (and who knows what else). I put "protects" in
> quotation marks because the spinlock is released and re-acquired in
> several places where the code needs to call functions that can
> possibly sleep. I don't have to tell you it makes the spinlock useless
> and doesn't protect anything.
>

You have to tell me, cos I don't think it makes it useless, it just
constrains the contexts in which it is providing protection. No lock
provides protection when it isn't locked - the problem here is the
assumption that it does.

Depending on the scope of the locking, and what else it may block,
releasing and re-aquiring may be the correct strategy - just don't
assume state across the unlock.

If there is no lock held during driver callbacks, then they, and
anything they call, need to be aware that things can change, and GPIOLIB
needs to ensure that nothing the driver is accessing is freed until the
callbacks return.

> An example of that is gpiod_request_commit() where in the time between
> releasing the lock in order to call gc->request() and acquiring it
> again, gpiod_free_commit() can be called, thus undoing a part of the
> changes we just introduced in the first part of this function. We'd
> then return from gc->request() and continue acting like we've just
> requested the GPIO leading to undefined behavior.
>

So GPIOLIB needs to check for that after re-acquiring the lock.

> There are more instances of this pattern. This seems to be a way to
> work around the fact that we have GPIO API functions that can be
> called from atomic context (gpiod_set/get_value(),
> gpiod_direction_input/output(), etc.) that in their implementation
> call driver callbacks that may as well sleep (gc->set(),
> gc->direction_output(), etc.).
>

Which is fine - as long as GPIOLIB is aware that things can change while
it doesn't hold the lock.  And as long as it doesn't go freeing objects
still in use.

> Protecting the list of GPIO devices is simple. It should be a mutex as
> the list should never be modified from atomic context. This can be
> easily factored out right now.


> Protecting GPIO descriptors is
> trickier. If we use a spinlock for that, we'll run into problems with
> GPIO drivers that can sleep. If we use a mutex, we'll have a problem
> with users calling GPIO functions from atomic context.
>

Generally I would advocate for not holding locks over callbacks.
If the callback requires locks then it (or the code it calls) should
request them itself.
GPIOLIB just needs to ensure the desc isn't freed during the callback.

The contract for the driver callbacks is not clear to me. e.g. can they
be called concurrently (e.g. different cdev requests trying to set
different lines and so both calling gc->set())
If so, are the drivers aware of that?
If not, a mutex over the callbacks would seem very appropriate to
enforce that contract, independent of protecting the desc.
(though ideally the drivers are be aware that they need to provide
their own locking as appropriate)

> One idea I have is introducing a strict limit on which functions can
> be used from atomic context (we don't enforce anything ATM in
> functions that don't have the _cansleep suffix in their names) and
> check which parts of the descriptor struct they modify. Then protect
> these parts with a spinlock in very limited critical sections. Have a
> mutex for everything else that can only be accessed from process
> context.
>

... and needs to call cansleep within the critical section itself.

> Another one is introducing strict APIs like gpiod_set_value_atomic()
> that'll be designed to be called from atomic context exclusively and
> be able to handle it. Everything else must only be called from process
> context. This of course would be a treewide change as we'd need to
> modify all GPIO calls in interrupt handlers.
>
> I'd like to hear your ideas as this change is vital before we start
> protecting gdev->chip with SRCU in all API calls.
>

As above, I'm not clear on the driver callback contract, so there is a
good chance anything more specific I have to add would be incoherent.

I do have concerns that adding or changing locking could inadvertantly
constrain otherwise valid concurrency, but safe is better than fast.
But safe AND fast is ideal.
Sorry if that is obvious and not much help.

Cheers,
Kent.

