Return-Path: <linux-gpio+bounces-1114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 643C4809FF9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 10:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE0AFB20B66
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 09:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A2B12B7C;
	Fri,  8 Dec 2023 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PcM4gNuW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72071720
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 01:52:21 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4648dec9800so634349137.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 01:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702029141; x=1702633941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzTcB4ZD8xsy2DKITjWa4w3hlzMM6z9LXxXfiaL6ypk=;
        b=PcM4gNuWHSu8fMxZKVLKii8VbvjW5RwqraCHL72qiDNUh8+qcqOlNXvwB8if44A0zW
         pUmoowtuB0zY2QWasWL01KeE6HoUp8i6flAird/ZgMs0zD4s9M6iXF+Eg+Vzf5OACRdO
         D+4fAXaqXt09MAu5P2KSbw8sp1Y8zg+L5J7w+DbnGl760anoSpNrx8V0E1+TVh7RbnZr
         1fcoholmdawCSFuA+ZsNhHbohKY/Ty1Ani4PaUIVYC7v7wmbUiYZgCo/IfDMo1/UYBI8
         1w6l7K+x1zF5Rjoahbx57eC3gGjOHNkFuN/FcqdIJESveCadYIXF9uEP+H4vRmwY/i/K
         D5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702029141; x=1702633941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzTcB4ZD8xsy2DKITjWa4w3hlzMM6z9LXxXfiaL6ypk=;
        b=ckCii3WQXo9n1KKfR7C0Sa0DyeDIAdHOCYEtXEAp5eSl/ODTeaQLs5bObEnnHBGMy4
         Ed2j+GRcSiJhaChY2zRFrm9bcoI/zSYpoA0NydPIy63VbU3q1cy/KRLw331OTPy0Lufi
         5RAfrzhzeBauMJ9le5+9yephu1AQ85Ck4+4pWvqmROdTCP1Vq1kZ/BmxCSd4xvTbkcpV
         DgS+MESB2L/MWBjsb5zwp28a+mfKoKeQH80M2k1Rb+4k6UqIF9OQr60hjd35BVSf8b51
         WqXJ/b6bgltUQ5o8oPFba+u2BRievYSteiVTftAgAkqufx4hqO1ubD1+uHtVsbccPlrP
         uBQA==
X-Gm-Message-State: AOJu0YwZsxDb6S9ymEfMbsEpBl1cN5UEJH13VZvrtUQHK0DtjyqLcvZF
	qNaIqP87cP464/d/G3oNVhAGv7+HtScBmJjqibmPZw==
X-Google-Smtp-Source: AGHT+IGmpLQUzabM4C+v49yJ5mkDTpJva0U827QpO3u5P1ISmfl1HwXYTKQZl2hNS5Bvki/VUsBBI/a6ZfVnhed42Xc=
X-Received: by 2002:a05:6102:2ca:b0:464:77f1:ff5a with SMTP id
 h10-20020a05610202ca00b0046477f1ff5amr3679270vsh.38.1702029140993; Fri, 08
 Dec 2023 01:52:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel> <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel> <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <ZXJq2zGjBT0yQAXv@rigel> <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
 <ZXLWHTjv9W-IH_OP@rigel>
In-Reply-To: <ZXLWHTjv9W-IH_OP@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 8 Dec 2023 10:52:09 +0100
Message-ID: <CAMRc=MfXQb=A=4f0kFEW4ENuNk0ZmL_qAkWihEvFcYaizCf8LA@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 9:38=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Fri, Dec 08, 2023 at 09:13:17AM +0100, Bartosz Golaszewski wrote:
> > On Fri, Dec 8, 2023 at 2:01=E2=80=AFAM Kent Gibson <warthog618@gmail.co=
m> wrote:
> > >
> > > On Thu, Dec 07, 2023 at 07:37:54PM +0100, Bartosz Golaszewski wrote:
> > > > On Tue, Nov 28, 2023 at 11:47=E2=80=AFAM Bartosz Golaszewski <brgl@=
bgdev.pl> wrote:
> > > > >
> > > >
> > > > [snip]
> > > >
> > > > >
> > > > > Because years of technical debt, that's why. :)
> > > > >
> > > >
> > > > Speaking of technical debt: you may have noticed that despite stati=
ng
> > > > I'm almost done last week, I still haven't submitted my locking
> > > > rework.
> > > >
> > > > The reason for that is that I'm stuck on some corner-cases related =
to
> > > > the GPIO <-> pinctrl interaction. Specifically the fact that we hav=
e
> > > > GPIOLIB API functions that may be called from atomic context which =
may
> > > > end up calling into pinctrl where a mutex will be acquired.
> > > >
> > >
> > > To be clear, that is an existing pinctrl mutex?
> >
> > Yes, I'm talking about pctldev->mutex. TBH set_config IMO should never
> > be called from atomic context but that's already there and will be
> > hard to change it now. :(
> >
> > >
> > > > An example of that is any of the GPIO chips that don't set the
> > > > can_sleep field in struct gpio_chip but still use
> > > > gpiochip_generic_config() (e.g. tegra186). We can then encounter th=
e
> > > > following situation:
> > > >
> > > > irq_handler() // in atomic context
> > > >   gpiod_direction_output() // line is open-drain
> > > >     gpio_set_config()
> > > >       gpiochip_generic_config()
> > > >         pinctrl_gpio_set_config()
> > > >           mutex_lock()
> > > >
> > >
> > > Isn't using a mutex (the pinctrl one here) from atomic always a
> > > problem?  Shouldn't this flow be handed off to irq_thread()?
> > >
> >
> > This is a corner-case. Typically we won't be calling gpio_set_config()
> > from gpiod_direction_output(). This only happens if the line has
> > special config like open-source/open-drain. Any other places where we
> > may end up calling into pinctrl is request() and free() and those
> > already might sleep.
> >
>
> Why does it matter that it is a corner case?
> So it is currently possible for that corner case to hit a mutex within
> atomic context??
>
> > > > Currently we don't take any locks nor synchronize in any other way
> > > > (which is wrong as concurrent gpiod_direction_output() and
> > > > gpiod_direction_input() will get in each other's way). Using a mute=
x
> > > > will be fine but for non-sleeping chips if we use a spinlock here (=
no
> > > > other choice really) we'll set off fireworks.
> > > >
> > > > One of the ideas I have is using the fact that we already use atomi=
c
> > > > bitops in most places. Let's not take locks but add a new flag:
> > > > FLAG_SETTING_DIRECTION. Now when we go into
> > > > gpiod_direction_output/input(), we test and set it. A subsequent ca=
ll
> > > > will fail with EBUSY or EAGAIN as long as it's set. It will have no
> > > > effect on set/get() - any synchronization will be left to the drive=
r.
> > > > When we're done, we clear it after setting the relevant direction
> > > > flag.
> > > >
> > > > Does this make any sense? There's still the label pointer and debou=
nce
> > > > period stored in the descriptor but these are not accessed in atomi=
c
> > > > context AFAICT.
> > > >
> > >
> > > Makes sense to me, as it is basically the sub-state solution I sugges=
ted
> > > earlier for request/release, but applied to direction.  Not sure abou=
t
> > > the contention behaviour though, as that is something userspace will
> > > see and might not be expecting.
> > >
> >
> > User-space will never call from atomic context.
>
> Don't you need to do the test and set in either case?
>
> > We could potentially
> > use a work-queue here even for sleeping chips and serialize the
> > operations
> >
> > > OTOH I'm starting to think that serialising callbacks might be a good=
 idea
> > > - unless it is crystal clear to the driver authors that the callbacks=
 may
> > > be called concurrently.
> >
> > This was my initial idea: use mutex for sleeping chips, spinlock for
> > non-sleeping ones and make it possible for drivers to disable locking
> > entirely. Except that we cannot use spinlock for chips interacting
> > with pinctrl at all even if they can never sleep. :/
> >
> > >
> > > The debounce is really a cdev field.  Putting it in the desc made sen=
se
> > > to me at the time as it is per-line, not per-request, but perhaps it
> > > should moved into the cdev linereq, even if that means having to allo=
c
> > > space for it, just to get it out of your hair.
> > >
> >
> > This sounds good actually.
> >
>
> Yeah, no need to risk other GPIO users messing with it if it is only ther=
e
> for cdev.
> Want me to take a look at it or are you happy to take care of it?
>

If you'll find the time to do it in the following days then sure, go
ahead, otherwise, I'll have some pare cycles today and next week to
spend on it.

Bart

> Cheers,
> Kent.

