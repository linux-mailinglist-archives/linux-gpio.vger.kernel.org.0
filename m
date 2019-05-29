Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB8D2E446
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 20:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbfE2SOt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 14:14:49 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:16849 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfE2SOt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 14:14:49 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ceecc0e0000>; Wed, 29 May 2019 11:14:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 11:14:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 May 2019 11:14:47 -0700
Received: from [10.110.103.86] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 May
 2019 18:14:45 +0000
Subject: Re: [PATCH V2 02/12] pinctrl: tegra: add suspend and resume support
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
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-3-git-send-email-skomatineni@nvidia.com>
 <6273a790-d4b7-c501-3fec-d9816288b139@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <d9d54f05-b0bf-6e65-9308-45e94454301e@nvidia.com>
Date:   Wed, 29 May 2019 11:14:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6273a790-d4b7-c501-3fec-d9816288b139@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559153678; bh=A9YK/nFxLV3PJjOi7BCVU2yWC+RVl5qSeED4QLSsntQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=sMA1G/hK2fy+v7joD29O4P+g1qw+eTvO4mInczl2kFzTjOBgm/L8zygm+96e28Oe0
         TAEUIVAgZYdyTL+40oXWlQyrmb5evGStTC7Pweb4lYQFbP2o8nEDBD4N4u1UvGJWDT
         6FjvWwvd7U1u4lyMXgPB/aw8W/E3O4EJQTRJOXkOzw47YbQjABIQmrF+bCqJIvNoCK
         3nIkRI1b/lxkc7wO38I7dPyXWIDR+29WIo3UO6pwhEIsoqQCDQS1vr26Icba9CVpK0
         f25sOpUSM2v/V2efZgxAjPlb++RleDbUJNTkzOQGW3b+saaeSXbgP7dUsIGl0fpnno
         VQL+DXoltW1fw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/29/19 8:29 AM, Dmitry Osipenko wrote:
> 29.05.2019 2:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds suspend and resume support for Tegra pinctrl driver
>> and registers them to syscore so the pinmux settings are restored
>> before the devices resume.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/pinctrl/tegra/pinctrl-tegra.c    | 68 ++++++++++++++++++++++++=
+++++++-
>>   drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>>   drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
>>   drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
>>   drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
>>   drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>>   drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
>>   7 files changed, 75 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/teg=
ra/pinctrl-tegra.c
>> index a5008c066bac..bdc47e62c457 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>> @@ -28,11 +28,18 @@
>>   #include <linux/pinctrl/pinmux.h>
>>   #include <linux/pinctrl/pinconf.h>
>>   #include <linux/slab.h>
>> +#include <linux/syscore_ops.h>
>>  =20
>>   #include "../core.h"
>>   #include "../pinctrl-utils.h"
>>   #include "pinctrl-tegra.h"
>>  =20
>> +#define EMMC2_PAD_CFGPADCTRL_0			0x1c8
>> +#define EMMC4_PAD_CFGPADCTRL_0			0x1e0
>> +#define EMMC_DPD_PARKING			(0x1fff << 14)
>> +
>> +static struct tegra_pmx *pmx;
>> +
>>   static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
>>   {
>>   	return readl(pmx->regs[bank] + reg);
>> @@ -629,6 +636,50 @@ static void tegra_pinctrl_clear_parked_bits(struct =
tegra_pmx *pmx)
>>   	}
>>   }
>>  =20
>> +static int __maybe_unused tegra_pinctrl_suspend(void)
>> +{
>> +	u32 *backup_regs =3D pmx->backup_regs;
>> +	u32 *regs;
>> +	int i, j;
>> +
>> +	for (i =3D 0; i < pmx->nbanks; i++) {
>> +		regs =3D pmx->regs[i];
>> +		for (j =3D 0; j < pmx->reg_bank_size[i] / 4; j++)
>> +			*backup_regs++ =3D readl(regs++);
>> +	}
>> +
>> +	return pinctrl_force_sleep(pmx->pctl);
>> +}
>> +
>> +static void __maybe_unused tegra_pinctrl_resume(void)
>> +{
>> +	u32 *backup_regs =3D pmx->backup_regs;
>> +	u32 *regs;
>> +	u32 val;
>> +	int i, j;
>> +
>> +	for (i =3D 0; i < pmx->nbanks; i++) {
>> +		regs =3D pmx->regs[i];
>> +		for (j =3D 0; j < pmx->reg_bank_size[i] / 4; j++)
>> +			writel(*backup_regs++, regs++);
>> +	}
>> +
>> +	if (pmx->soc->has_park_padcfg) {
>> +		val =3D pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
>> +		val &=3D ~EMMC_DPD_PARKING;
>> +		pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
>> +
>> +		val =3D pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
>> +		val &=3D ~EMMC_DPD_PARKING;
>> +		pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
>> +	}
>> +}
>>
> But the CFGPADCTRL registers are already programmed by restoring the
> backup_regs and hence the relevant EMMC's are already unparked. Hence
> why do you need to force-unpark both of the EMMC's? What if EMMC is
> unpopulated on a board, why do you need to unpark it then?

PARK bit for EMMC2/EMMC4 (EMMC2_PAD_CFGPADCTRL and EMMC4_PAD_CFGPADCTRL)=20
are not part of pinmux.

They are part of CFGPADCTRL register so pinctrl driver pingroup doesn't=20
include these registers.

backup_regs doesn't take care of this and need to handled separately for=20
Tegra210.


During resume we have to clear PARK bit for the pads on Tegra210 and=20
this is not related to presence/absence of eMMC on the board.

PAD is parked during LP0 entry to have it in DPD mode and it stays in=20
DPD till its cleared by SW on resume.
