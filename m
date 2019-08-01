Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A9D7E3F7
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 22:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388986AbfHAUR3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 16:17:29 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43921 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbfHAUR2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 16:17:28 -0400
Received: by mail-lf1-f67.google.com with SMTP id c19so51220692lfm.10;
        Thu, 01 Aug 2019 13:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cK/sq4xiUHMUWT9MvoKGDEL0eyaoo/GJeoHsc7LdZXM=;
        b=vQ9Kj95VPchsXK5vqBeQ7cA3ko3DJRLuKVQsxrMn+audzO9NpJcZvSOBBF9zq54RmK
         7iAvuSsiovuONPZnvfMUa8CDpC+iQwVKoJLm9Aj51FvW7Okxskeh8l+nV2zmqAtdOOpa
         4s/s6SIjbsKXFJyai8VOYXHevykpTc2IfsmwCLyqFYdnimA47mq/2wG1lt9e2zRivick
         Ohdrcpit1rjENt3vsuIFRHp5o9FnW2sYMqEWT87BJfQ9W5IMo6lps80Qwyg8sUJAvZCJ
         E1JgtXgSbMjMR4ZN0+1dvMItFH9p3qgXul0Dd5vVQRIR3AyjpWyiVWqW2lMfD1Q4kNUY
         1dDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cK/sq4xiUHMUWT9MvoKGDEL0eyaoo/GJeoHsc7LdZXM=;
        b=VW+wirfEDAhDExVK6EBpB+J8OyWJ/OMjYtMTBx3DPLYGrpnoLVNheBKJfLU0esyYBo
         9i+yaDRW6a4OVrc922UzyuQGs3yojsbboegQJbPN+P2fZcTJed8WXWJOjsNLsBas6Rt8
         ny9tKdy8yEnX5cG81Z4rzbdSLQy9ow/Z1qUoWBkZ0xdOiA8VW86taDjaO2gS1hATsOjC
         U/u+mqdiURnxquD940HfFwaE5r5+jzIOdCG5k0O9M7IsulaQQLOwfz2VQRCSxrOYlWyx
         Ff+S7mw4MQKjjTQwzQoCN88vNL4S3GoPuJu3bYiTijnNLcGxJ8T9DywDu8Th9Z69i06y
         a5vw==
X-Gm-Message-State: APjAAAWFOFEGHkr2wi5GmOrzmAgzOxYWwaSIrMeS5dxpHRcYDCYyc9H3
        rhxy6Lfdt2Vf3QH25PNN4mFu5t7w
X-Google-Smtp-Source: APXvYqyVdUJFE5BsPoJHfZeSl1V9yCgpTcZ07ke4DVSrX72iXWjKnlSI3WmQ2PjhKVMIv8LzA0ECww==
X-Received: by 2002:ac2:5609:: with SMTP id v9mr59619763lfd.27.1564690645079;
        Thu, 01 Aug 2019 13:17:25 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id p15sm14997549lji.80.2019.08.01.13.17.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 13:17:24 -0700 (PDT)
Subject: Re: [PATCH v7 07/20] clk: tegra: clk-periph: Add save and restore
 support
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
 <1564532424-10449-8-git-send-email-skomatineni@nvidia.com>
 <f90cf34d-c294-b23d-38e3-6de9a8fca7d6@gmail.com>
 <e796e26e-830c-b1be-e368-c7ff177a61dd@gmail.com>
 <67cf6c13-688d-0305-61e2-c63c8e8b4729@nvidia.com>
 <550de191-f982-4544-6fbc-bf16dfeae2c6@nvidia.com>
 <c85ba067-af68-0b4a-d347-501ed7ed0ef9@gmail.com>
 <a81b85a2-5634-cfa2-77c5-94c23c4847bd@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ef9e865f-359b-0873-a414-3d548bd4e590@gmail.com>
Date:   Thu, 1 Aug 2019 23:17:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <a81b85a2-5634-cfa2-77c5-94c23c4847bd@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

01.08.2019 22:42, Sowjanya Komatineni пишет:
> 
> On 8/1/19 12:00 PM, Dmitry Osipenko wrote:
>> 01.08.2019 20:58, Sowjanya Komatineni пишет:
>>> On 7/31/19 4:09 PM, Sowjanya Komatineni wrote:
>>>> On 7/31/19 3:44 AM, Dmitry Osipenko wrote:
>>>>> 31.07.2019 12:50, Dmitry Osipenko пишет:
>>>>>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>>>>>> This patch implements save and restore context for peripheral fixed
>>>>>>> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
>>>>>>> peripheral clock ops.
>>>>>>>
>>>>>>> During system suspend, core power goes off and looses the settings
>>>>>>> of the Tegra CAR controller registers.
>>>>>>>
>>>>>>> So during suspend entry clock and reset state of peripherals is
>>>>>>> saved
>>>>>>> and on resume they are restored to have clocks back to same rate and
>>>>>>> state as before suspend.
>>>>>>>
>>>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>> ---
>>>>>>>    drivers/clk/tegra/clk-periph-fixed.c | 33
>>>>>>> ++++++++++++++++++++++++++++++++
>>>>>>>    drivers/clk/tegra/clk-periph-gate.c  | 34
>>>>>>> +++++++++++++++++++++++++++++++++
>>>>>>>    drivers/clk/tegra/clk-periph.c       | 37
>>>>>>> ++++++++++++++++++++++++++++++++++++
>>>>>>>    drivers/clk/tegra/clk-sdmmc-mux.c    | 28
>>>>>>> +++++++++++++++++++++++++++
>>>>>>>    drivers/clk/tegra/clk.h              |  6 ++++++
>>>>>>>    5 files changed, 138 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>> b/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>> index c088e7a280df..21b24530fa00 100644
>>>>>>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>> @@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct
>>>>>>> clk_hw *hw,
>>>>>>>        return (unsigned long)rate;
>>>>>>>    }
>>>>>>>    +static int tegra_clk_periph_fixed_save_context(struct clk_hw
>>>>>>> *hw)
>>>>>>> +{
>>>>>>> +    struct tegra_clk_periph_fixed *fixed =
>>>>>>> to_tegra_clk_periph_fixed(hw);
>>>>>>> +    u32 mask = 1 << (fixed->num % 32);
>>>>>>> +
>>>>>>> +    fixed->enb_ctx = readl_relaxed(fixed->base +
>>>>>>> fixed->regs->enb_reg) &
>>>>>>> +             mask;
>>>>>>> +    fixed->rst_ctx = readl_relaxed(fixed->base +
>>>>>>> fixed->regs->rst_reg) &
>>>>>>> +             mask;
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void tegra_clk_periph_fixed_restore_context(struct clk_hw
>>>>>>> *hw)
>>>>>>> +{
>>>>>>> +    struct tegra_clk_periph_fixed *fixed =
>>>>>>> to_tegra_clk_periph_fixed(hw);
>>>>>>> +    u32 mask = 1 << (fixed->num % 32);
>>>>>>> +
>>>>>>> +    if (fixed->enb_ctx)
>>>>>>> +        writel_relaxed(mask, fixed->base +
>>>>>>> fixed->regs->enb_set_reg);
>>>>>>> +    else
>>>>>>> +        writel_relaxed(mask, fixed->base +
>>>>>>> fixed->regs->enb_clr_reg);
>>>>>>> +
>>>>>>> +    udelay(2);
>>>>>>> +
>>>>>>> +    if (!fixed->rst_ctx) {
>>>>>>> +        udelay(5); /* reset propogation delay */
>>>>>>> +        writel_relaxed(mask, fixed->base + fixed->regs->rst_reg);
>>>>>>> +    }
>>>>>>> +}
>>>>>>> +
>>>>>>>    static const struct clk_ops tegra_clk_periph_fixed_ops = {
>>>>>>>        .is_enabled = tegra_clk_periph_fixed_is_enabled,
>>>>>>>        .enable = tegra_clk_periph_fixed_enable,
>>>>>>>        .disable = tegra_clk_periph_fixed_disable,
>>>>>>>        .recalc_rate = tegra_clk_periph_fixed_recalc_rate,
>>>>>>> +    .save_context = tegra_clk_periph_fixed_save_context,
>>>>>>> +    .restore_context = tegra_clk_periph_fixed_restore_context,
>>>>>>>    };
>>>>>>>      struct clk *tegra_clk_register_periph_fixed(const char *name,
>>>>>>> diff --git a/drivers/clk/tegra/clk-periph-gate.c
>>>>>>> b/drivers/clk/tegra/clk-periph-gate.c
>>>>>>> index 4b31beefc9fc..6ba5b08e0787 100644
>>>>>>> --- a/drivers/clk/tegra/clk-periph-gate.c
>>>>>>> +++ b/drivers/clk/tegra/clk-periph-gate.c
>>>>>>> @@ -25,6 +25,8 @@ static DEFINE_SPINLOCK(periph_ref_lock);
>>>>>>>      #define read_rst(gate) \
>>>>>>>        readl_relaxed(gate->clk_base + (gate->regs->rst_reg))
>>>>>>> +#define write_rst_set(val, gate) \
>>>>>>> +    writel_relaxed(val, gate->clk_base + (gate->regs->rst_set_reg))
>>>>>>>    #define write_rst_clr(val, gate) \
>>>>>>>        writel_relaxed(val, gate->clk_base +
>>>>>>> (gate->regs->rst_clr_reg))
>>>>>>>    @@ -110,10 +112,42 @@ static void clk_periph_disable(struct
>>>>>>> clk_hw *hw)
>>>>>>>        spin_unlock_irqrestore(&periph_ref_lock, flags);
>>>>>>>    }
>>>>>>>    +static int clk_periph_gate_save_context(struct clk_hw *hw)
>>>>>>> +{
>>>>>>> +    struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
>>>>>>> +
>>>>>>> +    gate->clk_state_ctx = read_enb(gate) & periph_clk_to_bit(gate);
>>>>>>> +    gate->rst_state_ctx = read_rst(gate) & periph_clk_to_bit(gate);
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void clk_periph_gate_restore_context(struct clk_hw *hw)
>>>>>>> +{
>>>>>>> +    struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
>>>>>>> +
>>>>>>> +    if (gate->clk_state_ctx)
>>>>>>> +        write_enb_set(periph_clk_to_bit(gate), gate);
>>>>>>> +    else
>>>>>>> +        write_enb_clr(periph_clk_to_bit(gate), gate);
>>>>>>> +
>>>>>>> +    udelay(5);
>>>>>>> +
>>>>>>> +    if (!(gate->flags & TEGRA_PERIPH_NO_RESET) &&
>>>>>>> +        !(gate->flags & TEGRA_PERIPH_MANUAL_RESET)) {
>>>>>>> +        if (gate->rst_state_ctx)
>>>>>>> +            write_rst_set(periph_clk_to_bit(gate), gate);
>>>>>>> +        else
>>>>>>> +            write_rst_clr(periph_clk_to_bit(gate), gate);
>>>>>>> +    }
>>>>>>> +}
>>>>>>> +
>>>>>>>    const struct clk_ops tegra_clk_periph_gate_ops = {
>>>>>>>        .is_enabled = clk_periph_is_enabled,
>>>>>>>        .enable = clk_periph_enable,
>>>>>>>        .disable = clk_periph_disable,
>>>>>>> +    .save_context = clk_periph_gate_save_context,
>>>>>>> +    .restore_context = clk_periph_gate_restore_context,
>>>>>>>    };
>>>>>>>      struct clk *tegra_clk_register_periph_gate(const char *name,
>>>>>>> diff --git a/drivers/clk/tegra/clk-periph.c
>>>>>>> b/drivers/clk/tegra/clk-periph.c
>>>>>>> index 58437da25156..06fb62955768 100644
>>>>>>> --- a/drivers/clk/tegra/clk-periph.c
>>>>>>> +++ b/drivers/clk/tegra/clk-periph.c
>>>>>>> @@ -99,6 +99,37 @@ static void clk_periph_disable(struct clk_hw *hw)
>>>>>>>        gate_ops->disable(gate_hw);
>>>>>>>    }
>>>>>>>    +static int clk_periph_save_context(struct clk_hw *hw)
>>>>>>> +{
>>>>>>> +    struct tegra_clk_periph *periph = to_clk_periph(hw);
>>>>>>> +    const struct clk_ops *gate_ops = periph->gate_ops;
>>>>>>> +    struct clk_hw *gate_hw = &periph->gate.hw;
>>>>>>> +
>>>>>>> +    if (!(periph->gate.flags & TEGRA_PERIPH_NO_GATE))
>>>>>>> +        gate_ops->save_context(gate_hw);
>>>>>>> +
>>>>>>> +    periph->parent_ctx = clk_periph_get_parent(hw);
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void clk_periph_restore_context(struct clk_hw *hw)
>>>>>>> +{
>>>>>>> +    struct tegra_clk_periph *periph = to_clk_periph(hw);
>>>>>>> +    const struct clk_ops *gate_ops = periph->gate_ops;
>>>>>>> +    struct clk_hw *gate_hw = &periph->gate.hw;
>>>>>>> +    const struct clk_ops *div_ops = periph->div_ops;
>>>>>>> +    struct clk_hw *div_hw = &periph->divider.hw;
>>>>>>> +
>>>>>>> +    clk_periph_set_parent(hw, periph->parent_ctx);
>>>>>>> +
>>>>>>> +    if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
>>>>>>> +        div_ops->restore_context(div_hw);
>>>>>> Could you please point to where the divider's save_context() happens?
>>>>>> Because I can't see it.
>>>>> Ah, I now see that there is no need to save the dividers context
>>>>> because
>>>>> clk itself has enough info that is needed for the context's restoring
>>>>> (like I pointed in the review to v6).
>>>>>
>>>>> Looks like you could also implement a new clk_hw_get_parent_index()
>>>>> generic helper to get the index instead of storing it manually.
>>>> clk_periph_get_parent basically invokes existing clk_mux_ops
>>>> get_parent() which is then saved in tegra_clk_periph.
>>>>
>>>> All existing drivers are using directly get_parent() from clk_mux
>>>> which actually gets index from the register read.
>>>>
>>>> To have this more generic w.r.t save/restore context point of view,
>>>> probably instead of implementing new get_parent_index helper, I think
>>>> its better to implement save_context and restore_context to
>>>> clk_mux_ops along with creating parent_index field into clk_mux to
>>>> cache index during set_parent.
>>>>
>>>> So we just need to invoke mux_ops save_context and restore_context.
>>>>
>>> I hope its ok to add save/restore context to clk_mux_ops to be more
>>> generic w.r.t save/restore context rather than get_parent_index API.
>>> Please confirm if you agree.
>> Sounds like a good idea. I see that there is a 'restoring' helper for
>> the generic clk_gate, seems something similar could be done for the
>> clk_mux. And looks like anyway you'll need to associate the parent clock
>> with the hw index in order to restore the muxing.
> 
> by 'restoring' helper for generic clk_gate, are you referring to
> clk_gate_restore_context API?

Yes.

> clk_gate_restore_context is API that's any clk drivers can use for
> clk_gate operation restore for custom gate clk_ops.
> 
> But clk-periph is directly using generic clk_mux ops from clk_mux so I
> think we should add .restore_context to clk_mux_ops and then during
> clk-periph restore need to invoke mux_ops->restore_context.

I'm not sure whether it will be good for every driver that uses generic
clk_mux ops. Should be more flexible to have a generic helper function
that any driver could use in order to restore the clock's parent.

The clk-periph restoring also includes case of combining divider and
parent restoring, so generic helper could be useful in that case as well.

It also looks like you could actually use the clk_gate_restore_context()
instead of manually saving the clock's enable-state, couldn't you?
