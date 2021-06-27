Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9E23B535B
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 15:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhF0NP0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 09:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhF0NP0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 09:15:26 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AAFC061574;
        Sun, 27 Jun 2021 06:13:02 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id k16so3288371vke.10;
        Sun, 27 Jun 2021 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Tjgpm1kVGPAXZNtvvMM1nI0Pgj2qqCr902KolbR97E=;
        b=OMIhE0ZTrJXr/MGgShocUO/UXr4TJFwicQViAbxi7vTJwKvig9mbBL1gt722Ip9EMz
         SfpheKV68hCGBSOCkj5hHKtOa+TjVTCk+4L20q38kOZGlemJrERA+BEUUMyQCDSGaBOP
         feftPL2nwokUfAYqRUkyxg6bJSHXqZSxm1OyaKmSaP/lFRJ8HJEqX2Ys6a27clFrQg3+
         /RxrLvQEjtcYUHn/hi1PrsgrkFPcWukg4enGf365ZW1NFS3NGE5uVtxGdzhu0c7bGgi7
         iJAovhx9vYlTcSS8+ZOsJ7jT5vxZkSuk8O1yoNTXZ8h0he1DgydraKrGrDkg3Rz762mG
         xqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Tjgpm1kVGPAXZNtvvMM1nI0Pgj2qqCr902KolbR97E=;
        b=rInQpI27iq0548yuOMC4g0DtpesvU20ZhM1uU5tsPDz/7ndRWClrDg8ADxvO3wHGzw
         zAC+qhpwrt3JdXusaoE0JZNmewjNPEWg6bWZzgGT44scANj4ayyD4z3MYHVrIBhmismr
         TPGCmr6XvZhXtoZxFGHYts7llnrpJ70CTKTmrgWLeh4jK3/3bWBWcCw4fj5/yrNzb4jU
         OmbkRhWDFpo8/BKSrdS6M4DXPuSb9V/af391cRXLoZskcD3QTYFm0HvY+Inwn9EGVgsD
         L94KWlGLDh6/zqFqMu1Oi262lwXq5gnAv9wgX/nncYncd4fpTUmflF7RG9y8wFzC6T+H
         1bCQ==
X-Gm-Message-State: AOAM5333HU6HSTwz2CuHXmk+UMfe7yq3TCpAn+uF2dfyVnqZpTVRU8/W
        Ofg6Lnd+8x5rInyUyuWLkprqE1Legrui71cmC24=
X-Google-Smtp-Source: ABdhPJxBAWfo9LcD13d2xGlxZT0UtFa1Mhj1p1EcfdFf5dd17bTAAYECsTAqZMG/5ZIOA7KIGVwh3v/VFVqWbXnzEwE=
X-Received: by 2002:ac5:c4c1:: with SMTP id a1mr13796157vkl.18.1624799581388;
 Sun, 27 Jun 2021 06:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
 <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
 <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
 <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com> <CAHp75VcF-HDZ6mKvXT=zYnBrcPaNJ+SYJ72LQ7s-62zQ5ZqoQg@mail.gmail.com>
In-Reply-To: <CAHp75VcF-HDZ6mKvXT=zYnBrcPaNJ+SYJ72LQ7s-62zQ5ZqoQg@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sun, 27 Jun 2021 15:12:50 +0200
Message-ID: <CAMhs-H9gw63j98vVo3y0ymW4_6rFNL8u5cYNM2hzyrmkPB3h3w@mail.gmail.com>
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

On Sun, Jun 27, 2021 at 3:01 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 27, 2021 at 1:56 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> > On Sun, Jun 27, 2021 at 12:51 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sun, Jun 27, 2021 at 12:47 PM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> > > > On Sun, Jun 27, 2021 at 11:33 AM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Sat, Jun 26, 2021 at 7:18 PM Sergio Paracuellos
> > > > > <sergio.paracuellos@gmail.com> wrote:
> > > > > >
> > > > > > The default handling of the gpio-line-names property by the
> > > > > > gpiolib-of implementation does not work with the multiple
> > > > > > gpiochip banks per device structure used by the gpio-mt7621
> > > > > > driver.
> > > > > >
> > > > > > This commit adds driver level support for the device tree
> > > > > > property so that GPIO lines can be assigned friendly names.
> > >
> > > > > > This driver has three gpiochips with 32 gpios each. Core implementation
> > > > >
> > > > > implementation
> > > > >
> > > > >
> > > > > > got gpio's repeated along each gpio chip if chip.names is not assigned.
> > > > > > To avoid this behaviour driver will set this names as empty or
> > > > >
> > > > > the driver
> > > > > these names
> > > > >
> > > > > > with desired friendly line names. Consider the following sample with
> > > > > > minimal entries for the first chip with this patch changes applied:
> > > > >
> > > > > The same comment as per v1:
> > > > >
> > > > > Any idea why it's not a duplicate of
> > > > > https://elixir.bootlin.com/linux/v5.13-rc7/C/ident/devprop_gpiochip_set_names,
> > > > > and why the latter is not called in your case?
> > > >
> > > > The core properly calls this function but not in the way expected.
> > > > This driver implements three banks of 32 gpios each internally using
> > > > one gpiochip per bank, all of them in the same device. So the core
> > > > code you are pointing out here duplicates the same names along the
> > > > three gpiochips which is not the expected behaviour. So implementing
> > > > in this way and setting names at least reserved avoids the core code
> > > > to be run and also avoids the duplication getting expected behaviour
> > > > for all the banks and each line friendly name.
> > >
> > > Isn't it the problem of how we supply fwnode in that case?
> > > Another possibility is to fix DT (although I'm not sure it's now possible).
> >
> > Since the fwnode is the same for all banks of the same device, each bank
> > repeats the first MTK_BANK_WIDTH label names in each bank.
>
> Can you point out the DT in question?

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/drivers/staging/mt7621-dts/mt7621.dtsi?h=staging-next

Gpio node:

 gpio: gpio@600 {
              #gpio-cells = <2>;
              #interrupt-cells = <2>;
              compatible = "mediatek,mt7621-gpio";
              gpio-controller;
              gpio-ranges = <&pinctrl 0 0 95>;
              interrupt-controller;
              reg = <0x600 0x100>;
              interrupt-parent = <&gic>;
              interrupts = <GIC_SHARED 12 IRQ_TYPE_LEVEL_HIGH>;
   };

My overlay:

&gpio {
    gpio-line-names = "", "", "", "",
                      "", "", "SFP LOS", "extcon port5 PoE compat",
                      "SFP module def0", "LED blue SFP", "SFP tx disable", "",
                      "switch USB power", "mode", "", "buzzer",
                      "LED blue pwr", "switch port5 PoE out", "reset";
};



>
> > This commit populates the gc.names member of each bank from the
> > device-tree node within the driver. This overrides the default behavior
> > since devprop_gpiochip_set_names() will only be called if names is NULL.
>
> I believe this commit is not needed in the proposed (i.e. duplication) shape.
> The fwnode supports primary and secondary ones. Thus, we may create a
> pair of fwnodes when they will unify properties per device with
> properties per child together (child is primary and device, i.e.
> parent, is secondary).

There are no child nodes, all the stuff is in the same parent node
and, as I said, belongs to the same device but internally uses three
gpiochips. This case is pretty much the same as the following already
added commit for gpio-brcmstb:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/drivers/gpio/gpio-brcmstb.c?id=5eefcaed501dd9e3933dbff58720244bd75ed90f

Best regards,
    Sergio Paracuellos
>
> --
> With Best Regards,
> Andy Shevchenko
