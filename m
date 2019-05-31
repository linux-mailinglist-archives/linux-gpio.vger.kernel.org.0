Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63ABD315A8
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2019 21:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfEaTwv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 May 2019 15:52:51 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15015 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727343AbfEaTwv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 May 2019 15:52:51 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf186100002>; Fri, 31 May 2019 12:52:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 May 2019 12:52:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 May 2019 12:52:49 -0700
Received: from [10.2.175.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 May
 2019 19:52:45 +0000
Subject: Re: [PATCH V2 03/12] clk: tegra: save and restore PLLs state for
 system
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
 <1559084936-4610-4-git-send-email-skomatineni@nvidia.com>
 <20190529232810.14A5224366@mail.kernel.org>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <f5fd9068-134a-3343-9cca-94db67cd748f@nvidia.com>
Date:   Fri, 31 May 2019 12:52:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529232810.14A5224366@mail.kernel.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559332368; bh=+OtNzRTspnNq7fTZGHYQmYRka68TmYn5YO1oiUAfnMI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=nG/K91HTv7KRVGECV5Ru4ruZvcwq0LKATCDUqMuTwTthN2VzO0OZZHdhzaOcN9E/I
         Hp9JT+hRqnCIAcLCmaSBSX7bMtQxRt22SfNClRCnIBhwLMaSj5ho1n0h7xeLBw2Gjx
         mQqfh0UOsXgFoKWcNK5TQ1PsBV47GvzC5vYODB8TmMPi1hR0nc5QUTvfjXR+VLyd4t
         9jyZo7wFIs7pjwY1sTt2u2w4wtqKBayyBkZpLvq0hY6YFBxrNplg5iKNOV02AGPz5v
         EpCllyU1QX1gRWeJXxvP+1FUHXXzOndRzQm4BCCPAgTIsDRC53dIVF6Pxxthg53WCt
         lLv1eFbNAOePA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/29/19 4:28 PM, Stephen Boyd wrote:
> Quoting Sowjanya Komatineni (2019-05-28 16:08:47)
>> This patch has implementation of saving and restoring PLL's state to
>> support system suspend and resume operations.
> Can you provide some more background on _why_ this patch should exist?
> That's typically what gets written in the commit text.
Will add more in next version of this series.
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-divider.c | 19 ++++++++
>>   drivers/clk/tegra/clk-pll-out.c | 25 +++++++++++
>>   drivers/clk/tegra/clk-pll.c     | 99 ++++++++++++++++++++++++++++++++---------
>>   drivers/clk/tegra/clk.h         |  9 ++++
>>   4 files changed, 132 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
>> index 2a1822a22740..718694727042 100644
>> --- a/drivers/clk/tegra/clk-divider.c
>> +++ b/drivers/clk/tegra/clk-divider.c
>> @@ -14,6 +14,7 @@
>>    * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>    */
>>   
>> +#include <linux/clk.h>
>>   #include <linux/kernel.h>
>>   #include <linux/io.h>
>>   #include <linux/err.h>
>> @@ -179,3 +180,21 @@ struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
>>                                            reg, 16, 1, CLK_DIVIDER_READ_ONLY,
>>                                            mc_div_table, lock);
>>   }
>> +
>> +#if defined(CONFIG_PM_SLEEP)
>> +void tegra_clk_divider_resume(struct clk_hw *hw, unsigned long rate)
>> +{
>> +       struct clk_hw *parent = clk_hw_get_parent(hw);
>> +       unsigned long parent_rate;
>> +
>> +       if (IS_ERR(parent)) {
> Will this ever happen? Collapse the WARN_ON into the if please:
>
> 	if (WARN_ON(IS_ERR(parent)))
>
Will fix in next version of this series.
>> +               WARN_ON(1);
>> +               return;
>> +       }
>> +
>> +       parent_rate = clk_hw_get_rate(parent);
>> +
>> +       if (clk_frac_div_set_rate(hw, rate, parent_rate) < 0)
>> +               WARN_ON(1);
>> +}
>> +#endif
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>> index 09bccbb9640c..e4d124cc5657 100644
>> --- a/drivers/clk/tegra/clk.h
>> +++ b/drivers/clk/tegra/clk.h
>> @@ -841,6 +841,15 @@ int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>>   int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>>                   u8 frac_width, u8 flags);
>>   
>> +#ifdef CONFIG_PM_SLEEP
> Can you remove this ifdef? It just complicates compilation testing.
OK, Will fix in next version
>> +void tegra_clk_pll_resume(struct clk *c, unsigned long rate);
>> +void tegra_clk_divider_resume(struct clk_hw *hw, unsigned long rate);
>> +void tegra_clk_pll_out_resume(struct clk *clk, unsigned long rate);
>> +void tegra_clk_plle_tegra210_resume(struct clk *c);
>> +void tegra_clk_sync_state_pll(struct clk *c);
>> +void tegra_clk_sync_state_pll_out(struct clk *clk);
> Do these APIs need to operate on struct clk? Why can't they operate on
> clk_hw or why can't we drive the suspend/resume sequence from the clk
> provider driver itself?
>
Yes can change to use clk_hw.

By clk provider driver, are you referring to clk-tegra210?

clk-terga210 driver has suspend/resume implementation. These API's are 
for corresponding clock specific implementations (clk-pll, clk-pll-out, 
clk-divider) for enabling and restoring to proper rate and are invoked 
during clk-tegra210 driver resume.

thanks

Sowjanya

