Return-Path: <linux-gpio+bounces-1104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AFC80984B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 02:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C4F7281E9D
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 01:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FE27FA;
	Fri,  8 Dec 2023 01:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BojPCiJ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC2FD59
	for <linux-gpio@vger.kernel.org>; Thu,  7 Dec 2023 17:01:22 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d06fffdb65so12458435ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Dec 2023 17:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701997282; x=1702602082; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j70BRMzgDsvZ8mzFUhrH/sFaE9EEqqslT6VjYzB7u/M=;
        b=BojPCiJ/AMtiDjLcTi69hVy/z+xMR1ATDF92veh7S8cf4sA/edu2KpPwzFVJW62ISl
         pwQyxe1NSJdLrKjdhnOh5lwlpU/E9GfXiGdrSGzjp/swylkbiH5XttoS6YKWYqz6vZYE
         e7BV6PUKHDjVjv7HZMMA9pQrcyYPVqemgFL0vdkaZTCBY64T1snPLbDA4g7LPdaL+fWH
         AkWNPT1E3yeMk/Ts1jpK+2/L/pIh1Mf3iRPXRCCZf7VBHQXqesmMTS9yRytJaI1jL/EC
         xPg/mxvMMTWUvo2m/9vLhU8gmY8tFUiHliI5qfVm/DQmjctKPFiLHY7GTppRDe1Hn5Sz
         eS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701997282; x=1702602082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j70BRMzgDsvZ8mzFUhrH/sFaE9EEqqslT6VjYzB7u/M=;
        b=c6SKMMRmBw6cjGSasigQgSs/2XU3CFmAbVLUgwcnIA2iX93cZKakL5eS69ACR7g2Zh
         nvmGPau4Jr1bXD/cNttz/1J0Om0ihXChrxQZpZZ+xsH+IQt9z94Wb82Ynv4ad9YlHA5O
         jJ487ZH8B7W3QTYn/Nn6basPcewSGU0SBnpN6gBlykwQ+t7T+yAkhaVQ0XX5UJAl5/oh
         uHOb9csjvk8E0qXj9CQn7HG+ThURyvt8B++2i4nj0mNggILy3yEJOeFoSZiHfzDFl9et
         ZsWAmnHTJLixbu8bBWpykIYJmD6cm6gmb0I268Pt/6Erd0R1hgzAvCRkb708HEaawaCr
         qh/A==
X-Gm-Message-State: AOJu0Yx019d7tsc6yefyLw6vhAFFvAwVkp76l4pH97/P4OmypRBV0lN9
	ybtDBKHqxp8TTkpZXJiFZfw=
X-Google-Smtp-Source: AGHT+IEo+esb80E9y+GucqvPtLtxXKGeFzUYA+vAHy6HKy0SED2VaSwks2yHg3+o3Gsl3XgWKbtqOg==
X-Received: by 2002:a17:90a:30d:b0:285:da91:69d6 with SMTP id 13-20020a17090a030d00b00285da9169d6mr2850159pje.36.1701997281691;
        Thu, 07 Dec 2023 17:01:21 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id az4-20020a170902a58400b001c71ec1866fsm430551plb.258.2023.12.07.17.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:01:21 -0800 (PST)
Date: Fri, 8 Dec 2023 09:01:15 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXJq2zGjBT0yQAXv@rigel>
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel>
 <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel>
 <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>

On Thu, Dec 07, 2023 at 07:37:54PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 28, 2023 at 11:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
>
> [snip]
>
> >
> > Because years of technical debt, that's why. :)
> >
>
> Speaking of technical debt: you may have noticed that despite stating
> I'm almost done last week, I still haven't submitted my locking
> rework.
>
> The reason for that is that I'm stuck on some corner-cases related to
> the GPIO <-> pinctrl interaction. Specifically the fact that we have
> GPIOLIB API functions that may be called from atomic context which may
> end up calling into pinctrl where a mutex will be acquired.
>

To be clear, that is an existing pinctrl mutex?

> An example of that is any of the GPIO chips that don't set the
> can_sleep field in struct gpio_chip but still use
> gpiochip_generic_config() (e.g. tegra186). We can then encounter the
> following situation:
>
> irq_handler() // in atomic context
>   gpiod_direction_output() // line is open-drain
>     gpio_set_config()
>       gpiochip_generic_config()
>         pinctrl_gpio_set_config()
>           mutex_lock()
>

Isn't using a mutex (the pinctrl one here) from atomic always a
problem?  Shouldn't this flow be handed off to irq_thread()?

> Currently we don't take any locks nor synchronize in any other way
> (which is wrong as concurrent gpiod_direction_output() and
> gpiod_direction_input() will get in each other's way). Using a mutex
> will be fine but for non-sleeping chips if we use a spinlock here (no
> other choice really) we'll set off fireworks.
>
> One of the ideas I have is using the fact that we already use atomic
> bitops in most places. Let's not take locks but add a new flag:
> FLAG_SETTING_DIRECTION. Now when we go into
> gpiod_direction_output/input(), we test and set it. A subsequent call
> will fail with EBUSY or EAGAIN as long as it's set. It will have no
> effect on set/get() - any synchronization will be left to the driver.
> When we're done, we clear it after setting the relevant direction
> flag.
>
> Does this make any sense? There's still the label pointer and debounce
> period stored in the descriptor but these are not accessed in atomic
> context AFAICT.
>

Makes sense to me, as it is basically the sub-state solution I suggested
earlier for request/release, but applied to direction.  Not sure about
the contention behaviour though, as that is something userspace will
see and might not be expecting.

OTOH I'm starting to think that serialising callbacks might be a good idea
- unless it is crystal clear to the driver authors that the callbacks may
be called concurrently.

The debounce is really a cdev field.  Putting it in the desc made sense
to me at the time as it is per-line, not per-request, but perhaps it
should moved into the cdev linereq, even if that means having to alloc
space for it, just to get it out of your hair.

Cheers,
Kent.

