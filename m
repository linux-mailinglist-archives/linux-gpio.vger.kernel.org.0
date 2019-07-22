Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9B96F958
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 08:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfGVGKJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 02:10:09 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34600 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfGVGKJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 02:10:09 -0400
Received: by mail-lj1-f196.google.com with SMTP id p17so36352346ljg.1;
        Sun, 21 Jul 2019 23:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=68NS5MbPNGx3oVlzPDafzy93b3e0AKuHa1JWZ/+s3eI=;
        b=UE2rtg/BgoQ25KHxvLwe+9vZJ8jVjSjp7xm+yti7wvF2U3QGw8r0Sg0AEp1hv8Va9R
         c1eIgbzT7QWxERbHgY+gRUwMNO5RZUhX7mp+5sXkgSYDW47J87qSu7qXzdNZyQF07dya
         Sw+5ueLy8m4kBuZByZKpf8UwD5hhKZSnm/O37MQEp0pPLXjfv0WCng5cUwIk1nqQQJjY
         W4xT8cVrTWtHKgVnbaZ67x8g+Rpt9DNaYVa1c06urHU1tkcYE9+8RfWgkKcVjaIKibJa
         ZPwIF74TMQjjXcVKTFbbuwxA866AxBe6wkBRcRa8CkVqotCi8KNHEpG6mFsdb7AxR3VG
         s6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=68NS5MbPNGx3oVlzPDafzy93b3e0AKuHa1JWZ/+s3eI=;
        b=NjAWGCP4Z0WqliGEYAOsuG8dub+kgThKLFwOMFPTlbKea914sYQq0MznNOcVN9DX7d
         c4WcOwmSOsz/z0PI5ASxevIHHf2ogWjPtMmV0tJ+h0MA4w3yoRkfQnfGDboGekTeoilu
         DOXVehR9/cbrDONz870xBKh7oFcGzeO+ZBefe5FoGU5OufpqM4NHH0iSIlk1WKl0R5MH
         uhO8L0qAvBd0AxAz7Ziha5larTbmIJkrNMBFSK0ASrHtFMjVEaQiJHswE5NASXbmY3eL
         OwU5LZShLH1vVNyvru9x+h3lWQty0sGJLc7v+W5UZVAS1rsnu6Rg/jWxmlN5UqHMDhcC
         HGzA==
X-Gm-Message-State: APjAAAWAt+BoNgKzj3iGwnbVFkUqEPKxv4K9OZ6CqdA+142olCWuVyhr
        6f5uJX+AdLcMlgIBsNH1hqqZ+T1Q
X-Google-Smtp-Source: APXvYqw1KkWjC+xvlA+ECAECuodIEg0Kh6r/WI/+a86Y4AW/YGn/6J3Bgd9ve7cDggr8cWSPIeIhwA==
X-Received: by 2002:a2e:2bd3:: with SMTP id r80mr35916957ljr.23.1563775805562;
        Sun, 21 Jul 2019 23:10:05 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id c19sm5809639lfi.39.2019.07.21.23.10.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 23:10:04 -0700 (PDT)
Subject: Re: [PATCH V6 14/21] clk: tegra210: Add suspend and resume support
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-15-git-send-email-skomatineni@nvidia.com>
 <e683b417-66fb-38dc-c16b-dab616583a88@gmail.com>
 <88da46d2-b90d-f57e-7611-b8653b56bdf6@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ceedb802-7561-488f-3a89-67bee19f2fea@gmail.com>
Date:   Mon, 22 Jul 2019 09:10:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <88da46d2-b90d-f57e-7611-b8653b56bdf6@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

22.07.2019 1:45, Sowjanya Komatineni пишет:
> 
> On 7/21/19 2:38 PM, Dmitry Osipenko wrote:
>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>> This patch adds support for clk: tegra210: suspend-resume.
>>>
>>> All the CAR controller settings are lost on suspend when core
>>> power goes off.
>>>
>>> This patch has implementation for saving and restoring all PLLs
>>> and clocks context during system suspend and resume to have the
>>> clocks back to same state for normal operation.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/clk/tegra/clk-tegra210.c | 68
>>> ++++++++++++++++++++++++++++++++++++++--
>>>   drivers/clk/tegra/clk.c          | 14 +++++++++
>>>   drivers/clk/tegra/clk.h          |  1 +
>>>   3 files changed, 80 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/clk/tegra/clk-tegra210.c
>>> b/drivers/clk/tegra/clk-tegra210.c
>>> index 55a88c0824a5..68271873acc1 100644
>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>> @@ -9,6 +9,7 @@
>>>   #include <linux/clkdev.h>
>>>   #include <linux/of.h>
>>>   #include <linux/of_address.h>
>>> +#include <linux/syscore_ops.h>
>>>   #include <linux/delay.h>
>>>   #include <linux/export.h>
>>>   #include <linux/mutex.h>
>>> @@ -220,11 +221,15 @@
>>>   #define CLK_M_DIVISOR_SHIFT 2
>>>   #define CLK_M_DIVISOR_MASK 0x3
>>>   +#define CLK_MASK_ARM    0x44
>>> +#define MISC_CLK_ENB    0x48
>>> +
>>>   #define RST_DFLL_DVCO 0x2f4
>>>   #define DVFS_DFLL_RESET_SHIFT 0
>>>     #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>>   #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>>> +#define CPU_SOFTRST_CTRL 0x380
>>>     #define LVL2_CLK_GATE_OVRA 0xf8
>>>   #define LVL2_CLK_GATE_OVRC 0x3a0
>>> @@ -2825,6 +2830,7 @@ static int tegra210_enable_pllu(void)
>>>       struct tegra_clk_pll_freq_table *fentry;
>>>       struct tegra_clk_pll pllu;
>>>       u32 reg;
>>> +    int ret;
>>>         for (fentry = pll_u_freq_table; fentry->input_rate; fentry++) {
>>>           if (fentry->input_rate == pll_ref_freq)
>>> @@ -2853,9 +2859,8 @@ static int tegra210_enable_pllu(void)
>>>       reg |= PLL_ENABLE;
>>>       writel(reg, clk_base + PLLU_BASE);
>>>   -    readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
>>> -                      reg & PLL_BASE_LOCK, 2, 1000);
>>> -    if (!(reg & PLL_BASE_LOCK)) {
>>> +    ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
>>> +    if (ret) {
>> Why this is needed? Was there a bug?
>>
> during resume pllu init is needed and to use same terga210_init_pllu,
> poll_timeout_atomic can't be used as its ony for atomic context.
> 
> So changed to use wait_for_mask which should work in both cases.

Atomic variant could be used from any context, not sure what do you
mean. The 'atomic' part only means that function won't cause scheduling
and that's it.

>>>           pr_err("Timed out waiting for PLL_U to lock\n");
>>>           return -ETIMEDOUT;
>>>       }
>>> @@ -3288,6 +3293,56 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>>>   }
>>>     #ifdef CONFIG_PM_SLEEP
>>> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) +
>>> ((_off) * 4))
>>> +#define car_writel(_val, _base, _off) \
>>> +        writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
>>> +
>>> +static u32 spare_reg_ctx, misc_clk_enb_ctx, clk_msk_arm_ctx;
>>> +static u32 cpu_softrst_ctx[3];
>>> +
>>> +static int tegra210_clk_suspend(void)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    clk_save_context();
>>> +
>>> +    /*
>>> +     * save the bootloader configured clock registers SPARE_REG0,
>>> +     * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL
>> Nit: Start all multi-line comments with a capital letter and put dot in
>> the end of sentence.
>>
>>> +     */
>>> +    spare_reg_ctx = readl_relaxed(clk_base + SPARE_REG0);
>>> +    misc_clk_enb_ctx = readl_relaxed(clk_base + MISC_CLK_ENB);
>>> +    clk_msk_arm_ctx = readl_relaxed(clk_base + CLK_MASK_ARM);
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
>>> +        cpu_softrst_ctx[i] = car_readl(CPU_SOFTRST_CTRL, i);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void tegra210_clk_resume(void)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    tegra_clk_osc_resume(clk_base);
>>> +
>>> +    /*
>>> +     * restore the bootloader configured clock registers SPARE_REG0,
>>> +     * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL from saved context.
>> Same here.
>>
>>> +     */
>>> +    writel_relaxed(spare_reg_ctx, clk_base + SPARE_REG0);
>>> +    writel_relaxed(misc_clk_enb_ctx, clk_base + MISC_CLK_ENB);
>>> +    writel_relaxed(clk_msk_arm_ctx, clk_base + CLK_MASK_ARM);
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
>>> +        car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
>>> +
>>> +    fence_udelay(5, clk_base);
>>> +
>>> +    tegra210_init_pllu();
>>> +    clk_restore_context();
>>> +}
>>> +
>>>   static void tegra210_cpu_clock_suspend(void)
>>>   {
>>>       /* switch coresite to clk_m, save off original source */
>>> @@ -3303,6 +3358,11 @@ static void tegra210_cpu_clock_resume(void)
>>>   }
>>>   #endif
>>>   +static struct syscore_ops tegra_clk_syscore_ops = {
>>> +    .suspend = tegra210_clk_suspend,
>>> +    .resume = tegra210_clk_resume,
>>> +};
>>> +
>>>   static struct tegra_cpu_car_ops tegra210_cpu_car_ops = {
>>>       .wait_for_reset    = tegra210_wait_cpu_in_reset,
>>>       .disable_clock    = tegra210_disable_cpu_clock,
>>> @@ -3587,5 +3647,7 @@ static void __init tegra210_clock_init(struct
>>> device_node *np)
>>>       tegra210_mbist_clk_init();
>>>         tegra_cpu_car_ops = &tegra210_cpu_car_ops;
>>> +
>>> +    register_syscore_ops(&tegra_clk_syscore_ops);
>>>   }
>>>   CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
>>> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
>>> index 573e3c967ae1..eb08047fd02f 100644
>>> --- a/drivers/clk/tegra/clk.c
>>> +++ b/drivers/clk/tegra/clk.c
>>> @@ -23,6 +23,7 @@
>>>   #define CLK_OUT_ENB_W            0x364
>>>   #define CLK_OUT_ENB_X            0x280
>>>   #define CLK_OUT_ENB_Y            0x298
>>> +#define CLK_ENB_PLLP_OUT_CPU        BIT(31)
>>>   #define CLK_OUT_ENB_SET_L        0x320
>>>   #define CLK_OUT_ENB_CLR_L        0x324
>>>   #define CLK_OUT_ENB_SET_H        0x328
>>> @@ -199,6 +200,19 @@ const struct tegra_clk_periph_regs
>>> *get_reg_bank(int clkid)
>>>       }
>>>   }
>>>   +void tegra_clk_set_pllp_out_cpu(bool enable)
>>> +{
>>> +    u32 val;
>>> +
>>> +    val = readl_relaxed(clk_base + CLK_OUT_ENB_Y);
>>> +    if (enable)
>>> +        val |= CLK_ENB_PLLP_OUT_CPU;
>>> +    else
>>> +        val &= ~CLK_ENB_PLLP_OUT_CPU;
>>> +
>>> +    writel_relaxed(val, clk_base + CLK_OUT_ENB_Y);
>>> +}
>>> +
>>>   struct clk ** __init tegra_clk_init(void __iomem *regs, int num,
>>> int banks)
>>>   {
>>>       clk_base = regs;
>>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>>> index 562a3ee2d537..0ffa763c755b 100644
>>> --- a/drivers/clk/tegra/clk.h
>>> +++ b/drivers/clk/tegra/clk.h
>>> @@ -863,6 +863,7 @@ int div_frac_get(unsigned long rate, unsigned
>>> parent_rate, u8 width,
>>>            u8 frac_width, u8 flags);
>>>   void tegra_clk_sync_state_pll(struct clk_hw *hw);
>>>   void tegra_clk_osc_resume(void __iomem *clk_base);
>>> +void tegra_clk_set_pllp_out_cpu(bool enable);
>>>     /* Combined read fence with delay */
>>>   #define fence_udelay(delay, reg)    \
>>>

