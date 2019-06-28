Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 077FA5A017
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 17:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfF1P6V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 11:58:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35032 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbfF1P6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 11:58:20 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 039EF60AA3; Fri, 28 Jun 2019 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561737500;
        bh=APkeNd5JV3ZMlJeYJ23oxnlZ0WDm5BFkwS+DaKHgNws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nZOx2gCRCBQ1yAb2oBsSGK82xukznVdUC6zoOimtI0NCj8DJrUKH1sBtDW1aFcXa7
         HW6tcdDW1YtKikqRjRz5qUHHrq4tgahSwPc4uNgq3YTtPvo9YGa8HOgvuGZ5ABs3WR
         v1ukgB/4MNPWcBapi+cr00h/5+13Et1/dJPZ3IQE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D693602F2;
        Fri, 28 Jun 2019 15:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561737498;
        bh=APkeNd5JV3ZMlJeYJ23oxnlZ0WDm5BFkwS+DaKHgNws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hwv+/+MvfWey3N6Wp0eff8/1BSt1DpChn0LRN5niX/MpDo2B4dXEQSUE8RS3u14c3
         PzUX0Fty9+7J9ZPa13avO6DeZP4m/+5ghbCrlU3nK9gxT5N5yauoXaAt6SVB7iSPy1
         R5JxLdjsdh/x4IIN3Klz4o/oCDvlE656Bc3yKCJQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D693602F2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 28 Jun 2019 09:58:17 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
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
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190628155817.GB24030@codeaurora.org>
References: <20190624132531.6184-1-linus.walleij@linaro.org>
 <20190626210900.GA1629@codeaurora.org>
 <CACRpkdbxicUbg9NSaYsRMQG0Qo-WysdU07qD_T3rDEe7cjCcUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACRpkdbxicUbg9NSaYsRMQG0Qo-WysdU07qD_T3rDEe7cjCcUw@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, Jun 28 2019 at 03:15 -0600, Linus Walleij wrote:
>Hi Lina,
>
>thanks for your comments!
>
>On Wed, Jun 26, 2019 at 10:09 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
>> Thanks for the patch Linus. I was running into the warning in
>> gpiochip_set_irq_hooks(), because it was called from two places.
>> Hopefully, this will fix that as well. I will give it a try.
>
>That's usually when creating two irqchips from a static config.
>The most common solution is to put struct irq_chip into the
>driver state container and assign all functions dynamically so
>the irqchip is a "live" struct if you see how I mean. This is
>needed because the gpiolib irqchip core will augment some
>of the pointers in the irqchip, so if that is done twice, it feels
>a bit shaky.
>
Yeah, I realized what was happening. I have fixed it in my drivers.

>> On Mon, Jun 24 2019 at 07:29 -0600, Linus Walleij wrote:
>
>> >+  girq->num_parents = 1;
>> >+  girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
>> >+                               GFP_KERNEL);
>>
>> Could this be folded into the gpiolib?
>
>It is part of the existing API for providing an irq_chip along
>with the gpio_chip but you are right, it's kludgy. I do have
>a patch like this, making the parents a static sized field
>simply:
>https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?h=devel-gpio-irqchip
>
>So I might go on this approach. (In a separate patch.)
>
>> >+  /* Get a pointer to the gpio_irq_chip */
>> >+  girq = &g->gc.irq;
>> >+  girq->chip = &g->irq;
>> >+  girq->default_type = IRQ_TYPE_NONE;
>> >+  girq->handler = handle_bad_irq;
>> >+  girq->fwnode = g->fwnode;
>> >+  girq->parent_domain = parent;
>> >+  girq->child_to_parent_hwirq = my_gpio_child_to_parent_hwirq;
>> >+
>> Should be the necessary, if the driver implements it's own .alloc?
>
>The idea is that when using GPIOLIB_IRQCHIP and
>IRQ_DOMAIN_HIERARCHY together, the drivers utilizing
>GPIOLIB_IRQCHIP will rely on the .alloc() and .translate()
>implementations in gpiolib so the ambition is that these should
>cover all hierarchical use cases.
>
>> >+static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
>> >+{
>> >+      if (!gc->irq.parent_domain) {
>> >+              chip_err(gc, "missing parent irqdomain\n");
>> >+              return -EINVAL;
>> >+      }
>> >+
>> >+      if (!gc->irq.parent_domain ||
>> >+          !gc->irq.child_to_parent_hwirq ||
>>
>> This should probably be validated if the .ops have not been set.
>
>Yeah the idea here is a pretty imperialistic one: the gpiolib
>always provide the ops for hierarchical IRQ. The library
>implementation should cover all needs of all consumers,
>for the hierarchical case.
>
>I might be wrong, but then I need to see some example
>of hierarchies that need something more than what the
>gpiolib core is providing and idiomatic enough that it can't
>be rewritten and absolutely must have its own ops.
>
Here is an example of what I am working on [1]. The series is based on
this patch. What I want to point out is the .alloc function. The TLMM
irqchip's parent could be a PDC or a MPM depending on the QCOM SoC
architecture. They behave differently. The PDC takes over for the GPIO
and handles the monitoring etc, while the MPM comes into play only after
the SoC is in low power therefore TLMM needs to do its job. The way to
cleanly support both of themis to have our own .alloc functions to help
understand the the wakeup-parent irqchip's behavior.

Since I need my own .ops, it makes the function below irrelevant to
gpiolib. While I would still need a function to translate to parent
hwirq, I don't see it any beneficial to gpiolib.

thanks,
Lina

>> >+      int (*child_to_parent_hwirq)(struct gpio_chip *chip,
>> >+                                   unsigned int child_hwirq,
>> >+                                   unsigned int child_type,
>> >+                                   unsigned int *parent_hwirq,
>> >+                                   unsigned int *parent_type);
>>
>> Would irq_fwspec(s) be better than passing all these arguments around?
>
>I looked over these three drivers that I patched in the series
>and they all seemed to need pretty much these arguments,
>so wrapping it into fwspec would probably just make all
>drivers have to unwrap them to get child (I guess not parent)
>back out.
>
>But we can patch it later if it proves this is too much arguments
>for some drivers. Its the right amount for those I changed,
>AFAICT.
>
>Yours,
>Linus Walleij

[1]. https://github.com/i-lina/linux/commits/gpio2-2

