Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B721427670E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 05:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgIXDYW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 23:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbgIXDYU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 23:24:20 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFC6C0613D3;
        Wed, 23 Sep 2020 20:24:20 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k8so1027531pfk.2;
        Wed, 23 Sep 2020 20:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z7HzKeU+YA+5aHKiz2EeN/KjqifzfqdCnK/SeiTbOfE=;
        b=Aw6B7XlCdnR2FWkEXh6n4je/FYrmxziP+LGULZ63SEZanzdLUZvMXHS70GpqoYIK/s
         KhTQ2klOtJUB8hEv5YWfnEnKcnbWv2fXL3GJWjH+XK6/jjqhR+eGiR4qcjUwTfz/YO4J
         H5MaKQ9wQhF/oUWjY/oSRt5a//Z2BYV0//ginwIsNo4sZb0baZu0WZAwq5d3b1w+72g3
         KOQsIVexXsbn54y/ZD+wzDo1BDE9NTAVbk9wYpLByU75hVpLstPy58cOI2WYL4u9EAu0
         g+fmrzqdVf45Hsf48CcvWLqL2HAdTelLqRTu9lgiu7rz7maAgJjo5od8OAvk/M+vWv21
         J/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z7HzKeU+YA+5aHKiz2EeN/KjqifzfqdCnK/SeiTbOfE=;
        b=QLnqE5A7Qv2eJELfpv1V0o5fQA0ZVTD9ikT/FY5e8ntGAT1kVEwUG7c4lacRskA04g
         b1Lw9NgKnFxyspJg4h9e8qXViy64Z5gf5zHBuPq5W6Pe/SVYqX4PIEgMJukfo2fDQe5q
         Yr1gDZGTZxgYSq2K8VQfX/AudhV/+S6Pv3cH/DO06+DWyUXiPao/7qIVtg5YwadsHFsX
         Z9kmISr8JSMBR0VexcleSNgP1KvFKBrAQ98a3D9FcILCFEC7gmY2kCJMOfbIyBKIekWZ
         rXMp2iKOPdQUzZK49R5b+kvx3YSEyUButZASlzDQyqLkuGEASbYM5fjcQM0irDzR4CxV
         egpA==
X-Gm-Message-State: AOAM5332Pvwq5rUUetSBvA3h11XZ6HWCoNyir87BY+sIhbVQ53Yq0yHy
        FdJlueX/tEPNuvB2qxetIgs7nhImarfHgQ==
X-Google-Smtp-Source: ABdhPJyYnbwiVMvPZWFR7UWMvCm9jblwlxI2CIZ293stINzslINVqDS1oBvWF+A64NGjr27qBU7DVg==
X-Received: by 2002:a63:c64d:: with SMTP id x13mr2278799pgg.380.1600917860098;
        Wed, 23 Sep 2020 20:24:20 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id 124sm959465pfd.132.2020.09.23.20.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 20:24:19 -0700 (PDT)
Date:   Thu, 24 Sep 2020 11:24:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 10/20] gpiolib: cdev: support
 GPIO_V2_LINE_SET_CONFIG_IOCTL
Message-ID: <20200924032414.GC11575@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-11-warthog618@gmail.com>
 <CAHp75VdaPR+iihenPYos1mAGLbDhJPvCfDTtURpk_MBa=3wYEg@mail.gmail.com>
 <CAHp75Vcktxp1C6NTOrW-WEnfueOu0UvtquFLpsL5+vv6Fdaajw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vcktxp1C6NTOrW-WEnfueOu0UvtquFLpsL5+vv6Fdaajw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 07:15:46PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 23, 2020 at 7:14 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Add support for GPIO_V2_LINE_SET_CONFIG_IOCTL, the uAPI v2
> > > line set config ioctl.
> 
> > > +static long linereq_set_config_unlocked(struct linereq *lr,
> > > +                                       struct gpio_v2_line_config *lc)
> > > +{
> > > +       struct gpio_desc *desc;
> > > +       unsigned int i;
> > > +       u64 flags;
> > > +       bool polarity_change;
> > > +       int ret;
> > > +
> > > +       for (i = 0; i < lr->num_lines; i++) {
> > > +               desc = lr->lines[i].desc;
> > > +               flags = gpio_v2_line_config_flags(lc, i);
> >
> > > +               polarity_change =
> > > +                       (test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
> > > +                        ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0));
> >
> > Comparison
> 
> Comparison between int / long (not all archs are agreed on this) and
> boolean is not the best we can do.
> 

There is no bool to int comparision here.

There are two comparisons - the inner int vs int => bool and the
outer bool vs bool.  The "!= 0" is effectively an implicit cast to
bool, as is your new_polarity initialisation below.

> What about
> 
>   bool old_polarity = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
>   bool new_polarity = flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW;
> 
>   old_polarity ^ new_polarity
> 

So using bitwise operators on bools is ok??

> and move this under INPUT conditional?
> 

It has to be before the gpio_v2_line_config_flags_to_desc_flags() call,
as that modifies the desc flags, including the new polarity, so
polarity_change would then always be false :-).

Cheers,
Kent.

> > > +
> > > +               gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
> > > +               /*
> > > +                * Lines have to be requested explicitly for input
> > > +                * or output, else the line will be treated "as is".
> > > +                */
> > > +               if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
> > > +                       int val = gpio_v2_line_config_output_value(lc, i);
> > > +
> > > +                       edge_detector_stop(&lr->lines[i]);
> > > +                       ret = gpiod_direction_output(desc, val);
> > > +                       if (ret)
> > > +                               return ret;
> > > +               } else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
> > > +                       ret = gpiod_direction_input(desc);
> > > +                       if (ret)
> > > +                               return ret;
> > > +
> > > +                       ret = edge_detector_update(&lr->lines[i],
> > > +                                       flags & GPIO_V2_LINE_EDGE_FLAGS,
> > > +                                       polarity_change);
> > > +                       if (ret)
> > > +                               return ret;
> > > +               }
> > > +
> > > +               blocking_notifier_call_chain(&desc->gdev->notifier,
> > > +                                            GPIO_V2_LINE_CHANGED_CONFIG,
> > > +                                            desc);
> > > +       }
> > > +       return 0;
> > > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
