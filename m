Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A39A465151
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 16:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350499AbhLAPW3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 10:22:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243357AbhLAPWQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 10:22:16 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42B1C061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 07:18:54 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id o29so20703615wms.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 07:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=SocG1K4Km9pityZDy8LZ6cbAsQD/fy8hCQDiq9C2wEc=;
        b=UFx+fv//tBONGiK+z8htFYIwDfao0KXOQs/xq3njMyn/pSrVamvrBpoNOquW0g3OYq
         xjitEbWec6dUdUUCEohqRjz1d4Z2pD4B9ia4FyUCBi5c/kQQs8SxiHJq0D2Mn0zEaYBP
         ag+sewFvXfgFSVo+B27OZOBmoswDmH9e4iq8FXDGMa/+gTlub4x9GibYM3+5dH0SnrBQ
         1HytCoEbh25lqXZCj7BY/ZTAQHn5Rg/AgVXVtIY9m8o8QbApTS5bIEbABvhURaAY8Hph
         NHvOYE0TCTVNVPfamzTFpOwKeFY8YHIXMKChKf4nF3tG3dIUP/cdK91KAfbKcT7o8e3p
         OMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SocG1K4Km9pityZDy8LZ6cbAsQD/fy8hCQDiq9C2wEc=;
        b=p3osAzD1tcjVklr3WHU94NCFFNmvC1OMGnK+WJ4pryfr45e4Ou+tGvA+et3SGKaTF0
         M2Okl2JbuFVqXeLjWT0qOHxtdl7kn90A7Xo/RI2Q5iiK2H2Rbbr4P5WJvpP8vC6yUPG6
         mwQegYLLuT6o2ONoTV5jR/GoGK0Me5YkM21F+kDHfdPSTesMwNiTCmGxfL+n7tfVzqIo
         Q62e9XIDrXY9KlXVq87XVTL7NZiNnyUmaTBRsKt/9w3VdxYl4ECpIO9JSgDkQKwCR5kZ
         8ZudgQe2NHdO8r5EV24GW4jfQZnZlbbV8UrPb8NsH6Axye9Jjah5LUHqDYhARZQHCwmH
         wnCw==
X-Gm-Message-State: AOAM532pIc3T2FnTC3nJjUp/G/weQF2EkoFJzTG1x4yASLrXqfYmOwUi
        c/Fo90XESqLy2BgyCK7veaKhzg==
X-Google-Smtp-Source: ABdhPJzi5YkLKACpYiy0/O9nTMFaton8K3JkoAfHFyk7pgZOLNVRU7r4rFm15NZLCPZtet0VtW9+Hg==
X-Received: by 2002:a7b:cd93:: with SMTP id y19mr7591237wmj.190.1638371933474;
        Wed, 01 Dec 2021 07:18:53 -0800 (PST)
Received: from ?IPV6:2a00:1098:3142:14:3430:4041:27d3:fbce? ([2a00:1098:3142:14:3430:4041:27d3:fbce])
        by smtp.gmail.com with ESMTPSA id g124sm1206703wme.28.2021.12.01.07.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 07:18:53 -0800 (PST)
Message-ID: <06345f5a-c8e7-848b-d25f-3f3e32ab5418@raspberrypi.com>
Date:   Wed, 1 Dec 2021 15:18:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] pinctrl: bcm2835: Change init order for gpio hogs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20211129105556.675235-1-phil@raspberrypi.com>
 <20211129105556.675235-2-phil@raspberrypi.com>
 <CAHp75Vei9FUY0gGD99gVv_FZzcpN1y_i65BB-auyAFUwqsQxNA@mail.gmail.com>
From:   Phil Elwell <phil@raspberrypi.com>
In-Reply-To: <CAHp75Vei9FUY0gGD99gVv_FZzcpN1y_i65BB-auyAFUwqsQxNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On 01/12/2021 12:06, Andy Shevchenko wrote:
> On Monday, November 29, 2021, Phil Elwell <phil@raspberrypi.com 
> <mailto:phil@raspberrypi.com>> wrote:
> 
>     ...and gpio-ranges
> 
>     pinctrl-bcm2835 is a combined pinctrl/gpio driver. Currently the gpio
>     side is registered first, but this breaks gpio hogs (which are
>     configured during gpiochip_add_data). Part of the hog initialisation
>     is a call to pinctrl_gpio_request, and since the pinctrl driver hasn't
>     yet been registered this results in an -EPROBE_DEFER from which it can
>     never recover.
> 
>     Change the initialisation sequence to register the pinctrl driver
>     first.
> 
>     This also solves a similar problem with the gpio-ranges property, which
>     is required in order for released pins to be returned to inputs.
> 
> 
> We have a callback in GPIO chip to register pin ranges, why driver does it 
> separately?

A few experiments (this is not my driver) appear to show that the call to 
pinctrl_add_gpio_range can be removed, but only once the gpio-ranges DT property 
has been added if we want to remain functionality throughout a bisect. That tidy 
up might be better done with a followup commit once the DT patch has also
been accepted, unless it's possible to guarantee the sequencing between
the pinctrl/gpio tree and the DT tree.

>     Fixes: 73345a18d464b ("pinctrl: bcm2835: Pass irqchip when adding
>                             gpiochip")
>     Signed-off-by: Phil Elwell <phil@raspberrypi.com <mailto:phil@raspberrypi.com>>
> 
> 
> 
> Is it originally so strange indentation or is it only on my side?

The "g" is below the "p" in the patch.

Thanks,

Phil

>     ---
>       drivers/pinctrl/bcm/pinctrl-bcm2835.c | 29 +++++++++++++++------------
>       1 file changed, 16 insertions(+), 13 deletions(-)
> 
>     diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>     b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>     index 2abcc6ce4eba..b607d10e4cbd 100644
>     --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>     +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>     @@ -1244,6 +1244,18 @@ static int bcm2835_pinctrl_probe(struct
>     platform_device *pdev)
>                      raw_spin_lock_init(&pc->irq_lock[i]);
>              }
> 
>     +       pc->pctl_desc = *pdata->pctl_desc;
>     +       pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
>     +       if (IS_ERR(pc->pctl_dev)) {
>     +               gpiochip_remove(&pc->gpio_chip);
>     +               return PTR_ERR(pc->pctl_dev);
>     +       }
>     +
>     +       pc->gpio_range = *pdata->gpio_range;
>     +       pc->gpio_range.base = pc->gpio_chip.base;
>     +       pc->gpio_range.gc = &pc->gpio_chip;
>     +       pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
>     +
>              girq = &pc->gpio_chip.irq;
>              girq->chip = &bcm2835_gpio_irq_chip;
>              girq->parent_handler = bcm2835_gpio_irq_handler;
>     @@ -1251,8 +1263,10 @@ static int bcm2835_pinctrl_probe(struct
>     platform_device *pdev)
>              girq->parents = devm_kcalloc(dev, BCM2835_NUM_IRQS,
>                                           sizeof(*girq->parents),
>                                           GFP_KERNEL);
>     -       if (!girq->parents)
>     +       if (!girq->parents) {
>     +               pinctrl_remove_gpio_range(pc->pctl_dev, &pc->gpio_range);
>                      return -ENOMEM;
>     +       }
> 
>              if (is_7211) {
>                      pc->wake_irq = devm_kcalloc(dev, BCM2835_NUM_IRQS,
>     @@ -1307,21 +1321,10 @@ static int bcm2835_pinctrl_probe(struct
>     platform_device *pdev)
>              err = gpiochip_add_data(&pc->gpio_chip, pc);
>              if (err) {
>                      dev_err(dev, "could not add GPIO chip\n");
>     +               pinctrl_remove_gpio_range(pc->pctl_dev, &pc->gpio_range);
>                      return err;
>              }
> 
>     -       pc->pctl_desc = *pdata->pctl_desc;
>     -       pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
>     -       if (IS_ERR(pc->pctl_dev)) {
>     -               gpiochip_remove(&pc->gpio_chip);
>     -               return PTR_ERR(pc->pctl_dev);
>     -       }
>     -
>     -       pc->gpio_range = *pdata->gpio_range;
>     -       pc->gpio_range.base = pc->gpio_chip.base;
>     -       pc->gpio_range.gc = &pc->gpio_chip;
>     -       pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
>     -
>              return 0;
>       }
> 
>     -- 
>     2.25.1
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
