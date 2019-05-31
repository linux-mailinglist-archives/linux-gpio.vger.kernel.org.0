Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C872315B1
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2019 21:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfEaT4D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 May 2019 15:56:03 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15143 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbfEaT4C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 May 2019 15:56:02 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf186d00001>; Fri, 31 May 2019 12:56:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 May 2019 12:56:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 May 2019 12:56:00 -0700
Received: from [10.2.175.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 May
 2019 19:55:57 +0000
Subject: Re: [PATCH V2 04/12] clk: tegra: add support for peripheral clock
 suspend and resume
To:     Stephen Boyd <sboyd@kernel.org>, <jason@lakedaemon.net>,
        <jonathanh@nvidia.com>, <linus.walleij@linaro.org>,
        <marc.zyngier@arm.com>, <mark.rutland@arm.com>, <stefan@agner.ch>,
        <tglx@linutronix.de>, <thierry.reding@gmail.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-5-git-send-email-skomatineni@nvidia.com>
 <20190529233049.A7E5924371@mail.kernel.org>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <abd481db-9387-8e7f-e68e-9f1a3e217b51@nvidia.com>
Date:   Fri, 31 May 2019 12:55:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529233049.A7E5924371@mail.kernel.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1559332560; bh=fyUgksf15TgB7D/+ZMOAO7M7CVG31MW/WSQCDBy4pVQ=;
	h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
	 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
	 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
	 Content-Language;
	b=iqAjo2NdebEX6IQgtE+dZ1EoyeCEIZAqRf22p21EapkVX0OBJC3q4Gq7gRPrH2fJC
	 uhLbg6vyTpA7tw+SL/Q6OC76foZllVOZDlC8m02oSU3qttQyJX5rCD59shHR+I4y1U
	 EO5f5ynsViWBR2kJNtgRO2yTrKQCYOWgX2VSfb1c3OX347L/TSCQDDFU/bocKSDD6L
	 cjVCbddyiIHj6HtpiRzWKIezGprf40oa5Lsd7heEqGTFe2IPIuIAcrtSjmg455iUvU
	 qyKwofgEpOyXkvlW1Jy4Xm+1v3hRH1W5bgxWWMWL7BWkGQQDwHLZXwNVTA0iT/JH6L
	 nz/b3Hyar6Dwg==

On 5/29/19 4:30 PM, Stephen Boyd wrote:
> Quoting Sowjanya Komatineni (2019-05-28 16:08:48)
>> This patch implements peripheral clock context save and restore
>> to support system suspend and resume operation.
> Again, why?
Will add more in commit in next version of this series.
>> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
>> index 6f2862eddad7..08b788766564 100644
>> --- a/drivers/clk/tegra/clk.c
>> +++ b/drivers/clk/tegra/clk.c
>> @@ -81,6 +81,10 @@ static struct clk **clks;
>>   static int clk_num;
>>   static struct clk_onecell_data clk_data;
>>   
>> +#ifdef CONFIG_PM_SLEEP
>> +static u32 *periph_ctx;
>> +#endif
> Please move this into the ifdef below.
>
WIll fix in V3
>> +
>>   /* Handlers for SoC-specific reset lines */
>>   static int (*special_reset_assert)(unsigned long);
>>   static int (*special_reset_deassert)(unsigned long);
>> @@ -210,6 +214,65 @@ const struct tegra_clk_periph_regs *get_reg_bank(int clkid)
>>          }
>>   }
>>   
>> +#ifdef CONFIG_PM_SLEEP
>> +void tegra_clk_periph_suspend(void __iomem *clk_base)
>> +{
>> +       int i, idx;
>> +
>> +       idx = 0;
>> +       for (i = 0; i < periph_banks; i++, idx++)
>> +               periph_ctx[idx] =
>> +                       readl_relaxed(clk_base + periph_regs[i].rst_reg);
>> +
>> +       for (i = 0; i < periph_banks; i++, idx++)
>> +               periph_ctx[idx] =
>> +                       readl_relaxed(clk_base + periph_regs[i].enb_reg);
>> +}
>> +
>> +void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base)
>> +{
>> +       int i;
>> +
>> +       WARN_ON(count != periph_banks);
>> +
>> +       for (i = 0; i < count; i++)
>> +               writel_relaxed(clks_on[i], clk_base + periph_regs[i].enb_reg);
>> +}
>> +
>> +void tegra_clk_periph_resume(void __iomem *clk_base)
>> +{
>> +       int i, idx;
>> +
>> +       idx = 0;
>> +       for (i = 0; i < periph_banks; i++, idx++)
>> +               writel_relaxed(periph_ctx[idx],
>> +                              clk_base + periph_regs[i].rst_reg);
>> +
>> +       /* ensure all resets have propagated */
>> +       fence_udelay(2, clk_base);
>> +       tegra_read_chipid();
>> +
>> +       for (i = 0; i < periph_banks; i++, idx++)
>> +               writel_relaxed(periph_ctx[idx],
>> +                              clk_base + periph_regs[i].enb_reg);
>> +
>> +       /* ensure all enables have propagated */
>> +       fence_udelay(2, clk_base);
>> +       tegra_read_chipid();
>> +}
>> +
>> +static int tegra_clk_suspend_ctx_init(int banks)
>> +{
>> +       int err = 0;
>> +
>> +       periph_ctx = kzalloc(2 * banks * sizeof(*periph_ctx), GFP_KERNEL);
> Is this kcalloc(2 * banks, sizeof(*periph_ctx)... ?
Will fix in V3
>> +       if (!periph_ctx)
>> +               err = -ENOMEM;
>> +
>> +       return err;
>> +}
>> +#endif
>> +
>>   struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
>>   {
>>          clk_base = regs;
>> @@ -226,11 +289,20 @@ struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
>>          periph_banks = banks;
>>   
>>          clks = kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
>> -       if (!clks)
>> +       if (!clks) {
>>                  kfree(periph_clk_enb_refcnt);
>> +               return NULL;
>> +       }
>>   
>>          clk_num = num;
>>   
>> +#ifdef CONFIG_PM_SLEEP
> Can you use if (IS_ENABLED(CONFIG_PM_SLEEP)) here?
Will fix in V3
>
>> +       if (tegra_clk_suspend_ctx_init(banks)) {
>> +               kfree(periph_clk_enb_refcnt);
>> +               kfree(clks);
>> +               return NULL;
>> +       }
>> +#endif
>>          return clks;
>>   }
>>   
