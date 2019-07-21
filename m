Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3D46F66D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 00:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfGUWjS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 18:39:18 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15766 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfGUWjS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 18:39:18 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d34e9940001>; Sun, 21 Jul 2019 15:39:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 15:39:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 21 Jul 2019 15:39:15 -0700
Received: from [10.2.164.85] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 22:39:13 +0000
Subject: Re: [PATCH V6 09/21] clk: tegra: clk-super: Fix to enable PLLP
 branches to CPU
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-10-git-send-email-skomatineni@nvidia.com>
 <0c86cd7f-81b5-40c5-6f1e-796e8f13b522@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <042f4b43-7b9c-533d-2548-d903b34363da@nvidia.com>
Date:   Sun, 21 Jul 2019 15:39:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0c86cd7f-81b5-40c5-6f1e-796e8f13b522@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563748756; bh=XSn3kjHgLfdqtv9w8cD2jkXMlL/sVULliMmPPh0g6L8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=gDSWldJtoVkdcoCN2bw4JBiDPK2r40z3sQagQad2suDaDJasA834DyFHwd2RiYjAL
         7X5lrgJWg4Uk5FYmahxo7dJ3Ee4zRcbJNbLuYgKhucdCKNhVaQHBJ28sNd3a+PZGna
         hQH+nPe8Qw1Kh2Zln2PDrffFlfiTQN9ZGsNWiujSZ5gXb+bObeYln7R7uSiBm2g7JP
         AXh6+skT0m8Dvbl5RsjqQ/BsTewcVtRg+VZFvZ4DRS/JaO4wpcnigaf001bPG7ob2M
         nyl2S6go8J61uBN1CXG6sCA+0cDF+VvgBJFerRTI54p/I3k3DPwPHT6sC/OuIKQSmV
         kP3CwCkXRQc+Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/21/19 2:16 PM, Dmitry Osipenko wrote:
> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch has a fix to enable PLLP branches to CPU before changing
>> the CPU clusters clock source to PLLP for Gen5 Super clock.
>>
>> During system suspend entry and exit, CPU source will be switched
>> to PLLP and this needs PLLP branches to be enabled to CPU prior to
>> the switch.
>>
>> On system resume, warmboot code enables PLLP branches to CPU and
>> powers up the CPU with PLLP clock source.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-super.c            | 11 +++++++++++
>>   drivers/clk/tegra/clk-tegra-super-gen4.c |  4 ++--
>>   drivers/clk/tegra/clk.h                  |  4 ++++
>>   3 files changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super=
.c
>> index 39ef31b46df5..d73c587e4853 100644
>> --- a/drivers/clk/tegra/clk-super.c
>> +++ b/drivers/clk/tegra/clk-super.c
>> @@ -28,6 +28,9 @@
>>   #define super_state_to_src_shift(m, s) ((m->width * s))
>>   #define super_state_to_src_mask(m) (((1 << m->width) - 1))
>>  =20
>> +#define CCLK_SRC_PLLP_OUT0 4
>> +#define CCLK_SRC_PLLP_OUT4 5
>> +
>>   static u8 clk_super_get_parent(struct clk_hw *hw)
>>   {
>>   	struct tegra_clk_super_mux *mux =3D to_clk_super_mux(hw);
>> @@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw *hw, u=
8 index)
>>   		if (index =3D=3D mux->div2_index)
>>   			index =3D mux->pllx_index;
>>   	}
>> +
>> +	/*
>> +	 * Enable PLLP branches to CPU before selecting PLLP source
>> +	 */
>> +	if ((mux->flags & TEGRA_CPU_CLK) &&
>> +	    ((index =3D=3D CCLK_SRC_PLLP_OUT0) || (index =3D=3D CCLK_SRC_PLLP_=
OUT4)))
>> +		tegra_clk_set_pllp_out_cpu(true);
> Should somewhere here be tegra_clk_set_pllp_out_cpu(false) when
> switching from PLLP?
PLLP may be used for other CPU clusters.
>>   	val &=3D ~((super_state_to_src_mask(mux)) << shift);
>>   	val |=3D (index & (super_state_to_src_mask(mux))) << shift;
>>  =20
>> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegr=
a/clk-tegra-super-gen4.c
>> index cdfe7c9697e1..cd208d0eca2a 100644
>> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
>> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
>> @@ -180,7 +180,7 @@ static void __init tegra_super_clk_init(void __iomem=
 *clk_base,
>>   					gen_info->num_cclk_g_parents,
>>   					CLK_SET_RATE_PARENT,
>>   					clk_base + CCLKG_BURST_POLICY,
>> -					0, 4, 8, 0, NULL);
>> +					TEGRA_CPU_CLK, 4, 8, 0, NULL);
>>   		} else {
>>   			clk =3D tegra_clk_register_super_mux("cclk_g",
>>   					gen_info->cclk_g_parents,
>> @@ -201,7 +201,7 @@ static void __init tegra_super_clk_init(void __iomem=
 *clk_base,
>>   					gen_info->num_cclk_lp_parents,
>>   					CLK_SET_RATE_PARENT,
>>   					clk_base + CCLKLP_BURST_POLICY,
>> -					0, 4, 8, 0, NULL);
>> +					TEGRA_CPU_CLK, 4, 8, 0, NULL);
>>   		} else {
>>   			clk =3D tegra_clk_register_super_mux("cclk_lp",
>>   					gen_info->cclk_lp_parents,
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>> index ac6de3a0b91f..c357b49e49b0 100644
>> --- a/drivers/clk/tegra/clk.h
>> +++ b/drivers/clk/tegra/clk.h
>> @@ -694,6 +694,9 @@ struct clk *tegra_clk_register_periph_data(void __io=
mem *clk_base,
>>    * Flags:
>>    * TEGRA_DIVIDER_2 - LP cluster has additional divider. This flag indi=
cates
>>    *     that this is LP cluster clock.
>> + * TEGRA_CPU_CLK - This flag indicates this is CPU cluster clock. To us=
e PLLP
>> + * for CPU clock source, need to enable PLLP branches to CPU by setting=
 the
>> + * additional bit PLLP_OUT_CPU for gen5 super clock.
>>    */
>>   struct tegra_clk_super_mux {
>>   	struct clk_hw	hw;
>> @@ -710,6 +713,7 @@ struct tegra_clk_super_mux {
>>   #define to_clk_super_mux(_hw) container_of(_hw, struct tegra_clk_super=
_mux, hw)
>>  =20
>>   #define TEGRA_DIVIDER_2 BIT(0)
>> +#define TEGRA_CPU_CLK	BIT(1)
> I'd name this TEGRA210_CPU_CLK for clarity.
>
>>   extern const struct clk_ops tegra_clk_super_ops;
>>   struct clk *tegra_clk_register_super_mux(const char *name,
>>
> Will be better to move the tegra_clk_set_pllp_out_cpu() definition into
> this patch, otherwise this looks inconsistent for reviewer.
ok, Will move to this patch
