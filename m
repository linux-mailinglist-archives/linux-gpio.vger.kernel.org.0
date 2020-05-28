Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137AD1E6283
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 15:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390479AbgE1NnQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 09:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390468AbgE1NnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 09:43:15 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E83C05BD1E;
        Thu, 28 May 2020 06:43:15 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id m7so11583788plt.5;
        Thu, 28 May 2020 06:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=azWiRUhHjCo2o19V2ZlFG7W2kgi9DZuQbiyov+RmyJQ=;
        b=fu44bgllL7AZZXPGj53xfJU/X4VwelM5xRXvj95LeFILkWue6PCVnMXr2GhDrn9qRm
         XeKjMW8J7y/NP+tbAsHgYJZLzCk52iZm7hSxdv0SBqQ0/TKmoIh3FzbxtRthPCC1CanV
         cLZQWRZOrw8zZJ0z3tolbLROCIh7FrN+0zEA5abMACwkxnFttA1uLht5a81YYLQNaYeO
         274H2gCF8eOpO4Eio2PWUGSbNLaAobuakh2T7F8z7C0oksJhr0FN1TACNlQs345pooEX
         g0p+DMad0TLw4nzbGSaOt/d0LyGuW4aS6Cgti31qbm0Wphkt6Ao8aYPTDfmEg3gk35wP
         pmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=azWiRUhHjCo2o19V2ZlFG7W2kgi9DZuQbiyov+RmyJQ=;
        b=Z1Ij/0LTgBjdy50WnQ8jdLTpm4mSl/be28dQ8U41kfbQtDAgt9WUrx9D6/1kfAQZv1
         3hLkMJMD/Pv2o6uWOCkIzKY9jO40Nz5eBAVLFNWBZehQ7HIvkd49IwCt4xuWaekkbUnI
         atAI0egc4Ts9yL68LqRfDm3cJS25hHBRdCrYaj/MwXZRwWq7/i4fK5i3NZb5rVmahoIy
         49PcaGozO10l9jGOUXAyP9jcbe97oBexbIKWWMG/E3S/twOrznaJZvr4xdfb6SMV9oz8
         AFCK1546aJ739AZXf+/sbwpiDMRSpL5e7RAFh+9q72WXbHlcj59AG594Dm+vsPqEOEWD
         bbYQ==
X-Gm-Message-State: AOAM5301RpD3e2iCtWz06VkUbvFrDuZ68dSplwqkNtEwyewh/nxkfyjM
        lpn+law6E0D5ShPjSkniNGpaemk7V2Tk6aW1VIE=
X-Google-Smtp-Source: ABdhPJzN52Ft8oXOZKiVCu8qos5NLsdiNjdUFwARDB1LrsLGeVdHj6yzu20k/+pMnYuOIah+jVpsjcl8y6ouPKo6Lu8=
X-Received: by 2002:a17:90b:113:: with SMTP id p19mr4005458pjz.129.1590673393623;
 Thu, 28 May 2020 06:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200528035841.16800-1-michael@walle.cc> <20200528035841.16800-3-michael@walle.cc>
 <CAHp75VfQ64iz3qVPsZ+8z4fMQWphruB0FzzCTQPqZ9LkuhV6Ww@mail.gmail.com> <fe83fd615eaae323dcc3d578b0e7d75a@walle.cc>
In-Reply-To: <fe83fd615eaae323dcc3d578b0e7d75a@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 May 2020 16:43:01 +0300
Message-ID: <CAHp75Vdh6ngva4CgWY8bfQXJMjoFYDHOx0Q7c+9wOD1eebb8qA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: add a reusable generic gpio_chip using regmap
To:     Michael Walle <michael@walle.cc>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 28, 2020 at 4:00 PM Michael Walle <michael@walle.cc> wrote:
> Am 2020-05-28 13:45, schrieb Andy Shevchenko:
> > On Thu, May 28, 2020 at 7:04 AM Michael Walle <michael@walle.cc> wrote:

> > More comments from me below.
>
> Thanks for the review.

You are welcome! Thanks for doing this actually.

(So, the not commented points I think you agreed with)

...

> >>  # Device drivers. Generally keep list sorted alphabetically
> >
> > Hmm...
> >
> >> +obj-$(CONFIG_GPIO_REGMAP)      += gpio-regmap.o
> >>  obj-$(CONFIG_GPIO_GENERIC)     += gpio-generic.o
> >
> > ...is it?
>
> That's because gpio-regmap.o seems not be a driver and more of a generic
> thing (like gpio-generic.o) and gpio-generic.o has another rule two
> lines
> below and I don't want to put gpio-regmap.o in between.

OK!

...

> >> +       if (gpio->reg_dir_out_base) {
> >> +               base = gpio_regmap_addr(gpio->reg_dir_out_base);
> >> +               invert = 0;
> >> +       } else if (gpio->reg_dir_in_base) {
> >> +               base = gpio_regmap_addr(gpio->reg_dir_in_base);
> >> +               invert = 1;
> >> +       } else {
> >
> >> +               return GPIO_LINE_DIRECTION_IN;
> >
> > Hmm... Doesn't it an erroneous case and we basically shouldn't be here?
>
> yeah, I'll return -EOPNOTSUPP. Better than just ignoring, right?

Yes, that's what I meant.

...

> >> +       if (!!(val & mask) ^ invert)
> >> +               return GPIO_LINE_DIRECTION_OUT;
> >
> >> +       else
> >
> > Redundant 'else'.
>
> IMHO, That looks really strange. like it has nothing to do with the
> if statement. I'd like to keep that one.

We have many drivers done like that, but it's minor, so, up to you and
maintainers.

-- 
With Best Regards,
Andy Shevchenko
