Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D830559DA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 23:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfFYVWp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 17:22:45 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8463 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbfFYVWp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 17:22:45 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1290a20001>; Tue, 25 Jun 2019 14:22:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 25 Jun 2019 14:22:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 25 Jun 2019 14:22:43 -0700
Received: from [10.110.103.70] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Jun
 2019 21:22:42 +0000
Subject: Re: [PATCH V3 06/17] clk: tegra: pll: save and restore pll context
To:     Stephen Boyd <sboyd@kernel.org>, <jason@lakedaemon.net>,
        <jonathanh@nvidia.com>, <linus.walleij@linaro.org>,
        <marc.zyngier@arm.com>, <mark.rutland@arm.com>, <stefan@agner.ch>,
        <tglx@linutronix.de>, <thierry.reding@gmail.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-7-git-send-email-skomatineni@nvidia.com>
 <20190625204640.D640E205ED@mail.kernel.org>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <1d34f117-9882-7e11-9641-90f3b7ebc273@nvidia.com>
Date:   Tue, 25 Jun 2019 14:22:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190625204640.D640E205ED@mail.kernel.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561497762; bh=hQq9zJfXZXl1rOsdFRIeo5nPIVHqhZjlNT3Q2VrPlQk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Y4N840opIgVuHmpvaOTFetAl+QpI9mntDy4WT4f5UR/ubLzxtJhZTTQgN5os097Bp
         YOkxmqmMAkCJOUEMKC/rRPumaNf9mkF3tDJ6QGGQxFUGj8eO/vZIzFVzsQyQn95P/l
         /W/IPMLBEQdM9FsZFgHzPZ/ZfjFU1u/iip5/9bmNKqAM7EDivgyI0VL2EXs7OouQMA
         Wy+A9tqV8wvHucn6G/aCLIKE6ziAeJlpsa07+DHt01Lb0I/tAjzTTr9vZMsJUKTRz/
         9R0tjhcuSXnPgNdV5yScRySul2vMkvKy62Zf4AKLl9GJxK1DjPyIOYWdOuHjPObkn/
         NIhrvn25PM/Lg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/25/19 1:46 PM, Stephen Boyd wrote:
> Quoting Sowjanya Komatineni (2019-06-18 00:46:20)
>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>> index 1583f5fc992f..4b0ed8fc6268 100644
>> --- a/drivers/clk/tegra/clk-pll.c
>> +++ b/drivers/clk/tegra/clk-pll.c
>> @@ -1008,6 +1008,54 @@ static unsigned long clk_plle_recalc_rate(struct clk_hw *hw,
>>          return rate;
>>   }
>>   
>> +void tegra_clk_sync_state_pll(struct clk_hw *hw)
>> +{
>> +       if (!__clk_get_enable_count(hw->clk))
>> +               clk_pll_disable(hw);
>> +       else
>> +               clk_pll_enable(hw);
>> +}
>> +
>> +static int tegra_clk_pll_save_context(struct clk_hw *hw)
>> +{
>> +       struct tegra_clk_pll *pll = to_clk_pll(hw);
>> +
>> +       pll->rate = clk_hw_get_rate(hw);
>> +
>> +       if (!strcmp(__clk_get_name(hw->clk), "pll_mb"))
>> +               pll->pllbase_ctx = pll_readl_base(pll);
>> +       else if (!strcmp(__clk_get_name(hw->clk), "pll_re_vco"))
>> +               pll->pllbase_ctx = pll_readl_base(pll) & (0xf << 16);
>> +
>> +       return 0;
>> +}
>> +
>> +static void tegra_clk_pll_restore_context(struct clk_hw *hw)
>> +{
>> +       struct tegra_clk_pll *pll = to_clk_pll(hw);
>> +       u32 val;
>> +
>> +       if (clk_pll_is_enabled(hw))
>> +               return;
>> +
>> +       if (!strcmp(__clk_get_name(hw->clk), "pll_mb")) {
> Is there any way to avoid doing a string comparison here, and instead do
> something like a pointer comparison? Or maybe look at some flag in the
> tegra_clk_pll to figure out what to do differently? Using a string
> comparison is not too nice. Or even have different clk ops for the
> different clks and then do different things in this restore clk_op?
OK, Will update...
>> +               pll_writel_base(pll->pllbase_ctx, pll);
>> +       } else if (!strcmp(__clk_get_name(hw->clk), "pll_re_vco")) {
>> +               val = pll_readl_base(pll);
>> +               val &= ~(0xf << 16);
>> +               pll_writel_base(pll->pllbase_ctx | val, pll);
>> +       }
>> +
>> +       if (pll->params->set_defaults)
>> +               pll->params->set_defaults(pll);
>> +
>> +       clk_set_rate(hw->clk, pll->rate);
> Do you need to call clk_set_rate() here to change the frequency of the
> clk or just the parents of the clk, or both? I'd think that when we're
> restoring the clk the cached rate of the clk would match whatever we're
> restoring to, so this is a NOP. So does this do anything?
>
> I'd prefer that the restore ops just restore the clk hardware state of
> the clk_hw passed in, and not try to fix up the entire tree around a
> certain clk, if that's even possible.

On restore, need to program tegra plls rate back to the same rate as 
they were before suspend, so I am calling clk_set_rate to program pll 
m,n,p values in hw registers.

>> +
>> +       /* do not sync pllx state here. pllx is sync'd after dfll resume */
>> +       if (strcmp(__clk_get_name(hw->clk), "pll_x"))
>> +               tegra_clk_sync_state_pll(hw);
>> +}
>> +
>>   const struct clk_ops tegra_clk_pll_ops = {
>>          .is_enabled = clk_pll_is_enabled,
>>          .enable = clk_pll_enable,
>> @@ -1015,6 +1063,8 @@ const struct clk_ops tegra_clk_pll_ops = {
>>          .recalc_rate = clk_pll_recalc_rate,
>>          .round_rate = clk_pll_round_rate,
>>          .set_rate = clk_pll_set_rate,
>> +       .save_context = tegra_clk_pll_save_context,
>> +       .restore_context = tegra_clk_pll_restore_context,
