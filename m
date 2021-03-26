Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47DAC34ADED
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 18:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhCZRwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 13:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhCZRwC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 13:52:02 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1564C0613AA;
        Fri, 26 Mar 2021 10:52:01 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso2820777pjb.4;
        Fri, 26 Mar 2021 10:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0cdEld9Fs/fX6vTf9NEn8mSkHQmLdx/ookPyltaK1vM=;
        b=s+qm+ByPyucHOa7HZmw5TU47A2OBjmkfqRE3NOS87xn8aiJjFmz63qeVE5cvWbEelO
         xubtJpthF4mWwPp5JoFHca5IjTPxWmA8Gt/O5MnEpUhihrIzL60voLjxKSBRfS6iTrDk
         4aq79D9fvq9MYA2+MlzdgJg56FqOXYPqPCsAxXHn9+sxyOWjk5rawXE9r897qX2rQBfl
         eLjAND67lz2TywMWvNnPRA+RV8J2QU2hhbpE6EfvgNyN8j7QPfSwOagQhyNyPyEVshec
         QfYKOqPFaQCQkTxRq2q/EPJisCuYIE+oigmKX6GxHYRMnAPjbFZsSiuo3GQCplt2xFQx
         0f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0cdEld9Fs/fX6vTf9NEn8mSkHQmLdx/ookPyltaK1vM=;
        b=TcdPwmQX+czNC/URGVDnpRxWBoyWjoYi5ZvJ+o/HjFtOCphXs/Cr9WXD9Mlj3JY6Lt
         92Z9ENx83xOurbvB7BDp8pxNMPwOCCsSxDYcGhh2bfZRIQoFDehBKy1oqgVmeHlfUdQ0
         BbVJXhJCDDqvlZ3/mSRzK20lI12BCdZt+J0EhoSrQ9FA/U0A8WtFdJdsCaMm+n/tTt2B
         Mmo7Lg0pMs3khkHnvzD1jPLboojvRLC4lJ87SKio7jOaY8bLU3u0HgBug13zFBAcwGuH
         CsGMTT/rsdD6ichRQhYvAxvrJ8v/vHgPBtqhzzMfWRxrxVO7aaqUOBKDl+niI8eP30yy
         xq2A==
X-Gm-Message-State: AOAM530BOpJWuwsDK9Wo80EmuJdlC/OIAj2ZKJHNBIjV7JFZCwu7Uf8l
        494ysjGhj0mUv+tONtbxAnMylaix8GwXGFZsg2s=
X-Google-Smtp-Source: ABdhPJzzLWlQqFwoFzaa6TACjnbhWYMSrEbU3ydQunvU0I+lg8vTEcgn7/os+rXvJPJgPh8hGrXsoAhRWf3D0yLHXKg=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr16408696plb.21.1616781121242; Fri, 26
 Mar 2021 10:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
 <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VdxRkX15Ts+L1UJdXbpoaTu3Ue6o9o=Yh2cRCXCEi1jwA@mail.gmail.com> <8853471c798ce3dbbbd939c05a58fa5ce40be605.camel@fi.rohmeurope.com>
In-Reply-To: <8853471c798ce3dbbbd939c05a58fa5ce40be605.camel@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Mar 2021 19:51:45 +0200
Message-ID: <CAHp75VcXoTpKmT9qW61Ua=1KcN7GU_QeJU6ciFPGOetB0hQ3ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] gpio: support ROHM BD71815 GPOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 26, 2021 at 3:33 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
> On Fri, 2021-03-26 at 13:26 +0200, Andy Shevchenko wrote:
> > On Wed, Mar 24, 2021 at 12:20 PM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:

...

> > > +       return (val >> offset) & 1;
> >
> > !!(val & BIT(offset)) can also work and be in alignment with the
> > below code.
>
> This is an opinion, but to me !!(val & BIT(offset)) looks more
> confusing. I don't see the benefit from the change.

I always try to find a compromise between two: your own style and
common practice used in the subsystem in question. AFAIR my proposal
is (recommended?) style for new code.

...

> > > +       if (!bd71815->e5_pin_is_gpo && offset)
> > > +               return;
> >
> > I wonder if you can use valid_mask instead of this.
>
> Do you mean re-naming the e5_pin_is_gpo to valid_mask? Or do you mean
> some GPIO framework internal feature allowing to define valid pins? (If
> my memory serves me right one can set invalid pins from DT - but by
> default all pins are valid and here we want to invalidate a pin by
> default). For renaming I don't see the value - if internal feature can
> be used then there may be value. Thanks for the pointer, I'll look what
> I find.

I mean to utilize internal valid_mask bitmap. Yes, you may fill it as
valid at the start of the driver and then simply call __clear_bit() /
clear_bit() against one you wanted to disable. Then core will take
care of the rest (AFAIR).

...

> > > +       bit = BIT(offset);
> >
> > Can be moved to the definition block.
>
> I don't like doing the assignment before we check if the operation is
> valid. And, making assignments which are not plain constants in
> declaration make reading the declaration much harder.

OK.

...

> > > +       default:
> > > +               break;
> > > +       }
> > > +       return -EOPNOTSUPP;
> >
> > You may return directly from default.
>
> I think there used to be compilers which didn't like having the return
> inside a block - even if the block was a default. I also prefer seeing
> return at the end of function which should return a value.

I prefer less LOCs in the file when it makes sense. And here you seem
appealing to compilers from last century.

...

> > > +       int ret;
> > > +       struct bd71815_gpio *g;
> > > +       struct device *dev;
> > > +       struct device *parent;
> >
> > Reversed xmas tree order.
>
> What is the added value here? I understand alphabetical sorting - it
> helps looking if particular entry is included. I also understand type-
> based sorting. But reverse Xmas tree? I thin I have heard it eases
> reading declarations - which is questionable in this case. Double so
> when you also suggest moving assignments to declaration block which
> makes it _much_ harder to read? I won't change this unless it is
> mandated by the maintainers.

Compare to:

       struct bd71815_gpio *g;
       struct device *parent;
       struct device *dev;
       int ret;

It's easier to read, esp. taking into account that ret is going last.
It seems to me more natural, so we have a disagreement here, but I'm
not a maintainer, it's up to them.

...

> > > +       parent = dev->parent;
>
> It is not always obvious (especially for someone not reading MFD driver
> code frequently) why we use parent device for some things and the
> device being probed to some other stuff. Typically this is not needed
> if the device is not MFD sub-device. And again, the comments in the
> middle of declaration block look confusing to me. I think removing
> comments and moving these to declaration make readability _much_ worse.

I disagree with you here again. To me it's like completely unneeded churn.

...

> > > +       g->e5_pin_is_gpo = of_property_read_bool(parent->of_node,
> > > +                                                "rohm,enable-
> > > hidden-gpo");
> >
> > You may use device_property_read_bool().
>
> Out of the curiosity - is there any other reason but ACPI?

We might have another property provider (by the fact we already have
the third one, but it's a specific one, called software nodes).

>  ACPI support
> can be added later if needed.

Yes, but doing something OF centric which might have been used on
non-OF platforms is to do double effort and waste time and resources.

> I still think you're correct. This is
> definitely one of the points that fall in the category of things "I
> must consider as a good practice for (my) new contribution". So I try
> to keep this in mind in the future.

...

> > > +       g->chip.of_node = parent->of_node;
> >
> > Redundant. GPIO library does it for you and even better.
>
> So I can nowadays just omit this? Thanks!

For a long time. I haven't checked the date when it started like this,
but couple of years sounds like a good approximation.

...

> > > +MODULE_DEVICE_TABLE(platform, bd7181x_gpo_id);
> >
> > Why do you need this ID table exactly?
> > You have the same name as in the platform driver structure below.
>
> This driver was also supporting another IC (BD71817) - but as far as I
> know the BD71817 is no longer used too much so I dropped it. The ID
> table was left with this one entry only. I will see if this is any more
> needed. Thanks.

Yes, but in that case you have to have driver data to differentiate
the chips, right? Otherwise for platform drivers this makes a little
sense b/c it effectively repeats .name from gpo_bd71815_driver.

-- 
With Best Regards,
Andy Shevchenko
