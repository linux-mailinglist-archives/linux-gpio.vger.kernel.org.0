Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A65687CF4E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 23:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbfGaVEx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 17:04:53 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:8803 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfGaVEx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 17:04:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d42027c0002>; Wed, 31 Jul 2019 14:05:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 31 Jul 2019 14:04:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 31 Jul 2019 14:04:51 -0700
Received: from [10.110.102.167] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 21:04:50 +0000
Subject: Re: [PATCH v7 06/20] clk: tegra: Support for OSC context save and
 restore
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-7-git-send-email-skomatineni@nvidia.com>
 <16cca6aa-1034-f38a-49d1-d87b37fb6bbb@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b5a58bfc-c777-886f-d902-f499ec38e2ae@nvidia.com>
Date:   Wed, 31 Jul 2019 14:04:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <16cca6aa-1034-f38a-49d1-d87b37fb6bbb@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564607100; bh=5rrpy+cn1KnA3JbJVL1tKlVMXhmWssvFAJuR/U8+9e8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=WS8MF5eKhGbOte36YkWSpNh9xhWM82n79UA8DnM36gXW+YMUOEMtWt3nIIDMwtTlq
         pqTIPXMSv/oGMxkFOKXfu5UXpqKQKQ5y0UJkpkOyDekFCFXA+RHOPpx4ywwy32DzHs
         LLa3YA1LOVNr3nX+24At6RJPfB74LzYkFNg5cYklVkH+8wwMnzg37irjhpZc82QI0M
         f4lQ9e5HZGOt5TuF2o2akyotU+XiUsMOWd/3NJVftyTKg75H/eETNinmL/4HvAbVPn
         tC+X9D2fmOML2s57yKFpEqIG8vcFCazukwV8Qczd0/pEAWa8lW+Ui46Ws+RaO7siJs
         aJeDjsKzwyiyw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/31/19 4:11 AM, Dmitry Osipenko wrote:
> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds support for saving OSC clock frequency and the
>> drive-strength during OSC clock init and creates an API to restore
>> OSC control register value from the saved context.
>>
>> This API is invoked by Tegra210 clock driver during system resume
>> to restore the  OSC clock settings.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-tegra-fixed.c | 15 +++++++++++++++
>>   drivers/clk/tegra/clk.h             |  1 +
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk=
-tegra-fixed.c
>> index 8d91b2b191cf..7c6c8abfcde6 100644
>> --- a/drivers/clk/tegra/clk-tegra-fixed.c
>> +++ b/drivers/clk/tegra/clk-tegra-fixed.c
>> @@ -17,6 +17,10 @@
>>   #define OSC_CTRL			0x50
>>   #define OSC_CTRL_OSC_FREQ_SHIFT		28
>>   #define OSC_CTRL_PLL_REF_DIV_SHIFT	26
>> +#define OSC_CTRL_MASK			(0x3f2 |	\
>> +					(0xf << OSC_CTRL_OSC_FREQ_SHIFT))
>> +
>> +static u32 osc_ctrl_ctx;
>>  =20
>>   int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk=
 *clks,
>>   			      unsigned long *input_freqs, unsigned int num,
>> @@ -29,6 +33,7 @@ int __init tegra_osc_clk_init(void __iomem *clk_base, =
struct tegra_clk *clks,
>>   	unsigned osc_idx;
>>  =20
>>   	val =3D readl_relaxed(clk_base + OSC_CTRL);
>> +	osc_ctrl_ctx =3D val & OSC_CTRL_MASK;
>>   	osc_idx =3D val >> OSC_CTRL_OSC_FREQ_SHIFT;
>>  =20
>>   	if (osc_idx < num)
>> @@ -96,3 +101,13 @@ void __init tegra_fixed_clk_init(struct tegra_clk *t=
egra_clks)
>>   		*dt_clk =3D clk;
>>   	}
>>   }
>> +
>> +void tegra_clk_osc_resume(void __iomem *clk_base)
>> +{
>> +	u32 val;
>> +
>> +	val =3D readl_relaxed(clk_base + OSC_CTRL) & ~OSC_CTRL_MASK;
>> +	val |=3D osc_ctrl_ctx;
>> +	writel_relaxed(val, clk_base + OSC_CTRL);
> Why a full raw u32 OSC_CTRL value couldn't be simply saved and restored?

Storing and restoring only required fields to avoid accidental=20
misconfiguration.

OSC_CTRL register has other bits (PLL_REF_DIV) which are configured by=20
BR depending on OSC_FREQ and also setting PLL_REF_DIV while PLLS are in=20
use is not safe.

>> +	fence_udelay(2, clk_base);
>> +}
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>> index f1ef6ae8c979..abba6d8a04cd 100644
>> --- a/drivers/clk/tegra/clk.h
>> +++ b/drivers/clk/tegra/clk.h
>> @@ -842,6 +842,7 @@ u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsi=
gned long input_rate);
>>   int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>>   int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>>   		 u8 frac_width, u8 flags);
>> +void tegra_clk_osc_resume(void __iomem *clk_base);
>>  =20
>>  =20
>>   /* Combined read fence with delay */
>>
