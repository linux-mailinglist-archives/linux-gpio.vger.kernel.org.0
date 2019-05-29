Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946062E76D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 23:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfE2V1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 17:27:48 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10377 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfE2V1r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 17:27:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ceef9500001>; Wed, 29 May 2019 14:27:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 14:27:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 May 2019 14:27:44 -0700
Received: from [10.110.103.86] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 May
 2019 21:27:43 +0000
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
 <d9d54f05-b0bf-6e65-9308-45e94454301e@nvidia.com>
 <11fe4d9a-6d8e-bc4f-b764-a849571fb6b0@gmail.com>
 <0f087659-cdde-9f89-55a2-d399ee539431@nvidia.com>
 <34480b14-48da-2745-086d-6a8900c5a049@gmail.com>
 <fc1f3c56-ab6b-478e-75d8-797d8e3bf21f@nvidia.com>
 <5e074715-fd8c-908a-b880-9f1fd03a244f@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <c4e9fc53-f457-3e1d-8c73-8b98c30d9c69@nvidia.com>
Date:   Wed, 29 May 2019 14:27:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5e074715-fd8c-908a-b880-9f1fd03a244f@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559165264; bh=jBNTDZNhcuMESM/DvM0sJxQRJ8rLBwbERO65J0Pnklc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=ZZgc5Ag8FIuU+IG9Ua8kqCsOCzJyL6VXM+frhngr/gq9QRNpic0SX0V4p+faTTezp
         b1FTbVRDBeZEH/jyd8TiqHSoboJOgTzgbo61OyzLITPHbDluRRwFxAvkqRMS4S+WJL
         RFTJ9zEfLu5b3P1OpFUQ/T249pnUsqNqbFw7MbIC212iiJODYfJz0RA53qNSdGftbc
         mIc/OfNyVDMZnbCJ6V4Wt9PjbvVCa3oNuNT1ktc8WMMScF5jbET3j2qpPA2+v8hNGX
         VeGgpCHjbl+BNLiuUA1WAmsxIVvmA2h0c375H3LVJ8esRrAoSctVcG+ipf12iZdyPn
         2FsUvkYQZXaCA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/29/19 2:25 PM, Dmitry Osipenko wrote:
> 29.05.2019 23:56, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 5/29/19 1:47 PM, Dmitry Osipenko wrote:
>>> 29.05.2019 23:11, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 5/29/19 12:32 PM, Dmitry Osipenko wrote:
>>>>> 29.05.2019 21:14, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> On 5/29/19 8:29 AM, Dmitry Osipenko wrote:
>>>>>>> 29.05.2019 2:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>>> This patch adds suspend and resume support for Tegra pinctrl drive=
r
>>>>>>>> and registers them to syscore so the pinmux settings are restored
>>>>>>>> before the devices resume.
>>>>>>>>
>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>> ---
>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.c=C2=A0=C2=
=A0=C2=A0 | 68
>>>>>>>> +++++++++++++++++++++++++++++++-
>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.h=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 ++
>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/pinctrl/tegra/pinctrl-tegra114.c |=C2=
=A0 1 +
>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/pinctrl/tegra/pinctrl-tegra124.c |=C2=
=A0 1 +
>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/pinctrl/tegra/pinctrl-tegra20.c=C2=A0 =
|=C2=A0 1 +
>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/pinctrl/tegra/pinctrl-tegra210.c |=C2=
=A0 1 +
>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/pinctrl/tegra/pinctrl-tegra30.c=C2=A0 =
|=C2=A0 1 +
>>>>>>>>  =C2=A0=C2=A0=C2=A0 7 files changed, 75 insertions(+), 1 deletion(=
-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>>>>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>>>>> index a5008c066bac..bdc47e62c457 100644
>>>>>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>>>>> @@ -28,11 +28,18 @@
>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/pinctrl/pinmux.h>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/pinctrl/pinconf.h>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/slab.h>
>>>>>>>> +#include <linux/syscore_ops.h>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0 #include "../core.h"
>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include "../pinctrl-utils.h"
>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include "pinctrl-tegra.h"
>>>>>>>>  =C2=A0=C2=A0=C2=A0 +#define EMMC2_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1c8
>>>>>>>> +#define EMMC4_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1e0
>>>>>>>> +#define EMMC_DPD_PARKING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x1fff << 14)
>>>>>>>> +
>>>>>>>> +static struct tegra_pmx *pmx;
>>>>>>>> +
>>>>>>>>  =C2=A0=C2=A0=C2=A0 static inline u32 pmx_readl(struct tegra_pmx *=
pmx, u32 bank, u32
>>>>>>>> reg)
>>>>>>>>  =C2=A0=C2=A0=C2=A0 {
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return readl(pmx->regs=
[bank] + reg);
>>>>>>>> @@ -629,6 +636,50 @@ static void
>>>>>>>> tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>  =C2=A0=C2=A0=C2=A0 }
>>>>>>>>  =C2=A0=C2=A0=C2=A0 +static int __maybe_unused tegra_pinctrl_suspe=
nd(void)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 *backup_regs =3D pmx->backup_regs;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 *regs;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 int i, j;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < pmx->nbanks; i++) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs =3D pmx->regs[i];
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j < pmx-=
>reg_bank_size[i] / 4; j++)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *backup_regs++ =3D readl(regs++);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 return pinctrl_force_sleep(pmx->pctl);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static void __maybe_unused tegra_pinctrl_resume(void)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 *backup_regs =3D pmx->backup_regs;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 *regs;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 val;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 int i, j;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < pmx->nbanks; i++) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs =3D pmx->regs[i];
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j < pmx-=
>reg_bank_size[i] / 4; j++)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 writel(*backup_regs++, regs++);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (pmx->soc->has_park_padcfg) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx,=
 0, EMMC2_PAD_CFGPADCTRL_0);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PAR=
KING;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0=
, EMMC2_PAD_CFGPADCTRL_0);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx,=
 0, EMMC4_PAD_CFGPADCTRL_0);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PAR=
KING;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0=
, EMMC4_PAD_CFGPADCTRL_0);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +}
>>>>>>>>
>>>>>>> But the CFGPADCTRL registers are already programmed by restoring th=
e
>>>>>>> backup_regs and hence the relevant EMMC's are already unparked. Hen=
ce
>>>>>>> why do you need to force-unpark both of the EMMC's? What if EMMC is
>>>>>>> unpopulated on a board, why do you need to unpark it then?
>>>>>> PARK bit for EMMC2/EMMC4 (EMMC2_PAD_CFGPADCTRL and
>>>>>> EMMC4_PAD_CFGPADCTRL)
>>>>>> are not part of pinmux.
>>>>>>
>>>>>> They are part of CFGPADCTRL register so pinctrl driver pingroup
>>>>>> doesn't
>>>>>> include these registers.
>>>>> I'm looking at the tegra210_groups and it clearly has these both
>>>>> registers as a part of pinctrl setup because the rest of the bits
>>>>> configure drive of the pads.
>>>>>
>>>>>  =C2=A0=C2=A0From pinctrl-tegra210.c:
>>>>>
>>>>> #define DRV_PINGROUP_REG_A=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x8d4=C2=A0=C2=A0=C2=A0 /* bank 0 */
>>>>>
>>>>> DRV_PINGROUP(sdmmc2, 0xa9c, 2,=C2=A0 6,=C2=A0 8,=C2=A0 6,=C2=A0 28, 2=
,=C2=A0 30, 2),
>>>>> DRV_PINGROUP(sdmmc4, 0xab4, 2,=C2=A0 6,=C2=A0 8,=C2=A0 6,=C2=A0 28, 2=
,=C2=A0 30, 2),
>>>>>
>>>>> ...
>>>>>
>>>>> 0xa9c - 0x8d4 =3D 0x1c8
>>>>> 0xab4 - 0x8d4 =3D 0x1e0
>>>>>
>>>>> Hence the PARK bits are already getting unset by restoring the
>>>>> backup_regs because the CFGPADCTRL registers are a part of the "bank =
0"
>>>>> registers.
>>>>>
>>>>> Am I still missing something?
>>>> DRV_PINGROUP parked_bit is -1 and will not be programmed so store and
>>>> restore will not take care of it.
>>>>
>>>> Also EMMC PADCFG is the only padcfg register which has parked bit and
>>>> for other IO pads its part of pinmux
>>> You're storing raw values of all of the PINCTRL registers and then
>>> restoring the raw values (if I'm not misreading that part on the patch)=
,
>>> it's absolutely meaningless that DRV_PINGROUP doesn't define the PARK
>>> bits.
>>>
>>> In a result, the backup_regs array contains raw CFGPADCTRL value with
>>> the PARK bits being unset on store, that value is written out on the
>>> restore as-is and hence the PARK bits are getting unset as well.
>>>
>>> And why DRV_PINGROUP misses PARK bits for the EMMC's? Looks like a
>>> driver's drawback that need to be addressed.
>> Parked bits from padcfg are available only for couple of EMMC registers.
>>
>> default PARK bits are set so stored value contains park bit set. on
>> resume, after restoring park bit is cleared.
> TRM says that the PARK bits are set on HW reset (and on DPD IIUC) and
> then SW should unset the bits. I assume that the PARK bits of the EMMC
> pads are unset by bootloader and that's why it doesn't cause problems
> for kernel, in oppose to PARK bits of the rest of pinmux that are unset
> by the driver in tegra_pinctrl_clear_parked_bits() on driver's probe.
>
>> on subsequence DPD entry, stored value contains park bit 0 and HW clamps
>> park bit to logic 1 during DPD entry and cleared again on resume.
> I assume that EMMC won't work properly if pads are "parked" and the PARK
> bits should be in unset state on kernel boot-up as I wrote above, hence
> stored value should always contain 0 for the EMMC PARK bits. No?

On bootup, pads still works. PARK bit is to keep pads in DPD once they=20
enter into DPD (LP0) and on resume they need to be cleared to be out of DPD


