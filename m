Return-Path: <linux-gpio+bounces-1110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2B809DEE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 09:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88651281610
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 08:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AB61097A;
	Fri,  8 Dec 2023 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wq71ZEEr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B46D1721
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 00:13:29 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4b2d237ab87so541721e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 00:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702023208; x=1702628008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r54JKG3RSzzY1woO7RL5tT6pxy8wH9NW+BZSfr3Ygqo=;
        b=wq71ZEErxMbwkw8TnsfOxjarVku6DUipKZm1+yy4QXf0DXUm2HmnLRVT0nRAfIsusR
         olIoWHgB88zAdMSR1R50R4/Q31W/Ljm4GvcRQzLV1Hk2/kNozFnhrmAoqAOSOl42rrOb
         ZmN+MIMezJ0MIVS4yAeF+xQJHdqjV79sJd6hd3UpZ1v6e86O0ZZa6+FkBissuuXGoepU
         EAus6FNp3/CmS6CWT3AsfDKHyVqCTZFwudSAqk6gbWr6Ws6xPQ1ikYNmnigHGP0RP6wX
         s5YxgOGTeu/yfC4q0cD+MuZZmyGZUdMQwrG4wcTjYQylBP4ZlEqQI8q46w0xIdWTDFNV
         nPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702023208; x=1702628008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r54JKG3RSzzY1woO7RL5tT6pxy8wH9NW+BZSfr3Ygqo=;
        b=kX/zVU58p167i8AF6yaS3T3D/s3QH5919wzY1Kw5oaxum6dg4oSlB7+V+ZoyMHxmQG
         ejJDGi7F5UwoE+tSHfup8VfvAERWU4mJtEJns1AwV4xcIuX/FwbF4GKjqjcy9EMRzcE7
         oiJ7OyKRXk872StwC6ehgKHZ+PqlY4bFsL1wYSJrEVPLX7mpomJVpFc3rrYO9RPtoVbH
         MAFkmmLs7mEVuR/gyh2XgfdthMDBvTA88mMyo3knmIYWz0U2z5+TB/6Uitc3ksXzElBw
         9oaN6mNOmp2bIJc0hLUydjDYrLMWDEbsNP25UPX0xp8BAuvIf0djOXZAuC2hcaKaX5xL
         d2iA==
X-Gm-Message-State: AOJu0YyJNycOzIiwBs6TuGFtX47oAE8zaOeE8WF7NtHJ711uAoSYZ25A
	t0I3DvaD6n/Lpbg/cFbH3NylgQf7kt2jOlFiPLNQ6Q==
X-Google-Smtp-Source: AGHT+IFPgKz9YSc8YN8/BhVndKW7SIljM4vGdQZWz37K5dCrj2tJcC5pRcib60s3af6NaEOxglSn+UcPg/SjBaLPJ+U=
X-Received: by 2002:a05:6102:32cc:b0:465:d9da:ab11 with SMTP id
 o12-20020a05610232cc00b00465d9daab11mr4452471vss.59.1702023208444; Fri, 08
 Dec 2023 00:13:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel> <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel> <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com> <ZXJq2zGjBT0yQAXv@rigel>
In-Reply-To: <ZXJq2zGjBT0yQAXv@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 8 Dec 2023 09:13:17 +0100
Message-ID: <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 2:01=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Thu, Dec 07, 2023 at 07:37:54PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Nov 28, 2023 at 11:47=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > >
> >
> > [snip]
> >
> > >
> > > Because years of technical debt, that's why. :)
> > >
> >
> > Speaking of technical debt: you may have noticed that despite stating
> > I'm almost done last week, I still haven't submitted my locking
> > rework.
> >
> > The reason for that is that I'm stuck on some corner-cases related to
> > the GPIO <-> pinctrl interaction. Specifically the fact that we have
> > GPIOLIB API functions that may be called from atomic context which may
> > end up calling into pinctrl where a mutex will be acquired.
> >
>
> To be clear, that is an existing pinctrl mutex?

Yes, I'm talking about pctldev->mutex. TBH set_config IMO should never
be called from atomic context but that's already there and will be
hard to change it now. :(

>
> > An example of that is any of the GPIO chips that don't set the
> > can_sleep field in struct gpio_chip but still use
> > gpiochip_generic_config() (e.g. tegra186). We can then encounter the
> > following situation:
> >
> > irq_handler() // in atomic context
> >   gpiod_direction_output() // line is open-drain
> >     gpio_set_config()
> >       gpiochip_generic_config()
> >         pinctrl_gpio_set_config()
> >           mutex_lock()
> >
>
> Isn't using a mutex (the pinctrl one here) from atomic always a
> problem?  Shouldn't this flow be handed off to irq_thread()?
>

This is a corner-case. Typically we won't be calling gpio_set_config()
from gpiod_direction_output(). This only happens if the line has
special config like open-source/open-drain. Any other places where we
may end up calling into pinctrl is request() and free() and those
already might sleep.

> > Currently we don't take any locks nor synchronize in any other way
> > (which is wrong as concurrent gpiod_direction_output() and
> > gpiod_direction_input() will get in each other's way). Using a mutex
> > will be fine but for non-sleeping chips if we use a spinlock here (no
> > other choice really) we'll set off fireworks.
> >
> > One of the ideas I have is using the fact that we already use atomic
> > bitops in most places. Let's not take locks but add a new flag:
> > FLAG_SETTING_DIRECTION. Now when we go into
> > gpiod_direction_output/input(), we test and set it. A subsequent call
> > will fail with EBUSY or EAGAIN as long as it's set. It will have no
> > effect on set/get() - any synchronization will be left to the driver.
> > When we're done, we clear it after setting the relevant direction
> > flag.
> >
> > Does this make any sense? There's still the label pointer and debounce
> > period stored in the descriptor but these are not accessed in atomic
> > context AFAICT.
> >
>
> Makes sense to me, as it is basically the sub-state solution I suggested
> earlier for request/release, but applied to direction.  Not sure about
> the contention behaviour though, as that is something userspace will
> see and might not be expecting.
>

User-space will never call from atomic context. We could potentially
use a work-queue here even for sleeping chips and serialize the
operations

> OTOH I'm starting to think that serialising callbacks might be a good ide=
a
> - unless it is crystal clear to the driver authors that the callbacks may
> be called concurrently.

This was my initial idea: use mutex for sleeping chips, spinlock for
non-sleeping ones and make it possible for drivers to disable locking
entirely. Except that we cannot use spinlock for chips interacting
with pinctrl at all even if they can never sleep. :/

>
> The debounce is really a cdev field.  Putting it in the desc made sense
> to me at the time as it is per-line, not per-request, but perhaps it
> should moved into the cdev linereq, even if that means having to alloc
> space for it, just to get it out of your hair.
>

This sounds good actually.

Bart

> Cheers,
> Kent.

