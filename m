Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D6122CEEF
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 21:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgGXT7N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 15:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXT7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 15:59:13 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A107C0619D3;
        Fri, 24 Jul 2020 12:59:13 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z3so5801306pfn.12;
        Fri, 24 Jul 2020 12:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ojcIGO5CAmQ/rrq3+7bdIsRlDzBj1PpBf4wdlTsiCVU=;
        b=mfk3nWLENugUYagFhxmELMHoOTUIn/A7K/vwYma1v2c3qSpl3bbf2wnRqIoRkdwURt
         tpmZQmiLo+oIhcO+ejFiJvmA6DjMKJ25+tr8RbFJ6dQTqIf+HG3Fv4IbmYcryGHInhN7
         cb0YAqAgwiuF/DiZ4swgSz1ZO5lukWreuAh25vWLrkDuF5JHyXM5QEFsMb2Vaaf5bB/L
         5UVRKeyjUfzr3HfUjp76JlxdGriEp1WGz1Er3vRqYTABJ5RIg7X6h/KbRNo2iHA7S1HW
         yriVXTNhE7uc8T0JrZIDufremMwv1dYJKeagrOkgV6vT0LOLtmkP2FKxid+hAr5FWsaE
         RCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ojcIGO5CAmQ/rrq3+7bdIsRlDzBj1PpBf4wdlTsiCVU=;
        b=YYBbV3ox6If19NEGMVQX173VJNadsuwFH2OaVKw4T5M7Q0wePrtzK9S6oWJlUlpsMG
         az90Bi0iiPw5tYbN0Qwxp7E7PV+igQ2SQumKSnOR8QHoycONXx/sMxHoLfrpKK/A/eSH
         J7hhkbMXs+iw/pP4fHoYkX8iUJZGvyH1QbWaHoT9oeYxqF9yyPC3mATsQBXD7dL3hj7w
         1NdLmfK1p5Y6kdf/ENnxhxTBLRmiQ+3WGo2hyw/RDddn/g8IL+JBDrkJPpqf7Befack5
         8vtuT5c1w9yXKtdD60gcY2NiO0h7ncdOh2iZrPncP+amtTJ3zRNmhJSCY519Bl8Jk5z0
         Jrgw==
X-Gm-Message-State: AOAM532oR3pDf3SbQaQfGLzd7AC5keHykAly+N8RyjVjwdU0QAF0IINp
        gruQSSiQ/ahOWh0A6oA8ZcjxKtQRCZuO+BRm6o0=
X-Google-Smtp-Source: ABdhPJzW0BnWPjCjo818a0nVFHioJ4MmyYZx5d7bur507VD2Ys2Lwlt2ZZbqUxL0/XPIYyiVpBtNW0u8uFVUMC4+ROM=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr10141215pgi.203.1595620752921;
 Fri, 24 Jul 2020 12:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
 <1595513168-11965-3-git-send-email-srinivas.neeli@xilinx.com>
 <CAHp75Vd7BU5DYqyQFGfBtKrb6jWFEQjMCu2MOa_7M8XYkt6BFA@mail.gmail.com> <DM6PR02MB53867D532A3298BE06E32B86AF770@DM6PR02MB5386.namprd02.prod.outlook.com>
In-Reply-To: <DM6PR02MB53867D532A3298BE06E32B86AF770@DM6PR02MB5386.namprd02.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Jul 2020 22:58:56 +0300
Message-ID: <CAHp75VeFE3b4mpvkQifuC5WPkTk9RUQy4yM8jTQXtrfNWRmDXA@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] gpio: xilinx: Add interrupt support
To:     Srinivas Neeli <sneeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>, Robert Hancock <hancock@sedsystems.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 24, 2020 at 8:15 PM Srinivas Neeli <sneeli@xilinx.com> wrote:

...

> > > +#include <linux/irqchip/chained_irq.h>
> >
> > Not sure I see a user of it.
> >
> > ...
> we are using chained_irq_enter() and chained_irq_exit()
> APIs , so need "chained_irq.h"

I see.  But gpio/driver.h does it for you.

...

> > > +       for (index = 0; index < num_channels; index++) {
> > > +               if ((status & BIT(index))) {
> >
> > If gpio_width is the same among banks, you can use for_each_set_bit()
> > here as well.
> >
> > ...
> gpio_wdith vary depends on design. We can configure gpio pins for each bank.

I see.

...

> > > +       chip->irq = platform_get_irq_optional(pdev, 0);
> > > +       if (chip->irq <= 0) {
> > > +               dev_info(&pdev->dev, "GPIO IRQ not set\n");
> >
> > Why do you need an optional variant if you print an error anyway?
>
> Here intention is just printing a debug message to user.

Debug message should be debug, and not info. But in any case, I would
rather drop it, or use platform_get_irq() b/c now you have a code
controversy.

...

> > > +               chip->gc.irq.parents = (unsigned int *)&chip->irq;
> > > +               chip->gc.irq.num_parents = 1;
> >
> > Current pattern is to use devm_kcalloc() for it (Linus has plans to
> > simplify this in the future and this will help him to find what
> > patterns are being used)
>
> I didn't get this , Could you please explain more.

              girq->num_parents = 1;
              girq->parents = devm_kcalloc(dev, girq->num_parents, ...);
   if (!girq->parents)
     return -ENOMEM;

girq->parents[0] = chip->irq;

Also, use temporary variable for IRQ chip structure:
 girq = &chip->gc.irq;


-- 
With Best Regards,
Andy Shevchenko
