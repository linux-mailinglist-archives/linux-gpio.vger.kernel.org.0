Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50CB780AE9
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2019 14:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfHDMbf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Aug 2019 08:31:35 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39535 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbfHDMbe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Aug 2019 08:31:34 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so28494738wrt.6;
        Sun, 04 Aug 2019 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zjPnrNRSVe7Lq+IxwIrHRvCir1T+ns5PaYdIlvEIlBk=;
        b=P4XR67tpf5tpM8BGG0z7VSqd2WbcGDYp1d3F1Zw9+b19mp8rkNlr0BInWh/PTJ9X3i
         wiJPjPSMDEJEu8eSKJf+o465YcFGzchDTlnuL2Ts9ug3znxOR9j5roUfH819dX3tLM4+
         jUgqXd6Fsi1QZKlhjXSpn9Tdy3JR8vvqra/XhqgEq4a8qpfI7eHM1o/bW9mKaAWrRZsz
         ahsllKUTm6o+h+z3G5YmdiDa9m7JTQ9T19m526JAKn6PtUgKorJZQnHVAutpSR/I3t4K
         ekymEOH7xYYPADzT66aGszX70sraSYNdbH5C6WHnEULF3fmfU4O6Y45va/kyAZy7EB1p
         pavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zjPnrNRSVe7Lq+IxwIrHRvCir1T+ns5PaYdIlvEIlBk=;
        b=I+8qmYvgzZysTWAFzyQVwzIeT1t0Q1TO0PlMgTrDqQa8f+B/E+snJ+mAXf0OzpsaU+
         dFMj7zvsaag4GvV3ZtKx+ryv1GiLlbHRsy68pm2pWrySqdIJoXOztXmG7K/ZmrkhbbLF
         kHHp9xG7byg6uYW32j6F3cgIFJcH3R2sjB9qW9uqFp0T6WGl2g56DbbqoO8b393mxrxB
         Tjs327QDgK5klBvQASrLfZ5XqyxTViOgPz1vXJp0gby8qeHJBugqKOGJGGoovX9spoKg
         ud7ERgHHZRKPD5Z9ogVVac8dneq+SCkggy72r4edvKCvuDE1XL/LN7UIRo2D5lnILuiL
         pmEQ==
X-Gm-Message-State: APjAAAWE4c/OTzC3zUQSOLjg1Y/hgxX7OLw5HXITl/W1j1O+fJK0hKg2
        DMSdjMNF7XwxfV8ZUqA+SEKcI6dW
X-Google-Smtp-Source: APXvYqzoOBqus6DmFQ6IvL+svzpdaKVcmXoM8e0DsqrpS9rH8/P4jG9l5WA0tFTjRZqzPIJyBZ2hfw==
X-Received: by 2002:adf:e541:: with SMTP id z1mr63654152wrm.48.1564921889413;
        Sun, 04 Aug 2019 05:31:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id r11sm126166181wre.14.2019.08.04.05.31.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Aug 2019 05:31:28 -0700 (PDT)
Subject: Re: [PATCH v7 07/20] clk: tegra: clk-periph: Add save and restore
 support
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <a81b85a2-5634-cfa2-77c5-94c23c4847bd@nvidia.com>
 <ef9e865f-359b-0873-a414-3d548bd4e590@gmail.com>
 <50bad1d3-df41-d1e5-a7c7-4be9c661ed14@nvidia.com>
 <62a5c6ed-21b1-8403-6fac-9c5d99b5a255@gmail.com>
 <85cd5100-467e-d08e-0ae5-ae57a6de5312@nvidia.com>
 <61652889-2e77-8f1e-9ed4-b7e525a40b10@nvidia.com>
 <9f6fc791-5c76-76d5-98fb-fd8facfd75d7@nvidia.com>
 <8bca50b2-a78c-c6b1-6547-4cec98a3e9cb@gmail.com>
 <314b5572-4113-d5c5-5956-1a55555a573c@nvidia.com>
 <a64472fd-46b7-5ff9-3140-11f71d5f88ff@gmail.com>
 <90268663-e5a7-4715-bd1a-31644c2fe9ab@gmail.com>
 <c6e1d744-3a7a-fe1b-2c86-a3d49f022232@nvidia.com>
 <73cd521b-782c-7fb2-d904-ae8b07927d47@gmail.com>
 <d82de63a-02a3-8fb0-57e7-7fe00d6b86ab@nvidia.com>
 <8d30f325-1c63-3802-7c21-f313115f8e55@gmail.com>
 <274e67b1-16b8-2475-d026-68bd89b090ec@nvidia.com>
 <4dec8efb-bc3b-0275-8dea-7600a8f9e478@nvidia.com>
 <2eab4f34-34be-e317-05bb-37749f2ef792@gmail.com>
Message-ID: <ac60dba2-a150-3ee5-fd09-48fc888feae5@gmail.com>
Date:   Sun, 4 Aug 2019 15:31:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2eab4f34-34be-e317-05bb-37749f2ef792@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

04.08.2019 15:24, Dmitry Osipenko пишет:
> 04.08.2019 2:44, Sowjanya Komatineni пишет:
>>
>> On 8/3/19 10:01 AM, Sowjanya Komatineni wrote:
>>>
>>> On 8/3/19 3:33 AM, Dmitry Osipenko wrote:
>>>> 03.08.2019 2:51, Sowjanya Komatineni пишет:
>>>>> On 8/2/19 2:15 PM, Dmitry Osipenko wrote:
>>>>>> 02.08.2019 23:32, Sowjanya Komatineni пишет:
>>>>>>> On 8/2/19 1:17 PM, Dmitry Osipenko wrote:
>>>>>>>> 02.08.2019 23:13, Dmitry Osipenko пишет:
>>>>>>>>> 02.08.2019 21:33, Sowjanya Komatineni пишет:
>>>>>>>>>> On 8/2/19 5:38 AM, Dmitry Osipenko wrote:
>>>>>>>>>>> 02.08.2019 2:49, Sowjanya Komatineni пишет:
>>>>>>>>>>>> On 8/1/19 4:19 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>> On 8/1/19 2:30 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>> On 8/1/19 1:54 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>> 01.08.2019 23:31, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>>>> On 8/1/19 1:17 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>> 01.08.2019 22:42, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>>>>>> On 8/1/19 12:00 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>> 01.08.2019 20:58, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>>>>>>>> On 7/31/19 4:09 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>>>>>>> On 7/31/19 3:44 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>> 31.07.2019 12:50, Dmitry Osipenko пишет:
>>>>>>>>>>>>>>>>>>>>>>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>>>>>>>>>>>>>>>>>>>>>>> This patch implements save and restore context for
>>>>>>>>>>>>>>>>>>>>>>>> peripheral
>>>>>>>>>>>>>>>>>>>>>>>> fixed
>>>>>>>>>>>>>>>>>>>>>>>> clock ops, peripheral gate clock ops, sdmmc mux clock
>>>>>>>>>>>>>>>>>>>>>>>> ops, and
>>>>>>>>>>>>>>>>>>>>>>>> peripheral clock ops.
>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>> During system suspend, core power goes off and
>>>>>>>>>>>>>>>>>>>>>>>> looses the
>>>>>>>>>>>>>>>>>>>>>>>> settings
>>>>>>>>>>>>>>>>>>>>>>>> of the Tegra CAR controller registers.
>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>> So during suspend entry clock and reset state of
>>>>>>>>>>>>>>>>>>>>>>>> peripherals is
>>>>>>>>>>>>>>>>>>>>>>>> saved
>>>>>>>>>>>>>>>>>>>>>>>> and on resume they are restored to have clocks back to
>>>>>>>>>>>>>>>>>>>>>>>> same
>>>>>>>>>>>>>>>>>>>>>>>> rate and
>>>>>>>>>>>>>>>>>>>>>>>> state as before suspend.
>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>>>>>>>>>>>>>>>>>>>> Signed-off-by: Sowjanya Komatineni
>>>>>>>>>>>>>>>>>>>>>>>> <skomatineni@nvidia.com>
>>>>>>>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>>>>>>> drivers/clk/tegra/clk-periph-fixed.c | 33
>>>>>>>>>>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>>>>> drivers/clk/tegra/clk-periph-gate.c | 34
>>>>>>>>>>>>>>>>>>>>>>>> +++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>>>>> drivers/clk/tegra/clk-periph.c | 37
>>>>>>>>>>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>>>>> drivers/clk/tegra/clk-sdmmc-mux.c | 28
>>>>>>>>>>>>>>>>>>>>>>>> +++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>>>>> drivers/clk/tegra/clk.h | 6 ++++++
>>>>>>>>>>>>>>>>>>>>>>>>          5 files changed, 138 insertions(+)
>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>>>>>>> index c088e7a280df..21b24530fa00 100644
>>>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>>>>>>> @@ -60,11 +60,44 @@
>>>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_recalc_rate(struct
>>>>>>>>>>>>>>>>>>>>>>>> clk_hw *hw,
>>>>>>>>>>>>>>>>>>>>>>>>              return (unsigned long)rate;
>>>>>>>>>>>>>>>>>>>>>>>>          }
>>>>>>>>>>>>>>>>>>>>>>>>          +static int
>>>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_save_context(struct
>>>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>>>> +    struct tegra_clk_periph_fixed *fixed =
>>>>>>>>>>>>>>>>>>>>>>>> to_tegra_clk_periph_fixed(hw);
>>>>>>>>>>>>>>>>>>>>>>>> +    u32 mask = 1 << (fixed->num % 32);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    fixed->enb_ctx = readl_relaxed(fixed->base +
>>>>>>>>>>>>>>>>>>>>>>>> fixed->regs->enb_reg) &
>>>>>>>>>>>>>>>>>>>>>>>> +             mask;
>>>>>>>>>>>>>>>>>>>>>>>> +    fixed->rst_ctx = readl_relaxed(fixed->base +
>>>>>>>>>>>>>>>>>>>>>>>> fixed->regs->rst_reg) &
>>>>>>>>>>>>>>>>>>>>>>>> +             mask;
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    return 0;
>>>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +static void
>>>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_restore_context(struct
>>>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>>>> +    struct tegra_clk_periph_fixed *fixed =
>>>>>>>>>>>>>>>>>>>>>>>> to_tegra_clk_periph_fixed(hw);
>>>>>>>>>>>>>>>>>>>>>>>> +    u32 mask = 1 << (fixed->num % 32);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    if (fixed->enb_ctx)
>>>>>>>>>>>>>>>>>>>>>>>> + writel_relaxed(mask, fixed->base +
>>>>>>>>>>>>>>>>>>>>>>>> fixed->regs->enb_set_reg);
>>>>>>>>>>>>>>>>>>>>>>>> +    else
>>>>>>>>>>>>>>>>>>>>>>>> + writel_relaxed(mask, fixed->base +
>>>>>>>>>>>>>>>>>>>>>>>> fixed->regs->enb_clr_reg);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    udelay(2);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    if (!fixed->rst_ctx) {
>>>>>>>>>>>>>>>>>>>>>>>> +        udelay(5); /* reset propogation delay */
>>>>>>>>>>>>>>>>>>>>>>>> + writel_relaxed(mask, fixed->base +
>>>>>>>>>>>>>>>>>>>>>>>> fixed->regs->rst_reg);
>>>>>>>>>>>>>>>>>>>>>>>> +    }
>>>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>>          static const struct clk_ops
>>>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_ops
>>>>>>>>>>>>>>>>>>>>>>>> = {
>>>>>>>>>>>>>>>>>>>>>>>>              .is_enabled =
>>>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_is_enabled,
>>>>>>>>>>>>>>>>>>>>>>>>              .enable = tegra_clk_periph_fixed_enable,
>>>>>>>>>>>>>>>>>>>>>>>>              .disable = tegra_clk_periph_fixed_disable,
>>>>>>>>>>>>>>>>>>>>>>>> .recalc_rate =
>>>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_recalc_rate,
>>>>>>>>>>>>>>>>>>>>>>>> +    .save_context =
>>>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_save_context,
>>>>>>>>>>>>>>>>>>>>>>>> +    .restore_context =
>>>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_restore_context,
>>>>>>>>>>>>>>>>>>>>>>>>          };
>>>>>>>>>>>>>>>>>>>>>>>>            struct clk
>>>>>>>>>>>>>>>>>>>>>>>> *tegra_clk_register_periph_fixed(const
>>>>>>>>>>>>>>>>>>>>>>>> char
>>>>>>>>>>>>>>>>>>>>>>>> *name,
>>>>>>>>>>>>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>>>>>>> index 4b31beefc9fc..6ba5b08e0787 100644
>>>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>>>>>>> @@ -25,6 +25,8 @@ static
>>>>>>>>>>>>>>>>>>>>>>>> DEFINE_SPINLOCK(periph_ref_lock);
>>>>>>>>>>>>>>>>>>>>>>>>            #define read_rst(gate) \
>>>>>>>>>>>>>>>>>>>>>>>> readl_relaxed(gate->clk_base +
>>>>>>>>>>>>>>>>>>>>>>>> (gate->regs->rst_reg))
>>>>>>>>>>>>>>>>>>>>>>>> +#define write_rst_set(val, gate) \
>>>>>>>>>>>>>>>>>>>>>>>> +    writel_relaxed(val, gate->clk_base +
>>>>>>>>>>>>>>>>>>>>>>>> (gate->regs->rst_set_reg))
>>>>>>>>>>>>>>>>>>>>>>>>          #define write_rst_clr(val, gate) \
>>>>>>>>>>>>>>>>>>>>>>>> writel_relaxed(val, gate->clk_base +
>>>>>>>>>>>>>>>>>>>>>>>> (gate->regs->rst_clr_reg))
>>>>>>>>>>>>>>>>>>>>>>>>          @@ -110,10 +112,42 @@ static void
>>>>>>>>>>>>>>>>>>>>>>>> clk_periph_disable(struct
>>>>>>>>>>>>>>>>>>>>>>>> clk_hw *hw)
>>>>>>>>>>>>>>>>>>>>>>>> spin_unlock_irqrestore(&periph_ref_lock, flags);
>>>>>>>>>>>>>>>>>>>>>>>>          }
>>>>>>>>>>>>>>>>>>>>>>>>          +static int clk_periph_gate_save_context(struct
>>>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>>>> +    struct tegra_clk_periph_gate *gate =
>>>>>>>>>>>>>>>>>>>>>>>> to_clk_periph_gate(hw);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> + gate->clk_state_ctx = read_enb(gate) &
>>>>>>>>>>>>>>>>>>>>>>>> periph_clk_to_bit(gate);
>>>>>>>>>>>>>>>>>>>>>>>> + gate->rst_state_ctx = read_rst(gate) &
>>>>>>>>>>>>>>>>>>>>>>>> periph_clk_to_bit(gate);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    return 0;
>>>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +static void clk_periph_gate_restore_context(struct
>>>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>>>> +    struct tegra_clk_periph_gate *gate =
>>>>>>>>>>>>>>>>>>>>>>>> to_clk_periph_gate(hw);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    if (gate->clk_state_ctx)
>>>>>>>>>>>>>>>>>>>>>>>> + write_enb_set(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>>>>>>> +    else
>>>>>>>>>>>>>>>>>>>>>>>> + write_enb_clr(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    udelay(5);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    if (!(gate->flags & TEGRA_PERIPH_NO_RESET) &&
>>>>>>>>>>>>>>>>>>>>>>>> + !(gate->flags & TEGRA_PERIPH_MANUAL_RESET)) {
>>>>>>>>>>>>>>>>>>>>>>>> +        if (gate->rst_state_ctx)
>>>>>>>>>>>>>>>>>>>>>>>> + write_rst_set(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>>>>>>> +        else
>>>>>>>>>>>>>>>>>>>>>>>> + write_rst_clr(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>>>>>>> +    }
>>>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>>          const struct clk_ops
>>>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_gate_ops = {
>>>>>>>>>>>>>>>>>>>>>>>>              .is_enabled = clk_periph_is_enabled,
>>>>>>>>>>>>>>>>>>>>>>>>              .enable = clk_periph_enable,
>>>>>>>>>>>>>>>>>>>>>>>>              .disable = clk_periph_disable,
>>>>>>>>>>>>>>>>>>>>>>>> +    .save_context = clk_periph_gate_save_context,
>>>>>>>>>>>>>>>>>>>>>>>> +    .restore_context =
>>>>>>>>>>>>>>>>>>>>>>>> clk_periph_gate_restore_context,
>>>>>>>>>>>>>>>>>>>>>>>>          };
>>>>>>>>>>>>>>>>>>>>>>>>            struct clk
>>>>>>>>>>>>>>>>>>>>>>>> *tegra_clk_register_periph_gate(const
>>>>>>>>>>>>>>>>>>>>>>>> char *name,
>>>>>>>>>>>>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>>>>>>> index 58437da25156..06fb62955768 100644
>>>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>>>>>>> @@ -99,6 +99,37 @@ static void
>>>>>>>>>>>>>>>>>>>>>>>> clk_periph_disable(struct
>>>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>>>> gate_ops->disable(gate_hw);
>>>>>>>>>>>>>>>>>>>>>>>>          }
>>>>>>>>>>>>>>>>>>>>>>>>          +static int clk_periph_save_context(struct
>>>>>>>>>>>>>>>>>>>>>>>> clk_hw *hw)
>>>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>>>> +    struct tegra_clk_periph *periph =
>>>>>>>>>>>>>>>>>>>>>>>> to_clk_periph(hw);
>>>>>>>>>>>>>>>>>>>>>>>> +    const struct clk_ops *gate_ops = periph->gate_ops;
>>>>>>>>>>>>>>>>>>>>>>>> +    struct clk_hw *gate_hw = &periph->gate.hw;
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    if (!(periph->gate.flags & TEGRA_PERIPH_NO_GATE))
>>>>>>>>>>>>>>>>>>>>>>>> + gate_ops->save_context(gate_hw);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> + periph->parent_ctx = clk_periph_get_parent(hw);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    return 0;
>>>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +static void clk_periph_restore_context(struct clk_hw
>>>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>>>> +    struct tegra_clk_periph *periph =
>>>>>>>>>>>>>>>>>>>>>>>> to_clk_periph(hw);
>>>>>>>>>>>>>>>>>>>>>>>> +    const struct clk_ops *gate_ops = periph->gate_ops;
>>>>>>>>>>>>>>>>>>>>>>>> +    struct clk_hw *gate_hw = &periph->gate.hw;
>>>>>>>>>>>>>>>>>>>>>>>> +    const struct clk_ops *div_ops = periph->div_ops;
>>>>>>>>>>>>>>>>>>>>>>>> +    struct clk_hw *div_hw = &periph->divider.hw;
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> + clk_periph_set_parent(hw, periph->parent_ctx);
>>>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>>> +    if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
>>>>>>>>>>>>>>>>>>>>>>>> + div_ops->restore_context(div_hw);
>>>>>>>>>>>>>>>>>>>>>>> Could you please point to where the divider's
>>>>>>>>>>>>>>>>>>>>>>> save_context()
>>>>>>>>>>>>>>>>>>>>>>> happens?
>>>>>>>>>>>>>>>>>>>>>>> Because I can't see it.
>>>>>>>>>>>>>>>>>>>>>> Ah, I now see that there is no need to save the dividers
>>>>>>>>>>>>>>>>>>>>>> context
>>>>>>>>>>>>>>>>>>>>>> because
>>>>>>>>>>>>>>>>>>>>>> clk itself has enough info that is needed for the
>>>>>>>>>>>>>>>>>>>>>> context's
>>>>>>>>>>>>>>>>>>>>>> restoring
>>>>>>>>>>>>>>>>>>>>>> (like I pointed in the review to v6).
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Looks like you could also implement a new
>>>>>>>>>>>>>>>>>>>>>> clk_hw_get_parent_index()
>>>>>>>>>>>>>>>>>>>>>> generic helper to get the index instead of storing it
>>>>>>>>>>>>>>>>>>>>>> manually.
>>>>>>>>>>>>>>>>>>>>> clk_periph_get_parent basically invokes existing
>>>>>>>>>>>>>>>>>>>>> clk_mux_ops
>>>>>>>>>>>>>>>>>>>>> get_parent() which is then saved in tegra_clk_periph.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> All existing drivers are using directly get_parent() from
>>>>>>>>>>>>>>>>>>>>> clk_mux
>>>>>>>>>>>>>>>>>>>>> which actually gets index from the register read.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> To have this more generic w.r.t save/restore context
>>>>>>>>>>>>>>>>>>>>> point of
>>>>>>>>>>>>>>>>>>>>> view,
>>>>>>>>>>>>>>>>>>>>> probably instead of implementing new get_parent_index
>>>>>>>>>>>>>>>>>>>>> helper,
>>>>>>>>>>>>>>>>>>>>> I think
>>>>>>>>>>>>>>>>>>>>> its better to implement save_context and
>>>>>>>>>>>>>>>>>>>>> restore_context to
>>>>>>>>>>>>>>>>>>>>> clk_mux_ops along with creating parent_index field into
>>>>>>>>>>>>>>>>>>>>> clk_mux to
>>>>>>>>>>>>>>>>>>>>> cache index during set_parent.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> So we just need to invoke mux_ops save_context and
>>>>>>>>>>>>>>>>>>>>> restore_context.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> I hope its ok to add save/restore context to clk_mux_ops
>>>>>>>>>>>>>>>>>>>> to be
>>>>>>>>>>>>>>>>>>>> more
>>>>>>>>>>>>>>>>>>>> generic w.r.t save/restore context rather than
>>>>>>>>>>>>>>>>>>>> get_parent_index
>>>>>>>>>>>>>>>>>>>> API.
>>>>>>>>>>>>>>>>>>>> Please confirm if you agree.
>>>>>>>>>>>>>>>>>>> Sounds like a good idea. I see that there is a 'restoring'
>>>>>>>>>>>>>>>>>>> helper for
>>>>>>>>>>>>>>>>>>> the generic clk_gate, seems something similar could be done
>>>>>>>>>>>>>>>>>>> for the
>>>>>>>>>>>>>>>>>>> clk_mux. And looks like anyway you'll need to associate the
>>>>>>>>>>>>>>>>>>> parent
>>>>>>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>>>>>>> with the hw index in order to restore the muxing.
>>>>>>>>>>>>>>>>>> by 'restoring' helper for generic clk_gate, are you
>>>>>>>>>>>>>>>>>> referring to
>>>>>>>>>>>>>>>>>> clk_gate_restore_context API?
>>>>>>>>>>>>>>>>> Yes.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> clk_gate_restore_context is API that's any clk drivers can
>>>>>>>>>>>>>>>>>> use for
>>>>>>>>>>>>>>>>>> clk_gate operation restore for custom gate clk_ops.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> But clk-periph is directly using generic clk_mux ops from
>>>>>>>>>>>>>>>>>> clk_mux
>>>>>>>>>>>>>>>>>> so I
>>>>>>>>>>>>>>>>>> think we should add .restore_context to clk_mux_ops and then
>>>>>>>>>>>>>>>>>> during
>>>>>>>>>>>>>>>>>> clk-periph restore need to invoke mux_ops->restore_context.
>>>>>>>>>>>>>>>>> I'm not sure whether it will be good for every driver that
>>>>>>>>>>>>>>>>> uses
>>>>>>>>>>>>>>>>> generic
>>>>>>>>>>>>>>>>> clk_mux ops. Should be more flexible to have a generic helper
>>>>>>>>>>>>>>>>> function
>>>>>>>>>>>>>>>>> that any driver could use in order to restore the clock's
>>>>>>>>>>>>>>>>> parent.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> The clk-periph restoring also includes case of combining
>>>>>>>>>>>>>>>>> divider
>>>>>>>>>>>>>>>>> and
>>>>>>>>>>>>>>>>> parent restoring, so generic helper could be useful in that
>>>>>>>>>>>>>>>>> case
>>>>>>>>>>>>>>>>> as well.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> It also looks like you could actually use the
>>>>>>>>>>>>>>>>> clk_gate_restore_context()
>>>>>>>>>>>>>>>>> instead of manually saving the clock's enable-state, couldn't
>>>>>>>>>>>>>>>>> you?
>>>>>>>>>>>>>>>> ok for clk_mux, can add generic clk_mux_restore_context API
>>>>>>>>>>>>>>>> rather
>>>>>>>>>>>>>>>> than
>>>>>>>>>>>>>>>> using restore_context in clk_ops and will invoke that during
>>>>>>>>>>>>>>>> clk_periph
>>>>>>>>>>>>>>>> restore.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>> digging thru looks like for clk_periph source restore instead of
>>>>>>>>>>>> clk_mux_restore_context, i can directly do clk_hw_get_parent and
>>>>>>>>>>>> clk_set_parent with mux_hw as they invoke mux_ops get/set parent
>>>>>>>>>>>> anyway.
>>>>>>>>>>>> Will do this for periph clk mux
>>>>> Just to be clear, clk_mux don't have cached parent. get_parent is by
>>>>> register read. So, cant directly use get_parent and then set during
>>>>> restore.
>>>>>
>>>>> So will create both clk_mux_save/restore_context in generic clk driver
>>>>> and will invoke them during tegra peripheral clock suspend/resume.
>>>> Why MUX clock doesn't have a cached parent? What MUX clock you're
>>>> talking about?
>>>>
>>>> [snip]
>>>
>>> Please ignore got it.
>>>
>>> Will send next version after giving few more days for feedback.
>>>
>> Couple of issues:
>>
>> 1.) I see clk-tegra-periph driver periph_clks init_data entries for some
>> peripherals are not correct for Tegra 114 and later chips.
>>
>> Eg I2C TEGRA_INIT_DATA_TABLE entries in clk-tegra-periph are used for all Tegra
>> chipsets currently in the driver.
>>
>> These entries are using MUX shift of 30 and MUX mask only for 2 bits which is
>> correct for T30 and prior.
>> But for later Tegra chips, it should be MUX shift 29 and MASK(3).
>>
>> Also, I2C parent idx entries in mux_pllp_clkm_idx are different from Tegra114
>> onwards.
>>
>> As we are using only PLLP and CLKM sources only for I2C, their corresponding mux
>> values from register spec by using upper 2 bits for T114 onwards match actual 2
>> bits of MUX value on T30 and prior.
>>
>> Not sure if this something known pending to port actual clock MUX table changes
>> for Tegra114 onwards?
>>
>> Or
>>
>> Are we purposely using upper 2 bits only for clock source for T114 and later as
>> the upper 2 bit values of the limited clock source we are using match with
>> previous Tegra peripheral clock source mux values?
> 
> The actual hardware values are compatible on all Tegra SoCs and PLLC2 and PLLC3
> are just unused on T114+, so should be okay.
> 
>> Peter/Thierry, Can you please help comment on this?
>>
>>
>> 2.) Other issue is regarding using clk_set_parent directly during clk_peripheral
>> restore is clk_core_set_parent checks new parent with current parent and if its
>> same, it just returns as success which is good in normal operation.
>>
>> But during restore, we can't use clk_set_parent as new parent is from
>> clk_get_parent on restore and this is same as cached parent.
>>
>> So clk_set_parent returns 0 but acutal register value for clk source is different
>> as it gets reset on SC7 entry/exit and to restore need to invoke mux_ops
>> set_parent with parent_index.
>>
>> So this need parent index for cached parent and without using context variable to
>> store this, need an API like you were originally suggesting for get_parent_index
>> to get parent index for the specified parent clk_hw.
>>
>> As we decided not to use save/restore for clk_mux ops as its generic for other
>> drivers, looks like we need get_parent_index API to use for restoring peripheral
>> source and use this with clk_mux_ops set_parent.
>>
>> clk core driver already has clk_fetch_parent_index but is it OK to export this?
>>
>> Otherwise, will create separate API in clk driver which returns parent index from
>> parent clk_hw by using this existing clk_fetch_parent_index so this API can be
>> used by other drivers.

Actually, you probably meant exactly the same what I wrote below. So
yes, it should be good to extend the CCF API since likely that this case
will be useful for other drivers as well.

> The clk_fetch_parent_index can't be used directly as you can see because it uses
> clk_core which is internal to clk.c, you'll need to make a wrapper for getting the
> cached index.
> 
> Something like this:
> 
> int clk_hw_get_parent_index(struct clk_hw *hw, struct *parent_hw)
> {
> 	if (!hw || !parent_hw)
> 		return -EINVAL;
> 
> 	return clk_fetch_parent_index(hw->core, parent_hw->core);
> }
> 

