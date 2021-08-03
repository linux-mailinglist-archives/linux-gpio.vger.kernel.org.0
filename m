Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19003DEAFC
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 12:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235495AbhHCKep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 06:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235458AbhHCKef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 06:34:35 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AC7C06179A;
        Tue,  3 Aug 2021 03:34:14 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id t3so21046581plg.9;
        Tue, 03 Aug 2021 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gUlOdJ9XQT6Y1TLMVY7TvS0f9TdTpUJkbcu/euswTpI=;
        b=OVGAJCGQgKOfrQtMQ+7oLZn99a1NlqUPMTDYPgr7T9jc92sQG/9KI8DH0WfHC+/HiE
         saufWO4B0WzYKSYqksSWu5YnTe0LBW0kDJG9cc9cXJ55JMOlW9mgc4HxYDnFNTlQbkNi
         dBCm1uqNi8kfufYnmAyNtGBKzB9qBGA+SXDKn2X/Ls7CFl3F4qAgWj1dHnIg9DuDIKu1
         XEiufcn580Usz96z7gH9cW2vzLamg9tdNJBtiaW53Y6zaR9eHIu57raRdPDmSznS52Z+
         NMe474lh61Fc5mMDSo8gM3x4Ba348w+2PlOZdMX8DqlG0DGtqigoyUobasMWjUkAuD/D
         qWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gUlOdJ9XQT6Y1TLMVY7TvS0f9TdTpUJkbcu/euswTpI=;
        b=HOvztEg2mw+FYBdNU/Rb2N3bSx5Icvr9Gk1iFiMtbok4SWNWYRuGSOnDa1solXHOVC
         YMLQxNqDuOLdGr3TaOnND01pqFZqYsdXqjuoTPNao3FZh0Ai7WBfSaBaiNq9jCk6zz41
         e9KqLnMQ8D8EsZl/tBLFhXyoXjb+JWWv27xcsEd6xWFpsZOMfttzfHfwgUG/XSrkAjgL
         3BrL+0h35v0PoMKFptIbEQkUgcYbtd3dQVYVl2lmUc+gtfklA63WVPzZbcDs9M874lWD
         +LSS++Ke7g/ZvRYb3e0raUKtMu2IS5JhPquBbJBUnI1MBEvWEcn0yGBUHrhog0ol2kWA
         2jJg==
X-Gm-Message-State: AOAM532GSaCFeK8MnzsFRGI/IjTfSS4qSDCJczChZG69Sx35Ty5MNRNF
        5Z10abpSLjTpNGhj5rOjR4TcSwQQUHu6Ihtf7ly3tSlN50YfGw==
X-Google-Smtp-Source: ABdhPJy8/GLzJXE0Sbq4RzvQ2nMWzsr/B9cP3HzwsDbrXs4gyEVrA0uvccH3J3UGBLIYJ9viNfcDuohGBOr5NXxaViI=
X-Received: by 2002:a17:902:b713:b029:12b:b249:693f with SMTP id
 d19-20020a170902b713b029012bb249693fmr1633411pls.17.1627986854331; Tue, 03
 Aug 2021 03:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au> <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
 <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com> <CAHp75Vc2W+WmwNj1AvH6EiT_80c+5gADV9QzK+asHxpd1Ucppw@mail.gmail.com>
 <6cc64039-f82a-4c1e-ad2c-16fad7aa3178@www.fastmail.com> <CAHp75Vdx9QA7dmSWK8GHxBBxP0uYjrz=Gm=75yqaWbBX6k3v=w@mail.gmail.com>
 <50aaf381-8cda-4656-9222-f23fda75d3bc@www.fastmail.com>
In-Reply-To: <50aaf381-8cda-4656-9222-f23fda75d3bc@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 3 Aug 2021 13:33:38 +0300
Message-ID: <CAHp75Ve-6zKE9UX+LR022cGAA6xvd8CeLnnKE_fT3snnzmNusA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] leds: Fix pca955x GPIO pin mappings
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 3, 2021 at 7:07 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 29 Jul 2021, at 17:10, Andy Shevchenko wrote:
> > On Thu, Jul 29, 2021 at 3:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > On Wed, 28 Jul 2021, at 18:43, Andy Shevchenko wrote:
> > > > On Wed, Jul 28, 2021 at 8:43 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > > However, userspace would never have
> > > > > got the results it expected with the existing driver implementation, so
> > > > > I guess you could argue that no such (useful) userspace exists. Given
> > > > > that, we could adopt the strategy of always defining a gpiochip
> > > > > covering the whole pin space, and parts of the devicetree binding just
> > > > > become redundant.
> > > >
> > > > I'm lost now. GPIO has its own userspace ABI, how does it work right
> > > > now in application to this chip?
> > >
> > > As above, it "works" if the GPIOs specified in the devicetree are
> > > contiguous from line 0. It's broken if they're not.
> >
> > So, "it never works" means there is no bug. Now, what we need is to
> > keep the same enumeration scheme, but if you wish to be used half/half
> > (or any other ratio), the driver should do like the above mentioned
> > PWM, i.e. register entire space and depending on the requestor either
> > proceed with a line or mark it as BUSY.
> >
> > Ideally, looking into what the chip can do, this should be indeed
> > converted to some like pin control + PWM + LED + GPIO drivers. Then
> > the function in pin mux configuration can show what exactly is enabled
> > on the certain line(s).
>
> So just to clarify, you want both solutions here?
>
> 1. A gpiochip that covers the entire pin space
> 2. A pinmux implementation that manages pin allocation to the different drivers
>
> In that case we can largely leave this series as is? We only need to
> adjust how we configure the gpiochip by dropping the pin-mapping
> implementation?

Nope. It's far from what I think of. Re-reading again your cover
letter it points out that pin mux per se does not exist in the
hardware. In this case things become a bit too complicated, but we
still may manage to handle them. Before I was thinking about this
hierarchy

1. pinmux driver (which is actually the main driver here)
2. LED driver (using regmap API)
3. GPIO driver (via gpio-regmap)
4. PWM driver.

Now what we need here is some kind of "virtual" pinmux. Do I
understand correctly?

To be clear: I do not like putting everything into one driver when the
logical parts may be separated.

-- 
With Best Regards,
Andy Shevchenko
