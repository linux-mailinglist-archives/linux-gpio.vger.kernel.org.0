Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40C3B4A885
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 19:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbfFRRfE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 13:35:04 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:10677 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729586AbfFRRfD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 13:35:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0920c60002>; Tue, 18 Jun 2019 10:35:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 10:35:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 10:35:01 -0700
Received: from [10.2.168.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 17:34:58 +0000
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Stephen Warren <swarren@wwwdotorg.org>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>,
        <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
 <7706a287-44b7-3ad6-37ff-47e97172a798@gmail.com>
 <a23ffbae-dd85-c023-7aae-3b81e0b17ebc@gmail.com>
 <fd415362-7479-6f98-c8db-1b7758fd3f1d@wwwdotorg.org>
 <e53bf16a-681e-da31-1e9c-4ed2a24ed3a6@nvidia.com>
Message-ID: <cff9b6a2-dc33-d03b-9945-799b158deb07@nvidia.com>
Date:   Tue, 18 Jun 2019 10:34:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e53bf16a-681e-da31-1e9c-4ed2a24ed3a6@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560879302; bh=EtLjwWpiDtqSfPhNA/8G8Clz5OAG+A5COmGeaCrkKVg=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=kwGAzBsQ1yoTWwKlo2/UOXv2gkDJ8firGCWiN14gqHzMxIIzL+NJZ9lpPELHx7++8
         C93tekf3G0sFEXan2CyLBApX5uH4osQ5xuNl+ata+wnHZmNVrOtlPPhO6hhKsV/Juf
         bZZ27nnu7W7H0ZnSISHtqcoPE+/xNqqhYTqKlosqswoYZXizfVaeos2MrmAZ08rpAS
         yLrxRqjT/pGG5gMZ13xiR+i9Huo6g16m5gpObtCMD/6v8RkLqVDaMmayD+7Pe8lziR
         FxzKA/nr4019w/Sj8inE7uex06rlPkDCg+nyeUgJDyr2rcvucvqnbVPNXZILdkVwtR
         xtp0jurZ5tT0Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/18/19 9:50 AM, Sowjanya Komatineni wrote:
>
> On 6/18/19 8:41 AM, Stephen Warren wrote:
>> On 6/18/19 3:30 AM, Dmitry Osipenko wrote:
>>> 18.06.2019 12:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 18.06.2019 10:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> This patch adds suspend and resume support for Tegra pinctrl driver
>>>>> and registers them to syscore so the pinmux settings are restored
>>>>> before the devices resume.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.c=C2=A0=C2=A0=C2=A0 | 62=20
>>>>> ++++++++++++++++++++++++++++++++
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 5 +++
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra114.c |=C2=A0 1 +
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra124.c |=C2=A0 1 +
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra20.c=C2=A0 |=C2=A0 1 +
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra30.c=C2=A0 |=C2=A0 1 +
>>>>> =C2=A0 7 files changed, 84 insertions(+)
>>>>>
>>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c=20
>>>>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>> index 34596b246578..ceced30d8bd1 100644
>>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>> @@ -20,11 +20,16 @@
>>>>> =C2=A0 #include <linux/pinctrl/pinmux.h>
>>>>> =C2=A0 #include <linux/pinctrl/pinconf.h>
>>>>> =C2=A0 #include <linux/slab.h>
>>>>> +#include <linux/syscore_ops.h>
>>>>> =C2=A0 =C2=A0 #include "../core.h"
>>>>> =C2=A0 #include "../pinctrl-utils.h"
>>>>> =C2=A0 #include "pinctrl-tegra.h"
>>>>> =C2=A0 +#define EMMC2_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1c8
>>>>> +#define EMMC4_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1e0
>>>>> +#define EMMC_DPD_PARKING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x1fff << 14)
>>>>> +
>>>>> =C2=A0 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u=
32=20
>>>>> reg)
>>>>> =C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return readl(pmx->regs[bank] + reg);
>>>>> @@ -619,6 +624,48 @@ static void=20
>>>>> tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (pmx->soc->has_park_padcfg) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx, 0,=
 EMMC2_PAD_CFGPADCTRL_0);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PARKIN=
G;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0, E=
MMC2_PAD_CFGPADCTRL_0);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx, 0,=
 EMMC4_PAD_CFGPADCTRL_0);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PARKIN=
G;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0, E=
MMC4_PAD_CFGPADCTRL_0);
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +}
>>>>
>>>> Is there any reason why parked_bit can't be changed to=20
>>>> parked_bitmask like I was
>>>> asking in a comment to v2?
>>>>
>>>> I suppose that it's more preferable to keep pinctrl-tegra.c=20
>>>> platform-agnostic for
>>>> consistency when possible, hence adding platform specifics here=20
>>>> should be discouraged.
>>>> And then the parked_bitmask will also result in a proper hardware=20
>>>> description in the code.
>>>>
>>>
>>> I'm now also vaguely recalling that Stephen Warren had some kind of=20
>>> a "code generator"
>>> for the pinctrl drivers. So I guess all those tables were=20
>>> auto-generated initially.
>>>
>>> Stephen, maybe you could adjust the generator to take into account=20
>>> the bitmask (of
>>> course if that's a part of the generated code) and then re-gen it=20
>>> all for Sowjanya?
>>
>> https://github.com/NVIDIA/tegra-pinmux-scripts holds the scripts that=20
>> generate tegra-pinctrlNNN.c. See soc-to-kernel-pinctrl-driver.py.=20
>> IIRC, tegra-pinctrl.c (the core file) isn't auto-generated. Sowjanya=20
>> is welcome to send a patch to that repo if the code needs to be updated.
>
>
> Hi Dmitry,
>
> Just want to be clear on my understanding of your request.
>
> "change parked_bit to parked_bitmask" are you requested to change=20
> parked_bit of PINGROUP and DRV_PINGROUP to use bitmask value rather=20
> than bit position inorder to have parked bit configuration for EMMC=20
> PADs as well to happen by masking rather than checking for existence=20
> of parked_bit?
>
> Trying to understand the reason/benefit for changing parked_bit to=20
> parked_bitmask.
Also, Park bits in CFGPAD registers are not common for all CFGPAD=20
registers. Park bits are available only for EMMC and also those bits are=20
used for something else on other CFGPAD registers so bitmask can't be=20
common and this also need an update to DRV_PINGROUP macro args just only=20
to handle EMMC parked_bitmask. So not sure of the benefit in using=20
bitmask rather than parked_bit
>
> thanks
>
> Sowjanya
>
