Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCBE88CEBC
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbfHNIrD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:47:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40688 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbfHNIrC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 04:47:02 -0400
Received: by mail-lf1-f65.google.com with SMTP id b17so78761948lff.7
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 01:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J+Uv/ssW3LS+BMf/0AoJkCiv1isbEzUkHs4RgSvcQLQ=;
        b=Ha98pG9CnnigxyTxsokOvzCl+km65kr6rUzBJ1RXkyXbl9Kw/gjT1fgQmSVd5KL1Oi
         vuatFX7wcIgQAxrutfoZ/rHiWQnMHlocwbESCmKcWrLHe4urCUOwnbQYxIe/bn5WlTBA
         /3J85Xxv8d44xBoXEXKQYCBDcEzvzOvRhIReSA6PC6+0OTatsANYQtdZO5QH+lU31LCc
         IU9nFrqrIc5Ndggq3heSdgWTn4HCQrA4dl8xHk4xH9KfWisgReeYKtiphmbU7QiuToal
         2tTaOCx10jwoQEqFsvqYfhwcELsMMewO047Q8NwVddrI8VJ9hxCpswruESapUquYRtmH
         uw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J+Uv/ssW3LS+BMf/0AoJkCiv1isbEzUkHs4RgSvcQLQ=;
        b=BbZqSWvLSnwvEJ6YL7BAq4HH8psqiEGZVew0lOgDhYAPjjdx9j4NZVxxyHKKBF8PEg
         1o7CsEeHXcA8N3Ua3g0CQAxacPqTiCQ6bGfVc7LXjOliYL62Aipdg9rZaJGfwYV9DyZY
         lJkMADeLIPKnX5y6yw9nRptj0SVnul0D3sYWJwPHuGQVmKnxrQ+5X3GepeYFauVPBpWk
         T+5BIzobDB02MwxW8sAA12+mg2C4XQKOqkkIyHvs4bTduZi8t2eunpjD3Luv3QSReYut
         KGv2wtB40wtiFa3HacYNhUpxT5OFm7p9kI6rQNjR48A5vW5j4QQn1BTV/aIgxKDWnYEL
         5Ygw==
X-Gm-Message-State: APjAAAVlGR8nYkJHeBSbLkDLe5+tjnkT8AXxWIpGE/BQgLvqFvbQEyQv
        hG+ziqJKZ6sS8dEompU/zI7MBOJCpMtaPbJvKhFdEg==
X-Google-Smtp-Source: APXvYqyGHzt8eVn18eiTFmQAUBfEJREot29/k8GOTjTpRYhs3wo/vm+Z1+K00mQ/n6SZmxrDgdLl/gshupco4s7OPnw=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr25712838lfp.61.1565772420852;
 Wed, 14 Aug 2019 01:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190812081351.21284-1-linus.walleij@linaro.org> <20190812105825.GB30120@smile.fi.intel.com>
In-Reply-To: <20190812105825.GB30120@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:46:49 +0200
Message-ID: <CACRpkda_2T_eBf5AxpNG0P54KTLds-NvYDMcTWx5BtOa9kK-mA@mail.gmail.com>
Subject: Re: [PATCH] gpio: lynxpoint: Pass irqchip when adding gpiochip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        David Cohen <david.a.cohen@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 12:58 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Aug 12, 2019 at 10:13:51AM +0200, Linus Walleij wrote:

> > +             girq->num_parents = 1;
> > +             girq->parents = devm_kcalloc(&pdev->dev, 1,
> > +                                          sizeof(*girq->parents),
> > +                                          GFP_KERNEL);
> > +             if (!girq->parents)
> > +                     return -ENOMEM;
>
> I understand the point to use kcalloc() for one entry, though I would make
> intention more explicitly, i.e. use girq->num_parents in it instead of hard
> coded value.

That is better, but I have a loose plan to get rid of this
and just set parents to a fixed width because all the allocation
is annoying.

> > +             girq->parents[0] = (unsigned)irq_rc->start;
> > +             girq->default_type = IRQ_TYPE_NONE;
>
> > +             girq->handler = handle_simple_irq;
>
> > -             ret = gpiochip_irqchip_add(gc, &lp_irqchip, 0,
> > -                                        handle_simple_irq, IRQ_TYPE_NONE);
>
> Hmm... Now I'm wondering, shall we use handle_bad_irq() here?

If you are sure that every consumer will call .set_type() you can
use handle_bad_irq, and that is preferred.

Yours,
Linus Walleij
