Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE6D34D60A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 19:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhC2R3C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 13:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhC2R2d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 13:28:33 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A63C061756
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 10:28:33 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eaff:9f01:70e:2270:a87a:b884] (unknown [IPv6:2a02:a03f:eaff:9f01:70e:2270:a87a:b884])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 2AB511E7666;
        Mon, 29 Mar 2021 19:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1617038911;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=apILH2jxXe5LN9Q5vQyV4TB4Zz2YYgHtPcywUUL5P/E=;
        b=yxACvTg3B1nOkj65s3tLMRiT7fWm/iQILsv7M6QeP6/OHtJbEsyQ/KK9ht7wbLR65oRUkd
        Cu0pekst/vUhYgVaQMfk5Z2IhNFkq8Lv0jzTy2ZEbVQ35/a5sV5hqe4DOfmHDrIzeysmIv
        A5tZ1NuNGHsc39Ltdu/Kuki5WZeWQA3k0IRO6Ja9aixPqX9FfBOYSwuyrkTwh9OtfBa7pJ
        eJhZEywb5glEXd59hgcqpmQLqFP6dR9VUVLox5GXFvCoD56x7v9+VE7Pe8K+zDPUv6Vqts
        +FvMBDzXMTMiYwgeS7/ghksCmTTB7rH0tEDXaGMQ6MIX+MRCAPrmIrIekm+FAQ==
Message-ID: <537a2becc81360f314a4293f7bb619ed2a377cb6.camel@svanheule.net>
Subject: Re: [PATCH v4 2/2] gpio: Add Realtek Otto GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Date:   Mon, 29 Mar 2021 19:28:28 +0200
In-Reply-To: <CAHp75VfTkfBqHc1S1aUm0Pr-=L_FNDUqkoH_x+KJgkXdZ33VAA@mail.gmail.com>
References: <cover.1616760183.git.sander@svanheule.net>
         <31e5a5aeb833c43c07daafcf939864497ff1c349.1616760183.git.sander@svanheule.net>
         <CAHp75Vdi06dLxJNCo4f1CA=cS1MuPwG0nEAnVqt8BRrz9bnOtw@mail.gmail.com>
         <f5059092c1d4f3a23683a2eebfa37cb739881a8a.camel@svanheule.net>
         <CAHp75VfTkfBqHc1S1aUm0Pr-=L_FNDUqkoH_x+KJgkXdZ33VAA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Thank you for clarifying your remarks. I'll support for building as a
module, and have implemented the gpio_irq_chip->init_hw() callback.

On Mon, 2021-03-29 at 13:26 +0300, Andy Shevchenko wrote:
> On Fri, Mar 26, 2021 at 11:11 PM Sander Vanheule <
> sander@svanheule.net> wrote:
> > On Fri, 2021-03-26 at 20:19 +0200, Andy Shevchenko wrote:
> > > On Fri, Mar 26, 2021 at 2:05 PM Sander Vanheule <
> > > sander@svanheule.net>
> > > wrote:
> > > > +static const struct of_device_id realtek_gpio_of_match[] = {
> > > > +       { .compatible = "realtek,otto-gpio" },
> > > > +       {
> > > > +               .compatible = "realtek,rtl8380-gpio",
> > > > +               .data = (void *)GPIO_INTERRUPTS
> > > 
> > > Not sure why this flag is needed right now. Drop it completely for
> > > good.
> > > > +       },
> > > > +       {
> > > > +               .compatible = "realtek,rtl8390-gpio",
> > > > +               .data = (void *)GPIO_INTERRUPTS
> > > 
> > > Ditto
> > 
> > Linus Walleij asked this question too after v1:
> > https://lore.kernel.org/linux-gpio/e9f0651e5fb52b7d56361ceb30b41759b6f2ec13.camel@svanheule.net/
> > 
> > Note that the fall-back compatible doesn't have this flag set.
> 
> AFAICS all, except one have this flag, I suggest you to do other way
> around, i.e. check compatible string in the code. Or do something more
> clever. What happens if you have this flag enabled for the fallback
> node?
> 
> If two people ask the same, it might be a smoking gun.
> 

Testing for the fallback wouldn't work, since of_device_is_compatible()
would always match. Setting the (inverse) flag only on the fallback
would indeed reduce the clutter.

If the port order is reversed w.r.t. to the current implementation,
enabling a GPIO+IRQ would enable the same pin on a different port. I
don't think the result would be catastrophical, but it would result in
unexpected behaviour. When A0 and C0 are then enabled, A0 interrupts
would actually come from C0, and vice versa.

   Intended port | A | B | C | D
-----------------+---+---+---+---
Actual GPIO port | D | C | B | A
 Actual IRQ port | B | A | D | C

If only the actual GPIO ports change, at least you can still use a
modified GPIO line number and polling. The user could just leave out
the optional irq-controller from the devicetree, but I would rather
have it enforced in some way.


Best,
Sander

