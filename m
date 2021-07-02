Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6040B3B9E72
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 11:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhGBJnG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 05:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhGBJnF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 05:43:05 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75073C061762;
        Fri,  2 Jul 2021 02:40:33 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id j4so1738143uae.6;
        Fri, 02 Jul 2021 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EfNvLQqP0kFi/q/QwOw4n3oCTsPZ9Op+nfCqiBRc2NY=;
        b=Bt1hWfzsPbL7fVoXBAb7hyGYflyLMw9XuMFjSzOKyWqe/5BXXSGdlMInwNG3uxHPfg
         sLT0Ad6JZpZAXplnq7oKbamBvM8lmmTEaMpGSqSIRaO97XlURJCXbFelKSLK4FL9v8e6
         +cjpivrEHW5LaIMxAOQzx1qDWp94/6HLwKy60j1N1/fzRU3pRQnglFQN5nO8S2tcRSz8
         yTeSU5JgHwHRllt3W0WfRqUHz6J0JzQnorLnZCl/1dtO2u+VQLnuDR6AGUnbSB7+iTwy
         BOa44CZ1Ndb2qBh9bCo+SXpMcfm0FFj7Qt3Nf1yXQz8iAqHWju0XAy+FANcUw0xWXeXj
         wOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EfNvLQqP0kFi/q/QwOw4n3oCTsPZ9Op+nfCqiBRc2NY=;
        b=kRyH6u2J6m2zKi8DcZ4CSpn2Ibr07WRh6sz5qoxrpiJKHnuVzbTk9WWNOyUUCPTOo6
         tsN704xKo3lcT7rvimAIvkVQ6ceunnPilP3uAbJO8naFkAmJRWaZMy/HU5uNYWKe0JDl
         NNZfjxb2Vmjhn/l6otMITu7R/tZyPnPg81mpV7YN0+F8MtymbyR3+AcZGnnBCrkJcVmB
         Py9GeTVJ6tAWavK66PbBkeRJiweVB764YaxxyD12BPJovDxo5blAJfUa6hACCUjWAwO+
         3ZHzT7X04vRFLBgGzNXnXmlNUWNdB+rINv1e4yYIp3MorMLA8IJ2kXsusr+0CkVnd1ZR
         vV9g==
X-Gm-Message-State: AOAM531/m0sZathXfCjQF7k7Ze34GV3TD6ftY/zQNhhP/I1r3CWJJXFk
        O/SkfQrUgowvAHYo1QzhpFGGgDWxfnOSyZHnOiM=
X-Google-Smtp-Source: ABdhPJx5jzRg8GGxCCowMCBeLumqMOm7poZvhUC9p5Dyt4dxwS+k88706SiSUMQdj5UQ3ogdVr2cAvV+mncEqs7TmmI=
X-Received: by 2002:a9f:35e9:: with SMTP id u38mr5271023uad.131.1625218832077;
 Fri, 02 Jul 2021 02:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
 <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
 <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
 <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com>
 <CAHp75VcF-HDZ6mKvXT=zYnBrcPaNJ+SYJ72LQ7s-62zQ5ZqoQg@mail.gmail.com>
 <CAMhs-H9gw63j98vVo3y0ymW4_6rFNL8u5cYNM2hzyrmkPB3h3w@mail.gmail.com> <CAHp75VccSCWa=EH8i01_b_HLZRumUZ48oRjeuaV5Dp1BQAoz2w@mail.gmail.com>
In-Reply-To: <CAHp75VccSCWa=EH8i01_b_HLZRumUZ48oRjeuaV5Dp1BQAoz2w@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 2 Jul 2021 11:40:20 +0200
Message-ID: <CAMhs-H_Ne4W79Awbmo6w_68X+h0-ybjvzNsbh=XuHMPJJ8-hDQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Fri, Jul 2, 2021 at 11:27 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 27, 2021 at 4:13 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> > On Sun, Jun 27, 2021 at 3:01 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sun, Jun 27, 2021 at 1:56 PM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> > > > On Sun, Jun 27, 2021 at 12:51 PM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Sun, Jun 27, 2021 at 12:47 PM Sergio Paracuellos
> > > > > <sergio.paracuellos@gmail.com> wrote:
> > > > > > On Sun, Jun 27, 2021 at 11:33 AM Andy Shevchenko
> > > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > > On Sat, Jun 26, 2021 at 7:18 PM Sergio Paracuellos
> > > > > > > <sergio.paracuellos@gmail.com> wrote:
> > > > > > > >
> > > > > > > > The default handling of the gpio-line-names property by the
> > > > > > > > gpiolib-of implementation does not work with the multiple
> > > > > > > > gpiochip banks per device structure used by the gpio-mt7621
> > > > > > > > driver.
> > > > > > > >
> > > > > > > > This commit adds driver level support for the device tree
> > > > > > > > property so that GPIO lines can be assigned friendly names.
> > > > >
> > > > > > > > This driver has three gpiochips with 32 gpios each. Core implementation
> > > > > > >
> > > > > > > implementation
> > > > > > >
> > > > > > >
> > > > > > > > got gpio's repeated along each gpio chip if chip.names is not assigned.
> > > > > > > > To avoid this behaviour driver will set this names as empty or
> > > > > > >
> > > > > > > the driver
> > > > > > > these names
> > > > > > >
> > > > > > > > with desired friendly line names. Consider the following sample with
> > > > > > > > minimal entries for the first chip with this patch changes applied:
> > > > > > >
> > > > > > > The same comment as per v1:
> > > > > > >
> > > > > > > Any idea why it's not a duplicate of
> > > > > > > https://elixir.bootlin.com/linux/v5.13-rc7/C/ident/devprop_gpiochip_set_names,
> > > > > > > and why the latter is not called in your case?
> > > > > >
> > > > > > The core properly calls this function but not in the way expected.
> > > > > > This driver implements three banks of 32 gpios each internally using
> > > > > > one gpiochip per bank, all of them in the same device. So the core
> > > > > > code you are pointing out here duplicates the same names along the
> > > > > > three gpiochips which is not the expected behaviour. So implementing
> > > > > > in this way and setting names at least reserved avoids the core code
> > > > > > to be run and also avoids the duplication getting expected behaviour
> > > > > > for all the banks and each line friendly name.
> > > > >
> > > > > Isn't it the problem of how we supply fwnode in that case?
> > > > > Another possibility is to fix DT (although I'm not sure it's now possible).
> > > >
> > > > Since the fwnode is the same for all banks of the same device, each bank
> > > > repeats the first MTK_BANK_WIDTH label names in each bank.
> > >
> > > Can you point out the DT in question?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/drivers/staging/mt7621-dts/mt7621.dtsi?h=staging-next
> >
> > Gpio node:
> >
> >  gpio: gpio@600 {
> >               #gpio-cells = <2>;
> >               #interrupt-cells = <2>;
> >               compatible = "mediatek,mt7621-gpio";
> >               gpio-controller;
> >               gpio-ranges = <&pinctrl 0 0 95>;
> >               interrupt-controller;
> >               reg = <0x600 0x100>;
> >               interrupt-parent = <&gic>;
> >               interrupts = <GIC_SHARED 12 IRQ_TYPE_LEVEL_HIGH>;
> >    };
> >
> > My overlay:
> >
> > &gpio {
> >     gpio-line-names = "", "", "", "",
> >                       "", "", "SFP LOS", "extcon port5 PoE compat",
> >                       "SFP module def0", "LED blue SFP", "SFP tx disable", "",
> >                       "switch USB power", "mode", "", "buzzer",
> >                       "LED blue pwr", "switch port5 PoE out", "reset";
> > };
> >
> >
> >
> > >
> > > > This commit populates the gc.names member of each bank from the
> > > > device-tree node within the driver. This overrides the default behavior
> > > > since devprop_gpiochip_set_names() will only be called if names is NULL.
> > >
> > > I believe this commit is not needed in the proposed (i.e. duplication) shape.
> > > The fwnode supports primary and secondary ones. Thus, we may create a
> > > pair of fwnodes when they will unify properties per device with
> > > properties per child together (child is primary and device, i.e.
> > > parent, is secondary).
> >
> > There are no child nodes, all the stuff is in the same parent node
> > and, as I said, belongs to the same device but internally uses three
> > gpiochips.
>
> And it can't be split into three children in the overlay?

Original code before this being mainlined was using three children and
I was told in the review that three children were not allowed:

See https://patchwork.ozlabs.org/project/linux-gpio/patch/1527924610-13135-3-git-send-email-sergio.paracuellos@gmail.com/#1932827

> Let's assume it can't, then the GPIO library function should be
> refactored in a way that it takes parameters like base index for the
> names and tries to satisfy the caller.

Bartosz, Linus, any thoughts on this?

>
> > This case is pretty much the same as the following already
> > added commit for gpio-brcmstb:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/drivers/gpio/gpio-brcmstb.c?id=5eefcaed501dd9e3933dbff58720244bd75ed90f
>
> This should be fixed accordingly.

Obviously, the treatment should be the same, yes :)

Best regards,
    Sergio Paracuellos
>
> --
> With Best Regards,
> Andy Shevchenko
