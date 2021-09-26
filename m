Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C29418693
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Sep 2021 07:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhIZFLB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Sep 2021 01:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbhIZFLA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Sep 2021 01:11:00 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BAAC061570
        for <linux-gpio@vger.kernel.org>; Sat, 25 Sep 2021 22:09:24 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id x7so39058822edd.6
        for <linux-gpio@vger.kernel.org>; Sat, 25 Sep 2021 22:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZwmxiJplNaUDWRob1Y5K502f8Y/tXmKQGcU3N6EbHXc=;
        b=IFjcoMEkeJmT6H259G3Ydz5V1X7WctpO0rorGz8gWTPDycrfEujI9ozLcdjFC82lib
         dbBBdlEe2hvM/9/UDTr6lNrk1dzVsUxg/5UOg1khUQJdWt7svUqjbdQ/rwghcJ0g2YFW
         iXAFHp5WJ9TTN2OgQ2ZBiBMpk8zmoVvbJcOz4zygN2AGgGz25e+TWC5p56g2WxOPLEVI
         45E2MKFizwftpe4OOkBrDfWoyAocT8mRd0Z6jcPMr4OAwHfPnm3N8GXPgbz444XYtc1Y
         yUU7MvmOL/H2Hz1vnvqSV4GUfYe9tMQ1O/8qOlyMVus99xI1G1x2CL1W8iGAZiLjlNZv
         pssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZwmxiJplNaUDWRob1Y5K502f8Y/tXmKQGcU3N6EbHXc=;
        b=awn9hCPGQAEHgx03WTw6tVhlh1agX6IybM1q4lrFZ4Vu1fYNejmSSa6UmwGFLjy2tL
         CI+rXakOeEroZZpoWSLhevHigs6mY9Tsofe9vgvqH/WL5xRPtDAxRyVCJSN9Q/O/13f8
         KlvEENSjzegTbjEY27pc7sxjA1p0FCR9uEWHWoOhDXzTGWDBN+/tdE61+uHceovd6rD7
         KlN1hbTK6khG1aetcgjnpRDGfd8/hn3Vm+4uPpzoDimm106HCDmqx5sFDO1oyorKIrxQ
         IyjsZ7S15xET15j/DmAOMF5W7OH/rsmlhwyJAoiN8AF+bjE4723wfeOxWdp7jvuqiKu2
         kcKg==
X-Gm-Message-State: AOAM5305RSjy5ekt7HgGHq4E45f1yCzT8tKaX3rL/0FpEDESvgj634+V
        0AY5oGVUKLrC7H6DxwHyqjyvN4NmpdEzvgrcIHI=
X-Google-Smtp-Source: ABdhPJzn2KYMFEDCks/NrpVOjE/1n0Ek8vbRiUREINVsXTSjPEtS3saidJJuuy6mtBFxPkKZhxA0lAdTx4ILfDsIHSA=
X-Received: by 2002:a50:e188:: with SMTP id k8mr15842715edl.119.1632632963210;
 Sat, 25 Sep 2021 22:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com> <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com> <20210925134425.GA4681@e124191.cambridge.arm.com>
In-Reply-To: <20210925134425.GA4681@e124191.cambridge.arm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 26 Sep 2021 08:08:46 +0300
Message-ID: <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, nd@arm.com,
        Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 25, 2021 at 4:45 PM Joey Gouly <joey.gouly@arm.com> wrote:
> On Wed, Sep 22, 2021 at 10:20:39AM +0300, Andy Shevchenko wrote:

...

> > > +F: drivers/pinctrl/pinctrl-apple-gpio.c
> >
> > Are you sure it's a good naming? Have you guaranteed that next Apple silicons
> > will use the same / compatible IP?
> We don't know what will be in future Apple SoCs, however this same GPIO
> HW has been in iPhones dating back to at least the iPhone 7 (2016). If
> there are minor changes we can add a new compatible, and if there is new
> HW in the future we can introduce a new file for it.

Do we have a chip name? For example, for M1 it's T8101 or something
like that. I would use a chip name/family rather than a broad brand
name.

...

> > > +   prev = readl(ppin);
> > > +   cfg = (prev & ~clr) | set;
> > > +
> > > +   if(!(prev & REG_GPIOx_CFG_DONE))
> > > +           writel(cfg & ~REG_GPIOx_CFG_DONE, ppin);
> > > +   writel(cfg, ppin);
> >
> > Is it IP requirement to have sequential writes? Can it be done in one?
> We unfortunately don't have the documentation for this HW, so this behaviour is
> based on observing what macOS does.

So, then there are following remarks/questions:
1/ Have you tested when it does a single write?
2/ If it doesn't work, this piece deserves a good comment.

...

> > > +   if(!of_find_property(node, "gpio-controller", NULL)) {
> > > +           dev_err(pctl->dev, "Apple GPIO must have 'gpio-controller' property.\n");
> > > +           return -ENODEV;
> > > +   }
> >
> > How is it possible?
> This is possible if booted with an invalid DTB. "gpio-controller" is a
> required property according to Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml.

No, we don't do silly checks. Compare to other pin control drivers. If
DTB is wrong, you will see it sooner or later.

...

> > > +   if (of_find_property(node, "interrupt-controller", NULL)) {
> >
> > Are you sure you need this check and OF core doesn't provide a generic way for this?
> >
> I don't think so, and pinctrl-equilibrium.c does something similar in
> `gpiochip_setup`.

Linus? Do we really need this?

...

> > > +   if (of_parse_phandle_with_fixed_args(pdev->dev.of_node, "gpio-ranges",
> > > +                   3, 0, &pinspec)) {
> > > +           dev_err(&pdev->dev, "gpio-ranges property not found\n");
> > > +           return -EINVAL;
> > > +   }
> > > +
> > > +   pctl->npins = pinspec.args[2];
> > > +   pin_base = pinspec.args[1];
> >
> >
> > Isn't this being provided by pin control?
> Not that I am aware of. It is a similar pattern to other pinctrl drivers
> like pinctrl-rza1.c and pinctrl-npcm7xx.c. The driver needs to get the
> number of pins/base from the DT to setup the internal data structures.

So, maybe you need to refactor the pin control core first and provide
some stubs that will serve your purposes, but to me it sounds weird to
have all these checks.

Linus, what is your opinion / input here?

-- 
With Best Regards,
Andy Shevchenko
