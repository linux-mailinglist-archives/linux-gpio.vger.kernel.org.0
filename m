Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D74BF9D748
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 22:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387991AbfHZUOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 16:14:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47234 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732670AbfHZUOD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Aug 2019 16:14:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 42B0F60DAD; Mon, 26 Aug 2019 20:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566850443;
        bh=kZiwGagGqfAf+n/Lo7zWVaH4cqfSlaXUVJR0w0Ucc3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hekKpIZd0xELrjJIZN3CkWnz27WnhuhZgoiJ0i+zzaihFnH6wrrXplm+jxOftkfHP
         uJVAvMc8YYlD+mC+CFaX5s538Sa2fiWzltP4Ap8ZbTdt3EsgWSmPe2pKLx8/EefuhM
         IUga8sb+WoVLhQ+Y5JMoRklradLqgxpLaz8wNKPw=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A08C060264;
        Mon, 26 Aug 2019 20:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566850441;
        bh=kZiwGagGqfAf+n/Lo7zWVaH4cqfSlaXUVJR0w0Ucc3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z40nyzfJpSb10d5iv5GHzGfgupv83KCnDC0CC/ZLCj6Mda4lSf6p15ldqO2Q1PDVs
         XFp3CwFscBaffCRykj5PVn6o7ExbrrizErLJ93WgvZnPtvJVD6/gr+k0VSZ5bjNOKW
         68B5parakIJ9uGpA7qXAczAyWWF3Q8uDBSJGgpC8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A08C060264
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Mon, 26 Aug 2019 14:14:00 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/6 v2] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190826201400.GC26639@codeaurora.org>
References: <20190808123242.5359-1-linus.walleij@linaro.org>
 <20190816011054.GA1041@onstation.org>
 <CACRpkdbZSJ4ggprUXaBJ07Hz=eryuy5=AmYOigTUmO9z4yahfQ@mail.gmail.com>
 <63f2d086-eb71-4153-071e-71102fe24a14@arm.com>
 <20190826161526.GB26639@codeaurora.org>
 <20190826194400.67c6e99b@why>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190826194400.67c6e99b@why>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 26 2019 at 13:02 -0600, Marc Zyngier wrote:
>On Mon, 26 Aug 2019 10:15:26 -0600
>Lina Iyer <ilina@codeaurora.org> wrote:
>
>> On Fri, Aug 23 2019 at 03:12 -0600, Marc Zyngier wrote:
>> >On 23/08/2019 09:24, Linus Walleij wrote:
>> >> Hi Brian,
>> >>
>> >> I tried to look into this ssbi-gpio problem...
>> >>
>> >> Paging in Marc Z as well.
>> >>
>> >> On Fri, Aug 16, 2019 at 3:10 AM Brian Masney <masneyb@onstation.org> wrote:
>> >>
>> >>> I started to convert ssbi-gpio over to this and pm8xxx_gpio_to_irq() has
>> >>> this little snippet that's different from spmi-gpio:
>> >>>
>> >>>         [ fwspec mapping code ]
>> >>>
>> >>>         /*
>> >>>          * Cache the IRQ since pm8xxx_gpio_get() needs this to get determine the
>> >>>          * line level.
>> >>>          */
>> >>>         pin->irq = ret;
>> >>>
>> >>> Here's the relevant code in pm8xxx_gpio_get():
>> >>>
>> >>>         if (pin->mode == PM8XXX_GPIO_MODE_OUTPUT) {
>> >>>                 ret = pin->output_value;
>> >>>         } else if (pin->irq >= 0) {
>> >>>                 ret = irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &state);
>> >>>                 ...
>> >>>         }
>> >>
>> >> It's a bit annoying that this API (irq_get_irqchip_state()) is relying on
>> >> the global irq numbers and the internal function using irqdesc
>> >> __irq_get_irqchip_state() is not exported.
>> >>
>> >> We should be encouraged to operate on IRQ descriptors rather
>> >> than IRQ numbers when doing this kind of deep core work,
>> >> right?
>> >
>> >Certainly, I'd like to gradually move over from the IRQ number to an
>> >irq_desc. In interrupt-heavy contexts, this ends up being quite time
>> >consuming. I have an old patch series somewhere changing irq domains to
>> >use irq_descs internally instead of IRQ numbers, which I should maybe
>> >revive.
>> >
>> >As for __irq_get_irqchip_state, the main issue is that it doesn't
>> >perform any locking on its own, so you'd have to either provide your
>> >own, or wrap it with something else.
>> >
>> Marc, on a related note, What are your thoughts on a
>> irq_set_irqchip_state? We are running into an issue where chip state
>> clear is required as well as clearing out that of the parent. Do you see
>> problems in doing that from an irqchip driver?
>
>[desperately trying to switch to my korg address...]
>
>I'm not sure I fully get the question: if this is whether it is worth
>implementing it, it usually is a good idea if the HW supports is. But I
>have the feeling that this isn't your question, so maybe explaining
>your use-case would help.
>
>Do you mean using irq_set_irqchip_state from within an irqchip driver?
>That'd be quite odd, as this function is usually used when something
>*outside* of the irqchip driver needs to poke at some internal state
>because "it knows best" (see for example what KVM does with the active
>state).
>
Yeah, I meant to say, when invoked on a parent irqchip from a child
irqchip.

In my case when GPIO is used as an interrupt. Even though the interrupt
is not enabled, the GPIO could cause the GIC_ISPEND to be set at GIC. We
were wondering if we could use the irq_set_irqchip_state to clear
pending state at GPIO's irqchip parent and all the way to GIC,  when the
GPIO is enabled as an interrupt.

-- Lina
