Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38EE0741D5
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2019 01:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387862AbfGXXJ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jul 2019 19:09:59 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9465 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387660AbfGXXJ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jul 2019 19:09:59 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d38e5410001>; Wed, 24 Jul 2019 16:09:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 24 Jul 2019 16:09:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 24 Jul 2019 16:09:56 -0700
Received: from [10.2.167.182] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Jul
 2019 23:09:54 +0000
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
To:     Dmitry Osipenko <digetx@gmail.com>,
        Marc Zyngier <marc.zyngier@arm.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
 <20c1d733-60f5-6375-c03c-639de5e41739@arm.com>
 <0bee8775-756f-adad-4597-8cad53017718@gmail.com>
 <a2ecc3ad-b7e9-9398-d59b-c7d3fbbd10bb@nvidia.com>
 <20190722193838.0d7cd2ad@why>
 <8e9f821c-3717-510d-c64f-8a1cc2452c25@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <78d5af07-2556-b60d-01d7-3684ebe7040b@nvidia.com>
Date:   Wed, 24 Jul 2019 16:09:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <8e9f821c-3717-510d-c64f-8a1cc2452c25@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564009793; bh=VLSdAR9+W67zAKWVdoz86+wcbQ6rb1+Uzd1mw8RH294=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=SdVMEYL5emd/8G9K2633IxqV/KN49aMr3dWzJPn2VFIaGFLvcy7dIaYY8AI6Hq/Zz
         IsYz6f6EzpV/WMOQl7hMBh4xik02UCf/JfxxF580qxgXnwDhWyYvfcYtnpf2O/VpZN
         3/cSKpxS1B332brBqbohEr1V7AP7smYIokQRft7YbsTBZTIvSxpM5tbiMy2EOQ8gx6
         fRjv6eAQU3vM31uuAGdUUdjfvIH0viWxEo+Y4Bv9zqGBtA+zrE60kWhl9fdYRFPu6u
         QEM/biMGUNbU6uP2LCyx9oNEr8nSKoDZDUNUbVGyJMCzRuVTh/T9Yy+VGSy3cXrNRF
         hkzAWYcj+B0yw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/22/19 4:35 PM, Dmitry Osipenko wrote:
> 22.07.2019 21:38, Marc Zyngier =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On Mon, 22 Jul 2019 09:21:21 -0700
>> Sowjanya Komatineni <skomatineni@nvidia.com> wrote:
>>
>>> On 7/22/19 3:57 AM, Dmitry Osipenko wrote:
>>>> 22.07.2019 13:13, Marc Zyngier =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 22/07/2019 10:54, Dmitry Osipenko wrote:
>>>>>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 =
entry
>>>>>>> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
>>>>>>>
>>>>>>> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend seq=
uence
>>>>>>> for Tegra210.
>>>>>>>
>>>>>>> This patch has fix for leaving the COP IRQ enabled for Tegra210 dur=
ing
>>>>>>> interrupt controller suspend operation.
>>>>>>>
>>>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>> ---
>>>>>>>    drivers/irqchip/irq-tegra.c | 20 ++++++++++++++++++--
>>>>>>>    1 file changed, 18 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegr=
a.c
>>>>>>> index e1f771c72fc4..851f88cef508 100644
>>>>>>> --- a/drivers/irqchip/irq-tegra.c
>>>>>>> +++ b/drivers/irqchip/irq-tegra.c
>>>>>>> @@ -44,6 +44,7 @@ static unsigned int num_ictlrs;
>>>>>>>   =20
>>>>>>>    struct tegra_ictlr_soc {
>>>>>>>    	unsigned int num_ictlrs;
>>>>>>> +	bool supports_sc7;
>>>>>>>    };
>>>>>>>   =20
>>>>>>>    static const struct tegra_ictlr_soc tegra20_ictlr_soc =3D {
>>>>>>> @@ -56,6 +57,7 @@ static const struct tegra_ictlr_soc tegra30_ictlr=
_soc =3D {
>>>>>>>   =20
>>>>>>>    static const struct tegra_ictlr_soc tegra210_ictlr_soc =3D {
>>>>>>>    	.num_ictlrs =3D 6,
>>>>>>> +	.supports_sc7 =3D true,
>>>>>>>    };
>>>>>>>   =20
>>>>>>>    static const struct of_device_id ictlr_matches[] =3D {
>>>>>>> @@ -67,6 +69,7 @@ static const struct of_device_id ictlr_matches[] =
=3D {
>>>>>>>   =20
>>>>>>>    struct tegra_ictlr_info {
>>>>>>>    	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
>>>>>>> +	const struct tegra_ictlr_soc *soc;
>>>>>>>    #ifdef CONFIG_PM_SLEEP
>>>>>>>    	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
>>>>>>>    	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
>>>>>>> @@ -147,8 +150,20 @@ static int tegra_ictlr_suspend(void)
>>>>>>>    		lic->cop_ier[i] =3D readl_relaxed(ictlr + ICTLR_COP_IER);
>>>>>>>    		lic->cop_iep[i] =3D readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS)=
;
>>>>>>>   =20
>>>>>>> -		/* Disable COP interrupts */
>>>>>>> -		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>>>>>> +		/*
>>>>>>> +		 * AVP/COP/BPMP-Lite is the Tegra boot processor.
>>>>>>> +		 *
>>>>>>> +		 * Tegra210 system suspend flow uses sc7entry firmware which
>>>>>>> +		 * is executed by COP/BPMP and it includes disabling COP IRQ,
>>>>>>> +		 * clamping CPU rail, turning off VDD_CPU, and preparing the
>>>>>>> +		 * system to go to SC7/LP0.
>>>>>>> +		 *
>>>>>>> +		 * COP/BPMP wakes up when COP IRQ is triggered and runs
>>>>>>> +		 * sc7entry-firmware. So need to keep COP interrupt enabled.
>>>>>>> +		 */
>>>>>>> +		if (!lic->soc->supports_sc7)
>>>>>>> +			/* Disable COP interrupts if SC7 is not supported */
>>>>>> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
>>>>>> doesn't sound correct to me. Something like 'firmware_sc7' should su=
it
>>>>>> better here.
>>>>> If what you're saying is true, then the whole patch is wrong, and the
>>>>> SC7 property should come from DT.
>>>> It should be safe to assume that all of existing Tegra210 devices use
>>>> the firmware for SC7, hence I wouldn't say that the patch is entirely
>>>> wrong. To me it's not entirely correct.
>>> Yes, all existing Tegra210 platforms uses sc7 entry firmware for SC7 an=
d
>>> AVP/COP IRQ need to be kept enabled as during suspend ATF triggers IRQ
>>> to COP for SC7 entry fw execution.
> Okay, as I already wrote before, it looks to me that a more proper
> solution should be to just remove everything related to COP from this
> driver instead of adding custom quirks for T210.
>
> The disabling / restoring of COP interrupts should be relevant only for
> the multimedia firmware on older Tegra SoCs. That firmware won't be ever
> supported in the upstream simply because NVIDIA abandoned the support
> for older hardware in the downstream and because it is not possible due
> to some legal weirdness (IIUC). The only variant for upstream is
> reverse-engineering of hardware (not the firmware BLOB) and writing
> proper opensource drivers for the upstream kernel, which we're already
> doing and have success to a some extent.
>
>> That's not the question. Dmitry says that the SC7 support is not a
>> property of the SoC, but mostly a platform decision on whether the
>> firmware supports SC7 or not.
>>
>> To me, that's a clear indication that this should not be hardcoded in
>> the driver, but instead obtained dynamically, via DT or otherwise.
> We already have an nvidia,suspend-mode property in the device-tree of
> the Power Management Controller node (all Tegra SoCs) which defines what
> suspending type is supported by a particular board.
>
>>>>>>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>>>>> Secondly, I'm also not sure why COP interrupts need to be disabled f=
or
>>>>>> pre-T210 at all, since COP is unused. This looks to me like it was
>>>>>> cut-n-pasted from downstream kernel without a good reason and could =
be
>>>>>> simply removed.
>>>>> Please verify that this is actually the case. Tegra-2 definitely need=
ed
>>>>> some level of poking, and I'm not keen on changing anything there unt=
il
>>>>> you (or someone else) has verified it on actual HW (see e307cc8941fc)=
.
>>>> Tested on Tegra20 and Tegra30, LP1 suspend-resume works perfectly fine
>>>> with all COP bits removed from the driver.
>>>>
>>>> AFAIK, the reason why downstream needed that disabling is that it uses
>>>> proprietary firmware which is running on the COP and that firmware is
>>>> usually a BLOB audio/video DEC-ENC driver which doesn't cleanup
>>>> interrupts after itself. That firmware is not applicable for the
>>>> upstream kernel, hence there is no need to care about it.
>>>>  =20
>>>>> Joseph, can you please shed some light here?
>>> SC7 entry flow uses 3rd party ATF (arm-trusted FW) blob which is the
>>> one that actually loads SC7 entry firmware and triggers IRQ to
>>> AVP/COP which causes COP to wakeup and run SC7 entry FW.
>>>
>>> So when SC7 support is enabled, IRQ need to be kept enabled and when
>>> SC7 FW starts execution, it will disable COP IRQ.
>> This looks like a lot of undocumented assumptions on what firmware
>> does, as well as what firmware *is*. What I gather from this thread is
>> that there is at least two versions of firmware (a "proprietary
>> firmware" for "downstream kernels", and another one for mainline), and
>> that they do different things.
>>
>> Given that we cannot know what people actually run, I don't think we
>> can safely remove anything unless this gets tested on the full spectrum
>> of HW/FW combination.
> I'm not sure whether multiple firmware variations exist in the wild for
> Tegra210. Maybe Sowjanya or somebody else from NVIDIA could clarify. I
> think there should be some efforts in regards to a fully opensource
> firmware on Tegra210, but I'm not following it and have no idea about
> the status.
>
> You're right that there are multiple variants of suspend-resuming flow
> on Tegra SoCs. The older 32bit Tegra SoC generations have a variety of
> options in regards to suspend-resuming, including firmware-less variants
> on platforms that are having kernel running in secure mode (dev boards,
> most of Tegra20 consumer devices) and Trusted-Foundations firmware
> variant for insecure platforms (consumer devices). And yes, vendor
> firmware creates a lot of headache in regards to bringing support into
> upstream because it usually does a lot of odd undocumented things which
> may also vary depending on a firmware version (bootloader, etc) and it
> also usually difficult to replace it with an opensource alternative due
> to a crypto signing.

Tried without this patch which keeps COP IRQ disabled and I see SC7=20
entry FW execution happens still.

Digging through the ATF FW code, I see on SC7 entry firmware loading=20
into IRAM, COP processor is reset with RESET VECTOR set to SC7 entry=20
firmware location in IRAM and on reset de-assert & unhalt COP, SC7=20
firmware starts execution.

Will remove this patch in next version...

