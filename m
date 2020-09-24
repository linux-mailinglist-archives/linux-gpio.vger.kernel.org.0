Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED68276BCC
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 10:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgIXI1G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 04:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbgIXI1F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 04:27:05 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B181FC0613CE;
        Thu, 24 Sep 2020 01:27:05 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id j7so1270351plk.11;
        Thu, 24 Sep 2020 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x9lDp/fm1dXSek9vB0bYLHVoKOQKR8P/mOoxP5x0AnI=;
        b=If5vtPX6M7ZWbPoCBAq27sx2WT8WY4MjVBPPBAJv/Ok3VfPY03mrb4WJd6UWiMRTeH
         sAoz7ZqXlUQIHYqgcXdGZwwSGS0Dvb+mIpg/cuhui3eLYGW3F+M+lE1fwNjuZs+/OQ7O
         tE4dQnPWP5FXssrWfDYSj3XEl2dbnkvAcYLzFx+juEY0KTCpYoR7y7pWI8YuoU3pO2+/
         BM4NMzPnWny3uMQdOISJWTd5WRh1lXOv4z0EU/l54m1+QY0AiR9UCQX85Iezba3Ngio1
         MYAX8xanzT5MKH4P2fgTVGMbR8VhlB/8Dd+UQAb4qPV8hC7wUNeW5JT6uQsof1gcBdDZ
         nURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x9lDp/fm1dXSek9vB0bYLHVoKOQKR8P/mOoxP5x0AnI=;
        b=htqX98aQnpcxtjmORjrtouAX3SuikhFQGvGIoTSWNUE4JLVEhLQILukxb9Xu9uryS6
         GJii9Al0/eZD6dsGy9CifdHMCKT84++WD961wJaJU4404fE0+m5a1Zz/Sw1lbCpQU4i3
         Z/Wug47k0AtI9j4BfyXy7cwGhSUjdFPcW9LhNwt18vrlgwB8a+TID6dPXTW6aBaga9QJ
         bk+05JUcogi9MRpaTHKnYXLEVxIgCfFWpGZdCJgwAL2H54HqieBVmlZbLf59aY64haXS
         S2Dnw1Ea60LAjcoJDou118VeXfirI/VPS/FYolmFK9zTYsJu18QCRW3G/rWFJTnDrlNQ
         sN4Q==
X-Gm-Message-State: AOAM530HAYEk9J9RZqoPxXmXcyuTfEZFXjTZLaDZvd0Ow/xZ11afoSx2
        f6WYL2cUNlZ0iARLdkyiOvFjzz1dBKCIWAz5THE=
X-Google-Smtp-Source: ABdhPJzL6A21jEGBmU6S3cHiA5bF3btfaOTrr0dHojkgbOrwmJFKVxmQjTsrjo5HqZ3JCWwViypGmljdGZ7mDcT/gDQ=
X-Received: by 2002:a17:902:c14c:b029:d2:4345:5a9 with SMTP id
 12-20020a170902c14cb02900d2434505a9mr3579454plj.0.1600936025168; Thu, 24 Sep
 2020 01:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-11-warthog618@gmail.com>
 <CAHp75VdaPR+iihenPYos1mAGLbDhJPvCfDTtURpk_MBa=3wYEg@mail.gmail.com>
 <CAHp75Vcktxp1C6NTOrW-WEnfueOu0UvtquFLpsL5+vv6Fdaajw@mail.gmail.com> <20200924032414.GC11575@sol>
In-Reply-To: <20200924032414.GC11575@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 24 Sep 2020 11:26:49 +0300
Message-ID: <CAHp75Vd1=CpsMecw=dua66i-P992e71uQcOzWR7tvd6ZGyKWoA@mail.gmail.com>
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

On Thu, Sep 24, 2020 at 6:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Sep 23, 2020 at 07:15:46PM +0300, Andy Shevchenko wrote:
> > On Wed, Sep 23, 2020 at 7:14 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > Add support for GPIO_V2_LINE_SET_CONFIG_IOCTL, the uAPI v2
> > > > line set config ioctl.
> >
> > > > +static long linereq_set_config_unlocked(struct linereq *lr,
> > > > +                                       struct gpio_v2_line_config *lc)
> > > > +{
> > > > +       struct gpio_desc *desc;
> > > > +       unsigned int i;
> > > > +       u64 flags;
> > > > +       bool polarity_change;
> > > > +       int ret;
> > > > +
> > > > +       for (i = 0; i < lr->num_lines; i++) {
> > > > +               desc = lr->lines[i].desc;
> > > > +               flags = gpio_v2_line_config_flags(lc, i);
> > >
> > > > +               polarity_change =
> > > > +                       (test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
> > > > +                        ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0));
> > >
> > > Comparison
> >
> > Comparison between int / long (not all archs are agreed on this) and
> > boolean is not the best we can do.
> >
>
> There is no bool to int comparision here.

test_bit() returns int or long depending on arch... Then you compare
it to bool (which is a product of != 0).

> There are two comparisons - the inner int vs int => bool and the
> outer bool vs bool.  The "!= 0" is effectively an implicit cast to
> bool, as is your new_polarity initialisation below.
>
> > What about
> >
> >   bool old_polarity = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
> >   bool new_polarity = flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW;
> >
> >   old_polarity ^ new_polarity
>
> So using bitwise operators on bools is ok??

XOR is special. There were never bitwise/boolean XORs.

> > and move this under INPUT conditional?
> >
>
> It has to be before the gpio_v2_line_config_flags_to_desc_flags() call,
> as that modifies the desc flags, including the new polarity, so
> polarity_change would then always be false :-).

I really don't see in the code how polarity_change value is used in
FLAG_OUTPUT branch below.

> > > > +
> > > > +               gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
> > > > +               /*
> > > > +                * Lines have to be requested explicitly for input
> > > > +                * or output, else the line will be treated "as is".
> > > > +                */
> > > > +               if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
> > > > +                       int val = gpio_v2_line_config_output_value(lc, i);
> > > > +
> > > > +                       edge_detector_stop(&lr->lines[i]);
> > > > +                       ret = gpiod_direction_output(desc, val);
> > > > +                       if (ret)
> > > > +                               return ret;
> > > > +               } else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
> > > > +                       ret = gpiod_direction_input(desc);
> > > > +                       if (ret)
> > > > +                               return ret;
> > > > +
> > > > +                       ret = edge_detector_update(&lr->lines[i],
> > > > +                                       flags & GPIO_V2_LINE_EDGE_FLAGS,
> > > > +                                       polarity_change);
> > > > +                       if (ret)
> > > > +                               return ret;
> > > > +               }
> > > > +
> > > > +               blocking_notifier_call_chain(&desc->gdev->notifier,
> > > > +                                            GPIO_V2_LINE_CHANGED_CONFIG,
> > > > +                                            desc);
> > > > +       }
> > > > +       return 0;
> > > > +}
> >
> > --
> > With Best Regards,
> > Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
