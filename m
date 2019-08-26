Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2F7D9D628
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 21:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387577AbfHZTBr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 15:01:47 -0400
Received: from inca-roads.misterjones.org ([213.251.177.50]:52054 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732700AbfHZTBr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Aug 2019 15:01:47 -0400
X-Greylist: delayed 1060 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Aug 2019 15:01:47 EDT
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
        (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1i2JyE-0007Pt-UE; Mon, 26 Aug 2019 20:44:03 +0200
Date:   Mon, 26 Aug 2019 19:44:00 +0100
From:   Marc Zyngier <maz@kernel.org>
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
Subject: Re: [PATCH 1/6 v2] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190826194400.67c6e99b@why>
In-Reply-To: <20190826161526.GB26639@codeaurora.org>
References: <20190808123242.5359-1-linus.walleij@linaro.org>
        <20190816011054.GA1041@onstation.org>
        <CACRpkdbZSJ4ggprUXaBJ07Hz=eryuy5=AmYOigTUmO9z4yahfQ@mail.gmail.com>
        <63f2d086-eb71-4153-071e-71102fe24a14@arm.com>
        <20190826161526.GB26639@codeaurora.org>
Organization: Approximate
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: ilina@codeaurora.org, linus.walleij@linaro.org, masneyb@onstation.org, linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com, tglx@linutronix.de, jonathanh@nvidia.com, skomatineni@nvidia.com, bbiswas@nvidia.com, linux-tegra@vger.kernel.org, david.daney@cavium.com, yamada.masahiro@socionext.com, treding@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Aug 2019 10:15:26 -0600
Lina Iyer <ilina@codeaurora.org> wrote:

> On Fri, Aug 23 2019 at 03:12 -0600, Marc Zyngier wrote:
> >On 23/08/2019 09:24, Linus Walleij wrote:  
> >> Hi Brian,
> >>
> >> I tried to look into this ssbi-gpio problem...
> >>
> >> Paging in Marc Z as well.
> >>
> >> On Fri, Aug 16, 2019 at 3:10 AM Brian Masney <masneyb@onstation.org> wrote:
> >>  
> >>> I started to convert ssbi-gpio over to this and pm8xxx_gpio_to_irq() has
> >>> this little snippet that's different from spmi-gpio:
> >>>
> >>>         [ fwspec mapping code ]
> >>>
> >>>         /*
> >>>          * Cache the IRQ since pm8xxx_gpio_get() needs this to get determine the
> >>>          * line level.
> >>>          */
> >>>         pin->irq = ret;
> >>>
> >>> Here's the relevant code in pm8xxx_gpio_get():
> >>>
> >>>         if (pin->mode == PM8XXX_GPIO_MODE_OUTPUT) {
> >>>                 ret = pin->output_value;
> >>>         } else if (pin->irq >= 0) {
> >>>                 ret = irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &state);
> >>>                 ...
> >>>         }  
> >>
> >> It's a bit annoying that this API (irq_get_irqchip_state()) is relying on
> >> the global irq numbers and the internal function using irqdesc
> >> __irq_get_irqchip_state() is not exported.
> >>
> >> We should be encouraged to operate on IRQ descriptors rather
> >> than IRQ numbers when doing this kind of deep core work,
> >> right?  
> >
> >Certainly, I'd like to gradually move over from the IRQ number to an
> >irq_desc. In interrupt-heavy contexts, this ends up being quite time
> >consuming. I have an old patch series somewhere changing irq domains to
> >use irq_descs internally instead of IRQ numbers, which I should maybe
> >revive.
> >
> >As for __irq_get_irqchip_state, the main issue is that it doesn't
> >perform any locking on its own, so you'd have to either provide your
> >own, or wrap it with something else.
> >  
> Marc, on a related note, What are your thoughts on a
> irq_set_irqchip_state? We are running into an issue where chip state
> clear is required as well as clearing out that of the parent. Do you see
> problems in doing that from an irqchip driver?

[desperately trying to switch to my korg address...]

I'm not sure I fully get the question: if this is whether it is worth
implementing it, it usually is a good idea if the HW supports is. But I
have the feeling that this isn't your question, so maybe explaining
your use-case would help.

Do you mean using irq_set_irqchip_state from within an irqchip driver?
That'd be quite odd, as this function is usually used when something
*outside* of the irqchip driver needs to poke at some internal state
because "it knows best" (see for example what KVM does with the active
state).

But again, stating your problem would help.

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
