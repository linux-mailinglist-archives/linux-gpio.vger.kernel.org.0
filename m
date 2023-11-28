Return-Path: <linux-gpio+bounces-563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE517FB881
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 11:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C4CCB219CE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 10:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F031D3FE5E;
	Tue, 28 Nov 2023 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c4gpp0un"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3D210CC
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 02:47:46 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7c4619b67e7so2645726241.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 02:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701168465; x=1701773265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2s6B+/GlkO0tyVfvEA+C42Vi26swd8lRGPLBo7NaVs=;
        b=c4gpp0unpJqpFj70x5m+TkOXnxMzl7xdb9s5a/L5iPH65t8HQW970LHgmAFAAVb6rA
         HGmFOJs9m56F8C7ITa8U8WygFns7mXEe8CdmxW6d63OyQ/uOOpzUJK2557RodFASl6i/
         FEViWC1A2+FcqW3IPtx9ELSiL8weQA99d9Er6Td/tYoLf/8C5pWpmDVwPQm1JcboSfZx
         yTBA1vX9keywhtJMrthk03/k3pResEDqo4GyW4RaxNia09LZnTKgx3fopVSni1I2rUAL
         w5PaL6kT8QWz+VdmHVjSRT592J+neeM1I18R3KnZUdFTWaVAqpfwUKYQ52udUVawATnh
         xJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701168465; x=1701773265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2s6B+/GlkO0tyVfvEA+C42Vi26swd8lRGPLBo7NaVs=;
        b=NEV/EQt/MbH4VUEeJ7LbjjDFYwTEP8fENGQ2EV84Nz+9OUoh7r58BMGB4Ls9VidCuV
         EPwQ5rYP1RvOtRs5cuqewWGK4g6A4WlrKBYjJUQaZIPe0M+Vga7kv2Us/eWPpIM/wQ1E
         8Ny1gb7O6Kej/Y31Ttz/ZEpehedNOBVjik2qYuN7yZbYARKM9/4wVVtkTqbZL67AQO/6
         6odq4rOsgk7wUerWBRKCynP56RKymG2SWt3Cx0dSX6yK5ltq80R66wCXwWBgOflj0tZv
         FM8PTqKODDgfNZuARJNzsWd+41OWEMjdDIsObB8u10jjCKs06nHeHhhZLTFM9xEJgjbe
         NqRw==
X-Gm-Message-State: AOJu0YxPpy/g6NTotSn1Bw4XySxWiIBBdGi3Qmui54EEDuAa43DPLLdF
	KwCDgtT17B2FfPHpwbzris6K/LV55ZAu+tiY4VSwOcwrOEjdueyz
X-Google-Smtp-Source: AGHT+IGXTiZcgz3JAAmXdismUYS7cCY69/MwN14i+P6JUCFbf5mVMl15yft3Uq4lXO/zYo+nvVf/eQATUDsIthZQiF8=
X-Received: by 2002:a05:6102:3587:b0:462:7e9d:fa2c with SMTP id
 h7-20020a056102358700b004627e9dfa2cmr17392926vsu.13.1701168465628; Tue, 28
 Nov 2023 02:47:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel> <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel>
In-Reply-To: <ZWKL4r9DREwYjnyo@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 Nov 2023 11:47:33 +0100
Message-ID: <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 1:06=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Sat, Nov 25, 2023 at 09:13:22PM +0100, Bartosz Golaszewski wrote:
> > On Sat, Nov 25, 2023 at 2:29=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Fri, Nov 24, 2023 at 05:00:36PM +0100, Bartosz Golaszewski wrote:
> > > > Hi!
> > > >
>
> > >
> > > Generally I would advocate for not holding locks over callbacks.
> > > If the callback requires locks then it (or the code it calls) should
> > > request them itself.
> > > GPIOLIB just needs to ensure the desc isn't freed during the callback=
.
> > >
> >
> > That is quite tricky though, isn't it?
>
> Well it is kernel code, so yeah.
> You were expecting it to be easy ;-)?
>
> > Let's consider our request/free
> > example. Even if we start gpiod_request_commit() by calling
> > gc->request() and then acquire the gpio_desc lock and modify the
> > descriptor, we may have a concurrent gpiod_free_commit() that will do
> > the same in reverse order. Even if the driver in question uses some
> > locking, we'll have time between when it releases the lock and when we
> > acquire the desc lock (or vice-versa for free). We can now end up in a
> > situation when we call gc->request(), return from it,
> > gpiod_free_commit() is called, acquires desc lock before
> > gpiod_request_commit() marking the descriptor as freed, we then
> > acquire the lock in gpiod_request_commit() and start marking the
> > descriptor as requested while gc->free() is called. We cannot know the
> > driver-specific state even if we wanted to re-check it within the
> > critical section.
> >
>
> So you use transitional states - not just requested/freed.
> Before the gc->request() call gpiod_request_commit() marks the desc as
> being requested (while it holds the appropriate lock of course).
> If the gpiod_free_commit() comes along and sees that mark, again while
> holdiing the lock, then it marks the desc as to be freed and leaves it
> for gpiod_request_commit() to cleanup.
> When gpiod_request_commit() re-acquires the lock after the gc->request()
> call it sees the to be freed mark and performs the cleanup instead of the
> commit finalisation.
>
> I'm generalising here and not looking at code, so the specifics may be
> wrong, but this is a solvable problem.
>
> > This particular example could be a non-issue if we only dealt out
> > descriptors for exclusive usage to consumers but unfortunately we
> > don't. We currently have lots of places in drivers/gpio/ and - oh
> > horror! - outside where users just shamelessly access the descriptor
> > array in a GPIO device and fiddle with its internals so this may
> > happen. That's another problem. But as we read and/or modify the
> > descriptors in almost all GPIO callbacks, this isn't the only use-case
> > that can lead to undefined behavior.
> >
>
> That is a very different problem - another breach of contract, or lack
> of contract. And a problem that can't be solved by changing the locks.
>
> > I'd say that driver-specific locking should be used whenever the
> > driver resources are shared between different subsystems. Some drivers
> > expose a GPIO chip but also an I2C expander or a PWM chip and they all
> > share resources. Then we also have power-management callbacks and
> > whatnot.
> >
> > For GPIOLIB callbacks exclusively, I think we should have a hard
> > contract for concurrency. Which brings me neatly to...
> >
> > > The contract for the driver callbacks is not clear to me. e.g. can th=
ey
> > > be called concurrently (e.g. different cdev requests trying to set
> > > different lines and so both calling gc->set())
> >
> > AFAIK there is no contract. None is documented and - with GPIOLIB's
> > current state - no implicit contract is enforced either.
> >
>
> And that is the actual problem here - the lack of contracts.
>
> > > If so, are the drivers aware of that?
> > > If not, a mutex over the callbacks would seem very appropriate to
> > > enforce that contract, independent of protecting the desc.
> >
> > Not a mutex. Not exclusively anyway. I suppose we could go with an
> > abstraction layer like what regmap does. If the chip is marked as
> > can_sleep then we use mutex, if not, we use spinlock. Possibly have a
> > flag allowing users to disable locking if they are certain concurrency
> > is not an issue.
> >
> > > (though ideally the drivers are be aware that they need to provide
> > > their own locking as appropriate)
> > >
> >
> > We should put a contract in place saying: if your driver is certain to
> > not share any resources with any other subsystem: don't use your own
> > locking. Otherwise, protect only the shared structures.
> >
>
> This is why I advocate for not holding any locks during the callbacks -
> then there are no restrictions imposed on the driver and no way it can
> inadvertantly deadlock.
>

I don't think it's even possible if we want correctness. For one: if
we want full hot-unplugability, we'll need to keep some lock around
gdev->chip. This is where I think SRCU will work fine. But the GPIOLIB
API functions will often read and/or modify the gpio_desc structure in
addition to calling the relevant GPIOLIB callback and often based on
its return value. I'm not sure it's possible to implement anything
lockless here. We could possibly allow providers who are *absolutely*
sure they don't need locking to disable it when registering the GPIO
chip but by default we should provide some and put it in the future
contract. This way GPIO chips that don't share their GPIO chip
structures, will be able to drop locking.

I'd like to implement a set of gpiod_lock() and gpiod_unlock()
functions which will abstract the locking. We'd then have a union of
struct mutex and spinlock_t and use the right one depending on the
value of can_sleep of the parent chip.

> > > > One idea I have is introducing a strict limit on which functions ca=
n
> > > > be used from atomic context (we don't enforce anything ATM in
> > > > functions that don't have the _cansleep suffix in their names) and
> > > > check which parts of the descriptor struct they modify. Then protec=
t
> > > > these parts with a spinlock in very limited critical sections. Have=
 a
> > > > mutex for everything else that can only be accessed from process
> > > > context.
> > > >
> > >
> > > ... and needs to call cansleep within the critical section itself.
> > >
> > > > Another one is introducing strict APIs like gpiod_set_value_atomic(=
)
> > > > that'll be designed to be called from atomic context exclusively an=
d
> > > > be able to handle it. Everything else must only be called from proc=
ess
> > > > context. This of course would be a treewide change as we'd need to
> > > > modify all GPIO calls in interrupt handlers.
> > > >
> > > > I'd like to hear your ideas as this change is vital before we start
> > > > protecting gdev->chip with SRCU in all API calls.
> > > >
> > >
> > > As above, I'm not clear on the driver callback contract, so there is =
a
> > > good chance anything more specific I have to add would be incoherent.
> > >
> > > I do have concerns that adding or changing locking could inadvertantl=
y
> > > constrain otherwise valid concurrency, but safe is better than fast.
> > > But safe AND fast is ideal.
> >
> > This is why my ultimate goal is to protect the gpio_chip pointer in
> > gpio_device against sudden disappearance of the provider with SRCU -
> > possibly the fastest sleepable locking mechanism we have in the
> > kernel.
> >
> > SRCU could also be used to check if a desc is requested before
> > entering the proper API call in the ideal world where we don't allow
> > using non-requested descriptors making it possible to avoid real locks
> > in struct gpio_desc.
> >
>
> So why allow the usage of non-requested descriptors?
>

Because years of technical debt, that's why. :)

Bart

> Cheers,
> Kent.
>

