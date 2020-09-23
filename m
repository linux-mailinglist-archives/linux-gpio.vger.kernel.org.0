Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E56275D21
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 18:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgIWQQF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 12:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgIWQQF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 12:16:05 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CCFFC0613CE;
        Wed, 23 Sep 2020 09:16:05 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id j7so7098431plk.11;
        Wed, 23 Sep 2020 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbX//q778+JDJApStJVQGdqO5vMzsaLZVfZFuHE2C6U=;
        b=SOvXiUz5WHYwbe2rAe6LNluzg2YhLb+eusjzeE/G4pCoYroRuaVwzUzjXZXi44yCWl
         JEkHzFVXNOItw14ZANb3mFumcyTwv4C6ODvb7ZWiDTYOEPl2JF6Bo1v7J8lJdNS15OFx
         AUPykO1Xkq6ka3BMPj84FDeM0Ls0Q5EdboYa9syuOCoc8ABQEJ7p85BBHti+B+kfn3sm
         9rTvYDL7AOHrfWIWyjVBzfFH3eN9/r4bba7VDN400go7UWS5I7le+YyJ3V7XIhaUT9aN
         NDqb2+btSFyZyiYx0V0j1bB1wiSEc8yTyMStLC2FU/kYBR7pF2CaWLvYaomx0Qvyjlz3
         vh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbX//q778+JDJApStJVQGdqO5vMzsaLZVfZFuHE2C6U=;
        b=nvNgizv2T6lKXCHjYedRH/n6FG/N0VdDB85gmY49/1b6FqmFBmv29uM3fsew+vqST8
         qFG6OKk81pTbXNhMZYL4kLjz1ZH5Bg/4ianlxWfuPaEsfGGZCZOWMYI/CcoaxAlmX+WW
         IGnghOMAr6gJ6FCI4DdZ/+Bjd29YZs8nRtB7tmBZ9Vs86eD7cF6/kRy4wysM1iv97s3x
         vjPayuK1Sr1ZcHdMWgQEZHswUKOlPYfPxqiKGIGr8X4sAOlmUYejX0VcY3OUOs+Uaewn
         KA5l1rvTo7J2T/4x4Et/1vBDyfgPkClJHTm1+jPYUaHgwjlsi0C9X5Fju4r1foA2cazn
         uOHQ==
X-Gm-Message-State: AOAM532a2iOf4aIPdy6wfSMhPJwyl42+tUTXUnVY3jw0z32GNHNCQPht
        ADY/OtUOyItWZTupU2SPa0gTDsg+7ondtcrNRz4=
X-Google-Smtp-Source: ABdhPJxhFuMHcruQxQI8D4mnGz9rO2Uyj3H0AHPKdRJj6yM8n1gSfFJ1bJX1Qoawp9CbFl8ES28Uh3NgwFmYdB/DYxs=
X-Received: by 2002:a17:90a:fd98:: with SMTP id cx24mr126231pjb.181.1600877764625;
 Wed, 23 Sep 2020 09:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-11-warthog618@gmail.com>
 <CAHp75VdaPR+iihenPYos1mAGLbDhJPvCfDTtURpk_MBa=3wYEg@mail.gmail.com>
In-Reply-To: <CAHp75VdaPR+iihenPYos1mAGLbDhJPvCfDTtURpk_MBa=3wYEg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 19:15:46 +0300
Message-ID: <CAHp75Vcktxp1C6NTOrW-WEnfueOu0UvtquFLpsL5+vv6Fdaajw@mail.gmail.com>
Subject: Re: [PATCH v9 10/20] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 7:14 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for GPIO_V2_LINE_SET_CONFIG_IOCTL, the uAPI v2
> > line set config ioctl.

> > +static long linereq_set_config_unlocked(struct linereq *lr,
> > +                                       struct gpio_v2_line_config *lc)
> > +{
> > +       struct gpio_desc *desc;
> > +       unsigned int i;
> > +       u64 flags;
> > +       bool polarity_change;
> > +       int ret;
> > +
> > +       for (i = 0; i < lr->num_lines; i++) {
> > +               desc = lr->lines[i].desc;
> > +               flags = gpio_v2_line_config_flags(lc, i);
>
> > +               polarity_change =
> > +                       (test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
> > +                        ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0));
>
> Comparison

Comparison between int / long (not all archs are agreed on this) and
boolean is not the best we can do.

What about

  bool old_polarity = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
  bool new_polarity = flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW;

  old_polarity ^ new_polarity

and move this under INPUT conditional?

> > +
> > +               gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
> > +               /*
> > +                * Lines have to be requested explicitly for input
> > +                * or output, else the line will be treated "as is".
> > +                */
> > +               if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
> > +                       int val = gpio_v2_line_config_output_value(lc, i);
> > +
> > +                       edge_detector_stop(&lr->lines[i]);
> > +                       ret = gpiod_direction_output(desc, val);
> > +                       if (ret)
> > +                               return ret;
> > +               } else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
> > +                       ret = gpiod_direction_input(desc);
> > +                       if (ret)
> > +                               return ret;
> > +
> > +                       ret = edge_detector_update(&lr->lines[i],
> > +                                       flags & GPIO_V2_LINE_EDGE_FLAGS,
> > +                                       polarity_change);
> > +                       if (ret)
> > +                               return ret;
> > +               }
> > +
> > +               blocking_notifier_call_chain(&desc->gdev->notifier,
> > +                                            GPIO_V2_LINE_CHANGED_CONFIG,
> > +                                            desc);
> > +       }
> > +       return 0;
> > +}

-- 
With Best Regards,
Andy Shevchenko
