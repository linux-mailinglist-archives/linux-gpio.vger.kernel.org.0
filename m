Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18DD9D6CB0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 02:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbfJOA66 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 20:58:58 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37676 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbfJOA66 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 20:58:58 -0400
Received: by mail-pg1-f193.google.com with SMTP id p1so11041236pgi.4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 17:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=i//9LDnGsJ0deSar7ha7EUOFxjhGQDbfJpc1q7rRvEM=;
        b=Wy0jLTW4Y2GSmKzaywfj2Xkln5RixMi/A1sR0p5ZGkrxNkBjRq2PKMiNyjh7N44mkz
         Pjecc+l8VGsev3IVybcOeO/vM8b+bJvJKvZ5aXDWyWpDh0p/m2t10fAFEkH4iNgpXGDI
         jBkD0U1L+3iXRGhOUDcrxCEy11c9N1MR6ncgQU27d52eZsow4SxvtofVMH6+1dTSKg9w
         nuW9Te6JhuTAiVllJADsBfawo9P5LlJ7GshHX9po/C9KpznvKf2QDNsrkSVFz1zW+cna
         v5EzTHmjb8WE0U8EAuIkyzWKbuqgv1YtBhCZ5qu27ZYxLkCwlHkc908ruhgy1Vm1xCI9
         PQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=i//9LDnGsJ0deSar7ha7EUOFxjhGQDbfJpc1q7rRvEM=;
        b=C84Z/DowYziMnHaIMXAWWub3XBmcbPrVNMdESDZ12bJDwq2jz/zh1NJCZgc30kemnV
         coeOf7JUNckALJ4OAoi6jwzEuFtbXDf87oSJxTDSwS4aIRFZm/803BljftX98O3LKtvz
         Zma1qYpMONlmdv8gXf9tuJ1E3wTqU3xZjeqcVSRFRWqz5pjas/xxSn88SDR5tMPyzLhx
         2lU17pZ7oxvaarhft5zo2j0H1lnYVgMyKrrVkf3cWLE/7rfnT+OWU9RfPoXkx1juI0a2
         RIkm0DPsm9yUfAiDD+twNxa9Eizg4D9SYbT/ugKevckuvd9a+uNXE7t9fZgjT4Qkd/T0
         nxcA==
X-Gm-Message-State: APjAAAXvL4H3nzud90eGh0wnsTxviU1zd00erENdEb11kGSj9ScjkoTj
        DBeuo9slAjnmJ6/KYJm8jWQ=
X-Google-Smtp-Source: APXvYqyikKbicYAlPSF43fPTR9iVrx+E/zJdeqpG34GQOR7yNhaipos16YTVzEfItvpyiDZXdRivLw==
X-Received: by 2002:a63:f908:: with SMTP id h8mr34837294pgi.244.1571101135236;
        Mon, 14 Oct 2019 17:58:55 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id v1sm22805746pjd.22.2019.10.14.17.58.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 17:58:54 -0700 (PDT)
Date:   Tue, 15 Oct 2019 08:58:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v2 5/6] gpiolib: disable bias on inputs when pull up/down
 are both set
Message-ID: <20191015005849.GA7970@sol>
References: <20191012015628.9604-1-warthog618@gmail.com>
 <20191012015628.9604-6-warthog618@gmail.com>
 <CAMRc=McL+Z2J5kiCQUNbHbxJyfyoLf6XOOrFx3NPNH2+tSh4wg@mail.gmail.com>
 <20191014130425.GC28012@sol>
 <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 06:50:41PM +0200, Bartosz Golaszewski wrote:
> pon., 14 paź 2019 o 15:04 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Mon, Oct 14, 2019 at 02:43:54PM +0200, Bartosz Golaszewski wrote:
> > > sob., 12 paź 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > This patch allows pull up/down bias to be disabled, allowing
> > > > the line to float or to be biased only by external circuitry.
> > > > Use case is for where the bias has been applied previously,
> > > > either by default or by the user, but that setting may
> > > > conflict with the current use of the line.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > > >  drivers/gpio/gpiolib.c | 22 +++++++---------------
> > > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > index 647334f53622..f90b20d548b9 100644
> > > > --- a/drivers/gpio/gpiolib.c
> > > > +++ b/drivers/gpio/gpiolib.c
> > > > @@ -539,11 +539,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> > > >             (lflags & GPIOHANDLE_REQUEST_OUTPUT))
> > > >                 return -EINVAL;
> > > >
> > > > -       /* Same with pull-up and pull-down. */
> > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > -               return -EINVAL;
> > > > -
> > > >         /*
> > > >          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
> > > >          * the hardware actually supports enabling both at the same time the
> > > > @@ -935,14 +930,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> > > >              (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
> > > >                 return -EINVAL;
> > > >
> > > > -       /*
> > > > -        * Do not allow both pull-up and pull-down flags to be set as they
> > > > -        *  are contradictory.
> > > > -        */
> > > > -       if ((lflags & GPIOHANDLE_REQUEST_PULL_UP) &&
> > > > -           (lflags & GPIOHANDLE_REQUEST_PULL_DOWN))
> > > > -               return -EINVAL;
> > > > -
> > > >         le = kzalloc(sizeof(*le), GFP_KERNEL);
> > > >         if (!le)
> > > >                 return -ENOMEM;
> > > > @@ -2931,6 +2918,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
> > > >         unsigned arg;
> > > >
> > > >         switch (mode) {
> > > > +       case PIN_CONFIG_BIAS_DISABLE:
> > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > >                 arg = 1;
> > > > @@ -2991,7 +2979,11 @@ int gpiod_direction_input(struct gpio_desc *desc)
> > > >         if (ret == 0)
> > > >                 clear_bit(FLAG_IS_OUT, &desc->flags);
> > > >
> > > > -       if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > +       if (test_bit(FLAG_PULL_UP, &desc->flags) &&
> > > > +               test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > +               gpio_set_config(chip, gpio_chip_hwgpio(desc),
> > > > +                               PIN_CONFIG_BIAS_DISABLE);
> > > > +       else if (test_bit(FLAG_PULL_UP, &desc->flags))
> > >
> > > From looking at the code: user-space can disable bias when setting
> > > both PULL_UP and PULL_DOWN flags. I don't understand why it's done in
> > > this implicit way? Why not a separate flag?
> >
> > An extra flag would waste a bit and add nothing but more sanity checking.
> >
> 
> I disagree. The user API needs to be very explicit. Sanity checking is
> alright - if there'll be too many ifdefs, we can start thinking about
> adding some core library helpers for sanitizing conflicting flags, I'm
> sure other frameworks could use something like this as well.
> 
> Especially in this context: setting PULL_UP and PULL_DOWN together
> disables bias - this doesn't make sense logically.
> 
In a way it does make a weird kind of sense - they cancel.  Physically.

Did you read the cover letter?  The problem, as I see it,
is that we're stuck using a flag field to encode a two bit enum.
That fact the we only have a flag field to play with can't be
changed due to ABI.
I'd be happier adding utils to pull bit fields out of flags.

It makes no sense to me to add another flag, so I wont be doing that.

Cheers,
Kent.

