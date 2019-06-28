Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0384159718
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 11:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfF1JOe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 05:14:34 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36464 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfF1JOe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 05:14:34 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so5271089ljj.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2019 02:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uznwEwrkA1WxOpPXx1Qs1nC3MJdNO44F8qkdWkJ+eWA=;
        b=Dw6osl4lChKJIdc5ihTOWdIykVTBBv1r71/QuNAsX0AIj1XlxfSZFAR6OsNmTvyjMb
         MCTXi+Sn6wSuCZ4yq31AcHJ6jJby18QXHUF+riuelGP416y9+a0ZPN/ejIsaXOvWrBgP
         9Jc7GQbzskBBd6F4cKn2T5CgAZQD0rMGfZVDkN3hAZI3mL6zuIwyrFhlIGSMFsWos1zW
         zHqA0kFatz/ATiemywJAqIkV8CBqBe7WXQWLHfYQNHgziCFra3oolxJaW/rlSbpM9u3R
         kYke8lNK5BkCQysPOfZGT8teSP35hksLaZ3xNUxyti1TLA//CqJo2yNYLo+nFzUiysAN
         CQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uznwEwrkA1WxOpPXx1Qs1nC3MJdNO44F8qkdWkJ+eWA=;
        b=U1Ds3C2amkUPKlXHVJ4F9N4E/zA7aRyXzgJ9XGLmQz90EbmsaAajOmfbI3O7zo3daE
         g+ZHFpuSBU17nm6z9+/UmWRObYLUENhtfGkesY7wtP+eNGyUPh3L+XgTsfG9/XMZ9892
         yQXSwA0TYf2fdam42a8zZ+X6bUTfrjF0hZM6LTTNRMgYH/slZcacwxvhpbiY26enWhjc
         l96J1WNzaZS7tahpCFSn2L6fIsO9KDn5wDXFEvlodNu6EMNBSMg/63goqJzEvurGePwn
         44N+GWsR9y6bqBsaLWyJZR/eQvHuVbJyIo7F8lBVdKpjRumKSdgYklUPP5ObDX9QYbKp
         gE6A==
X-Gm-Message-State: APjAAAUVSymisFT/if5MRntqMFYitL9/755gUmKkiGhxNiaP48GhhiLu
        w/7fHd0kJj5ngUiAe+nDADIB/NdmQ4cC6A/GD3S8Gg==
X-Google-Smtp-Source: APXvYqycHcj90kraQFODoJwFpy4ZpOMmJz0R9U8j9TWPajh/F2Q0ju0N595YB1frnXjW1PpRD1d+SIltiE5c/PFW5CU=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr5489914ljs.54.1561713272207;
 Fri, 28 Jun 2019 02:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190624132531.6184-1-linus.walleij@linaro.org> <20190626210900.GA1629@codeaurora.org>
In-Reply-To: <20190626210900.GA1629@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Jun 2019 10:14:20 +0100
Message-ID: <CACRpkdbxicUbg9NSaYsRMQG0Qo-WysdU07qD_T3rDEe7cjCcUw@mail.gmail.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Brian Masney <masneyb@onstation.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lina,

thanks for your comments!

On Wed, Jun 26, 2019 at 10:09 PM Lina Iyer <ilina@codeaurora.org> wrote:

> Thanks for the patch Linus. I was running into the warning in
> gpiochip_set_irq_hooks(), because it was called from two places.
> Hopefully, this will fix that as well. I will give it a try.

That's usually when creating two irqchips from a static config.
The most common solution is to put struct irq_chip into the
driver state container and assign all functions dynamically so
the irqchip is a "live" struct if you see how I mean. This is
needed because the gpiolib irqchip core will augment some
of the pointers in the irqchip, so if that is done twice, it feels
a bit shaky.

> On Mon, Jun 24 2019 at 07:29 -0600, Linus Walleij wrote:

> >+  girq->num_parents = 1;
> >+  girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
> >+                               GFP_KERNEL);
>
> Could this be folded into the gpiolib?

It is part of the existing API for providing an irq_chip along
with the gpio_chip but you are right, it's kludgy. I do have
a patch like this, making the parents a static sized field
simply:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?h=devel-gpio-irqchip

So I might go on this approach. (In a separate patch.)

> >+  /* Get a pointer to the gpio_irq_chip */
> >+  girq = &g->gc.irq;
> >+  girq->chip = &g->irq;
> >+  girq->default_type = IRQ_TYPE_NONE;
> >+  girq->handler = handle_bad_irq;
> >+  girq->fwnode = g->fwnode;
> >+  girq->parent_domain = parent;
> >+  girq->child_to_parent_hwirq = my_gpio_child_to_parent_hwirq;
> >+
> Should be the necessary, if the driver implements it's own .alloc?

The idea is that when using GPIOLIB_IRQCHIP and
IRQ_DOMAIN_HIERARCHY together, the drivers utilizing
GPIOLIB_IRQCHIP will rely on the .alloc() and .translate()
implementations in gpiolib so the ambition is that these should
cover all hierarchical use cases.

> >+static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
> >+{
> >+      if (!gc->irq.parent_domain) {
> >+              chip_err(gc, "missing parent irqdomain\n");
> >+              return -EINVAL;
> >+      }
> >+
> >+      if (!gc->irq.parent_domain ||
> >+          !gc->irq.child_to_parent_hwirq ||
>
> This should probably be validated if the .ops have not been set.

Yeah the idea here is a pretty imperialistic one: the gpiolib
always provide the ops for hierarchical IRQ. The library
implementation should cover all needs of all consumers,
for the hierarchical case.

I might be wrong, but then I need to see some example
of hierarchies that need something more than what the
gpiolib core is providing and idiomatic enough that it can't
be rewritten and absolutely must have its own ops.

> >+      int (*child_to_parent_hwirq)(struct gpio_chip *chip,
> >+                                   unsigned int child_hwirq,
> >+                                   unsigned int child_type,
> >+                                   unsigned int *parent_hwirq,
> >+                                   unsigned int *parent_type);
>
> Would irq_fwspec(s) be better than passing all these arguments around?

I looked over these three drivers that I patched in the series
and they all seemed to need pretty much these arguments,
so wrapping it into fwspec would probably just make all
drivers have to unwrap them to get child (I guess not parent)
back out.

But we can patch it later if it proves this is too much arguments
for some drivers. Its the right amount for those I changed,
AFAICT.

Yours,
Linus Walleij
