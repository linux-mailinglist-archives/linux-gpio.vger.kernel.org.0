Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A88F350085
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235551AbhCaMkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235506AbhCaMkI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 08:40:08 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59526C061574;
        Wed, 31 Mar 2021 05:40:08 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x126so14417497pfc.13;
        Wed, 31 Mar 2021 05:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n5asSzSMlsy/IJZzODnlLHF4/c6NSbP5Xn/BE7oQWnA=;
        b=SygpZcKiL+DOu+eqMwZDoTk0yxjQ0ThJvSXaqWP3bxzedWk3biiknUZg4cDp/at4FR
         oUNQlsmPyIcmrzClkm6XA3NxzWpQuNC9Ur+sNIq/jzlxHNmBoOGxGS0s6ZP4y2xXnr4u
         kbyJQtkbCcnuVWGZmA/mCOTVzGPdfxQCxF3Mc94UlPqxxrmZH+t/aBh88QOqgWWHm2T0
         T/F53OiOkY9JVokhXrdgq2aMRRfxvNdiigMCOwU7vZIWZ7HgJP4feP8lEjdKyt+ciAR0
         RTNMs/VKssSMetfBusuHf0u38Mqx63Hj7B2oyd3jBBxaHxaRbFxmFkCQebKz1oveA9Xw
         CsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n5asSzSMlsy/IJZzODnlLHF4/c6NSbP5Xn/BE7oQWnA=;
        b=ZD9H6I8WsopafEcOj40yMng6cVH4YQLmfTJ/RB0xXFcAVIzsxJsAf6cXXK2/x6Oi61
         RD36z8cfUXxJlaMNT3fUQEwAQVyUdsDD4RN+Q4mu/q/1WmahPm4zFLIl1r5YOqmTko4S
         Oo8bHvfGlLeAVzijRHnPxuEGfF69gvd7B7jrVZEUV/v7FAnFrLmWTeAOuDfjyVdwkczn
         3MWFGQLptNX+gjxk6cQNROzC5Zy24upSldelTeChpJos9XUzpYheV6RudPVrN5RTLudG
         0leRxLgJzVcbYC8AKYsxEm8DFP1fipZKQVAdi0+mQPvDOvkWqhUtWDlLKG/VKkPJ/yJm
         tp5g==
X-Gm-Message-State: AOAM5328Ei+EIhobu1sbaoORjy+vZnHUeq/qLnee+Yl7qwB9lboNxNK5
        d/uSq9ghjI1jxulzrydrhewSJ3nVU+cM0vwhwRY=
X-Google-Smtp-Source: ABdhPJysAcf9ww34OwUMFjvv2sKfsgiSglYJHpdZfYIVvwFYvIlLYSIu+qus6O2TQdO7WRRnTtXL2FdKyxOpQExC/hk=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr3137446pgi.4.1617194407960;
 Wed, 31 Mar 2021 05:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <11a8323c249ae6ea7584402ab0fb74551b6a4b7d.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <CAHp75Vcc3CNXguMK-ZhRfvfjVBQBbcGEYK_+WQAmb_Sw5-Derw@mail.gmail.com> <4c143c8ee65fe52840ccbb4e1b422b6e473563d9.camel@ew.tq-group.com>
In-Reply-To: <4c143c8ee65fe52840ccbb4e1b422b6e473563d9.camel@ew.tq-group.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 15:39:51 +0300
Message-ID: <CAHp75VfVCTj170S_4Lh9JyDYFfUQLjTtnU=O-iXgUVXcycLxwg@mail.gmail.com>
Subject: Re: (EXT) Re: [PATCH 1/3] gpio: tqmx86: really make IRQ optional
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 3:37 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
> On Wed, 2021-03-31 at 15:29 +0300, Andy Shevchenko wrote:
> > On Wed, Mar 31, 2021 at 2:37 PM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:

...

> > > -       irq = platform_get_irq(pdev, 0);
> > > -       if (irq < 0)
> > > +       irq = platform_get_irq_optional(pdev, 0);
> > > +       if (irq < 0 && irq != -ENXIO)
> > >                 return irq;
> >
> > This is a dead code now. I suggest you to do the opposite, i.e.
> > if (irq < 0)
> >   irq = 0;
>
> I don't understand which part of the code is dead now. I assume the
> `return irq` case is still useful for unexpected errors, or things like
> EPROBE_DEFER? I'm not sure if EPROBE_DEFER is relevant for this driver,
> but just ignoring the error code completely doesn't seem right to me.

platform_get_irq() AFAIK won't ever return such a code.
So, basically your conditional is always false.

I would like to see the code path which makes my comment wrong.


-- 
With Best Regards,
Andy Shevchenko
