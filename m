Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C6A43A5E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 17:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732019AbfFMPUk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 11:20:40 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:32780 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732020AbfFMMwy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 08:52:54 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so15002581lfe.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2019 05:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gwNxjWG8gQI5GgqIvq/lAc/Jdb6+55lVV208Tw8pEgk=;
        b=oSjivdVlU9Sm07SzG22+RcLNFv+XUuw1bt1G54OlPCzmQieEZd/+Nr4sojeGWuTrgS
         MuOWdPDVlBkOnAZDk08BA1CsYYbvLs4gCa5Q9LxP6Vl3YJGapkjO42aoTKCPcxz00wrh
         KtJ4fB7I6HYQhVdOT/Fh2gISxa/87pc3R6a/3EVb5vRQj/Eojp4yd2WuEXjlgFhZdDBf
         yNV+Z1HiCI0GjWl0vzWoJY1HOS4MptkwJBPKbYfs73t/rbmgUO1CY0FbuagchHMDuKzd
         sBDG3TcZuW66KDCdRAYJu5hhamcemoMz9RG/nfWuESh/+AgGhoheq7CecDeQqgY6fSv9
         24HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gwNxjWG8gQI5GgqIvq/lAc/Jdb6+55lVV208Tw8pEgk=;
        b=W9xe0xKpYi9yNUUeKzYrgly5ex0+qRTeXjRnUIflC78u0QqWbMFUWvTxO7u0mdmtkj
         5GAEYhgV+X5txRFEAYEHUM523YNwBJsMz89kNfaWg4fO0TlWddSHfBHFAVnAH3WSs/J7
         8N7/mwQrToPnGIX63EtxVkdJ9ANXnibRS1Q1K/iRZx4KBD7tXnSrD6FU5LOIUuYoAC68
         mzvg6VIf1t9ihIianABQiT9YNAJ9MMWxPBTtX4zWnbC45uQSk7+UC5QN8P1sD+qXMth3
         oiS7tK1w0g01geQKPZnzwUwqVNKYatiPbTRb9zSW56ep7rQB22T1LMpGVbzwSGCFGdb/
         dQQQ==
X-Gm-Message-State: APjAAAXSrmbQaRwJ19paOGLokEt6nLznP2slBcJspb3BrTzuoQ5j5GPI
        6idxgFp+VsfgSy/h9JkASNofWbYhcAczySade3zXKg==
X-Google-Smtp-Source: APXvYqxaCjMi4oyf4GocqT+eEm1qxowC4wzM0YSXx7qe4cKDVB+5e6DRAwmbdgCmNzvKlpKfGIFH1kOriFPcaWrNIuo=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr43910753lfh.92.1560430372375;
 Thu, 13 Jun 2019 05:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190602205424.28674-1-linus.walleij@linaro.org>
 <20190603091045.GC27753@ulmo> <CACRpkda9AMOpLq=02qw_q9Kkr1osiLz3F=ikFATKCj5u84K2Bw@mail.gmail.com>
 <20190604125834.GQ16519@ulmo>
In-Reply-To: <20190604125834.GQ16519@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Jun 2019 14:52:39 +0200
Message-ID: <CACRpkdYm9Te5BGZH9nLdFEHGQ9kCH_qj98v4Dh69SroR6yMejQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] RFC: gpio: Add support for hierarchical IRQ domains
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 2:58 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> The point that I'm trying to argue is that rather than find a
> complicated data structure that can represent all sorts of possible
> mappings, it'd be much simpler to just write code that can map from
> one to another.
>
> Some things are just much easier to write in code than in data.

OK I get the point, but I wonder if it is really anything else than
linear ranges here.

> On Tegra for example, we use this code to compact the sparse DT number
> space to the contiguous number space used by the GPIO chip:
>
>         port = fwspec->param[0] / 8;
>         pin = fwspec->param[0] % 8;
>
>         for (i = 0; i < port; i++)
>                 offset += gpio->soc->ports[i].pins;

That is a set of linear ranges.

> I've tested both ways, with just using plain gpiod_to_irq() or going via
> the IRQ domain. Both times I tested with gpio-keys, so it all works as
> expected.

OK then.

> However, the problem with gpiochip_to_irq() is that it basically needs
> to emulate as if data was coming from a device tree. That's basically
> what you do in the twocell code as well. The only difference on Tegra,
> again, is that we now need to expand the number space to the sparse DT
> number space by filling in the holes again. This is needed to make sure
> that when the IRQ fwspec is passed to the IRQ domain's .translate()
> callback, the values in the fwspec actually correspond to the ones
> defined by the DT.

Yeah I kind of get it now...

> > What would satisfy Tegra? I can think of trivial things like encoding a
> > "range" (int n_hwirqs) in each entry if that makes things more
> > convenient/faster when handling mapping of entire ranges.
>
> Like I said, the above would work for Tegra. My only gripe with it is
> that it's totally wasteful because we basically need 140 entries of the
> above (that's roughly 1.5-2 KiB) to do what is essentially a 1:1
> mapping.

It is not "totally wasteful" if the code can be reused with other
SoCs.

> One one hand we need to translate the GPIO/IRQ specifier into the linear
> domain of the GPIO/IRQ controller. Then in gpiochip_to_irq() we need to
> go back and translate to the GPIO/IRQ specifier in order to please the
> IRQ domain API. At the same time I don't think there's really a way
> around that. Ultimately both the gpiochip_to_irq() and regular IRQ
> mapping code paths end up calling irq_domain_ops.alloc(), which in turn
> requires the struct irq_fwspec.

Yeah I think you might need a custom .translate() function.
Can I please implement it on the less complex ixp4xx first,
before we move to the extra complicated Tegra186 problem?

> The difference is that the *DT specifier* is *not* linear and *not* a
> 1:1 mapping of the GPIO number space. That's the reason for doing the
> back and forth conversion between the DT and GPIO number spaces.

Yeah I get this... just hard to fit it in as it is evidently a bit
of corner case. And it's not so good to design a generic
feature in gpiolib (as I try to do) based on a corner case
with strange DT specifiers.

But let's add it when we need it, which may be step 2 then.

> > Where is the gpiochip.irq.domain coming from in the Tegra186
> > case?
>
> Erm... this is using just the plain gpio_irq_chip helpers.
> gpiochip_add_irqchip() ends up creating the IRQ domain.

Actually this has become a real problem for me as maintainer
now. And I'm talking about this:

$ git grep add_simple drivers/gpio/gpiolib.c
drivers/gpio/gpiolib.c:         gpiochip->irq.domain = irq_domain_add_simple(np,
drivers/gpio/gpiolib.c: gpiochip->irq.domain = irq_domain_add_simple(of_node,

There are two independent runpaths inside gpiolib for adding
irqdomains and it is a mess and if it confuses me then it
is going to confuse many others unless I'm entirely unfit
for this maintenance job.

We need to shrink gpiolib by initializing all gpio irqchips the
same way before we start adding more fancy features.

commit e0d89728981393b7d694bd3419b7794b9882c92d
"gpio: Implement tighter IRQ chip integration"
introduced these two runpaths, now we need to switch all
existing irqchips over and delete the old code so that
we don't mess things up even more and can't find our way
out.

Let's fix this first then move on to these new features.

Yours,
Linus Walleij
