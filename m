Return-Path: <linux-gpio+bounces-1130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8971680AC11
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 19:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABB2F1C20AA7
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 18:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96A1225CE;
	Fri,  8 Dec 2023 18:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lWXPGx+c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BCEA3
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 10:30:49 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-464808da25eso641302137.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 10:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702060248; x=1702665048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuIXhB4aB43M0Co4wkAqEIPCt5yl737CXEa56zNLJfc=;
        b=lWXPGx+cyB7xVUgHFtWzn7kzVeRlroPz+COWZiB/Z5N1dJmzCjlWxD5AK8bM6li9gP
         IbLmETYnGG1N4E0vk6LWwUmcvjYpEbWvIEvO97IbqggGz7YRkkFkvqgiXJAhezDm3G71
         v2kZpBqNlFssgjjLrL6UHs2io7/g/vMB7IhtzADvZNl3ChxX8+MHynI0V5gYZci8c7Cu
         yjAeukCNcmsClOtQJn+OC0oZqWkUvl0vZtM9FGiRztZPIyAXMTWyxcZuQMvCce+yi4dj
         KbfSrh9uxG6iD7dvwCYGH9SNPQDg8/Hyrzy69CneZzL82GShhAi2AZ+FWBlkAYJxu8VG
         t0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702060248; x=1702665048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuIXhB4aB43M0Co4wkAqEIPCt5yl737CXEa56zNLJfc=;
        b=TY8UGZwrc7sSOroL9Uytnr8kuj3mNfJ5Pwx9c9RWN+P28q27+BeEF8la3CkXxwdWzl
         ertKrb4/SpcyQ0TjSsduVe8RD8L0SthOZg6+Gos31GU4vzFEbcYvba6UVN8ZHTJVG/Gx
         RAZ3N2BW1Dm4/IGeNy8Gr0nMeV3+c9mvMCOatfEG5yA8pyvi8KFVz//PTkMfmZ4955GE
         Jb4RLSKsEd9w1ZDiIPx/UkY3SDATmjgc5k9Q+swSkGsIVRfM4eQ9QHrP2566mAPJFsvE
         hlVWcJvYfjQGMbLuheKSDWl0uPgNE7hq7uuADNg+umbu5lLXij0qjFTCOAp2k/GPzH3Y
         hjCw==
X-Gm-Message-State: AOJu0Yy4hx/QczcQ5WamTQg29r+7BMfKvgB4SzT4qhqrfLLndidEVqqe
	BfYNYjKGT/NXLkhj7yuLMBLv4t8LUemu/Vy9vuqEirJOftrH93cm
X-Google-Smtp-Source: AGHT+IF3WuVE357ITjpROLSflhXodcn69nupTnfoW8GLJq+Jb665LGPXPFj3rT2SiMu0qwIUG9aGBofNqP6AlfJyluo=
X-Received: by 2002:a05:6102:2921:b0:464:9555:fd0b with SMTP id
 cz33-20020a056102292100b004649555fd0bmr696084vsb.19.1702060247392; Fri, 08
 Dec 2023 10:30:47 -0800 (PST)
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
 <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
 <ZXMgmhTioEQ78Xeq@orome.fritz.box> <CAMRc=MeB9noBavBRiuKZf_6iWZJY0+ZG=n+ddGOs+TVavvuEfQ@mail.gmail.com>
 <ZXNHG0yp9QVflLBG@orome.fritz.box>
In-Reply-To: <ZXNHG0yp9QVflLBG@orome.fritz.box>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 8 Dec 2023 19:30:36 +0100
Message-ID: <CAMRc=Mfg0tYwmiNfTkX+aBJyZSk0TG-EXmnd=3R22wmT7q53Tw@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 5:41=E2=80=AFPM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Fri, Dec 08, 2023 at 03:47:00PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Dec 8, 2023 at 2:56=E2=80=AFPM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > >
> > > On Fri, Dec 08, 2023 at 02:12:45PM +0100, Linus Walleij wrote:
> > > > On Thu, Dec 7, 2023 at 7:38=E2=80=AFPM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:
> > > >
> > > > > The reason for that is that I'm stuck on some corner-cases relate=
d to
> > > > > the GPIO <-> pinctrl interaction. Specifically the fact that we h=
ave
> > > > > GPIOLIB API functions that may be called from atomic context whic=
h may
> > > > > end up calling into pinctrl where a mutex will be acquired.
> > > >
> > > > OK I see the problem.
> > > >
> > > > > An example of that is any of the GPIO chips that don't set the
> > > > > can_sleep field in struct gpio_chip but still use
> > > > > gpiochip_generic_config() (e.g. tegra186). We can then encounter =
the
> > > > > following situation:
> > > > >
> > > > > irq_handler() // in atomic context
> > > > >   gpiod_direction_output() // line is open-drain
> > > > >     gpio_set_config()
> > > > >       gpiochip_generic_config()
> > > > >         pinctrl_gpio_set_config()
> > > > >           mutex_lock()
> > > > >
> > > > > Currently we don't take any locks nor synchronize in any other wa=
y
> > > > > (which is wrong as concurrent gpiod_direction_output() and
> > > > > gpiod_direction_input() will get in each other's way).
> > > >
> > > > The only thing that really make sense to protect from here is
> > > > concurrent access to the same register (such as if a single
> > > > register contains multiple bits to set a number of GPIOs at
> > > > output or input).
> > > >
> > > > The real usecases for gpiod_direction_* I know of are limited to:
> > > >
> > > > 1. Once when the GPIO is obtained.
> > > >
> > > > 2. In strict sequence switching back and forth as in
> > > >     drivers/i2c/busses/i2c-cbus-gpio.c
> > > >     cbus_transfer()
> > >
> > > Isn't this a very special case already? cbus_transfer() holds the spi=
n
> > > lock across the entire function, so it will only work for a very smal=
l
> > > set of GPIO providers anyway, right? Anything that's sleepable just i=
s
> > > not going to work. I suspect that direction configuration is then als=
o
> > > not going to sleep, so this should be fine.
> > >
> >
> > Maybe we could switch to using gpiod_direction_*_raw() here and then
> > mark regular gpiod_direction_input/output() as might_sleep() and be
> > done with it? Treat this one as a special-case and then not accept
> > anyone new calling these from atomic context?
>
> Yeah, I2C CBUS already uses gpiod_set_value() in the same context as
> gpiod_direction_output()/gpiod_direction_input(), so it would've already
> warned about a mismatch anyway. Doing a test-run with the regular
> direction accessors marked as might_sleep() should flush out any other
> abusers.
>
> Thierry

We cannot possibly test all drivers out there but we can start out by
adding: `WARN_ON(in_atomic())` to the direction setters and getters
for the next release and then possibly switch to a full might_sleep()
if nobody complains?

Bart

