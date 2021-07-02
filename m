Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04003B9E92
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 11:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhGBJ7W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 05:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbhGBJ7V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 05:59:21 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B027C061762;
        Fri,  2 Jul 2021 02:56:49 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id j199so8043871pfd.7;
        Fri, 02 Jul 2021 02:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vi6uB4vFfoRq9MCgtt0L+5wl++IlNTg9EGNRj/RiSAU=;
        b=cdVGBYtsL3+k1Y+8F3QU0c4ZKNS4XaSnmf3LVktYQDixERrf6cIKrmxZhYIerF1JX6
         KwUTcAxKaU3dyW2/OnU6s5rmuNjQbMgdqxM/rk1tm8FEy+ESs4/1o7bMi7IKQUjDnQY0
         jwOMscAH7iumc1ur1vg7nAjPcuXsfqTWve2KP9SGhvs5FZmRQ2DSkAESwysIV0nhTG8f
         YAMQnvpPTfLV+Y+Et2GHgAwBPKJs94K4OG7TIyH1EtGYGSv2eP2MOprhZcXDAT2xhcBD
         iZLjRftMHBAQSdti3YJPoantrwQvBwnUa+P0SyKdI3C3Fu9KApW3GKvWR/TAWggBauN9
         +28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vi6uB4vFfoRq9MCgtt0L+5wl++IlNTg9EGNRj/RiSAU=;
        b=qd79kue9z6DJo5R7VKBymCQwEftr7hsujHYod+akMnYbskSdq8Re4FqDRQip8Nc/9t
         C1wZPQTFyu5awcnZ1YP6tBtY0MkW6KueZVXEeF1z2auNRcrgL6H9WuStLOB0KpFEkXjw
         McvcOdllbWm1Fd5as2yU75Z1Olwi10V/MhsQCjzKCY94I/i5oHUI2FmwxtlnjnfYNZak
         ODe0xVe2pjgJm19uGEjHJjz2e8gYMFJMgXBacfUQJwwGUxDcFqF/s+F8pNGzTUOb+iOw
         V/CVPru0A4wbB3iJg2GqraMO0KBLLXMOFtggLm/H3MeghUPcxniFNYRf+CJSmxCR3OAw
         ti0Q==
X-Gm-Message-State: AOAM531xwisfEOt1p0kAWB6b2M4ObuzGYaJHCZzPxZaldTY3PPIbZXgw
        RN/VlT2map0vyHn6n4xutgQJECegfQ0C5Qi7iUg=
X-Google-Smtp-Source: ABdhPJzJlHjGEl/ijNWqEk/lqmxEqNMq7wQrahYIFyg31TbpskqCGjBJP6FnCp8xxXu+qZi8dcV8gAGybWX8JMSpeho=
X-Received: by 2002:aa7:8055:0:b029:303:36a6:fec7 with SMTP id
 y21-20020aa780550000b029030336a6fec7mr4565082pfm.40.1625219808770; Fri, 02
 Jul 2021 02:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
 <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
 <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
 <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com>
 <CAHp75VcF-HDZ6mKvXT=zYnBrcPaNJ+SYJ72LQ7s-62zQ5ZqoQg@mail.gmail.com>
 <CAMhs-H9gw63j98vVo3y0ymW4_6rFNL8u5cYNM2hzyrmkPB3h3w@mail.gmail.com>
 <CAHp75VccSCWa=EH8i01_b_HLZRumUZ48oRjeuaV5Dp1BQAoz2w@mail.gmail.com> <CAMhs-H_Ne4W79Awbmo6w_68X+h0-ybjvzNsbh=XuHMPJJ8-hDQ@mail.gmail.com>
In-Reply-To: <CAMhs-H_Ne4W79Awbmo6w_68X+h0-ybjvzNsbh=XuHMPJJ8-hDQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Jul 2021 12:56:10 +0300
Message-ID: <CAHp75Vdr9iM0a4EA3pKE5W=jHeeGk_u_5ygXE81L5mWtGhYHTw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
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

On Fri, Jul 2, 2021 at 12:40 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Fri, Jul 2, 2021 at 11:27 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sun, Jun 27, 2021 at 4:13 PM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > > On Sun, Jun 27, 2021 at 3:01 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Sun, Jun 27, 2021 at 1:56 PM Sergio Paracuellos
> > > > <sergio.paracuellos@gmail.com> wrote:

...

> > > > Can you point out the DT in question?
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/drivers/staging/mt7621-dts/mt7621.dtsi?h=staging-next
> > >
> > > Gpio node:
> > >
> > >  gpio: gpio@600 {
> > >               #gpio-cells = <2>;
> > >               #interrupt-cells = <2>;
> > >               compatible = "mediatek,mt7621-gpio";
> > >               gpio-controller;
> > >               gpio-ranges = <&pinctrl 0 0 95>;
> > >               interrupt-controller;
> > >               reg = <0x600 0x100>;
> > >               interrupt-parent = <&gic>;
> > >               interrupts = <GIC_SHARED 12 IRQ_TYPE_LEVEL_HIGH>;
> > >    };
> > >
> > > My overlay:
> > >
> > > &gpio {
> > >     gpio-line-names = "", "", "", "",
> > >                       "", "", "SFP LOS", "extcon port5 PoE compat",
> > >                       "SFP module def0", "LED blue SFP", "SFP tx disable", "",
> > >                       "switch USB power", "mode", "", "buzzer",
> > >                       "LED blue pwr", "switch port5 PoE out", "reset";
> > > };
> > >
> > > > > This commit populates the gc.names member of each bank from the
> > > > > device-tree node within the driver. This overrides the default behavior
> > > > > since devprop_gpiochip_set_names() will only be called if names is NULL.
> > > >
> > > > I believe this commit is not needed in the proposed (i.e. duplication) shape.
> > > > The fwnode supports primary and secondary ones. Thus, we may create a
> > > > pair of fwnodes when they will unify properties per device with
> > > > properties per child together (child is primary and device, i.e.
> > > > parent, is secondary).
> > >
> > > There are no child nodes, all the stuff is in the same parent node
> > > and, as I said, belongs to the same device but internally uses three
> > > gpiochips.
> >
> > And it can't be split into three children in the overlay?
>
> Original code before this being mainlined was using three children and
> I was told in the review that three children were not allowed:
>
> See https://patchwork.ozlabs.org/project/linux-gpio/patch/1527924610-13135-3-git-send-email-sergio.paracuellos@gmail.com/#1932827

Thanks for the pointer!

> > Let's assume it can't, then the GPIO library function should be
> > refactored in a way that it takes parameters like base index for the
> > names and tries to satisfy the caller.
>
> Bartosz, Linus, any thoughts on this?

Reading that discussion and seeing Linus there, I guess he himself
signed (implicitly) for my idea :-)
Otherwise we will have duplication of the code for almost no benefit
when we can avoid it completely.

-- 
With Best Regards,
Andy Shevchenko
