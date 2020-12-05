Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA412CFC19
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 17:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgLEPft (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 10:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgLEPZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 10:25:59 -0500
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8C1C02B8E4;
        Sat,  5 Dec 2020 05:43:39 -0800 (PST)
Received: by mail-qv1-xf42.google.com with SMTP id ec16so4260719qvb.0;
        Sat, 05 Dec 2020 05:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=7V54Z/5Mr/xxZxoJa6ftBYvRndPF7BKH8GwvUe0W1jo=;
        b=nNe87USGiI5TXREYkoGvoEOqxnFeogR6rh+mcbxhir4ObpT9e7AokThh+c+w3ffXD6
         M49MBBrH2tTaQ2B/XzKpMt9KTTSaWxmb5ZGL5W4WSayvK8E92czfLckqGCPG81DwNuBV
         vlpGa6vdxIN7dknt76sod5Nri8oNnv8shGqoJgWBDwH1SsceR6gQtGELM3riabxWfkDX
         vvyMrOODthd0vjj0WUbvvD88Kqy2NFYFklWJiKzblUosrHQooLXmPnsbMrbCkulvxHu/
         PzM7Hx3ApImG7JG2GmPH65JrpMVzw0IpNiE3pL10QOZ30z2B38+92ZOSNGxjslJFE/cH
         /Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7V54Z/5Mr/xxZxoJa6ftBYvRndPF7BKH8GwvUe0W1jo=;
        b=nyJctCFI9pAYc8IU9scnLGzrkcfsNydrkivdQXt3t47AbdnOun0czlJLrAyPczDl21
         W8pF7CXEliv8L5Q/UnCl5EVcL4fIwZSslRaSp0S+fLqnuJTYK2tXn+/rBb/2P3B0kz/4
         O7uRFcL50QQnbiD2lB+eO3pFea2h9dmq18xjLoGIaTs+yH+a9Wgl2WNrHr/Kh9i9Imsr
         eE6DRyvcJ0lUAbbgYl70fyElSQ+80W7We0sXK2E/CQXBQyGVAOUk4JXLnqF2cJ9ohXHx
         SqZsQ32/GmpXDVuVLfgZvQB+A2X21dFyYlb6H+dLETI8sw8LQwW/0/KKGd4yJJ3EJc9s
         0zeg==
X-Gm-Message-State: AOAM530MNNs1YrSyYGDesg623TKoy5YGw8nGpjuPdoBNPfA/Gk+bruTX
        YlbEz8zOQn3v2lHjD6uJa4cTIQejJG5gsA==
X-Google-Smtp-Source: ABdhPJwyIeonJaI/FDnQ3n3MDma2rUmE/Kfsw0jOlKbN/08tEtNoFDPIVd613z6xf+DOoONjAZjHvA==
X-Received: by 2002:a0c:fa4f:: with SMTP id k15mr11346192qvo.62.1607175818286;
        Sat, 05 Dec 2020 05:43:38 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net. [108.51.35.162])
        by smtp.googlemail.com with ESMTPSA id r14sm8098427qtu.25.2020.12.05.05.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Dec 2020 05:43:37 -0800 (PST)
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
To:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com>
 <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <d9aec92299e5f427aaf5c5e892194e27006f8bbc.camel@wdc.com>
From:   Sean Anderson <seanga2@gmail.com>
Message-ID: <3ef543a8-5709-d653-e347-78faa08f81d2@gmail.com>
Date:   Sat, 5 Dec 2020 08:43:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d9aec92299e5f427aaf5c5e892194e27006f8bbc.camel@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/5/20 2:43 AM, Damien Le Moal wrote:
> Hi Stephen,
> 
> Thank you for the review. I will address all your comments.
> I just have a few questions below.
> 
> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:
>> Quoting Damien Le Moal (2020-12-01 19:24:50)
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 2daa6ee673f7..3da9a7a02f61 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3822,6 +3822,22 @@ W:       https://github.com/Cascoda/ca8210-linux.git
>>>   F:     Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
>>>   F:     drivers/net/ieee802154/ca8210.c
>>>   
>>>
>>>
>>>
>>> +CANAAN/KENDRYTE K210 SOC CLOCK DRIVER
>>> +M:     Damien Le Moal <damien.lemoal@wdc.com>
>>> +L:     linux-riscv@lists.infradead.org
>>> +L:     linux-clk@vger.kernel.org (clock driver)
>>
>> Is this needed? I think we cover all of drivers/clk/ and bindings/clock
>> already.
> 
> I was not sure about that so I added the entry. Will remove it.
> 
>>
>>> +S:     Maintained
>>> +F:     Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
>>> +F:     drivers/clk/clk-k210.c
>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>> index 88ac0d1a5da4..f2f9633087d1 100644
>>> --- a/arch/riscv/Kconfig.socs
>>> +++ b/arch/riscv/Kconfig.socs
>>> @@ -29,6 +29,8 @@ config SOC_CANAAN
>>>          select SERIAL_SIFIVE if TTY
>>>          select SERIAL_SIFIVE_CONSOLE if TTY
>>>          select SIFIVE_PLIC
>>> +       select SOC_K210_SYSCTL
>>> +       select CLK_K210
>>
>> Any reason to do this vs. just make it the default?
> 
> I do not understand here... Just selecting the drivers needed for the SoC here.
> Is there any other way of doing this ?
> 
> [...]
>>> +
>>> +       while (true) {
>>> +               reg = readl(pll->lock);
>>> +               if ((reg & mask) == mask)
>>> +                       break;
>>> +
>>> +               reg |= BIT(pll->lock_shift + K210_PLL_CLEAR_SLIP);
>>> +               writel(reg, pll->lock);
>>
>> Is this readl_poll_timeout?
> 
> Oh. Yes, it is. I did not know about this function. Will change the code to use
> it.

FWIW the timeout could be incorrect since we might be configuring a
parent of ACLK. And realistically the only way this fails is if a user
has edited this file and put in invalid PLL parameters. I don't think
you gain much by adding a timeout.

>>
>>> +       }
>>> +}
>>> +
>>> +static bool k210_pll_hw_is_enabled(struct k210_pll *pll)
>>> +{
>>> +       u32 reg = readl(pll->reg);
>>> +       u32 mask = K210_PLL_PWRD | K210_PLL_EN;
>>> +
>>> +       if (reg & K210_PLL_RESET)
>>> +               return false;
>>> +
>>> +       return (reg & mask) == mask;
>>> +}
>>> +
>>> +static void k210_pll_enable_hw(struct k210_pll *pll)
>>> +{
>>> +       struct k210_pll_cfg *pll_cfg = &k210_plls_cfg[pll->id];
>>> +       unsigned long flags;
>>> +       u32 reg;
>>> +
>>> +       spin_lock_irqsave(&kcl->clk_lock, flags);
>>> +
>>> +       if (k210_pll_hw_is_enabled(pll))
>>> +               goto unlock;
>>> +
>>> +       if (pll->id == K210_PLL0) {
>>> +               /* Re-parent aclk to IN0 to keep the CPUs running */
>>> +               k210_aclk_set_selector(0);
>>> +       }
>>> +
>>> +       /* Set factors */
>>> +       reg = readl(pll->reg);
>>> +       reg &= ~GENMASK(19, 0);
>>> +       reg |= FIELD_PREP(K210_PLL_CLKR, pll_cfg->r);
>>> +       reg |= FIELD_PREP(K210_PLL_CLKF, pll_cfg->f);
>>> +       reg |= FIELD_PREP(K210_PLL_CLKOD, pll_cfg->od);
>>> +       reg |= FIELD_PREP(K210_PLL_BWADJ, pll_cfg->bwadj);
>>> +       reg |= K210_PLL_PWRD;
>>> +       writel(reg, pll->reg);
>>> +
>>> +       /* Ensure reset is low before asserting it */
>>> +       reg &= ~K210_PLL_RESET;
>>> +       writel(reg, pll->reg);
>>> +       reg |= K210_PLL_RESET;
>>> +       writel(reg, pll->reg);
>>> +       nop();
>>> +       nop();
>>
>> Are these nops needed for some reason? Any comment to add here? It's
>> basically non-portable code and hopefully nothing is inserted into that
>> writel function that shouldn't be there.
> 
> No clue... They are "magic" nops that are present in the K210 SDK from
> Kendryte. I copied that, but do not actually know if they are really needed. I
> am working without any specs for the hardware: the Kendryte SDK is my main
> source of information here. I will try to remove them or just replace this with
> a delay() call a nd see what happens.

Basically any delay should work as long as it takes more than 2
instructions ;) Of course, anything longer than that just delays startup
for no reason.

--Sean

> 
> [...]
>>> +static int k210_aclk_set_parent(struct clk_hw *hw, u8 index)
>>> +{
>>> +       if (WARN_ON(index > 1))
>>
>> Is this possible? What am I going to do as a user if this happens?
> 
> No, it is not possible. Will remove this. I could put a BUG_ON(), but I am not
> a fan this extreme.
> 
> [...]
>>> +       /*
>>> +        * in0 is the system base fixed-rate 26MHz oscillator which
>>> +        * should already be defined by the device tree. If it is not,
>>> +        * create it here.
>>
>> Are there old DTBs that don't have this? Sadface.
> 
> No, not any old DTB. Will remove that.
> 
>>
>>> +        */
>>> +       in0_clk = of_clk_get(np, 0);
>>> +       if (IS_ERR(in0_clk)) {
>>> +               pr_warn("%pOFP: in0 oscillator not found\n", np);
>>> +               hws[K210_CLK_IN0] =
>>> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
>>> +                                                  0, K210_IN0_RATE);
>>> +       } else {
>>> +               hws[K210_CLK_IN0] = __clk_get_hw(in0_clk);
>>> +       }
>>> +       if (IS_ERR(hws[K210_CLK_IN0])) {
>>> +               pr_err("%pOFP: failed to get base oscillator\n", np);
>>> +               goto err;
>>> +       }
>>> +
>>> +       in0 = clk_hw_get_name(hws[K210_CLK_IN0]);
>>> +       aclk_parents[0] = in0;
>>> +       pll_parents[0] = in0;
>>> +       mux_parents[0] = in0;
>>
>> Can we use the new way of specifying clk parents so that we don't have
>> to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
>> the core can handl that all instead of this driver.
> 
> Not sure what new way of specifying the parent you are referring to here.
> clk_hw_set_parent() ?
> 
>>
>>> +
>>> +       /* PLLs */
>>> +       hws[K210_CLK_PLL0] =
>>> +               k210_register_pll(K210_PLL0, "pll0", pll_parents, 1, 0);
>>> +       hws[K210_CLK_PLL1] =
>>> +               k210_register_pll(K210_PLL1, "pll1", pll_parents, 1, 0);
>>> +       hws[K210_CLK_PLL2] =
>>> +               k210_register_pll(K210_PLL2, "pll2", pll_parents, 3, 0);
>>> +
>>> +       /* aclk: muxed of in0 and pll0_d, no gate */
>>> +       hws[K210_CLK_ACLK] = k210_register_aclk();
>>> +
>>> +       /*
>>> +        * Clocks with aclk as source: the CPU clock is obviously critical.
>>> +        * So is the CLINT clock as the scheduler clocksource.
>>> +        */
>>> +       hws[K210_CLK_CPU] =
>>> +               k210_register_clk(K210_CLK_CPU, "cpu", "aclk", CLK_IS_CRITICAL);
>>> +       hws[K210_CLK_CLINT] =
>>> +               clk_hw_register_fixed_factor(NULL, "clint", "aclk",
>>> +                                            CLK_IS_CRITICAL, 1, 50);
>>
>> Is anyone getting these clks? It's nice and all to model things in the
>> clk framework but if they never have a consumer then it is sort of
>> useless and just wastes memory and causes more overhead.
> 
> The CPU and SRAM clocks do not have any consumer, so I could remove them (just
> enable the HW but not represent them as clocks in the driver). There is no
> direct consumer of ACLK but it is the parent of multiple clocks, including the
> SRAM clocks. So it needs to be represented as a clock and kept alive even if
> all the peripheral drivers needing it are disabled. Otherwise, the system just
> stops (SRAM accesses hang).
> 
> [...]
>>> +       ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, kcl->clk_data);
>>> +       if (ret)
>>> +               pr_err("%pOFP: add clock provider failed %d\n", np, ret);
>>> +       else
>>> +               pr_info("%pOFP: CPU running at %lu MHz\n",
>>
>> Is this important? Is there a CPUfreq driver that runs and tells us the
>> boot CPU frequency instead? Doesn't feel like we care in the clk driver
>> about this.
> 
> There is no CPU freq driver that gives this frequency that I know of. That is
> why I added the message since the driver basically just comes up using the
> default HW settings for the SoC. CPU freq speed can be changed though by
> increasing the PLL freq. Just not supporting this for now as it is tricky to
> do: the SRAM clocks depend on aclk and PLL1 and if these are not the same
> value, the system hangs (most likely because we end up with the sram banks
> running at different speeds, which the SoC cache does not like).
> 
> [...]
>>> +CLK_OF_DECLARE_DRIVER(k210_clk, "canaan,k210-clk", k210_clk_init);
>>
>> Is this needed or can this just be a plain platform driver? If something
>> is needed early for a clocksource or clockevent then the driver can be
>> split to register those few clks early from this hook and then register
>> the rest later when the platform device probes. That's what
>> CLK_OF_DECLARE_DRIVER is for. A DECLARE_DRIVER without a platform driver
>> is incorrect.
> 
> I think I can clean this up: aclk and clint clocks are needed early but others
> can likely be deferred. Will fix this up.
> 
> Thanks !
> 

