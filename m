Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 699227F6FC
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 14:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbfHBMjC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 08:39:02 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38188 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbfHBMjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 08:39:01 -0400
Received: by mail-wr1-f66.google.com with SMTP id g17so77016322wrr.5;
        Fri, 02 Aug 2019 05:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EJRLx45Y6dU7aXALtTfTwDg5OsF+OpOejZZhXXUOU1E=;
        b=QUU+caLEXFege8P5oZ8qTdLrM0+t2WXHemGra4o3cTDBrgiuS7qAEoKCART+GRpSSv
         ro/vnD69YnHBVpN/jP/DdkR5gc8Qex2vAWF/3sfE34PAFUW2A7hj3rm0szhegdT/nZXn
         yuoBxbJ+0lXs+V9SKPxsrJJVaPXinzQDFGBeGQM2c3qg4zWEKBkkFJFoaYHLsBfeDOGk
         OVYAVGE8kilHbFApIWujzpw8gwpUkG8scHYKPbHTiqONx+Qr5DMiZqldkzCPGej6sotX
         89e1aj+ZrcEyyX7Ded8vfNSPw8qvO/7b+IQrt7du3EnoD/4kJyJZ435gC8UK1NJ9xSSx
         nX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EJRLx45Y6dU7aXALtTfTwDg5OsF+OpOejZZhXXUOU1E=;
        b=a7pWoRiyFdnyGgLIhplIuWp7FGgA8HiMJDIH8R6HFQiAeq4Qm35cTVD/+9kIvrX+zH
         rV3O2Nclk/IO1e41daEVAJJ2kLEauQWy0p1n+NenWNwo81rnzi8HXROjrq3KgwXnzofi
         1J9C7wpztRAtv3RwCkFRfiHYQ0qeC6+dnMFtWWBSblEoAbggVU8zie9wt6NkPGRHyZTL
         cbqd7b+XFH5+Epnyeulnuboa6yUz7dFLxq1vMPjYLO8x3n77zeEUbmgrljoZiKGWmEHJ
         psrTuYXgoSKJk9hR26qfN5u/0Y9z80ZZAdpDK/kH42eRzyD9iiASYJ3DCievvhkQeOZu
         K0wA==
X-Gm-Message-State: APjAAAXVx8I4/laP1bYpK2ejYymGwQLrR8e7PVGi3n1iolUvWky+xvDW
        s3GRcxxFhkLxYOnRS49kTj/GaL/r
X-Google-Smtp-Source: APXvYqzEe1S2fclgnVCa2BRIuzCpsXi6QXdNs+XQkJ11eeGoA+WmX+wWjC9BDjoWlp8jJc/GCDHMUw==
X-Received: by 2002:a05:6000:187:: with SMTP id p7mr22611556wrx.189.1564749536539;
        Fri, 02 Aug 2019 05:38:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id t15sm67292047wrx.84.2019.08.02.05.38.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:38:55 -0700 (PDT)
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
 <ef9e865f-359b-0873-a414-3d548bd4e590@gmail.com>
 <50bad1d3-df41-d1e5-a7c7-4be9c661ed14@nvidia.com>
 <62a5c6ed-21b1-8403-6fac-9c5d99b5a255@gmail.com>
 <85cd5100-467e-d08e-0ae5-ae57a6de5312@nvidia.com>
 <61652889-2e77-8f1e-9ed4-b7e525a40b10@nvidia.com>
 <9f6fc791-5c76-76d5-98fb-fd8facfd75d7@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8bca50b2-a78c-c6b1-6547-4cec98a3e9cb@gmail.com>
Date:   Fri, 2 Aug 2019 15:38:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9f6fc791-5c76-76d5-98fb-fd8facfd75d7@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

02.08.2019 2:49, Sowjanya Komatineni пишет:
> 
> On 8/1/19 4:19 PM, Sowjanya Komatineni wrote:
>>
>> On 8/1/19 2:30 PM, Sowjanya Komatineni wrote:
>>>
>>> On 8/1/19 1:54 PM, Dmitry Osipenko wrote:
>>>> 01.08.2019 23:31, Sowjanya Komatineni пишет:
>>>>> On 8/1/19 1:17 PM, Dmitry Osipenko wrote:
>>>>>> 01.08.2019 22:42, Sowjanya Komatineni пишет:
>>>>>>> On 8/1/19 12:00 PM, Dmitry Osipenko wrote:
>>>>>>>> 01.08.2019 20:58, Sowjanya Komatineni пишет:
>>>>>>>>> On 7/31/19 4:09 PM, Sowjanya Komatineni wrote:
>>>>>>>>>> On 7/31/19 3:44 AM, Dmitry Osipenko wrote:
>>>>>>>>>>> 31.07.2019 12:50, Dmitry Osipenko пишет:
>>>>>>>>>>>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>>>>>>>>>>>> This patch implements save and restore context for peripheral
>>>>>>>>>>>>> fixed
>>>>>>>>>>>>> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
>>>>>>>>>>>>> peripheral clock ops.
>>>>>>>>>>>>>
>>>>>>>>>>>>> During system suspend, core power goes off and looses the
>>>>>>>>>>>>> settings
>>>>>>>>>>>>> of the Tegra CAR controller registers.
>>>>>>>>>>>>>
>>>>>>>>>>>>> So during suspend entry clock and reset state of
>>>>>>>>>>>>> peripherals is
>>>>>>>>>>>>> saved
>>>>>>>>>>>>> and on resume they are restored to have clocks back to same
>>>>>>>>>>>>> rate and
>>>>>>>>>>>>> state as before suspend.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>      drivers/clk/tegra/clk-periph-fixed.c | 33
>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>      drivers/clk/tegra/clk-periph-gate.c  | 34
>>>>>>>>>>>>> +++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>      drivers/clk/tegra/clk-periph.c       | 37
>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>      drivers/clk/tegra/clk-sdmmc-mux.c    | 28
>>>>>>>>>>>>> +++++++++++++++++++++++++++
>>>>>>>>>>>>>      drivers/clk/tegra/clk.h              | 6 ++++++
>>>>>>>>>>>>>      5 files changed, 138 insertions(+)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>> index c088e7a280df..21b24530fa00 100644
>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>> @@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct
>>>>>>>>>>>>> clk_hw *hw,
>>>>>>>>>>>>>          return (unsigned long)rate;
>>>>>>>>>>>>>      }
>>>>>>>>>>>>>      +static int tegra_clk_periph_fixed_save_context(struct
>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct tegra_clk_periph_fixed *fixed =
>>>>>>>>>>>>> to_tegra_clk_periph_fixed(hw);
>>>>>>>>>>>>> +    u32 mask = 1 << (fixed->num % 32);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    fixed->enb_ctx = readl_relaxed(fixed->base +
>>>>>>>>>>>>> fixed->regs->enb_reg) &
>>>>>>>>>>>>> +             mask;
>>>>>>>>>>>>> +    fixed->rst_ctx = readl_relaxed(fixed->base +
>>>>>>>>>>>>> fixed->regs->rst_reg) &
>>>>>>>>>>>>> +             mask;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    return 0;
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +static void tegra_clk_periph_fixed_restore_context(struct
>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct tegra_clk_periph_fixed *fixed =
>>>>>>>>>>>>> to_tegra_clk_periph_fixed(hw);
>>>>>>>>>>>>> +    u32 mask = 1 << (fixed->num % 32);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    if (fixed->enb_ctx)
>>>>>>>>>>>>> +        writel_relaxed(mask, fixed->base +
>>>>>>>>>>>>> fixed->regs->enb_set_reg);
>>>>>>>>>>>>> +    else
>>>>>>>>>>>>> +        writel_relaxed(mask, fixed->base +
>>>>>>>>>>>>> fixed->regs->enb_clr_reg);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    udelay(2);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    if (!fixed->rst_ctx) {
>>>>>>>>>>>>> +        udelay(5); /* reset propogation delay */
>>>>>>>>>>>>> +        writel_relaxed(mask, fixed->base +
>>>>>>>>>>>>> fixed->regs->rst_reg);
>>>>>>>>>>>>> +    }
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +
>>>>>>>>>>>>>      static const struct clk_ops tegra_clk_periph_fixed_ops
>>>>>>>>>>>>> = {
>>>>>>>>>>>>>          .is_enabled = tegra_clk_periph_fixed_is_enabled,
>>>>>>>>>>>>>          .enable = tegra_clk_periph_fixed_enable,
>>>>>>>>>>>>>          .disable = tegra_clk_periph_fixed_disable,
>>>>>>>>>>>>>          .recalc_rate = tegra_clk_periph_fixed_recalc_rate,
>>>>>>>>>>>>> +    .save_context = tegra_clk_periph_fixed_save_context,
>>>>>>>>>>>>> +    .restore_context =
>>>>>>>>>>>>> tegra_clk_periph_fixed_restore_context,
>>>>>>>>>>>>>      };
>>>>>>>>>>>>>        struct clk *tegra_clk_register_periph_fixed(const char
>>>>>>>>>>>>> *name,
>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>> index 4b31beefc9fc..6ba5b08e0787 100644
>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>> @@ -25,6 +25,8 @@ static DEFINE_SPINLOCK(periph_ref_lock);
>>>>>>>>>>>>>        #define read_rst(gate) \
>>>>>>>>>>>>>          readl_relaxed(gate->clk_base + (gate->regs->rst_reg))
>>>>>>>>>>>>> +#define write_rst_set(val, gate) \
>>>>>>>>>>>>> +    writel_relaxed(val, gate->clk_base +
>>>>>>>>>>>>> (gate->regs->rst_set_reg))
>>>>>>>>>>>>>      #define write_rst_clr(val, gate) \
>>>>>>>>>>>>>          writel_relaxed(val, gate->clk_base +
>>>>>>>>>>>>> (gate->regs->rst_clr_reg))
>>>>>>>>>>>>>      @@ -110,10 +112,42 @@ static void
>>>>>>>>>>>>> clk_periph_disable(struct
>>>>>>>>>>>>> clk_hw *hw)
>>>>>>>>>>>>> spin_unlock_irqrestore(&periph_ref_lock, flags);
>>>>>>>>>>>>>      }
>>>>>>>>>>>>>      +static int clk_periph_gate_save_context(struct clk_hw
>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct tegra_clk_periph_gate *gate =
>>>>>>>>>>>>> to_clk_periph_gate(hw);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    gate->clk_state_ctx = read_enb(gate) &
>>>>>>>>>>>>> periph_clk_to_bit(gate);
>>>>>>>>>>>>> +    gate->rst_state_ctx = read_rst(gate) &
>>>>>>>>>>>>> periph_clk_to_bit(gate);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    return 0;
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +static void clk_periph_gate_restore_context(struct clk_hw
>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct tegra_clk_periph_gate *gate =
>>>>>>>>>>>>> to_clk_periph_gate(hw);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    if (gate->clk_state_ctx)
>>>>>>>>>>>>> + write_enb_set(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>> +    else
>>>>>>>>>>>>> + write_enb_clr(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    udelay(5);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    if (!(gate->flags & TEGRA_PERIPH_NO_RESET) &&
>>>>>>>>>>>>> +        !(gate->flags & TEGRA_PERIPH_MANUAL_RESET)) {
>>>>>>>>>>>>> +        if (gate->rst_state_ctx)
>>>>>>>>>>>>> + write_rst_set(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>> +        else
>>>>>>>>>>>>> + write_rst_clr(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>> +    }
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +
>>>>>>>>>>>>>      const struct clk_ops tegra_clk_periph_gate_ops = {
>>>>>>>>>>>>>          .is_enabled = clk_periph_is_enabled,
>>>>>>>>>>>>>          .enable = clk_periph_enable,
>>>>>>>>>>>>>          .disable = clk_periph_disable,
>>>>>>>>>>>>> +    .save_context = clk_periph_gate_save_context,
>>>>>>>>>>>>> +    .restore_context = clk_periph_gate_restore_context,
>>>>>>>>>>>>>      };
>>>>>>>>>>>>>        struct clk *tegra_clk_register_periph_gate(const
>>>>>>>>>>>>> char *name,
>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>> index 58437da25156..06fb62955768 100644
>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>> @@ -99,6 +99,37 @@ static void clk_periph_disable(struct
>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>          gate_ops->disable(gate_hw);
>>>>>>>>>>>>>      }
>>>>>>>>>>>>>      +static int clk_periph_save_context(struct clk_hw *hw)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct tegra_clk_periph *periph = to_clk_periph(hw);
>>>>>>>>>>>>> +    const struct clk_ops *gate_ops = periph->gate_ops;
>>>>>>>>>>>>> +    struct clk_hw *gate_hw = &periph->gate.hw;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    if (!(periph->gate.flags & TEGRA_PERIPH_NO_GATE))
>>>>>>>>>>>>> +        gate_ops->save_context(gate_hw);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    periph->parent_ctx = clk_periph_get_parent(hw);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    return 0;
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +static void clk_periph_restore_context(struct clk_hw *hw)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct tegra_clk_periph *periph = to_clk_periph(hw);
>>>>>>>>>>>>> +    const struct clk_ops *gate_ops = periph->gate_ops;
>>>>>>>>>>>>> +    struct clk_hw *gate_hw = &periph->gate.hw;
>>>>>>>>>>>>> +    const struct clk_ops *div_ops = periph->div_ops;
>>>>>>>>>>>>> +    struct clk_hw *div_hw = &periph->divider.hw;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    clk_periph_set_parent(hw, periph->parent_ctx);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
>>>>>>>>>>>>> + div_ops->restore_context(div_hw);
>>>>>>>>>>>> Could you please point to where the divider's save_context()
>>>>>>>>>>>> happens?
>>>>>>>>>>>> Because I can't see it.
>>>>>>>>>>> Ah, I now see that there is no need to save the dividers context
>>>>>>>>>>> because
>>>>>>>>>>> clk itself has enough info that is needed for the context's
>>>>>>>>>>> restoring
>>>>>>>>>>> (like I pointed in the review to v6).
>>>>>>>>>>>
>>>>>>>>>>> Looks like you could also implement a new
>>>>>>>>>>> clk_hw_get_parent_index()
>>>>>>>>>>> generic helper to get the index instead of storing it manually.
>>>>>>>>>> clk_periph_get_parent basically invokes existing clk_mux_ops
>>>>>>>>>> get_parent() which is then saved in tegra_clk_periph.
>>>>>>>>>>
>>>>>>>>>> All existing drivers are using directly get_parent() from clk_mux
>>>>>>>>>> which actually gets index from the register read.
>>>>>>>>>>
>>>>>>>>>> To have this more generic w.r.t save/restore context point of
>>>>>>>>>> view,
>>>>>>>>>> probably instead of implementing new get_parent_index helper,
>>>>>>>>>> I think
>>>>>>>>>> its better to implement save_context and restore_context to
>>>>>>>>>> clk_mux_ops along with creating parent_index field into
>>>>>>>>>> clk_mux to
>>>>>>>>>> cache index during set_parent.
>>>>>>>>>>
>>>>>>>>>> So we just need to invoke mux_ops save_context and
>>>>>>>>>> restore_context.
>>>>>>>>>>
>>>>>>>>> I hope its ok to add save/restore context to clk_mux_ops to be
>>>>>>>>> more
>>>>>>>>> generic w.r.t save/restore context rather than get_parent_index
>>>>>>>>> API.
>>>>>>>>> Please confirm if you agree.
>>>>>>>> Sounds like a good idea. I see that there is a 'restoring'
>>>>>>>> helper for
>>>>>>>> the generic clk_gate, seems something similar could be done for the
>>>>>>>> clk_mux. And looks like anyway you'll need to associate the parent
>>>>>>>> clock
>>>>>>>> with the hw index in order to restore the muxing.
>>>>>>> by 'restoring' helper for generic clk_gate, are you referring to
>>>>>>> clk_gate_restore_context API?
>>>>>> Yes.
>>>>>>
>>>>>>> clk_gate_restore_context is API that's any clk drivers can use for
>>>>>>> clk_gate operation restore for custom gate clk_ops.
>>>>>>>
>>>>>>> But clk-periph is directly using generic clk_mux ops from clk_mux
>>>>>>> so I
>>>>>>> think we should add .restore_context to clk_mux_ops and then during
>>>>>>> clk-periph restore need to invoke mux_ops->restore_context.
>>>>>> I'm not sure whether it will be good for every driver that uses
>>>>>> generic
>>>>>> clk_mux ops. Should be more flexible to have a generic helper
>>>>>> function
>>>>>> that any driver could use in order to restore the clock's parent.
>>>>>>
>>>>>> The clk-periph restoring also includes case of combining divider and
>>>>>> parent restoring, so generic helper could be useful in that case
>>>>>> as well.
>>>>>>
>>>>>> It also looks like you could actually use the
>>>>>> clk_gate_restore_context()
>>>>>> instead of manually saving the clock's enable-state, couldn't you?
>>>>> ok for clk_mux, can add generic clk_mux_restore_context API rather
>>>>> than
>>>>> using restore_context in clk_ops and will invoke that during
>>>>> clk_periph
>>>>> restore.
>>>>>
> digging thru looks like for clk_periph source restore instead of
> clk_mux_restore_context, i can directly do clk_hw_get_parent and
> clk_set_parent with mux_hw as they invoke mux_ops get/set parent anyway.
> Will do this for periph clk mux
>>>>>
>>>>> Reg clk_gate, looks like we cant use generic clk_gate_restore_context
>>>>> for clk-periph as it calls enable/disable callbacks and
>>>>> clk_periph_enable/disable in clk-periph-gate also updated refcnt and
>>>>> depending on that actual enable/disable is set.
>>>>>
>>>>> During suspend, peripherals that are already enabled have their
>>>>> refcnt >
>>>>> 1, so they dont go thru enable/disable on restore if we use same
>>>>> enable/disable callback.
>>>> Looks like you could just decrement the gate's enable_refcnt on
>>>> save_context, wouldn't that work?
>>>>
>> gate->enable_refcnt is within clk-periph-gate which gets updated when
>> enable/disable callbacks get execute thru clk_core_enable/disable.
>> But actual enable_count used in clk_gate_restore_context is the one
>> which gets updated with in the clk core enable/disable functions which
>> invokes these callbacks. Depending on this enable_count in clk core it
>> invokes enable/disable.
>>
>> So, this will cause mismatch if we handle refcnt during save/restore
>> of tegra_clk_periph_gate_ops and also enable/disable thru this
>> clk_gate_restore_context is based on enable_count from clk core.
>>
>>>>> Also to align exact reset state along with CLK (like for case where
>>>>> CLK
>>>>> is enabled but peripheral might be in reset state), implemented
>>>>> save/restore in tegra specific tegra_clk_periph_gate_ops
>>>> I'm wondering whether instead of saving/restoring reset-state of every
>>>> clock, you could simply save/restore the whole RST_DEV_x_SET register.
>>>> Couldn't you?
>>> Thats what I was doing in first version of patch. But later as we
>>> moved to use clk_save_context and clk_restore_context, peripheral
>>> clk_hw RST & CLK enables happen thru its corresponding save/restore
>>> after source restore
>>
>>
>> Also, to align both CLK & RST to the exact state of register, doing
>> save/restore in tegra_clk_periph_gate_ops and invoking this after
>> source restore for peripheral clock, seems cleaner to avoid any
>> misconfiguration b/w rst & clk settings.
>>

It looks to me that it is very wasteful to store/restore each individual
gate and reset state, also given that some of them are shared. I think
that the gates and resets should be restored separately for the
peripherals by a custom tegra_clk_save/restore_periph_gates/resets().
