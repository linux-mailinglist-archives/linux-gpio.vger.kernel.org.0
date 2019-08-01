Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D41EF7E1E8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 20:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732082AbfHASGJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 14:06:09 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17957 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731642AbfHASGI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 14:06:08 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d432a0f0002>; Thu, 01 Aug 2019 11:06:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 01 Aug 2019 11:06:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 01 Aug 2019 11:06:06 -0700
Received: from [10.110.103.107] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Aug
 2019 18:06:05 +0000
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
 <b5a58bfc-c777-886f-d902-f499ec38e2ae@nvidia.com>
 <3b55a112-42a6-212b-beea-10b64d5341d9@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <cd9c5116-4235-758c-7a09-d7185d52b22b@nvidia.com>
Date:   Thu, 1 Aug 2019 11:06:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <3b55a112-42a6-212b-beea-10b64d5341d9@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564682768; bh=a/b87Pb8fvKcIFpkvTunCaHBVyc5/LnfxNoUaEcDg5I=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=qCoC5rhblage217ft9hYs6jutEKqU9rc/h3lWC/TfMqvABQEzG6VldIDeVkeqURk4
         JHJ9qQB/1bT0oxNaSkENzZY1T2YjUsofCpBUyAXKWcWfAKqsu2bYTR21WCZby+VOLb
         LQUE1X/gXDloaEVCT2KjXpY0eKsYwGiJosjLw+TYfZEQvtMdUI+96F/l0eN0qEahUY
         8Dw/ed7zMdl8WTz1yAILTs1NLcksTchVpiBVUHpn9pusfUfNQ/E2+FJIdhCQCGEgKp
         dRjdXn9fdczXH9YSWHuku9Sd6PCQpoGNpLdcs7jvLu/jVhKFMD56NOw1pUj6Faow7M
         etjfkvr4ke+JQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/1/19 3:53 AM, Dmitry Osipenko wrote:
> 01.08.2019 0:04, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/31/19 4:11 AM, Dmitry Osipenko wrote:
>>> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> This patch adds support for saving OSC clock frequency and the
>>>> drive-strength during OSC clock init and creates an API to restore
>>>> OSC control register value from the saved context.
>>>>
>>>> This API is invoked by Tegra210 clock driver during system resume
>>>> to restore the=C2=A0 OSC clock settings.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/clk/tegra/clk-tegra-fixed.c | 15 +++++++++++++++
>>>>  =C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>>  =C2=A0 2 files changed, 16 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-tegra-fixed.c
>>>> b/drivers/clk/tegra/clk-tegra-fixed.c
>>>> index 8d91b2b191cf..7c6c8abfcde6 100644
>>>> --- a/drivers/clk/tegra/clk-tegra-fixed.c
>>>> +++ b/drivers/clk/tegra/clk-tegra-fixed.c
>>>> @@ -17,6 +17,10 @@
>>>>  =C2=A0 #define OSC_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x50
>>>>  =C2=A0 #define OSC_CTRL_OSC_FREQ_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 28
>>>>  =C2=A0 #define OSC_CTRL_PLL_REF_DIV_SHIFT=C2=A0=C2=A0=C2=A0 26
>>>> +#define OSC_CTRL_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (0x3f2 |=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0xf << OSC_CTRL_OSC_FREQ_SHI=
FT))
>>>> +
>>>> +static u32 osc_ctrl_ctx;
>>>>  =C2=A0 =C2=A0 int __init tegra_osc_clk_init(void __iomem *clk_base, s=
truct
>>>> tegra_clk *clks,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *input_freqs, u=
nsigned int num,
>>>> @@ -29,6 +33,7 @@ int __init tegra_osc_clk_init(void __iomem
>>>> *clk_base, struct tegra_clk *clks,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned osc_idx;
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D readl_relaxed(clk_base =
+ OSC_CTRL);
>>>> +=C2=A0=C2=A0=C2=A0 osc_ctrl_ctx =3D val & OSC_CTRL_MASK;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 osc_idx =3D val >> OSC_CTRL_OSC_FREQ_S=
HIFT;
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (osc_idx < num)
>>>> @@ -96,3 +101,13 @@ void __init tegra_fixed_clk_init(struct tegra_clk
>>>> *tegra_clks)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *dt_clk =3D cl=
k;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 }
>>>> +
>>>> +void tegra_clk_osc_resume(void __iomem *clk_base)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 u32 val;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 val =3D readl_relaxed(clk_base + OSC_CTRL) & ~OSC_=
CTRL_MASK;
>>>> +=C2=A0=C2=A0=C2=A0 val |=3D osc_ctrl_ctx;
>>>> +=C2=A0=C2=A0=C2=A0 writel_relaxed(val, clk_base + OSC_CTRL);
>>> Why a full raw u32 OSC_CTRL value couldn't be simply saved and restored=
?
>> Storing and restoring only required fields to avoid accidental
>> misconfiguration.
>>
>> OSC_CTRL register has other bits (PLL_REF_DIV) which are configured by
>> BR depending on OSC_FREQ and also setting PLL_REF_DIV while PLLS are in
>> use is not safe.
> I'm looking at the clk-driver sources and see that none of the Tegra
> drivers ever change the OSC_CTRL configuration, T30/114 even have
> #defines for the OSC_CTRL that are unused.
>
> So, this leads to a question.. does any bootloader really ever change
> the OSC_CTRL such that it differs after resume from suspend in
> comparison to the value at the time of kernel's booting up?

For Tegra210, bootloader programs OSC_CTRL register for drivestrength=20
programming.

These settings need to be restored to the same on SC7 exit as they gets=20
reset during SC7 entry.


