Return-Path: <linux-gpio+bounces-1112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B415809E6A
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 09:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FC18B20B50
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 08:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B356FD3;
	Fri,  8 Dec 2023 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqsxrQqQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B1310FC
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 00:38:59 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-58d956c8c38so903321eaf.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 00:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702024738; x=1702629538; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gat1+QKUNogBJs5SzZFfRNdFxJtQQClzEGO1Qs9cPWE=;
        b=lqsxrQqQx9wfsFZSfIM9SfVCteZ3flUouQBUM+W00swoGrieeuwvqDJGg1tX2iVxx4
         U6/crXF2ba2+mWNlvZ1cN4DxPC4Wd+9oKmmwKhu3F5EE9kCI+NUOTiIAuLGNUiF6WZ3p
         elmxaifDGvjF2pmB+ZLhVcPOdybfCnRI+k9P2rKRM3GDFx2Fnc6IP8u2W4IDhPYELwFr
         7IbsNJ1OX5mA0GwzEmjWOW0zqHbKIuU8Pl0d08gxB3wxo40kzEzzdinP3oAMxWrZYlv9
         5NDYAqJq/As4gco3RMnTqFQm96Rzy0Oa/MJnUeLP2wPvLV3slZMWb/xvPjkPTuC6gEW0
         N+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702024738; x=1702629538;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gat1+QKUNogBJs5SzZFfRNdFxJtQQClzEGO1Qs9cPWE=;
        b=wqbcDTg08MTBdygzmtVf+7/WenbCfy7V2mhxiWm7Jp+UvLwadNVcdtUNTi0kA2u9Oq
         O2Md6LVLVUOWm1IynggibYwz6n6gmlyPPKZv8eWMS6D4Wjp7MKXWtrv+63TjEZvmam2u
         lkW94agZc6jjO8oXtUJUcIBBf8pFgWXOMteFZRWb08hJQMM80up5lVt5Wk8BACCrnTAB
         QCQZwz8SxOgYVyGbC/jEtvtuvdCBA7t3kysaZZcLCdRyuTnUtWAFT8vCTd4Z/2u5ZG0l
         uT+RW0Zq2Z9I3heDLnARyUAogV+sUvWXqJinl/dq/gqpF27SHCGFqkeLqjbvS62RM8Kf
         UYXw==
X-Gm-Message-State: AOJu0YwDlfX9ZFaZ/oxjejpE+z2QgJmi9ChxBMWP27SaLx1e05QmkUFu
	UJJ/xJKQhILjTMIbWbps2WA=
X-Google-Smtp-Source: AGHT+IHFdrMp1JBC2QGpMKUI1zu+zIv4496JQyoTHrpLjGBZC6js2EmDKoZRMkpA6kW1mHgqLIv+HQ==
X-Received: by 2002:a05:6358:418f:b0:170:17ea:f4dd with SMTP id w15-20020a056358418f00b0017017eaf4ddmr4798617rwc.42.1702024738092;
        Fri, 08 Dec 2023 00:38:58 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id ca40-20020a056a0206a800b005897bfc2ed3sm870954pgb.93.2023.12.08.00.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 00:38:57 -0800 (PST)
Date: Fri, 8 Dec 2023 16:38:53 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXLWHTjv9W-IH_OP@rigel>
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel>
 <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel>
 <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <ZXJq2zGjBT0yQAXv@rigel>
 <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>

On Fri, Dec 08, 2023 at 09:13:17AM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 8, 2023 at 2:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Dec 07, 2023 at 07:37:54PM +0100, Bartosz Golaszewski wrote:
> > > On Tue, Nov 28, 2023 at 11:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > >
> > > [snip]
> > >
> > > >
> > > > Because years of technical debt, that's why. :)
> > > >
> > >
> > > Speaking of technical debt: you may have noticed that despite stating
> > > I'm almost done last week, I still haven't submitted my locking
> > > rework.
> > >
> > > The reason for that is that I'm stuck on some corner-cases related to
> > > the GPIO <-> pinctrl interaction. Specifically the fact that we have
> > > GPIOLIB API functions that may be called from atomic context which may
> > > end up calling into pinctrl where a mutex will be acquired.
> > >
> >
> > To be clear, that is an existing pinctrl mutex?
>
> Yes, I'm talking about pctldev->mutex. TBH set_config IMO should never
> be called from atomic context but that's already there and will be
> hard to change it now. :(
>
> >
> > > An example of that is any of the GPIO chips that don't set the
> > > can_sleep field in struct gpio_chip but still use
> > > gpiochip_generic_config() (e.g. tegra186). We can then encounter the
> > > following situation:
> > >
> > > irq_handler() // in atomic context
> > >   gpiod_direction_output() // line is open-drain
> > >     gpio_set_config()
> > >       gpiochip_generic_config()
> > >         pinctrl_gpio_set_config()
> > >           mutex_lock()
> > >
> >
> > Isn't using a mutex (the pinctrl one here) from atomic always a
> > problem?  Shouldn't this flow be handed off to irq_thread()?
> >
>
> This is a corner-case. Typically we won't be calling gpio_set_config()
> from gpiod_direction_output(). This only happens if the line has
> special config like open-source/open-drain. Any other places where we
> may end up calling into pinctrl is request() and free() and those
> already might sleep.
>

Why does it matter that it is a corner case?
So it is currently possible for that corner case to hit a mutex within
atomic context??

> > > Currently we don't take any locks nor synchronize in any other way
> > > (which is wrong as concurrent gpiod_direction_output() and
> > > gpiod_direction_input() will get in each other's way). Using a mutex
> > > will be fine but for non-sleeping chips if we use a spinlock here (no
> > > other choice really) we'll set off fireworks.
> > >
> > > One of the ideas I have is using the fact that we already use atomic
> > > bitops in most places. Let's not take locks but add a new flag:
> > > FLAG_SETTING_DIRECTION. Now when we go into
> > > gpiod_direction_output/input(), we test and set it. A subsequent call
> > > will fail with EBUSY or EAGAIN as long as it's set. It will have no
> > > effect on set/get() - any synchronization will be left to the driver.
> > > When we're done, we clear it after setting the relevant direction
> > > flag.
> > >
> > > Does this make any sense? There's still the label pointer and debounce
> > > period stored in the descriptor but these are not accessed in atomic
> > > context AFAICT.
> > >
> >
> > Makes sense to me, as it is basically the sub-state solution I suggested
> > earlier for request/release, but applied to direction.  Not sure about
> > the contention behaviour though, as that is something userspace will
> > see and might not be expecting.
> >
>
> User-space will never call from atomic context.

Don't you need to do the test and set in either case?

> We could potentially
> use a work-queue here even for sleeping chips and serialize the
> operations
>
> > OTOH I'm starting to think that serialising callbacks might be a good idea
> > - unless it is crystal clear to the driver authors that the callbacks may
> > be called concurrently.
>
> This was my initial idea: use mutex for sleeping chips, spinlock for
> non-sleeping ones and make it possible for drivers to disable locking
> entirely. Except that we cannot use spinlock for chips interacting
> with pinctrl at all even if they can never sleep. :/
>
> >
> > The debounce is really a cdev field.  Putting it in the desc made sense
> > to me at the time as it is per-line, not per-request, but perhaps it
> > should moved into the cdev linereq, even if that means having to alloc
> > space for it, just to get it out of your hair.
> >
>
> This sounds good actually.
>

Yeah, no need to risk other GPIO users messing with it if it is only there
for cdev.
Want me to take a look at it or are you happy to take care of it?

Cheers,
Kent.

