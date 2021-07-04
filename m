Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C683BACE0
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jul 2021 13:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhGDL21 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Jul 2021 07:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGDL20 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Jul 2021 07:28:26 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDC3C061574;
        Sun,  4 Jul 2021 04:25:50 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id x15so7032103vsc.1;
        Sun, 04 Jul 2021 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nz3VY5hMWT6gvxFnv98LVkSbNZy/EgCn5dCPbg5R5y0=;
        b=OwDPB92caW49xeKeW1wn6hurZe2fJwoT1GTY/YZy6ynD4e/rS1igiOY3RNpz4VJilI
         cq/URnSXtbCI5J2KxBOm5TjCsDfOFdw8HNd+WN5L9R6yF87T3ZNha6WPvCbIMSSiFz+0
         NikztMHGdCdTc0zvbtErCtlT9Y4vQ5vyLkj0LsOKelbBrlnOa9ALZalXjiM/TOTZfJdQ
         W4B69EZBgmKdkfQRKqlBHAWMW6b2f1jBkKQLNm3paf8sgkOnC2lXTaJvSbGIIe7gVJro
         tUMTq5r+Ew89W/T74QGOdy7/nFaC+vDKJSLet+bFpuoQqNqxGXIAcE1sxY+8ZPeDHDPA
         olrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nz3VY5hMWT6gvxFnv98LVkSbNZy/EgCn5dCPbg5R5y0=;
        b=CMOAU0oFN/PjvcXNvPG4AMjvoIuLRYVKovYHQN7xXG5MxTz/9Kvk2qpCPRTC+/6305
         48sWXwfxOx2ZGMTAauddhb3cQ/9UiODgrIs9J0yzUUBwb2XHclLr8R0z8WOofBCtR8sL
         6ahLCw3fiENET5Dc/S0HzsINXTVmxAPK1/DgBFVs7Dqol+AfnkiW/LDlg+NvmMUxYlYa
         DXb4/ObYZoV5Eixg5ap69nuhLpMLbuWahqmH7ZGKEb/cvuVHPgvvKAamf0RAjGp1ANYe
         L6I4Opw0V5Fh2AA0GAoGjlGrAe2Y2ueJdlyc/12IoNQY91e1AZpfdiRsyj8V5xIZNoON
         xBkQ==
X-Gm-Message-State: AOAM531RA2TilzxjF5Nys8W7WFWpfz340YTleAEBx32OSxiARV0wnk+0
        whpZImX5LlYLNBzi6HPClNPqX3Fj/dTAsnBxDtc=
X-Google-Smtp-Source: ABdhPJysQCHnUIYGeZP4ntuy5m1Smheh1TuEJXY9TELWI1Ji3MCZ+RvaieUiQj5DZak9NxzceHtU25Xd9ejFHgoAC8k=
X-Received: by 2002:a67:e116:: with SMTP id d22mr6174988vsl.49.1625397949543;
 Sun, 04 Jul 2021 04:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
 <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
 <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
 <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com>
 <CAHp75VcF-HDZ6mKvXT=zYnBrcPaNJ+SYJ72LQ7s-62zQ5ZqoQg@mail.gmail.com>
 <CAMhs-H9gw63j98vVo3y0ymW4_6rFNL8u5cYNM2hzyrmkPB3h3w@mail.gmail.com>
 <CAHp75VccSCWa=EH8i01_b_HLZRumUZ48oRjeuaV5Dp1BQAoz2w@mail.gmail.com>
 <CAMhs-H_Ne4W79Awbmo6w_68X+h0-ybjvzNsbh=XuHMPJJ8-hDQ@mail.gmail.com>
 <CACRpkdaqSoyDUn3dVuVgzRK_7AabdY=1FzAnhHZzPs3qS+GfsA@mail.gmail.com>
 <CAMhs-H_pomsvKXuerkVsNQva+B+tPr2xRZAU2R7oyjZ+GaQpqQ@mail.gmail.com>
 <CAMhs-H_=_tYk3Qj5-NaAmWgnuWc0ZRSEABZzwPfMxiUHP35nbw@mail.gmail.com>
 <CAHp75VdmTHr8zq0boz2ci0YO4fS9Zuf+LFXeK7CGiHqHkXKKMQ@mail.gmail.com>
 <CAMhs-H_e2U7nUav8h+Q0w-aZXvD6VM6wpg857WbFgw6x3z1ufA@mail.gmail.com>
 <CAMhs-H8Y0txwcqRTxpsB_GEoOYbhHWO81EANMxMSybzWPS=HTA@mail.gmail.com>
 <CAHp75VfRYZn5uuPgQHJ5Hm3p3XVrfs=ReZXxEPm+dqLNb5QtGA@mail.gmail.com>
 <CAMhs-H8g8c047DSw2ObX7xS=YuPrXNRMecuV1TnKT--gnDdDOw@mail.gmail.com>
 <CAMhs-H9HhBbKmbpVgDXbZD+Dmh96J98HR_DO6LZL8N0B00ihcQ@mail.gmail.com> <CAHp75VdQS8fd-=onz_L5MJvhVea30EriUj6e+-Q1yCo35n2kpg@mail.gmail.com>
In-Reply-To: <CAHp75VdQS8fd-=onz_L5MJvhVea30EriUj6e+-Q1yCo35n2kpg@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sun, 4 Jul 2021 13:25:38 +0200
Message-ID: <CAMhs-H-Qpob8JTeJZk59_+u+NZMy0zRdyfJ219L9o73pE-zQig@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 4, 2021 at 12:05 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jul 4, 2021 at 11:06 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> > On Sun, Jul 4, 2021 at 7:57 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > > On Sat, Jul 3, 2021 at 9:36 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Sat, Jul 3, 2021 at 3:51 PM Sergio Paracuellos
> > > > <sergio.paracuellos@gmail.com> wrote:
> > > > > On Sat, Jul 3, 2021 at 2:05 PM Sergio Paracuellos
> > > > > <sergio.paracuellos@gmail.com> wrote:
>
> ...
>
> > > > The below is closer to what I meant, yes. I have not much time to look
> > > > into the details, but I don't have objections about what you suggested
> > > > below. Additional comments there as well.
> > >
> > > Thanks for your time and review, Andy. Let's wait to see if Linus and
> > > Bartosz are also ok with this approach.
> > >
> > > > > How about something like this?
> > > > >
> > > > > diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> > > > > index 82fb20dca53a..5854a9343491 100644
> > > > > --- a/drivers/gpio/gpio-mt7621.c
> > > > > +++ b/drivers/gpio/gpio-mt7621.c
> > > > > @@ -241,6 +241,7 @@ mediatek_gpio_bank_probe(struct device *dev,
> > > > >         if (!rg->chip.label)
> > > > >                 return -ENOMEM;
> > > > >
> > > > > +       rg->chip.offset = bank * MTK_BANK_WIDTH;
> > > > >         rg->irq_chip.name = dev_name(dev);
> > > > >         rg->irq_chip.parent_device = dev;
> > > > >         rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
> > > >
> > > > Obviously it should be a separate patch :-)
> > >
> > > Of course :). I will include one separate patch per driver using the
> > > custom set names stuff: gpio-mt7621 and gpio-brcmstb. I don't know if
> > > any other one is also following that wrong pattern.
> >
> > What if each gpiochip inside the same driver has a different width? In
> > such a case (looking into the code seems to be the case for
> > 'gpio-brcmstb', since driver's calculations per base are aligned with
> > this code changes but when it is assigned every line name is taking
> > into account gpio bank's width variable... If the only "client" of
> > this code would be gpio-mt7621 (or those where base and width of the
> > banks is the same) I don't know if changing core code makes sense...
>
> As far as I understood the problem, the driver (either broadcom one or
> mediatek) uses one GPIO description from which it internally splits to
> a few GPIO chips. GPIO chips are kinda independent in that sense,
> correct? So, if you put the index / offset field per GPIO chip before
> creation, the problem is solved.  What did I miss?

Should be, yes. But my concern is about why the broadcom driver
calculate base as:

base = bank->id * MAX_GPIO_PER_BANK;

and then fill names using:

/*
 * Make sure to not index beyond the end of the number of descriptors
 * of the GPIO device.
 */
for (i = 0; i < bank->width; i++) {
 ...

It looks like each gpio chip is separated MAX_GPIO_PER_BANK but the
width of each of some of them may be different. So in my understanding
assume for example there are four banks with widths 32,32, 24, 32 and
if you want to provide friendly names for all of them, in the third
one you have to create empty strings until 32 or you will get wrong to
the starting of the fourth bank and the code is getting care of not
going out of index in the for loop and assign only those needed. So
technically you are providing 8 empty strings even though the width of
the third bank is only 24 which sounds also bad... But maybe I am
misunderstanding the code itself and I need a bit more sleep :)

Best regards,
    Sergio Paracuellos

>
> --
> With Best Regards,
> Andy Shevchenko
