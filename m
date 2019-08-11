Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD19892E7
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2019 19:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfHKRjz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Aug 2019 13:39:55 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39080 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfHKRjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Aug 2019 13:39:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id x4so4239259ljj.6;
        Sun, 11 Aug 2019 10:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eRt4wQiV64kopxfr8Sd84qDCmLRwo7EanQqCl6lGjN4=;
        b=CekxGGL8MV8rJ9T6Pt8r94tFtsG3c+VLRVxi7nasMVnuRxkhmuMsAMtDkcsTLN4A7S
         HiNyPa8BOlcDVTJqhaCKAFIgIDtyv0SNNId+aJPffH5sikXc2ZOLLV1QiUm5IsRG/Pgq
         5GUs2eEZF/n+TOyAnFNsBbwuo0+SChmus5hibfQesfxYvBJCiK65auNwsmbEAKtxD4Cz
         MGsIbBaHeyqwqG6lokx1gZdx7UfNddLOGQMWHml88mM01KZNXIWrQ5XdHwgQcmHtmrK9
         1rSKf3ZPPe2KvDmXYggmkYyTjnr19OmKX6s0fFM4FPiEe4QYAj4Xg/f2aIQ+qOf/rnQA
         dP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eRt4wQiV64kopxfr8Sd84qDCmLRwo7EanQqCl6lGjN4=;
        b=mQkW04nvnWJ1WL8/BUm7tL0Ezq0CeCJE/BuNOxxPbHSAA3hkyrytA3L3vF2rdsTdyk
         MbXMzUTmS+LlFlMULt31IcAVgrk39XTjUKoNCAE8fMjGUSppGZCaMe8f7EdXpdk97BKB
         1MVWYURizFJqT+42KCKVB1lVu6/ITMSXIMku8TEVltEHCS5YD7YQaXCeyipylDw6Ubiv
         G1SOWWwC0yRwmU58uFAve8FZ12iX/mOTizXrlxHCeVoOCQ4N2yIRlYFVObcMp/CIbatT
         6gWrJKGxk5lfRlVGGOOi0JuxMJLso2rli99WFDM1u316bEPtzeYGQ9GipSCvWN1R3wQA
         HSZg==
X-Gm-Message-State: APjAAAV6J5D4WBGBpBT77TPmlExGpPbIid3L7mbRLIUZAnw2gSY3z3MT
        t4Ovtgk48eM4V/4aOQ8qZnuFzH4M
X-Google-Smtp-Source: APXvYqwwWK+f3+AngCOxKiWJyrR4MgX+0FbfYzvsgNpclUTSAL0abEzaIaGmjAOhSoW4/CT8TVQoCQ==
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr17273613lji.64.1565545190669;
        Sun, 11 Aug 2019 10:39:50 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.218])
        by smtp.googlemail.com with ESMTPSA id o17sm20621175ljg.71.2019.08.11.10.39.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Aug 2019 10:39:50 -0700 (PDT)
Subject: Re: [PATCH v8 14/21] clk: tegra210: Add suspend and resume support
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, rjw@rjwysocki.net,
        viresh.kumar@linaro.org, linux-pm@vger.kernel.org
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-15-git-send-email-skomatineni@nvidia.com>
 <a21b7464-62c3-8461-04c2-a0e863bdde85@gmail.com>
 <7d101ec9-c559-8b40-1764-6bf67a9c7a7a@nvidia.com>
 <aa823801-00c7-df88-0f63-45338bffa854@gmail.com>
 <cbe94f84-a17b-7e1a-811d-89db571784e1@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4397de5d-772d-2b04-5f87-b2988f6c96c8@gmail.com>
Date:   Sun, 11 Aug 2019 20:39:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <cbe94f84-a17b-7e1a-811d-89db571784e1@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

09.08.2019 21:40, Sowjanya Komatineni пишет:
> 
> On 8/9/19 11:18 AM, Dmitry Osipenko wrote:
>> 09.08.2019 19:19, Sowjanya Komatineni пишет:
>>> On 8/9/19 6:56 AM, Dmitry Osipenko wrote:
>>>> 09.08.2019 2:46, Sowjanya Komatineni пишет:
>>>>> This patch adds support for clk: tegra210: suspend-resume.
>>>>>
>>>>> All the CAR controller settings are lost on suspend when core
>>>>> power goes off.
>>>>>
>>>>> This patch has implementation for saving and restoring all PLLs
>>>>> and clocks context during system suspend and resume to have the
>>>>> clocks back to same state for normal operation.
>>>>>
>>>>> Clock driver suspend and resume are registered as syscore_ops as clocks
>>>>> restore need to happen before the other drivers resume to have all their
>>>>> clocks back to the same state as before suspend.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>   drivers/clk/tegra/clk-tegra210.c | 103 +++++++++++++++++++++++++++++++++++++--
>>>>>   drivers/clk/tegra/clk.c          |  64 ++++++++++++++++++++++++
>>>>>   drivers/clk/tegra/clk.h          |   3 ++
>>>>>   3 files changed, 166 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>>>>> index 998bf60b219a..8dd6f4f4debb 100644
>>>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>>>> @@ -9,13 +9,13 @@
>>>>>   #include <linux/clkdev.h>
>>>>>   #include <linux/of.h>
>>>>>   #include <linux/of_address.h>
>>>>> +#include <linux/syscore_ops.h>
>>>>>   #include <linux/delay.h>
>>>>>   #include <linux/export.h>
>>>>>   #include <linux/mutex.h>
>>>>>   #include <linux/clk/tegra.h>
>>>>>   #include <dt-bindings/clock/tegra210-car.h>
>>>>>   #include <dt-bindings/reset/tegra210-car.h>
>>>>> -#include <linux/iopoll.h>
>>>>>   #include <linux/sizes.h>
>>>>>   #include <soc/tegra/pmc.h>
>>>>>   @@ -220,11 +220,15 @@
>>>>>   #define CLK_M_DIVISOR_SHIFT 2
>>>>>   #define CLK_M_DIVISOR_MASK 0x3
>>>>>   +#define CLK_MASK_ARM    0x44
>>>>> +#define MISC_CLK_ENB    0x48
>>>>> +
>>>>>   #define RST_DFLL_DVCO 0x2f4
>>>>>   #define DVFS_DFLL_RESET_SHIFT 0
>>>>>     #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>>>>   #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>>>>> +#define CPU_SOFTRST_CTRL 0x380
>>>>>     #define LVL2_CLK_GATE_OVRA 0xf8
>>>>>   #define LVL2_CLK_GATE_OVRC 0x3a0
>>>>> @@ -2825,6 +2829,7 @@ static int tegra210_enable_pllu(void)
>>>>>       struct tegra_clk_pll_freq_table *fentry;
>>>>>       struct tegra_clk_pll pllu;
>>>>>       u32 reg;
>>>>> +    int ret;
>>>>>         for (fentry = pll_u_freq_table; fentry->input_rate; fentry++) {
>>>>>           if (fentry->input_rate == pll_ref_freq)
>>>>> @@ -2853,9 +2858,14 @@ static int tegra210_enable_pllu(void)
>>>>>       reg |= PLL_ENABLE;
>>>>>       writel(reg, clk_base + PLLU_BASE);
>>>>>   -    readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
>>>>> -                      reg & PLL_BASE_LOCK, 2, 1000);
>>>>> -    if (!(reg & PLL_BASE_LOCK)) {
>>>>> +    /*
>>>>> +     * During clocks resume, same PLLU init and enable sequence get
>>>>> +     * executed. So, readx_poll_timeout_atomic can't be used here as it
>>>>> +     * uses ktime_get() and timekeeping resume doesn't happen by that
>>>>> +     * time. So, using tegra210_wait_for_mask for PLL LOCK.
>>>>> +     */
>>>>> +    ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
>>>>> +    if (ret) {
>>>>>           pr_err("Timed out waiting for PLL_U to lock\n");
>>>>>           return -ETIMEDOUT;
>>>>>       }
>>>>> @@ -3288,6 +3298,84 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>>>>>   }
>>>>>     #ifdef CONFIG_PM_SLEEP
>>>>> +/*
>>>>> + * This array lists mask values for each peripheral clk bank
>>>>> + * to mask out reserved bits during the clocks state restore
>>>>> + * on SC7 resume to prevent accidental writes to these reserved
>>>>> + * bits.
>>>>> + */
>>>>> +static u32 periph_clk_rsvd_mask[TEGRA210_CAR_BANK_COUNT] = {
>>>> Should be more natural to have a "valid_mask" instead of "rsvd_mask".
>>>>
>>>> What's actually wrong with touching of the reserved bits? They must be NO-OP.. or the
>>>> reserved bits are actually some kind of "secret" bits? If those bits have some use-case
>>>> outside of Silicon HW (like FPGA simulation), then this doesn't matter for upstream and you
>>>> have to keep the workaround locally in the downstream kernel or whatever.
>>> Will rename as valid_mask.
>>>
>>> some bits in these registers are undefined and is not good to write to these bits as they
>>> can cause pslverr.
>> Okay, it should be explained in the comment.
>>
>> Is it possible to disable trapping of changing the undefined bits?
> No its internal to design

Okay.

Also, what about to move the valid_mask into struct tegra_clk_periph_regs?

>>>>> +    0x23282006,
>>>>> +    0x782e0c18,
>>>>> +    0x0c012c05,
>>>>> +    0x003e7304,
>>>>> +    0x86c04800,
>>>>> +    0xc0199000,
>>>>> +    0x03e03800,
>>>>> +};
>>>>> +
>>>>> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_off) * 4))
>>>>> +#define car_writel(_val, _base, _off) \
>>>>> +        writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
>>>>> +
>>>>> +static u32 spare_reg_ctx, misc_clk_enb_ctx, clk_msk_arm_ctx;
>>>>> +static u32 cpu_softrst_ctx[3];
>>>>> +
>>>>> +static int tegra210_clk_suspend(void)
>>>>> +{
>>>>> +    unsigned int i;
>>>>> +
>>>>> +    clk_save_context();
>>>>> +
>>>>> +    /*
>>>>> +     * Save the bootloader configured clock registers SPARE_REG0,
>>>>> +     * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL.
>>>>> +     */
>>>>> +    spare_reg_ctx = readl_relaxed(clk_base + SPARE_REG0);
>>>>> +    misc_clk_enb_ctx = readl_relaxed(clk_base + MISC_CLK_ENB);
>>>>> +    clk_msk_arm_ctx = readl_relaxed(clk_base + CLK_MASK_ARM);
>>>>> +
>>>>> +    for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
>>>>> +        cpu_softrst_ctx[i] = car_readl(CPU_SOFTRST_CTRL, i);
>>>>> +
>>>>> +    tegra_clk_periph_suspend();
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static void tegra210_clk_resume(void)
>>>>> +{
>>>>> +    unsigned int i;
>>>>> +
>>>>> +    tegra_clk_osc_resume(clk_base);
>>>>> +
>>>>> +    /*
>>>>> +     * Restore the bootloader configured clock registers SPARE_REG0,
>>>>> +     * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL from saved context.
>>>>> +     */
>>>>> +    writel_relaxed(spare_reg_ctx, clk_base + SPARE_REG0);
>>>>> +    writel_relaxed(misc_clk_enb_ctx, clk_base + MISC_CLK_ENB);
>>>>> +    writel_relaxed(clk_msk_arm_ctx, clk_base + CLK_MASK_ARM);
>>>>> +
>>>>> +    for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
>>>>> +        car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
>>>>> +
>>>>> +    fence_udelay(5, clk_base);
>>>>> +
>>>>> +    /* enable all the clocks before changing the clock sources */
>>>>> +    tegra_clk_periph_force_on(periph_clk_rsvd_mask);
>>>> Why clocks need to be enabled before changing the sources?
>>> To prevent glitchless frequency switch, Tegra clock programming recommended sequence is to
>>> change MUX control or divisor or both with the clocks running.
>> This should be explained in the comment.
>>
>>> Actual state of clocks before suspend are restored later after all PLL's and peripheral
>>> clocks are restored.
>>>
>>>>> +    /* wait for all writes to happen to have all the clocks enabled */
>>>>> +    wmb();
>>>> fence_udelay() has exactly the same barrier at the very beginning of readl(), no need to
>>>> duplicate it here.
>> Actually, readl does the rmb() and it should be a more correct variant of fencing because it
>> actually ensures that the write reached hardware. I suppose that something like fence_udelay
>> should be used for the pinctrl as well.
>>
>>>>> +    fence_udelay(2, clk_base);
>>>>> +
>>>>> +    /* restore PLLs and all peripheral clock rates */
>>>>> +    tegra210_init_pllu();
>>>> Why USB PLL need to be restored at first?
>>> USB PLL restore is independent to all other clocks restore. So this can be done either
>>> before clk_restore_context or even after.
>> Then why not to implement restore_context for PLLU?
> 
> pllu is registered as fixed_rate clock and we using clk core clk_register_fixed_rate which
> uses clk_fixed_rate_ops from the same generic clk-fixed-rate driver.
> 
> Also pllu init happens in the same clk-tegra210, so invoking it during resume which is the
> same sequence needed during resume as well.

Okay.

