Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583F63BACAD
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jul 2021 12:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhGDKIJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Jul 2021 06:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhGDKII (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Jul 2021 06:08:08 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9981C061762;
        Sun,  4 Jul 2021 03:05:32 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id f5so5790550pgv.3;
        Sun, 04 Jul 2021 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qM2np/6KCkaiJ22WZ5dLe/9dokvloKC/+FFFPrrORdA=;
        b=ELca/3gSkLjYpeooQ7rgWgv3IU4RdrXAawU66jvPd6XZjt1bn0qS8tXy8RvCppK+uN
         LvLA7Zd1xrE0m56YA/uH5J+ukvx8VCfXcH2Vv3Dst2Pm3vKs3aQhkTV6RnBN2jeNPufW
         G0zBLuoRBZAWUtOFgTFHGhpMtKDTttSEgosmaKuAQjSyiwk+zVyLau2isZIzjRiBg9kI
         EcXdz2Ngc7XY/HEBddLzCu6Exb2uibNmVuTxbJZ9cTCSt8ib7gAjaiKjfF+VlDbELDF5
         zzwA3c6C5LDO8xB3HBlDDSbSnWeymgzdgG5QK80CZ/IUVnEvQg28c2aL+8JjSQPZudpY
         wYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qM2np/6KCkaiJ22WZ5dLe/9dokvloKC/+FFFPrrORdA=;
        b=TZEWGmqwV+dq0PRbaiSiiw/xOhdd5dQJDb/0CWkYsvBOiZ9R5KRiZJxOXV/mRJ46PK
         ++cVRz6WhwTTbOsOtMbyqIv3wHUZGMy75l+Ahg+FSkdopmSP8XIeNPOVSbvmSLgfbM1n
         HI8DIcjUFN7QPFSLN89z9RoyvkzyPt5KOjYzsRJYfNTNii+B0RbD/rC+Wnv/BCoiMhde
         fuHR3qHUFV5sXzm2x9RWti9Vl0h+n0sQeGhOyqlC2MbL/MGRK82eG4iMsdzlQRAuWeOs
         sd5ndzOQ+WcsoWr6EDtK5/BpE7TM1PkizfQAD52KMlq/kGR3NXEmzjb4UllOMnPn78nR
         dEXQ==
X-Gm-Message-State: AOAM531xjOgOpBsddRz9zLkNBSfA9NvLpZyTwOsLc8dnMlfJooiJ2o9U
        +xOjhBpJMOOU9xHwdULoZY96GxzoYqFscJu0y+o=
X-Google-Smtp-Source: ABdhPJymu7mKim2mMcbs8xmJxUsevWcVxAwY0GqfWeHZknmrkT2XJRIVSo3e+GpzXhZPCIpHbQuiTx2oZu1pCyNqpCc=
X-Received: by 2002:a63:d014:: with SMTP id z20mr9715981pgf.203.1625393132320;
 Sun, 04 Jul 2021 03:05:32 -0700 (PDT)
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
 <CAMhs-H8g8c047DSw2ObX7xS=YuPrXNRMecuV1TnKT--gnDdDOw@mail.gmail.com> <CAMhs-H9HhBbKmbpVgDXbZD+Dmh96J98HR_DO6LZL8N0B00ihcQ@mail.gmail.com>
In-Reply-To: <CAMhs-H9HhBbKmbpVgDXbZD+Dmh96J98HR_DO6LZL8N0B00ihcQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 4 Jul 2021 13:04:56 +0300
Message-ID: <CAHp75VdQS8fd-=onz_L5MJvhVea30EriUj6e+-Q1yCo35n2kpg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
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

On Sun, Jul 4, 2021 at 11:06 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Sun, Jul 4, 2021 at 7:57 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> > On Sat, Jul 3, 2021 at 9:36 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sat, Jul 3, 2021 at 3:51 PM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> > > > On Sat, Jul 3, 2021 at 2:05 PM Sergio Paracuellos
> > > > <sergio.paracuellos@gmail.com> wrote:

...

> > > The below is closer to what I meant, yes. I have not much time to look
> > > into the details, but I don't have objections about what you suggested
> > > below. Additional comments there as well.
> >
> > Thanks for your time and review, Andy. Let's wait to see if Linus and
> > Bartosz are also ok with this approach.
> >
> > > > How about something like this?
> > > >
> > > > diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> > > > index 82fb20dca53a..5854a9343491 100644
> > > > --- a/drivers/gpio/gpio-mt7621.c
> > > > +++ b/drivers/gpio/gpio-mt7621.c
> > > > @@ -241,6 +241,7 @@ mediatek_gpio_bank_probe(struct device *dev,
> > > >         if (!rg->chip.label)
> > > >                 return -ENOMEM;
> > > >
> > > > +       rg->chip.offset = bank * MTK_BANK_WIDTH;
> > > >         rg->irq_chip.name = dev_name(dev);
> > > >         rg->irq_chip.parent_device = dev;
> > > >         rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
> > >
> > > Obviously it should be a separate patch :-)
> >
> > Of course :). I will include one separate patch per driver using the
> > custom set names stuff: gpio-mt7621 and gpio-brcmstb. I don't know if
> > any other one is also following that wrong pattern.
>
> What if each gpiochip inside the same driver has a different width? In
> such a case (looking into the code seems to be the case for
> 'gpio-brcmstb', since driver's calculations per base are aligned with
> this code changes but when it is assigned every line name is taking
> into account gpio bank's width variable... If the only "client" of
> this code would be gpio-mt7621 (or those where base and width of the
> banks is the same) I don't know if changing core code makes sense...

As far as I understood the problem, the driver (either broadcom one or
mediatek) uses one GPIO description from which it internally splits to
a few GPIO chips. GPIO chips are kinda independent in that sense,
correct? So, if you put the index / offset field per GPIO chip before
creation, the problem is solved.  What did I miss?

-- 
With Best Regards,
Andy Shevchenko
