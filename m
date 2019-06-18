Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8F1F4A79A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 18:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbfFRQus (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 12:50:48 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7884 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729327AbfFRQus (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 12:50:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0916660002>; Tue, 18 Jun 2019 09:50:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 09:50:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 09:50:45 -0700
Received: from [10.2.168.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 16:50:42 +0000
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <e53bf16a-681e-da31-1e9c-4ed2a24ed3a6@nvidia.com>
Date:   Tue, 18 Jun 2019 09:50:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fd415362-7479-6f98-c8db-1b7758fd3f1d@wwwdotorg.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560876646; bh=5ewJKPP9x+yjrdVa+IF7R1TIqyJxyuRq4n8ATlmTSi8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=oLXgwoYJsuaKPA+P5LeW5/e81zxqAoyQVYEKM/myVLbwzYNRQukxcYGG6Ydohv2hz
         aPpBNb8iAHRVg9Rc+rrtwi8qasw1FXgrJDCDAIlsgPE3nYjahbaKH9IUElaDuUdmok
         vfXv9Fz0FM6nhVuJ20fOoZquNmCMm2qirXnm3Mx+ThR9L4VpsLJn0Fl7sVl2/eN1t4
         +GDfH5FMAaOWxHgD/Tb3l5T0XzmHOlEFOvDZCNO3FXBLVBAXzTi4bdlSJlrEkNjQmu
         EELGsx3xxevMd3oUXHgO/rvxuyY6KHFFQZy0QVeTTNtWouPa5jIEG0+RwB1/hng/C+
         SoQw6VJNLK5Zw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/18/19 8:41 AM, Stephen Warren wrote:
> On 6/18/19 3:30 AM, Dmitry Osipenko wrote:
>> 18.06.2019 12:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 18.06.2019 10:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> This patch adds suspend and resume support for Tegra pinctrl driver
>>>> and registers them to syscore so the pinmux settings are restored
>>>> before the devices resume.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.c=C2=A0=C2=A0=C2=A0 | 62=20
>>>> ++++++++++++++++++++++++++++++++
>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 5 +++
>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra114.c |=C2=A0 1 +
>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra124.c |=C2=A0 1 +
>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra20.c=C2=A0 |=C2=A0 1 +
>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra30.c=C2=A0 |=C2=A0 1 +
>>>> =C2=A0 7 files changed, 84 insertions(+)
>>>>
>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c=20
>>>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> index 34596b246578..ceced30d8bd1 100644
>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> @@ -20,11 +20,16 @@
>>>> =C2=A0 #include <linux/pinctrl/pinmux.h>
>>>> =C2=A0 #include <linux/pinctrl/pinconf.h>
>>>> =C2=A0 #include <linux/slab.h>
>>>> +#include <linux/syscore_ops.h>
>>>> =C2=A0 =C2=A0 #include "../core.h"
>>>> =C2=A0 #include "../pinctrl-utils.h"
>>>> =C2=A0 #include "pinctrl-tegra.h"
>>>> =C2=A0 +#define EMMC2_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1c8
>>>> +#define EMMC4_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1e0
>>>> +#define EMMC_DPD_PARKING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x1fff << 14)
>>>> +
>>>> =C2=A0 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u3=
2=20
>>>> reg)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return readl(pmx->regs[bank] + reg);
>>>> @@ -619,6 +624,48 @@ static void=20
>>>> tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (pmx->soc->has_park_padcfg) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx, 0, =
EMMC2_PAD_CFGPADCTRL_0);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PARKING=
;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0, EM=
MC2_PAD_CFGPADCTRL_0);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx, 0, =
EMMC4_PAD_CFGPADCTRL_0);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PARKING=
;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0, EM=
MC4_PAD_CFGPADCTRL_0);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +}
>>>
>>> Is there any reason why parked_bit can't be changed to=20
>>> parked_bitmask like I was
>>> asking in a comment to v2?
>>>
>>> I suppose that it's more preferable to keep pinctrl-tegra.c=20
>>> platform-agnostic for
>>> consistency when possible, hence adding platform specifics here=20
>>> should be discouraged.
>>> And then the parked_bitmask will also result in a proper hardware=20
>>> description in the code.
>>>
>>
>> I'm now also vaguely recalling that Stephen Warren had some kind of a=20
>> "code generator"
>> for the pinctrl drivers. So I guess all those tables were=20
>> auto-generated initially.
>>
>> Stephen, maybe you could adjust the generator to take into account=20
>> the bitmask (of
>> course if that's a part of the generated code) and then re-gen it all=20
>> for Sowjanya?
>
> https://github.com/NVIDIA/tegra-pinmux-scripts holds the scripts that=20
> generate tegra-pinctrlNNN.c. See soc-to-kernel-pinctrl-driver.py.=20
> IIRC, tegra-pinctrl.c (the core file) isn't auto-generated. Sowjanya=20
> is welcome to send a patch to that repo if the code needs to be updated.


Hi Dmitry,

Just want to be clear on my understanding of your request.

"change parked_bit to parked_bitmask" are you requested to change=20
parked_bit of PINGROUP and DRV_PINGROUP to use bitmask value rather than=20
bit position inorder to have parked bit configuration for EMMC PADs as=20
well to happen by masking rather than checking for existence of parked_bit?

Trying to understand the reason/benefit for changing parked_bit to=20
parked_bitmask.


thanks

Sowjanya

