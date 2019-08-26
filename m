Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4B619D3CA
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 18:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731647AbfHZQP3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 12:15:29 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47534 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731839AbfHZQP3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Aug 2019 12:15:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4EA4E60ADE; Mon, 26 Aug 2019 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566836128;
        bh=MNZ76vg5emLKP0LvdNC5TCr1EQa8uU/k6NKrBA1lt6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pb9kDfwbSgd3fZpQuhW/iO3OPzvD9Fk+36DKWLInyUU/G2EpZ4uKXDS7ZzntJt0pn
         TLvCI2lkLqmCGR3ltvOacyPLqjPTS3eX/v4VOmyJCuxYsJPEIJUOCyy9IGJnHZDfgs
         1FD1JAtRnP0v5vUK5IQyl9M3oLEq6bdK+Dw9jgLU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 061CB6077A;
        Mon, 26 Aug 2019 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566836127;
        bh=MNZ76vg5emLKP0LvdNC5TCr1EQa8uU/k6NKrBA1lt6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mGDJYUIQSZfY/cS1eSrEUdAj0WaMc4lIlEB1lFvLXkmoAJZavKj18enNpg/EdJajg
         D96LnP8Ot0Eipz1GDQK3csAHPv03y8LuBI17zixkhfgM33+nzk2VeP/z1uAyFJb6M1
         /UDkDE0mNPS8289M7WwnN+V6Z3PHwcO7nShMMr10=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 061CB6077A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Mon, 26 Aug 2019 10:15:26 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Marc Zyngier <marc.zyngier@arm.com>
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
Message-ID: <20190826161526.GB26639@codeaurora.org>
References: <20190808123242.5359-1-linus.walleij@linaro.org>
 <20190816011054.GA1041@onstation.org>
 <CACRpkdbZSJ4ggprUXaBJ07Hz=eryuy5=AmYOigTUmO9z4yahfQ@mail.gmail.com>
 <63f2d086-eb71-4153-071e-71102fe24a14@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <63f2d086-eb71-4153-071e-71102fe24a14@arm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 23 2019 at 03:12 -0600, Marc Zyngier wrote:
>On 23/08/2019 09:24, Linus Walleij wrote:
>> Hi Brian,
>>
>> I tried to look into this ssbi-gpio problem...
>>
>> Paging in Marc Z as well.
>>
>> On Fri, Aug 16, 2019 at 3:10 AM Brian Masney <masneyb@onstation.org> wrote:
>>
>>> I started to convert ssbi-gpio over to this and pm8xxx_gpio_to_irq() has
>>> this little snippet that's different from spmi-gpio:
>>>
>>>         [ fwspec mapping code ]
>>>
>>>         /*
>>>          * Cache the IRQ since pm8xxx_gpio_get() needs this to get determine the
>>>          * line level.
>>>          */
>>>         pin->irq = ret;
>>>
>>> Here's the relevant code in pm8xxx_gpio_get():
>>>
>>>         if (pin->mode == PM8XXX_GPIO_MODE_OUTPUT) {
>>>                 ret = pin->output_value;
>>>         } else if (pin->irq >= 0) {
>>>                 ret = irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &state);
>>>                 ...
>>>         }
>>
>> It's a bit annoying that this API (irq_get_irqchip_state()) is relying on
>> the global irq numbers and the internal function using irqdesc
>> __irq_get_irqchip_state() is not exported.
>>
>> We should be encouraged to operate on IRQ descriptors rather
>> than IRQ numbers when doing this kind of deep core work,
>> right?
>
>Certainly, I'd like to gradually move over from the IRQ number to an
>irq_desc. In interrupt-heavy contexts, this ends up being quite time
>consuming. I have an old patch series somewhere changing irq domains to
>use irq_descs internally instead of IRQ numbers, which I should maybe
>revive.
>
>As for __irq_get_irqchip_state, the main issue is that it doesn't
>perform any locking on its own, so you'd have to either provide your
>own, or wrap it with something else.
>
Marc, on a related note, What are your thoughts on a
irq_set_irqchip_state? We are running into an issue where chip state
clear is required as well as clearing out that of the parent. Do you see
problems in doing that from an irqchip driver?

--Lina

