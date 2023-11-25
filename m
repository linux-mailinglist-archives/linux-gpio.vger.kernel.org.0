Return-Path: <linux-gpio+bounces-516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2967F8E93
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 21:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B064D2812A1
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 20:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6C830643;
	Sat, 25 Nov 2023 20:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y82oEdTj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D1EE5
	for <linux-gpio@vger.kernel.org>; Sat, 25 Nov 2023 12:13:34 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-462e19c29baso267321137.0
        for <linux-gpio@vger.kernel.org>; Sat, 25 Nov 2023 12:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700943213; x=1701548013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfc0OypfPiAlav1PC0xQnXsEtsTwkNJsUBtiwWBi3g4=;
        b=Y82oEdTjkwD0NFP3LyUa45JzgkKL2qv3QvIRQ6vILSTBkt6no0uN+EjiVaaF1eesON
         +rZNfHxSujZqzOlNrDw6mlGyjCxki3s+/aLhGKZiyNqnO/5vMldQa/nyhfojjThf9Dwd
         V/ndI+NpjYHzslXPQf4KIX0Q8xIWipcc8EzpbocM6IkAIVkVXIl+YoEikyUTyd2ooTE1
         ciw4+11W5Eug12HENWrcMUFa29+97WoaxmeuVaIZx9gBiGkEo8fzou92W1eBLXs7X/dG
         Fqg5O6jKrw9c7Mqx7l5oGAzxtX7Efvq73iLIRoZqaXyNsBami67PP6fyzbFCqEljluY5
         XTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700943213; x=1701548013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfc0OypfPiAlav1PC0xQnXsEtsTwkNJsUBtiwWBi3g4=;
        b=BP7bZn/rhqxGHU30uW18vQo8h/bBXeCzpOnzmaoAe+2QP2f/gZarPsPcBUXmIed4cb
         94Zu9yDhdYTFnoqNJysKz8q9X0TMHTdKAlX18k8vsr+RljRBxnJ5NpO/Ny1d//ya7Sjm
         v12prGZZN3WQIwmUhJF6OH/VObWRpg8m3OFDObUuopAWwZN/aWyoX9rRqyUGIfY3KS3P
         JytaHus3m2kWd2h2Ut8Mcw/9RrUfBUv3vDHjUUbd8VBNbXnhf6a9fkt8x9GUybXmDCRy
         esmRGQyZgSWTTq41maKvW/BNiT3vrIZ5BX3CyQzkS1qFaoF2lHLNLmWjRuG4LaN8vQy5
         JsAg==
X-Gm-Message-State: AOJu0Yy0a4s/5SaARO0HgGAzqGZ0cEtnTwmPM0VHPTLoza+y1DtCwG9i
	WoIVroNgam8q1kAXOUv4q6ljp832poeGcyN/AzxQqw==
X-Google-Smtp-Source: AGHT+IHuuTmvyqrD0poog1zN41wuNjGtNhtF0TR9MwnvqndiYDwDVfFuhKnrjoDF5/WGq9/ys4SLC0QENEEokFu5Hv0=
X-Received: by 2002:a05:6102:1293:b0:462:db21:176b with SMTP id
 jc19-20020a056102129300b00462db21176bmr6470324vsb.19.1700943213389; Sat, 25
 Nov 2023 12:13:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel>
In-Reply-To: <ZWFN8RVUy7Vx72CE@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 25 Nov 2023 21:13:22 +0100
Message-ID: <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2023 at 2:29=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, Nov 24, 2023 at 05:00:36PM +0100, Bartosz Golaszewski wrote:
> > Hi!
> >
> > I've been scratching my head over it for a couple days and I wanted to
> > pick your brains a bit.
> >
> > The existing locking in GPIOLIB is utterly broken. We have a global
> > spinlock that "protects" the list of GPIO devices but also the
> > descriptor objects (and who knows what else). I put "protects" in
> > quotation marks because the spinlock is released and re-acquired in
> > several places where the code needs to call functions that can
> > possibly sleep. I don't have to tell you it makes the spinlock useless
> > and doesn't protect anything.
> >
>
> You have to tell me, cos I don't think it makes it useless, it just
> constrains the contexts in which it is providing protection. No lock
> provides protection when it isn't locked - the problem here is the
> assumption that it does.
>
> Depending on the scope of the locking, and what else it may block,
> releasing and re-aquiring may be the correct strategy - just don't
> assume state across the unlock.
>
> If there is no lock held during driver callbacks, then they, and
> anything they call, need to be aware that things can change, and GPIOLIB
> needs to ensure that nothing the driver is accessing is freed until the
> callbacks return.
>
> > An example of that is gpiod_request_commit() where in the time between
> > releasing the lock in order to call gc->request() and acquiring it
> > again, gpiod_free_commit() can be called, thus undoing a part of the
> > changes we just introduced in the first part of this function. We'd
> > then return from gc->request() and continue acting like we've just
> > requested the GPIO leading to undefined behavior.
> >
>
> So GPIOLIB needs to check for that after re-acquiring the lock.
>
> > There are more instances of this pattern. This seems to be a way to
> > work around the fact that we have GPIO API functions that can be
> > called from atomic context (gpiod_set/get_value(),
> > gpiod_direction_input/output(), etc.) that in their implementation
> > call driver callbacks that may as well sleep (gc->set(),
> > gc->direction_output(), etc.).
> >
>
> Which is fine - as long as GPIOLIB is aware that things can change while
> it doesn't hold the lock.  And as long as it doesn't go freeing objects
> still in use.
>
> > Protecting the list of GPIO devices is simple. It should be a mutex as
> > the list should never be modified from atomic context. This can be
> > easily factored out right now.
>
>
> > Protecting GPIO descriptors is
> > trickier. If we use a spinlock for that, we'll run into problems with
> > GPIO drivers that can sleep. If we use a mutex, we'll have a problem
> > with users calling GPIO functions from atomic context.
> >
>
> Generally I would advocate for not holding locks over callbacks.
> If the callback requires locks then it (or the code it calls) should
> request them itself.
> GPIOLIB just needs to ensure the desc isn't freed during the callback.
>

That is quite tricky though, isn't it? Let's consider our request/free
example. Even if we start gpiod_request_commit() by calling
gc->request() and then acquire the gpio_desc lock and modify the
descriptor, we may have a concurrent gpiod_free_commit() that will do
the same in reverse order. Even if the driver in question uses some
locking, we'll have time between when it releases the lock and when we
acquire the desc lock (or vice-versa for free). We can now end up in a
situation when we call gc->request(), return from it,
gpiod_free_commit() is called, acquires desc lock before
gpiod_request_commit() marking the descriptor as freed, we then
acquire the lock in gpiod_request_commit() and start marking the
descriptor as requested while gc->free() is called. We cannot know the
driver-specific state even if we wanted to re-check it within the
critical section.

This particular example could be a non-issue if we only dealt out
descriptors for exclusive usage to consumers but unfortunately we
don't. We currently have lots of places in drivers/gpio/ and - oh
horror! - outside where users just shamelessly access the descriptor
array in a GPIO device and fiddle with its internals so this may
happen. That's another problem. But as we read and/or modify the
descriptors in almost all GPIO callbacks, this isn't the only use-case
that can lead to undefined behavior.

I'd say that driver-specific locking should be used whenever the
driver resources are shared between different subsystems. Some drivers
expose a GPIO chip but also an I2C expander or a PWM chip and they all
share resources. Then we also have power-management callbacks and
whatnot.

For GPIOLIB callbacks exclusively, I think we should have a hard
contract for concurrency. Which brings me neatly to...

> The contract for the driver callbacks is not clear to me. e.g. can they
> be called concurrently (e.g. different cdev requests trying to set
> different lines and so both calling gc->set())

AFAIK there is no contract. None is documented and - with GPIOLIB's
current state - no implicit contract is enforced either.

> If so, are the drivers aware of that?
> If not, a mutex over the callbacks would seem very appropriate to
> enforce that contract, independent of protecting the desc.

Not a mutex. Not exclusively anyway. I suppose we could go with an
abstraction layer like what regmap does. If the chip is marked as
can_sleep then we use mutex, if not, we use spinlock. Possibly have a
flag allowing users to disable locking if they are certain concurrency
is not an issue.

> (though ideally the drivers are be aware that they need to provide
> their own locking as appropriate)
>

We should put a contract in place saying: if your driver is certain to
not share any resources with any other subsystem: don't use your own
locking. Otherwise, protect only the shared structures.

> > One idea I have is introducing a strict limit on which functions can
> > be used from atomic context (we don't enforce anything ATM in
> > functions that don't have the _cansleep suffix in their names) and
> > check which parts of the descriptor struct they modify. Then protect
> > these parts with a spinlock in very limited critical sections. Have a
> > mutex for everything else that can only be accessed from process
> > context.
> >
>
> ... and needs to call cansleep within the critical section itself.
>
> > Another one is introducing strict APIs like gpiod_set_value_atomic()
> > that'll be designed to be called from atomic context exclusively and
> > be able to handle it. Everything else must only be called from process
> > context. This of course would be a treewide change as we'd need to
> > modify all GPIO calls in interrupt handlers.
> >
> > I'd like to hear your ideas as this change is vital before we start
> > protecting gdev->chip with SRCU in all API calls.
> >
>
> As above, I'm not clear on the driver callback contract, so there is a
> good chance anything more specific I have to add would be incoherent.
>
> I do have concerns that adding or changing locking could inadvertantly
> constrain otherwise valid concurrency, but safe is better than fast.
> But safe AND fast is ideal.

This is why my ultimate goal is to protect the gpio_chip pointer in
gpio_device against sudden disappearance of the provider with SRCU -
possibly the fastest sleepable locking mechanism we have in the
kernel.

SRCU could also be used to check if a desc is requested before
entering the proper API call in the ideal world where we don't allow
using non-requested descriptors making it possible to avoid real locks
in struct gpio_desc.

Bart

> Sorry if that is obvious and not much help.
>

