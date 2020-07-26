Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D99322DB0C
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jul 2020 03:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgGZBMv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 21:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbgGZBMv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 21:12:51 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF83CC0619D2;
        Sat, 25 Jul 2020 18:12:50 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k4so6347335pld.12;
        Sat, 25 Jul 2020 18:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lrqn0h4UeYu/NXBjnfBtgYmgcWJ30UKbihkBx7kwfNc=;
        b=EX7Mtu74e7NNmFrf8Um9TmfMjFl3im3HX0QNWFjH4WSZbbkHWZ7Z4CzJovTf/WTZpP
         I8tk3T4iXtbCToiSSlErXq+Lyb63rNf2Ny8XKUg0BDeSHIGn1q5iM3yXqtVG5PHZyi2c
         N9pBql17T61YRvziAGM6sg5mFFlHK/m++OkU9kaAoOENV4EF7Bk/A2vZrEVKCth36y9a
         Q9udfkmuYbU4D3Kwb7wu3JQ1BJ+bGNgGNzwiKMAylOEENSHD37bMjTropLA9e5+WvodK
         OLJ3XZAoJPO5zTfU+iJr/U9WmliMLaTEGEheb89Vqqb1rkHP8PPMt782eRUowgVqzRuG
         6Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lrqn0h4UeYu/NXBjnfBtgYmgcWJ30UKbihkBx7kwfNc=;
        b=EpO9Un7j74RL4G7FYDgmsruj92kjPnaRCm39OVczIwuhDN8sqIkYymk+aZbomPzJvs
         iCJzBeC/npg6xeRfOV9Mq6V6bgeWXYZBLYTvzUJDethTVpmmQfu8kVuYnp43npTBg70m
         Z3LTmdTrjBA0CI4WfLxLnHPcMyjSzHn1ER4FW70nANbuZHUNzFoVr8Qls0x3V/ZDyIv+
         4cHyP05zyjMMpg4wdCX211p41DvuRtE7IHVxXluX+8nAak9L0u1ZglSdqt6KCQVIj9vt
         vFMGBoZMV99HrfkrZ35ruHvLpZV6JiwRTO27NAH89qS/jUW+fXRTrf8caz5tVH/97aVs
         9QCA==
X-Gm-Message-State: AOAM532dU3H1CP/7ms7343o+NtEO7a9hYfchBu8zxXbof3hjpSOLAYf4
        5XcAc8X7FxLiUZlK/woi8EA=
X-Google-Smtp-Source: ABdhPJyXAhZUYNB1q8VtC7UJ44VKX/lsqzrXN7JZv9uTuuB+MM8CRyYuJO/+8IYkv3wDiCx0O1mQUg==
X-Received: by 2002:a17:90b:1907:: with SMTP id mp7mr11392538pjb.220.1595725970253;
        Sat, 25 Jul 2020 18:12:50 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id b4sm10705169pfo.137.2020.07.25.18.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 18:12:49 -0700 (PDT)
Date:   Sun, 26 Jul 2020 09:12:44 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and
 GPIOLINE_GET_VALUES_IOCTL
Message-ID: <20200726011244.GA6587@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-6-warthog618@gmail.com>
 <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 25, 2020 at 11:51:54PM +0300, Andy Shevchenko wrote:
> On Sat, Jul 25, 2020 at 7:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for requesting lines using the GPIO_GET_LINE_IOCTL, and
> > returning their current values using GPIOLINE_GET_VALUES_IOCTL.
> 
> ...
> 
> > +struct line {
> > +       struct gpio_device *gdev;
> > +       const char *label;
> > +       u32 num_descs;
> 
> > +       /* descs must be last so it can be dynamically sized */
> 
> I guess [] implies above comment and thus comment can be dropped.
> 
> > +       struct gpio_desc *descs[];
> > +};
> 
> ...
> 
> > +static bool padding_not_zeroed(__u32 *padding, int pad_size)
> > +{
> > +       int i, sum = 0;
> > +
> > +       for (i = 0; i < pad_size; i++)
> > +               sum |= padding[i];
> > +
> > +       return sum;
> > +}
> 
> Reimplementation of memchr_inv() ?
> 

I was hoping to find an existing function, surely checking a region is
zeroed is a common thing, right?, so this was a place holder as much
as anything.  Not sure memchr_inv fits the bill, but I'll give it a
try...

> ...
> 
> > +static u64 gpioline_config_flags(struct gpioline_config *lc, int line_idx)
> > +{
> > +       int i;
> > +
> > +       for (i = lc->num_attrs - 1; i >= 0; i--) {
> 
> Much better to read is
> 
> unsigned int i = lc->num_attrs;
> 
> while (i--) {
>  ...
> }
> 

Really? I find that the post-decrement in the while makes determining the
bounds of the loop more confusing.

> > +               if ((lc->attrs[i].attr.id == GPIOLINE_ATTR_ID_FLAGS) &&
> 
> > +                   test_bit(line_idx, (unsigned long *)lc->attrs[i].mask))
> 
> This casting is not good. What about BE 32-bit architecture?
> 

I agree the casting is hideous, but I thought the outcome was correct
as it is manipulating addresses, not data.
You think the address of a 64-bit differs based on endian??
Happy to change it - but not sure what to.

> > +                       return lc->attrs[i].attr.flags;
> > +       }
> > +       return lc->flags;
> > +}
> > +
> > +static int gpioline_config_output_value(struct gpioline_config *lc,
> > +                                       int line_idx)
> > +{
> 
> Same comments as per above.
> 
> > +}
> 
> ...
> 
> > +static long line_get_values(struct line *line, void __user *ip)
> > +{
> > +       struct gpioline_values lv;
> 
> > +       unsigned long *vals = (unsigned long *)lv.bits;
> 
> Casting u64 to unsigned long is not good.
> 

Same comments as per above.

> > +}
> 
> ...
> 
> > +static void line_free(struct line *line)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < line->num_descs; i++) {
> 
> > +               if (line->descs[i])
> 
> Redundant?
> 

Actually, no.  The line_free is also used to clean up construction
failures, so the line may be partially constructed.  num_descs is set
first, but the descs themselves may have failed to allocate.
And gpiod_free throws a warning if you pass a NULL, hence the extra check here.

> > +                       gpiod_free(line->descs[i]);
> > +       }
> > +       kfree(line->label);
> > +       put_device(&line->gdev->dev);
> > +       kfree(line);
> > +}
> 
> ...
> 
> > +       /* Make sure this is terminated */
> > +       linereq.consumer[sizeof(linereq.consumer)-1] = '\0';
> > +       if (strlen(linereq.consumer)) {
> > +               line->label = kstrdup(linereq.consumer, GFP_KERNEL);
> 
> kstrndup() ?
> 

That was a cut-and-paste from V1...

> > +               if (!line->label) {
> > +                       ret = -ENOMEM;
> > +                       goto out_free_line;
> > +               }
> > +       }
> 

... and changing it would result in this logic behaving differently.
You couldn't distinguish between consumer not being set, and
so label not being set, and kstrndup returning NULL due to no mem.

> ...
> 
> > +               struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
> 
> I prefer to see this split, but it's minor.
> 
> > +               if (IS_ERR(desc)) {
> > +                       ret = PTR_ERR(desc);
> > +                       goto out_free_line;
> > +               }
> 
> ...
> 
> > +               dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
> > +                       offset);
> 
> Perhaps tracepoint / event?
> 

Again, a cut-and-paste from V1, and I have no experience with
tracepoints or events, so I have no opinion on that.

So, yeah - perhaps?

Cheers,
Kent.
