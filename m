Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC3A3D8A64
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 11:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235455AbhG1JNp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 05:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235520AbhG1JNo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 05:13:44 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F88BC0613CF;
        Wed, 28 Jul 2021 02:13:43 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id f13so1923304plj.2;
        Wed, 28 Jul 2021 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6m4UZEx/kYzeDD67ywCPsN6+L14vcm0XjCn8vgnR0gs=;
        b=iC6z8Qctytr3DWMW26XBlXyJXmcX9mHqtGYg7L6xD94wbl7ajzQi5zIilGaoIAsNBu
         ZN7L0JWLQB0NsyAQiW+JqWlOT1mTbK4f+uOaBNUne3qrnSByPi9LK4eaUGHE6oXAo+tw
         7gXczYP9K2NW9xgp4RU0Wn0tG7xRBm8dvpW/t/+zJk+V0r1Lb6GZzxN+922cNAK3aV+j
         lKtMq4xZPZfiDze9gJjeELttGZiHW7K0jpIUX7aPHQVSLXgmQga/VBWMx7C7W9UDTxml
         zt0rZuogVBn8QhRnDgl2my8YDzXxJUe2Cy1wtm27Z5pRU6koXTuaHQgUeJXb1z/uUgVX
         Qrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6m4UZEx/kYzeDD67ywCPsN6+L14vcm0XjCn8vgnR0gs=;
        b=PUjkq5B1sWa0E3dOPmT2GEukvgq/pSjuUldr3TjQu3lRiIwYQxuPURmRXaZ0DogowA
         zrW/T0LEZRAi54f3kqG57fP+eDcFwOuBP1LbtbTKmD82awpzp+juGaD83SO8WnkoIRTo
         zGl/kIjF8f8/6TghFUMa2+veeVAHguLPspshtfF9fRAor+3WX6Avu7CLof1XAhkzJ4XC
         8dWcg8duXeBi4Sx2KvIEemb+fAHszFyIwWIy8/zjt/vKgKZTfw0aQc0OXuyNybN9qrcu
         q4w9+p7ySHJpxDpQIRt6nDVmPDVzi1yqBaEWS8zD3oS4ZxtUyIhaZ0seXb1cVk1ql4ur
         gRug==
X-Gm-Message-State: AOAM532ZDkGtX55k0RKd7AfriGSxKt6icOHLQj4q/j4k6fyD2VPWq4au
        TF5zKbF+0ENBPH7Huhv1sqMC/hrZQhsx4ksxs/8=
X-Google-Smtp-Source: ABdhPJyyR2mCT0pEZEhhVsDOslGMUTe+AfTMeNLSOODQi5iwax+TD6tMAXsYw27Coe070sKnGki21opJt2OQkPeCxzA=
X-Received: by 2002:a17:902:ac90:b029:12c:e7a:c183 with SMTP id
 h16-20020a170902ac90b029012c0e7ac183mr14859743plr.21.1627463622505; Wed, 28
 Jul 2021 02:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au> <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
 <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com>
In-Reply-To: <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Jul 2021 12:13:06 +0300
Message-ID: <CAHp75Vc2W+WmwNj1AvH6EiT_80c+5gADV9QzK+asHxpd1Ucppw@mail.gmail.com>
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

On Wed, Jul 28, 2021 at 8:43 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 23 Jul 2021, at 17:45, Andy Shevchenko wrote:
> > On Friday, July 23, 2021, Andrew Jeffery <andrew@aj.id.au> wrote:

> > > This series does a bunch of crimes, so it's an RFC. I'm cross-posting to the
> > > pinctrl/GPIO and LEDs lists because the PCA955x devices impact all of them. What
> > > needs fixing is the leds-pca955x driver's failure to map the GPIO numberspace to
> > > the pin numberspace of the PCA955x devices. The series solves that by
> > > implementing pinctrl and pinmux in the leds-pca955x driver.
> > >
> > > Things I'm unsure about:
> > >
> > > 1. Patch 1: The pinctrl_gpio_as_pin() API feels a bit dirty, not sure what
> > >    others thoughts are on that (Linus?).
> > >
> > > 2. Patch 2: I've added a new callback to hook the entirety of the pinctrl map
> > >    parsing rather than supplying a subnode-specific callback. This was necessary
> > >    to handle the PCA955x devicetree binding in a backwards compatible way.
> > >
> > > 3. Patch 4: The PCA955x devices don't actually have any pinmux hardware, but the
> > >    properties of the pinctrl/pinmux subsystems in the kernel map nicely onto the
> > >    problem we have. But it's quite a bit of code...
> > >
> > > 4. Patch 6: I also lost a bunch of time to overlooking the get_group_pins()
> > >    callback for pinctrl, and it seems odd to me that it isn't required.
> > >
> > > Please review!
> >
> >
> > Sounds like a hack.
>
> Yes, possibly. Feedback like this is why I sent the series as an RFC.
>
> > I was briefly looking into patches 1-4 and suddenly
> > realized that the fix can be similar as in PCA9685 (PWM), I.e. we
> > always have chips for the entire pin space and one may map them
> > accordingly, requested in one realm (LED) in the other (GPIO)
> > automatically is BUSY. Or I missed the point?
>
> No, you haven't missed the point. I will look at the PCA9685 driver.
>
> That said, my goal was to implement the behaviour intended by the
> existing binding (i.e. fix a bug).

Okay, so it implies that this used to work at some point. What has
changed from that point? Why can't we simply fix the culprit commit?

> However, userspace would never have
> got the results it expected with the existing driver implementation, so
> I guess you could argue that no such (useful) userspace exists. Given
> that, we could adopt the strategy of always defining a gpiochip
> covering the whole pin space, and parts of the devicetree binding just
> become redundant.

I'm lost now. GPIO has its own userspace ABI, how does it work right
now in application to this chip?

-- 
With Best Regards,
Andy Shevchenko
