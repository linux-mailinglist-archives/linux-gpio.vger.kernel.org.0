Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDBB080058
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 20:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfHBSnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 14:43:41 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16223 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfHBSnk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 14:43:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d44845b0002>; Fri, 02 Aug 2019 11:43:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 02 Aug 2019 11:43:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 02 Aug 2019 11:43:38 -0700
Received: from [10.2.165.119] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 18:43:36 +0000
Subject: Re: [PATCH v7 07/20] clk: tegra: clk-periph: Add save and restore
 support
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
 <1564532424-10449-8-git-send-email-skomatineni@nvidia.com>
 <c703b4fc-9ebb-0fd4-11de-80974b5c3842@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <614e3fec-cfa2-9e49-6130-d6de253acf03@nvidia.com>
Date:   Fri, 2 Aug 2019 11:43:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <c703b4fc-9ebb-0fd4-11de-80974b5c3842@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564771419; bh=Kbrh1J6jb4kOgZCg/eEabXhEFnoc7+ZrgplPPRc9fRM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=oE+GXtGlYqP7gJPYHtFjGyLisqcTTy4TWY28VxBtQ0J/+up/ybowHqzDZNJHT15iZ
         K/fBFd7mCh7PaV7lLvMstQ1ngVqI+SRLC4cLDYYZMUPQ7dWaYyrGdzxO5B2q74YKti
         ZTmwl8UOnZU/wQLkjzw/Or4cn3+g9jhJU0n7jnZOyEgBCJW8fgc7137tJ+W9EjhbyU
         mY0RIMB7Tpcf8IKcSSo7fZsIAEYxf2QqoISAUulaeOAgKXdGFRuQVJv7DK2eilIO2n
         p/vKcDvNh1eEM4DnyapnpCVIyJWjqbZo8oBQPOVyreqMWLuyGh3eeRI2Hkq1UwNmUv
         rlK54RzMzDeSg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/2/19 5:32 AM, Dmitry Osipenko wrote:
> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch implements save and restore context for peripheral fixed
>> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
>> peripheral clock ops.
>>
>> During system suspend, core power goes off and looses the settings
>> of the Tegra CAR controller registers.
>>
>> So during suspend entry clock and reset state of peripherals is saved
>> and on resume they are restored to have clocks back to same rate and
>> state as before suspend.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-periph-fixed.c | 33 ++++++++++++++++++++++++++++=
++++
>>   drivers/clk/tegra/clk-periph-gate.c  | 34 ++++++++++++++++++++++++++++=
+++++
>>   drivers/clk/tegra/clk-periph.c       | 37 ++++++++++++++++++++++++++++=
++++++++
>>   drivers/clk/tegra/clk-sdmmc-mux.c    | 28 +++++++++++++++++++++++++++
>>   drivers/clk/tegra/clk.h              |  6 ++++++
>>   5 files changed, 138 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c b/drivers/clk/tegra/cl=
k-periph-fixed.c
>> index c088e7a280df..21b24530fa00 100644
>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>> @@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct clk_hw *hw=
,
>>   	return (unsigned long)rate;
>>   }
>>  =20
>> +static int tegra_clk_periph_fixed_save_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph_fixed *fixed =3D to_tegra_clk_periph_fixed(hw)=
;
>> +	u32 mask =3D 1 << (fixed->num % 32);
> This could be BIT(fixed->num % 32).
>
>> +	fixed->enb_ctx =3D readl_relaxed(fixed->base + fixed->regs->enb_reg) &
>> +			 mask;
>> +	fixed->rst_ctx =3D readl_relaxed(fixed->base + fixed->regs->rst_reg) &
>> +			 mask;
> The enb_ctx/rst_ctx are booleans, while you assigning an integer value
> here. You're getting away here because bool is an 32bit unsigned int,
> but you shouldn't rely on it and always explicitly convert to a bool.
>
>> +	return 0;
>> +}
>> +
>> +static void tegra_clk_periph_fixed_restore_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_periph_fixed *fixed =3D to_tegra_clk_periph_fixed(hw)=
;
>> +	u32 mask =3D 1 << (fixed->num % 32);
>> +
>> +	if (fixed->enb_ctx)
>> +		writel_relaxed(mask, fixed->base + fixed->regs->enb_set_reg);
>> +	else
>> +		writel_relaxed(mask, fixed->base + fixed->regs->enb_clr_reg);
>> +
>> +	udelay(2);
> Will be better to read out and compare the hardware's state with the
> restored one, then bail out if the state is unchanged.
>
> Shouldn't it be fence_udelay()?
>
>> +	if (!fixed->rst_ctx) {
>> +		udelay(5); /* reset propogation delay */
> Why delaying is done before the writing to the reset register?

During SC7 exit, peripheral reset state is set to POR state. So some=20
peripherals will already be in reset state and making sure of=20
propagation delay before releasing from reset.

It should be rst_clr_reg. will fix in next rev

>
>> +		writel_relaxed(mask, fixed->base + fixed->regs->rst_reg);
> I'm not quite sure what's going on here, this looks wrong.
>
> 1. rst_reg points to RST_DEVICES_x
> 2. Each bit of RST_DEVICES_x represents the reset-assertion state of
> each individual device
> 3. By writing to rst_reg, all (!) devices are deasserted, except the one
> device which corresponds to the mask
> 4. The reset is asserted for a single device, while !fixed->rst_ctx
> means that it actually should be deasserted (?)
>
> Apparently you should use rst_set_reg / rst_clr_reg.
Yes, It should be rst_clr_reg. will fix in next rev
>> +	}
> What about the case where rst_ctx=3Dtrue?

ON SC7 exit, state of RST_DEV will be POR state where most peripherals=20
will already be in reset state.

Few of them which are not in reset state in POR values are those that=20
need to stay de-asserted across the boot states anyway.

>
>> +}
>> @@ -517,6 +517,8 @@ struct tegra_clk_periph_gate {
>>   	int			clk_num;
>>   	int			*enable_refcnt;
>>   	const struct tegra_clk_periph_regs *regs;
>> +	bool			clk_state_ctx;
>> +	bool			rst_state_ctx;
>>   };
>>  =20
>>   #define to_clk_periph_gate(_hw)					\
>> @@ -543,6 +545,8 @@ struct tegra_clk_periph_fixed {
>>   	unsigned int mul;
>>   	unsigned int div;
>>   	unsigned int num;
>> +	bool enb_ctx;
>> +	bool rst_ctx;
>>   };
> I'd expect these to be bool:1.
