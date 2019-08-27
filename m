Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C829E385
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 11:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfH0JAz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 05:00:55 -0400
Received: from foss.arm.com ([217.140.110.172]:41268 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbfH0JAz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Aug 2019 05:00:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27BE9337;
        Tue, 27 Aug 2019 02:00:54 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46C143F246;
        Tue, 27 Aug 2019 02:00:48 -0700 (PDT)
Subject: Re: [PATCH 1/6 v2] gpio: Add support for hierarchical IRQ domains
To:     Lina Iyer <ilina@codeaurora.org>
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
References: <20190808123242.5359-1-linus.walleij@linaro.org>
 <20190816011054.GA1041@onstation.org>
 <CACRpkdbZSJ4ggprUXaBJ07Hz=eryuy5=AmYOigTUmO9z4yahfQ@mail.gmail.com>
 <63f2d086-eb71-4153-071e-71102fe24a14@arm.com>
 <20190826161526.GB26639@codeaurora.org> <20190826194400.67c6e99b@why>
 <20190826201400.GC26639@codeaurora.org>
From:   Marc Zyngier <maz@kernel.org>
Organization: Approximate
Message-ID: <c812668e-0caf-4169-9990-9a7760adbb4e@kernel.org>
Date:   Tue, 27 Aug 2019 10:00:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826201400.GC26639@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26/08/2019 21:14, Lina Iyer wrote:
> On Mon, Aug 26 2019 at 13:02 -0600, Marc Zyngier wrote:
>> On Mon, 26 Aug 2019 10:15:26 -0600
>> Lina Iyer <ilina@codeaurora.org> wrote:
>>
>>> On Fri, Aug 23 2019 at 03:12 -0600, Marc Zyngier wrote:
>>>> On 23/08/2019 09:24, Linus Walleij wrote:
>>>>> Hi Brian,
>>>>>
>>>>> I tried to look into this ssbi-gpio problem...
>>>>>
>>>>> Paging in Marc Z as well.
>>>>>
>>>>> On Fri, Aug 16, 2019 at 3:10 AM Brian Masney <masneyb@onstation.org> wrote:
>>>>>
>>>>>> I started to convert ssbi-gpio over to this and pm8xxx_gpio_to_irq() has
>>>>>> this little snippet that's different from spmi-gpio:
>>>>>>
>>>>>>         [ fwspec mapping code ]
>>>>>>
>>>>>>         /*
>>>>>>          * Cache the IRQ since pm8xxx_gpio_get() needs this to get determine the
>>>>>>          * line level.
>>>>>>          */
>>>>>>         pin->irq = ret;
>>>>>>
>>>>>> Here's the relevant code in pm8xxx_gpio_get():
>>>>>>
>>>>>>         if (pin->mode == PM8XXX_GPIO_MODE_OUTPUT) {
>>>>>>                 ret = pin->output_value;
>>>>>>         } else if (pin->irq >= 0) {
>>>>>>                 ret = irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &state);
>>>>>>                 ...
>>>>>>         }
>>>>>
>>>>> It's a bit annoying that this API (irq_get_irqchip_state()) is relying on
>>>>> the global irq numbers and the internal function using irqdesc
>>>>> __irq_get_irqchip_state() is not exported.
>>>>>
>>>>> We should be encouraged to operate on IRQ descriptors rather
>>>>> than IRQ numbers when doing this kind of deep core work,
>>>>> right?
>>>>
>>>> Certainly, I'd like to gradually move over from the IRQ number to an
>>>> irq_desc. In interrupt-heavy contexts, this ends up being quite time
>>>> consuming. I have an old patch series somewhere changing irq domains to
>>>> use irq_descs internally instead of IRQ numbers, which I should maybe
>>>> revive.
>>>>
>>>> As for __irq_get_irqchip_state, the main issue is that it doesn't
>>>> perform any locking on its own, so you'd have to either provide your
>>>> own, or wrap it with something else.
>>>>
>>> Marc, on a related note, What are your thoughts on a
>>> irq_set_irqchip_state? We are running into an issue where chip state
>>> clear is required as well as clearing out that of the parent. Do you see
>>> problems in doing that from an irqchip driver?
>>
>> [desperately trying to switch to my korg address...]
>>
>> I'm not sure I fully get the question: if this is whether it is worth
>> implementing it, it usually is a good idea if the HW supports is. But I
>> have the feeling that this isn't your question, so maybe explaining
>> your use-case would help.
>>
>> Do you mean using irq_set_irqchip_state from within an irqchip driver?
>> That'd be quite odd, as this function is usually used when something
>> *outside* of the irqchip driver needs to poke at some internal state
>> because "it knows best" (see for example what KVM does with the active
>> state).
>>
> Yeah, I meant to say, when invoked on a parent irqchip from a child
> irqchip.
> 
> In my case when GPIO is used as an interrupt. Even though the interrupt
> is not enabled, the GPIO could cause the GIC_ISPEND to be set at GIC. We
> were wondering if we could use the irq_set_irqchip_state to clear
> pending state at GPIO's irqchip parent and all the way to GIC,  when the
> GPIO is enabled as an interrupt.

You can of course chain the call from one level to its parent. It's a
bit odd to have to clear a pending bit in this context, but I guess
that's a HW-specific limitation.

	M.
-- 
Jazz is not dead, it just smells funny...
