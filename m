Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0AE36A0F1
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Apr 2021 13:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhDXLgc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Apr 2021 07:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbhDXLgc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Apr 2021 07:36:32 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F608C061574;
        Sat, 24 Apr 2021 04:35:54 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d124so35731888pfa.13;
        Sat, 24 Apr 2021 04:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hEyQImcqllWtQ0CiGFfszj6lYsOKAVrxqiWhsQ184Gg=;
        b=Hrq7aVJKpnqILSVnLLuBjl0ff4hjFDTTQmegWEvI2orOBudKjM3zqWNJJ2mP4IwgtI
         XpBEDVz2LFvFUy47FdOZAg2I6S9UaxXXjZY+cCsNDoZCmtTsaYZexGdkoXbFxII2Of4c
         f2R2tOpn4wPEqtVK/+T/eOMDRvaOM6p/wX0rj/4IxRsgkUYMuLQl4WoAoTThKqu/Z/lM
         Qgh3cBMqOHPlh+nJ2f73Rz+UJ1XmfWSjksuZetloSN8gnXP66eX1EM6kRhxUL2iLY24S
         JwXFyIELbzwrmx44xnhGzgua+MJcUWu7pJfUSLdy3ljEdZ/UbtY5R9As4hcOBFJKFz6H
         Es7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hEyQImcqllWtQ0CiGFfszj6lYsOKAVrxqiWhsQ184Gg=;
        b=oOXMd9fWeFEgUasgPZrkwr7qFuP+ELxLn9RHLfdnjdqipFItcDg+EHZ0cRqv48fiNd
         Pk2StD0JoNp0aqeMYBVffNK+fXHQlWhrttTkdRds/svtwu466nGTo1tgRg7FDjSFkQ1v
         NdSCp2BWNyP3AUC6hmI5aV333QC5OqMDd2tKyDMmte6cCBLUnaWannsAMmM9i+RdBVtj
         y20i8hfRrAUgmxI0886EXbc3tU70QYhhhdKLArdjSkKKw5hj/i/kVW6RvyMzt2LbGLTa
         iklMTRQjbdw0QgImezNpcPTBbEiNqwWHIaTBpAWRsuPUat7cWHyd3QnwKpbohgvH2TpI
         qn1A==
X-Gm-Message-State: AOAM531LMJyKa5ZzKTT3cOHYJpPiiQQ5zWSMupMhBKFN9t4ocuh/dofy
        QhnlnoS5vd65ZEeNT7F1RD9p+Wb2I7SV3RNOpJM=
X-Google-Smtp-Source: ABdhPJw3AEIGZ8h1ev3dWzLcg5SvLKBB3MLMrmFiXoj0Q4zuXVlOGBqshuibySUti4RQ0Xr9HA7bbbqghzLHT3T++p8=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr7975564pgg.74.1619264153816;
 Sat, 24 Apr 2021 04:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210422152055.85544-1-tsbogend@alpha.franken.de>
 <CAHp75Ve6PEr5TFGRgALPCbi-T5Y5yNPV+-fJHC7C2mU+ms30uw@mail.gmail.com> <20210424103544.GA4353@alpha.franken.de>
In-Reply-To: <20210424103544.GA4353@alpha.franken.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 24 Apr 2021 14:35:37 +0300
Message-ID: <CAHp75VeZK+wyWBfwr9K7sQY=mET7DxcpE7OYxdAN_hJQodBtdg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 24, 2021 at 1:47 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Fri, Apr 23, 2021 at 06:37:41PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 22, 2021 at 6:21 PM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:

...

> > > +               virq = irq_linear_revmap(gc->irq.domain, bit);
> >
> > Is it guaranteed to be linear always?
>
> yes

OK.

...

> > > +       if (sense & ~(IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
> >
> > There is a _BOTH variant.
>
> that's IRQ_TYPE_EDGE_BOTH. LEVEL_BOTH would be an interesing concept.

Sorry, I meant _MASK in case of level. No need to open code the
existing definition.

> > > +       ilevel = readl(ctrl->gpio + IDT_GPIO_ILEVEL);
> > > +       if (sense & IRQ_TYPE_LEVEL_HIGH)
> > > +               ilevel |= BIT(d->hwirq);
> > > +       else if (sense & IRQ_TYPE_LEVEL_LOW)
> > > +               ilevel &= ~BIT(d->hwirq);
> >
> > > +       else
> > > +               return -EINVAL;
> >
> > Is it a double check of the above?
>
> no, the above test is for anything not LEVEL and this now takes care
> to be at least LEVEL_LOW or LEVEL_HIGH. This doesn't check for LOW|HIGH,
> which I assumed nobody tries to set...

And? Seems you have it as a dead code.
In your case HIGH is the winner anyway.

...

> > > +       /* Mask interrupts. */
> > > +       ctrl->mask_cache = 0xffffffff;
> > > +       writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
> >
> > What about using ->init_hw() call back?
>
> sure, doesn't look like it's worth the effort, but I changed it.

The problem here (which you may not notice from day 1) is the
ordering. We carefully put the ->init_hw() call in the proper place
and time.

...

> > > +       girq->handler = handle_level_irq;
> >
> > handle_bad_irq()
>
> the hardware only supports level interrupts. That's also why there is
> no handler change in idt_gpio_irq_set_type.

After I fixed a nasty issue in the pca953x related to Intel Galileo
platform, I may tell that setting the handler here is equal to putting
a mine for the future blown. When you set it in BAD here it will
reveal issues, if any, sooner than later.

-- 
With Best Regards,
Andy Shevchenko
