Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2BBA37D08
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 21:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbfFFTNU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 15:13:20 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1306 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728690AbfFFTNU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 15:13:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf965cc0001>; Thu, 06 Jun 2019 12:13:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Jun 2019 12:13:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Jun 2019 12:13:18 -0700
Received: from [10.110.103.56] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Jun
 2019 19:13:18 +0000
Subject: Re: [PATCH V2 07/12] clk: tegra: support for Tegra210 clocks
 suspend-resume
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
 <1559084936-4610-8-git-send-email-skomatineni@nvidia.com>
 <20190606181711.744502083D@mail.kernel.org>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <08e34220-4cec-377e-40eb-107d2c505dd7@nvidia.com>
Date:   Thu, 6 Jun 2019 12:13:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606181711.744502083D@mail.kernel.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559848396; bh=0Hw0EUJ8/gngamwlZemHyuBastDEP2AlCa4ErpjBa6E=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=LGpviftz6xVaGXPS1TxRHWtjO/LUF6Ok3SBKR0DqeF85NomSyjpaogRie7zv6HdGl
         IaOsPRb0Dr2eYp6Va3zGWp+qljGl3C5TjUntHdl+sHFSVEchxpvDqg+AsCM0siHcyT
         /wzew56jm1jxfLZ1mxFWhqDE6reu2BUhhM0WM65F6DZW9WAMqxiOZDHWZHfo7logt8
         nZ14fhlJz9Jomwq/E3DQxH2JV/gR2ZnU2ZHyPvzfrl8NXBNbkL+hX6ulKwZ6aNj1fI
         qx9QnYd7JltyNk8DRQErQoAAaDHIPkg6kw3ISj5T81Mgllr3wkta24FgFd0I+FrMxn
         BT16wdnc1CsJw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/6/19 11:17 AM, Stephen Boyd wrote:
> Quoting Sowjanya Komatineni (2019-05-28 16:08:51)
>> @@ -3381,6 +3398,367 @@ static struct tegra_clk_init_table init_table[] =
__initdata =3D {
>>          { TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
>>   };
>>  =20
>> +#ifdef CONFIG_PM_SLEEP
>> +static unsigned long pll_c_rate, pll_c2_rate, pll_c3_rate, pll_x_rate;
>> +static unsigned long pll_c4_rate, pll_d2_rate, pll_dp_rate;
>> +static unsigned long pll_re_vco_rate, pll_d_rate, pll_a_rate, pll_a1_ra=
te;
>> +static unsigned long pll_c_out1_rate;
>> +static unsigned long pll_a_out0_rate, pll_c4_out3_rate;
>> +static unsigned long pll_p_out_rate[5];
>> +static unsigned long pll_u_out1_rate, pll_u_out2_rate;
>> +static unsigned long pll_mb_rate;
>> +static u32 pll_m_v;
>> +static u32 pll_p_outa, pll_p_outb;
>> +static u32 pll_re_out_div, pll_re_out_1;
>> +static u32 cpu_softrst_ctx[3];
>> +static u32 cclkg_burst_policy_ctx[2];
>> +static u32 cclklp_burst_policy_ctx[2];
>> +static u32 sclk_burst_policy_ctx[3];
>> +static u32 sclk_ctx, spare_ctx, misc_clk_enb_ctx, clk_arm_ctx;
> This is a lot of state to maintain globally. Can it go into a container
> struct so we can get docs and understand what's going on a little
> better?
>
Will revisit and change in next version along with using clk driver=20
save_context and restore_context callbacks.
>> +
>> +static struct platform_device *dfll_pdev;
>> +#define car_readl(_base, _off) \
>> +       readl_relaxed(clk_base + (_base) + ((_off) * 4))
>> +#define car_writel(_val, _base, _off) \
>> +       writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
>> +
>> +static u32 *periph_clk_src_ctx;
>> +struct periph_source_bank {
>> +       u32 start;
>> +       u32 end;
> Do these need to be u32 or could they be u16?
WIll update in next version of this patch
>> +};
>> +
>> +static struct periph_source_bank periph_srcs[] =3D {
> Can this be const?
WIll update in next version of this patch
>
>> +       [0] =3D {
>> +               .start =3D 0x100,
>> +               .end =3D 0x198,
>> +       },
>> +       [1] =3D {
>> +               .start =3D 0x1a0,
>> +               .end =3D 0x1f8,
>> +       },
>> +       [2] =3D {
>> +               .start =3D 0x3b4,
>> +               .end =3D 0x42c,
>> +       },
>> +       [3] =3D {
>> +               .start =3D 0x49c,
>> +               .end =3D 0x4b4,
>> +       },
>> +       [4] =3D {
>> +               .start =3D 0x560,
>> +               .end =3D 0x564,
>> +       },
>> +       [5] =3D {
>> +               .start =3D 0x600,
>> +               .end =3D 0x678,
>> +       },
>> +       [6] =3D {
>> +               .start =3D 0x694,
>> +               .end =3D 0x6a0,
>> +       },
>> +       [7] =3D {
>> +               .start =3D 0x6b8,
>> +               .end =3D 0x718,
>> +       },
>> +};
>> +
>> +/* This array lists the valid clocks for each periph clk bank */
>> +static u32 periph_clks_on[] =3D {
> const?
WIll update in next version of this patch
>> +       0xdcd7dff9,
>> +       0x87d1f3e7,
>> +       0xf3fed3fa,
>> +       0xffc18cfb,
>> +       0x793fb7ff,
>> +       0x3fe66fff,
>> +       0xfc1fc7ff,
> What are these magic numbers?

These are the hard coded values for peripheral clock enable register=20
where it enables all clocks before restoring clock sources to proper rate.


>> +};
>> +
>> +static inline unsigned long clk_get_rate_nolock(struct clk *clk)
>> +{
>> +       if (IS_ERR_OR_NULL(clk)) {
> NULL is a valid clk pointer. Typically usage of IS_ERR_OR_NULL() is
> wrong.
>
>> +               WARN_ON(1);
>> +               return 0;
>> +       }
>> +
>> +       return clk_hw_get_rate(__clk_get_hw(clk));
>> +}
>> +
>> +static inline struct clk *pll_p_clk(unsigned int x)
>> +{
>> +       if (x < 4) {
> What is magic value 4?

PLLP outs OUT1 through OUT4 are defined sequential in tegra210-car.h and=20
OUT5=C2=A0 is not so retrieving value from clks using sequential indexing f=
or=20
up to OUT4.

Will update in next version to use define

>> +               return clks[TEGRA210_CLK_PLL_P_OUT1 + x];
>> +       } else if (x !=3D 4) {
>> +               WARN_ON(1);
>> +               return NULL;
>> +       } else {
>> +               return clks[TEGRA210_CLK_PLL_P_OUT5];
>> +       }
>> +}
>> +
> [..]
>> +
>> +static void tegra210_clk_resume(void)
>> +{
> [..]
>> +       fence_udelay(2, clk_base);
>> +       for (i =3D 0; i < BURST_POLICY_REG_SIZE; i++) {
>> +               car_writel(cclklp_burst_policy_ctx[i], CCLKLP_BURST_POLI=
CY, i);
>> +               car_writel(sclk_burst_policy_ctx[i], SCLK_BURST_POLICY, =
i);
>> +       }
>> +       car_writel(sclk_burst_policy_ctx[i], SYS_CLK_DIV, 0);
>> +
>> +       car_writel(sclk_ctx, SYSTEM_CLK_RATE, 0);
>> +       car_writel(spare_ctx, SPARE_REG0, 0);
>> +       car_writel(misc_clk_enb_ctx, MISC_CLK_ENB, 0);
>> +       car_writel(clk_arm_ctx, CLK_MASK_ARM, 0);
>> +
>> +       /* enable all clocks before configuring clock sources */
>> +       tegra_clk_periph_force_on(periph_clks_on, ARRAY_SIZE(periph_clks=
_on),
>> +                                 clk_base);
>> +
>> +       wmb();
> Please add a comment before barriers so we know what they're for.
Will do in next version of this patch.
>> +       fence_udelay(2, clk_base);
>> +
