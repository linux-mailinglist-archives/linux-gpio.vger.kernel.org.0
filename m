Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBD43D9EDD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 09:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbhG2Hku (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 03:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbhG2Hku (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 03:40:50 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4A2C061757;
        Thu, 29 Jul 2021 00:40:46 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so14230512pja.5;
        Thu, 29 Jul 2021 00:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w0a44nIazAWCFeMTVCEPSrDUq0YniFKHNtq0Lfg2ohY=;
        b=t7g76zVFOW82+YW0LTokF9MjLOA1uv5TRTNkErJ+A5zrihX8F4YV0jMNwhp72ra3Qo
         j6/uIRxl7Syp0Jus87MCUNNvG028aI9vlfEKJYteeFsAGsDwU0e0BnkqUbX/PWk4Invp
         SBh/7NCKQOn88oLj2/TOukmnNx1mdX2408K+KuJD5EyGTvAUJUtuJRYZwMCOx1I9ECPQ
         qSkCol4vxbg0TqOU77Urzpd7DNcXd7b7FF5r18vz6vpVLRgaORohwdPZ0oekbGzgbiXd
         NH0k1oiS1Yzvn10cdydt+xWDWIDA4rFwv4jZ/Od/NzzUSDFuVfLHpyQriy0PGSGGaQ/D
         nPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w0a44nIazAWCFeMTVCEPSrDUq0YniFKHNtq0Lfg2ohY=;
        b=ABS62Z2kmuj702UeIKIMaQNu4I7NtK65TPh3PlJFgJ9+fTzaWIyn3YJHZ86fo341Sr
         7AJi74qVCIY7OpztHhYfyG7pvcK+fPysn2UpAf9/ZGKwcPhOVorSuO8KyrqWeo9hpOVw
         9tmKLLv9JO456xwbBg0K+KR88TROieFvp7ETKtw+QKkROh8iPssyPBwFwbyOn8yaH1e0
         CO1DWgS+978t9sLFsz3pizxKj5OUAHB46njujxCC583i53pp/d8AtOQ0MFKZnsPRrgu+
         g6WXGEieCkrb2YeFS5/RQ9xNE6cJad4AKWGhqbW/46s8Y5vc8Em60difw4nC010NyDoJ
         pgiQ==
X-Gm-Message-State: AOAM531xPqEPIcQE6aKdGEt+ChGZkocsFQiyzDgMOAEY72Fz/Pe8qhxd
        5ozysMVvmJWZhvBMrSZzu6xstJyYvtg8paTk26FQl8Ug8Xk=
X-Google-Smtp-Source: ABdhPJw5qTNwYA5vkwxrUjxBj2aoPq1ZzdhxfkGVQkBAcF/mi0Y9RzrkVX6d4p9LIzWpx2R9LR85dj2HijqNc4C4faY=
X-Received: by 2002:a17:90a:7146:: with SMTP id g6mr3944401pjs.228.1627544446084;
 Thu, 29 Jul 2021 00:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au> <CAHp75VeQML7njMZ6x8kC-ZJVexC1xJ6n1cB3JneVMAVfuOJgWw@mail.gmail.com>
 <d019990e-a725-4ef5-bb54-aadee9d18b86@www.fastmail.com> <CAHp75Vc2W+WmwNj1AvH6EiT_80c+5gADV9QzK+asHxpd1Ucppw@mail.gmail.com>
 <6cc64039-f82a-4c1e-ad2c-16fad7aa3178@www.fastmail.com>
In-Reply-To: <6cc64039-f82a-4c1e-ad2c-16fad7aa3178@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 29 Jul 2021 10:40:09 +0300
Message-ID: <CAHp75Vdx9QA7dmSWK8GHxBBxP0uYjrz=Gm=75yqaWbBX6k3v=w@mail.gmail.com>
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

On Thu, Jul 29, 2021 at 3:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 28 Jul 2021, at 18:43, Andy Shevchenko wrote:
> > On Wed, Jul 28, 2021 at 8:43 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > On Fri, 23 Jul 2021, at 17:45, Andy Shevchenko wrote:
> > >
> > > > I was briefly looking into patches 1-4 and suddenly
> > > > realized that the fix can be similar as in PCA9685 (PWM), I.e. we
> > > > always have chips for the entire pin space and one may map them
> > > > accordingly, requested in one realm (LED) in the other (GPIO)
> > > > automatically is BUSY. Or I missed the point?
> > >
> > > No, you haven't missed the point. I will look at the PCA9685 driver.
> > >
> > > That said, my goal was to implement the behaviour intended by the
> > > existing binding (i.e. fix a bug).
> >
> > Okay, so it implies that this used to work at some point.
>
> I don't think this is true. It only "works" if the lines specified as
> GPIO in the devicetree are contiguous from line 0. That way the pin and
> GPIO number spaces align. I suspect that's all that's been tested up
> until this point.
>
> We now have a board with a PCA9552 where the first 8 pins are LED and
> the last 8 pins are GPIO, and if you specify this in the devicetree
> according to the binding you hit the failure to map between the two
> number spaces.
>
> > What has
> > changed from that point? Why can't we simply fix the culprit commit?
>
> As such nothing has changed, I think it's always been broken, just we
> haven't had hardware configurations that demonstrated the failure.
>
> >
> > > However, userspace would never have
> > > got the results it expected with the existing driver implementation, so
> > > I guess you could argue that no such (useful) userspace exists. Given
> > > that, we could adopt the strategy of always defining a gpiochip
> > > covering the whole pin space, and parts of the devicetree binding just
> > > become redundant.
> >
> > I'm lost now. GPIO has its own userspace ABI, how does it work right
> > now in application to this chip?
>
> As above, it "works" if the GPIOs specified in the devicetree are
> contiguous from line 0. It's broken if they're not.

So, "it never works" means there is no bug. Now, what we need is to
keep the same enumeration scheme, but if you wish to be used half/half
(or any other ratio), the driver should do like the above mentioned
PWM, i.e. register entire space and depending on the requestor either
proceed with a line or mark it as BUSY.

Ideally, looking into what the chip can do, this should be indeed
converted to some like pin control + PWM + LED + GPIO drivers. Then
the function in pin mux configuration can show what exactly is enabled
on the certain line(s).


-- 
With Best Regards,
Andy Shevchenko
