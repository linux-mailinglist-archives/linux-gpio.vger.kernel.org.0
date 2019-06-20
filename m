Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C97F14D563
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 19:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfFTRld (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 13:41:33 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12277 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfFTRld (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 13:41:33 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0bc5490000>; Thu, 20 Jun 2019 10:41:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 20 Jun 2019 10:41:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 20 Jun 2019 10:41:29 -0700
Received: from [10.110.103.99] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Jun
 2019 17:41:29 +0000
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add bitmask support for parked bits
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Stephen Warren <swarren@wwwdotorg.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Stefan Agner <stefan@agner.ch>,
        Dmitry Osipenko <digetx@gmail.com>,
        <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20190620170350.20224-1-thierry.reding@gmail.com>
 <20190620170350.20224-2-thierry.reding@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <9324e541-7953-801e-4b7a-2075236ed054@nvidia.com>
Date:   Thu, 20 Jun 2019 10:41:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620170350.20224-2-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561052489; bh=AI/M4WpIbqPzlfrdGYNhN06nbZJSs3HaWWR+gr2qXd0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=KGj7+ky0GSJaP3PfffKVJeBjOS9oCXKMY2JU2v/WbOaEIXYZ7O+/OSBHI6FIKiazQ
         Z0hvi1LqFSFoessnYEMIN3aCT1ayHIOvB2s2uKb494NpLkZDwzaqCUzHO6To7ZUWMT
         fvjxS86dLC/n+xR7kywlRkD2MnM9IlT87Su4z+j7GZKvYlNL4BEtyRIFvSxjQ7ZP/q
         egcX1gO6Uz/o4wk7nvzkA3f3R12LQMkNbQV8r4OZmf5VcVtYc9RsNnZgqF4C6n0CPM
         sZ3Henm1VmdvJrpItRHeiDAqhVHIZGCUXrFARkYn0Hk0tf/1vwKTb44VtpVPTf2jvI
         Lev7C2ssqoJ9Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/20/19 10:03 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Some pin groups have park bits for multiple pins in one register.
> Support this by turning the parked bit field into a parked bitmask
> field. If no parked bits are supported, the bitmask can be 0.
>
> Update the pingroup table on Tegra210, which is the only generation
> where this is supported, with the parked bitmask.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra.c    |  4 +-
>   drivers/pinctrl/tegra/pinctrl-tegra.h    |  4 +-
>   drivers/pinctrl/tegra/pinctrl-tegra114.c |  4 +-
>   drivers/pinctrl/tegra/pinctrl-tegra124.c |  4 +-
>   drivers/pinctrl/tegra/pinctrl-tegra194.c |  4 +-
>   drivers/pinctrl/tegra/pinctrl-tegra20.c  |  6 +--
>   drivers/pinctrl/tegra/pinctrl-tegra210.c | 60 ++++++++++++------------
>   drivers/pinctrl/tegra/pinctrl-tegra30.c  |  4 +-
>   8 files changed, 45 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 34596b246578..9df30809aaf6 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -613,9 +613,9 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>   
>   	for (i = 0; i < pmx->soc->ngroups; ++i) {
>   		g = &pmx->soc->groups[i];
> -		if (g->parked_bit >= 0) {
> +		if (g->parked_bitmask > 0) {
>   			val = pmx_readl(pmx, g->mux_bank, g->mux_reg);
> -			val &= ~(1 << g->parked_bit);
> +			val &= ~g->parked_bitmask;
>   			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>   		}

As parked_bit is now supported with DRV_PINGROUP, need to add check if 
name preceeds with drive_ and should use drv_bank/drv_reg OR

mux_bank/mux_reg. Otherwise this will cause a crash.


>   	}
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
> index 287702660783..105309774079 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
> @@ -96,7 +96,6 @@ struct tegra_function {
>    * @tri_reg:		Tri-state register offset.
>    * @tri_bank:		Tri-state register bank.
>    * @tri_bit:		Tri-state register bit.
> - * @parked_bit:		Parked register bit. -1 if unsupported.
>    * @einput_bit:		Enable-input register bit.
>    * @odrain_bit:		Open-drain register bit.
>    * @lock_bit:		Lock register bit.
> @@ -118,6 +117,7 @@ struct tegra_function {
>    * @slwf_bit:		Slew Falling register bit.
>    * @slwf_width:		Slew Falling field width.
>    * @drvtype_bit:	Drive type register bit.
> + * @parked_bitmask:	Parked register mask. 0 if unsupported.
>    *
>    * -1 in a *_reg field means that feature is unsupported for this group.
>    * *_bank and *_reg values are irrelevant when *_reg is -1.
> @@ -146,7 +146,6 @@ struct tegra_pingroup {
>   	s32 mux_bit:6;
>   	s32 pupd_bit:6;
>   	s32 tri_bit:6;
> -	s32 parked_bit:6;
>   	s32 einput_bit:6;
>   	s32 odrain_bit:6;
>   	s32 lock_bit:6;
> @@ -164,6 +163,7 @@ struct tegra_pingroup {
>   	s32 drvup_width:6;
>   	s32 slwr_width:6;
>   	s32 slwf_width:6;
> +	u32 parked_bitmask;
>   };
>   
>   /**
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
> index 29821c03b471..e72ab1eb2398 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
> @@ -1572,8 +1572,8 @@ static struct tegra_function tegra114_functions[] = {
>   		.lock_bit = 7,						\
>   		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
>   		.rcv_sel_bit = PINGROUP_BIT_##rcv_sel(9),		\
> -		.parked_bit = -1,					\
>   		.drv_reg = -1,						\
> +		.parked_bitmask = 0,					\
>   	}
>   
>   #define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b, drvdn_b,	\
> @@ -1593,7 +1593,6 @@ static struct tegra_function tegra114_functions[] = {
>   		.rcv_sel_bit = -1,					\
>   		.drv_reg = DRV_PINGROUP_REG(r),				\
>   		.drv_bank = 0,						\
> -		.parked_bit = -1,					\
>   		.hsm_bit = hsm_b,					\
>   		.schmitt_bit = schmitt_b,				\
>   		.lpmd_bit = lpmd_b,					\
> @@ -1606,6 +1605,7 @@ static struct tegra_function tegra114_functions[] = {
>   		.slwf_bit = slwf_b,					\
>   		.slwf_width = slwf_w,					\
>   		.drvtype_bit = PINGROUP_BIT_##drvtype(6),		\
> +		.parked_bitmask = 0,					\
>   	}
>   
>   static const struct tegra_pingroup tegra114_groups[] = {
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
> index 3616d8b97c32..26096c6b967e 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
> @@ -1741,8 +1741,8 @@ static struct tegra_function tegra124_functions[] = {
>   		.lock_bit = 7,						\
>   		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
>   		.rcv_sel_bit = PINGROUP_BIT_##rcv_sel(9),		\
> -		.parked_bit = -1,					\
>   		.drv_reg = -1,						\
> +		.parked_bitmask = 0,					\
>   	}
>   
>   #define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b, drvdn_b,	\
> @@ -1762,7 +1762,6 @@ static struct tegra_function tegra124_functions[] = {
>   		.rcv_sel_bit = -1,					\
>   		.drv_reg = DRV_PINGROUP_REG(r),				\
>   		.drv_bank = 0,						\
> -		.parked_bit = -1,					\
>   		.hsm_bit = hsm_b,					\
>   		.schmitt_bit = schmitt_b,				\
>   		.lpmd_bit = lpmd_b,					\
> @@ -1775,6 +1774,7 @@ static struct tegra_function tegra124_functions[] = {
>   		.slwf_bit = slwf_b,					\
>   		.slwf_width = slwf_w,					\
>   		.drvtype_bit = PINGROUP_BIT_##drvtype(6),		\
> +		.parked_bitmask = 0,					\
>   	}
>   
>   #define MIPI_PAD_CTRL_PINGROUP(pg_name, r, b, f0, f1)			\
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> index 957ef198850a..daf44cf240c9 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> @@ -87,7 +87,6 @@ static struct tegra_function tegra194_functions[] = {
>   		.lpmd_bit = -1,					\
>   		.lock_bit = -1,					\
>   		.hsm_bit = -1,					\
> -		.parked_bit = -1,				\
>   		.mux_bank = bank,				\
>   		.mux_bit = 0,					\
>   		.pupd_reg = ((r)),		\
> @@ -100,7 +99,8 @@ static struct tegra_function tegra194_functions[] = {
>   		.odrain_bit = e_od,				\
>   		.schmitt_bit = schmitt_b,			\
>   		.drvtype_bit = 13,				\
> -		.drv_reg = -1
> +		.drv_reg = -1,					\
> +		.parked_bitmask = 0
>   
>   #define drive_pex_l5_clkreq_n_pgg0				\
>   	DRV_PINGROUP_ENTRY_Y(0x14004, 12, 5, 20, 5, -1, -1, -1, -1, 0)
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
> index 4b7837e38fb5..0dc2cf0d05b1 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
> @@ -1989,13 +1989,13 @@ static struct tegra_function tegra20_functions[] = {
>   		.tri_reg = ((tri_r) - TRISTATE_REG_A),		\
>   		.tri_bank = 0,					\
>   		.tri_bit = tri_b,				\
> -		.parked_bit = -1,				\
>   		.einput_bit = -1,				\
>   		.odrain_bit = -1,				\
>   		.lock_bit = -1,					\
>   		.ioreset_bit = -1,				\
>   		.rcv_sel_bit = -1,				\
>   		.drv_reg = -1,					\
> +		.parked_bitmask = 0,				\
>   	}
>   
>   /* Pin groups with only pull up and pull down control */
> @@ -2009,7 +2009,7 @@ static struct tegra_function tegra20_functions[] = {
>   		.pupd_bank = 2,					\
>   		.pupd_bit = pupd_b,				\
>   		.drv_reg = -1,					\
> -		.parked_bit = -1,				\
> +		.parked_bitmask = 0,				\
>   	}
>   
>   /* Pin groups for drive strength registers (configurable version) */
> @@ -2025,7 +2025,7 @@ static struct tegra_function tegra20_functions[] = {
>   		.tri_reg = -1,					\
>   		.drv_reg = ((r) - PINGROUP_REG_A),		\
>   		.drv_bank = 3,					\
> -		.parked_bit = -1,				\
> +		.parked_bitmask = 0,				\
>   		.hsm_bit = hsm_b,				\
>   		.schmitt_bit = schmitt_b,			\
>   		.lpmd_bit = lpmd_b,				\
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> index 1462023bba35..39ab6480a941 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> @@ -1302,7 +1302,6 @@ static struct tegra_function tegra210_functions[] = {
>   		.lock_bit = 7,						\
>   		.ioreset_bit = -1,					\
>   		.rcv_sel_bit = PINGROUP_BIT_##e_io_hv(10),		\
> -		.parked_bit = 5,					\
>   		.hsm_bit = PINGROUP_BIT_##hsm(9),			\
>   		.schmitt_bit = 12,					\
>   		.drvtype_bit = PINGROUP_BIT_##drvtype(13),		\
> @@ -1317,10 +1316,11 @@ static struct tegra_function tegra210_functions[] = {
>   		.slwr_width = slwr_w,					\
>   		.slwf_bit = slwf_b,					\
>   		.slwf_width = slwf_w,					\
> +		.parked_bitmask = BIT(5),				\
>   	}
>   
> -#define DRV_PINGROUP(pg_name, r, drvdn_b, drvdn_w, drvup_b, drvup_w,	\
> -		     slwr_b, slwr_w, slwf_b, slwf_w)			\
> +#define DRV_PINGROUP(pg_name, r, prk_mask, drvdn_b, drvdn_w, drvup_b,	\
> +		     drvup_w, slwr_b, slwr_w, slwf_b, slwf_w)		\
>   	{								\
>   		.name = "drive_" #pg_name,				\
>   		.pins = drive_##pg_name##_pins,				\
> @@ -1335,7 +1335,6 @@ static struct tegra_function tegra210_functions[] = {
>   		.rcv_sel_bit = -1,					\
>   		.drv_reg = DRV_PINGROUP_REG(r),				\
>   		.drv_bank = 0,						\
> -		.parked_bit = -1,					\
>   		.hsm_bit = -1,						\
>   		.schmitt_bit = -1,					\
>   		.lpmd_bit = -1,						\
> @@ -1348,6 +1347,7 @@ static struct tegra_function tegra210_functions[] = {
>   		.slwf_bit = slwf_b,					\
>   		.slwf_width = slwf_w,					\
>   		.drvtype_bit = -1,					\
> +		.parked_bitmask = prk_mask,				\
>   	}
>   
>   static const struct tegra_pingroup tegra210_groups[] = {
> @@ -1515,32 +1515,32 @@ static const struct tegra_pingroup tegra210_groups[] = {
>   	PINGROUP(pz4,                  SDMMC1,     RSVD1,  RSVD2, RSVD3, 0x328c, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
>   	PINGROUP(pz5,                  SOC,        RSVD1,  RSVD2, RSVD3, 0x3290, N,   N,       N,       -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),
>   
> -	/* pg_name, r, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w */
> -	DRV_PINGROUP(pa6,    0x9c0, 12, 5,  20, 5,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pcc7,   0x9c4, 12, 5,  20, 5,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pe6,    0x9c8, 12, 5,  20, 5,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pe7,    0x9cc, 12, 5,  20, 5,  -1, -1, -1, -1),
> -	DRV_PINGROUP(ph6,    0x9d0, 12, 5,  20, 5,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pk0,    0x9d4, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk1,    0x9d8, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk2,    0x9dc, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk3,    0x9e0, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk4,    0x9e4, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk5,    0x9e8, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk6,    0x9ec, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk7,    0x9f0, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pl0,    0x9f4, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pl1,    0x9f8, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pz0,    0x9fc, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pz1,    0xa00, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pz2,    0xa04, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pz3,    0xa08, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pz4,    0xa0c, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pz5,    0xa10, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(sdmmc1, 0xa98, 12, 7,  20, 7,  28, 2,  30, 2),
> -	DRV_PINGROUP(sdmmc2, 0xa9c, 2,  6,  8,  6,  28, 2,  30, 2),
> -	DRV_PINGROUP(sdmmc3, 0xab0, 12, 7,  20, 7,  28, 2,  30, 2),
> -	DRV_PINGROUP(sdmmc4, 0xab4, 2,  6,  8,  6,  28, 2,  30, 2),
> +	/* pg_name, r, prk_mask, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w */
> +	DRV_PINGROUP(pa6,    0x9c0, 0x0,       12, 5,  20, 5,  -1, -1, -1, -1),
> +	DRV_PINGROUP(pcc7,   0x9c4, 0x0,       12, 5,  20, 5,  -1, -1, -1, -1),
> +	DRV_PINGROUP(pe6,    0x9c8, 0x0,       12, 5,  20, 5,  -1, -1, -1, -1),
> +	DRV_PINGROUP(pe7,    0x9cc, 0x0,       12, 5,  20, 5,  -1, -1, -1, -1),
> +	DRV_PINGROUP(ph6,    0x9d0, 0x0,       12, 5,  20, 5,  -1, -1, -1, -1),
> +	DRV_PINGROUP(pk0,    0x9d4, 0x0,       -1, -1, -1, -1, 28, 2,  30, 2),
> +	DRV_PINGROUP(pk1,    0x9d8, 0x0,       -1, -1, -1, -1, 28, 2,  30, 2),
> +	DRV_PINGROUP(pk2,    0x9dc, 0x0,       -1, -1, -1, -1, 28, 2,  30, 2),
> +	DRV_PINGROUP(pk3,    0x9e0, 0x0,       -1, -1, -1, -1, 28, 2,  30, 2),
> +	DRV_PINGROUP(pk4,    0x9e4, 0x0,       -1, -1, -1, -1, 28, 2,  30, 2),
> +	DRV_PINGROUP(pk5,    0x9e8, 0x0,       -1, -1, -1, -1, 28, 2,  30, 2),
> +	DRV_PINGROUP(pk6,    0x9ec, 0x0,       -1, -1, -1, -1, 28, 2,  30, 2),
> +	DRV_PINGROUP(pk7,    0x9f0, 0x0,       -1, -1, -1, -1, 28, 2,  30, 2),
> +	DRV_PINGROUP(pl0,    0x9f4, 0x0,       -1, -1, -1, -1, 28, 2,  30, 2),
> +	DRV_PINGROUP(pl1,    0x9f8, 0x0,       -1, -1, -1, -1, 28, 2,  30, 2),
> +	DRV_PINGROUP(pz0,    0x9fc, 0x0,       12, 7,  20, 7,  -1, -1, -1, -1),
> +	DRV_PINGROUP(pz1,    0xa00, 0x0,       12, 7,  20, 7,  -1, -1, -1, -1),
> +	DRV_PINGROUP(pz2,    0xa04, 0x0,       12, 7,  20, 7,  -1, -1, -1, -1),
> +	DRV_PINGROUP(pz3,    0xa08, 0x0,       12, 7,  20, 7,  -1, -1, -1, -1),
> +	DRV_PINGROUP(pz4,    0xa0c, 0x0,       12, 7,  20, 7,  -1, -1, -1, -1),
> +	DRV_PINGROUP(pz5,    0xa10, 0x0,       12, 7,  20, 7,  -1, -1, -1, -1),
> +	DRV_PINGROUP(sdmmc1, 0xa98, 0x0,       12, 7,  20, 7,  28, 2,  30, 2),
> +	DRV_PINGROUP(sdmmc2, 0xa9c, 0x7ffc000, 2,  6,  8,  6,  28, 2,  30, 2),
> +	DRV_PINGROUP(sdmmc3, 0xab0, 0x0,       12, 7,  20, 7,  28, 2,  30, 2),
> +	DRV_PINGROUP(sdmmc4, 0xab4, 0x7ffc000, 2,  6,  8,  6,  28, 2,  30, 2),
>   };
>   
>   static const struct tegra_pinctrl_soc_data tegra210_pinctrl = {
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
> index 610124c3d192..7299a371827f 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
> @@ -2133,8 +2133,8 @@ static struct tegra_function tegra30_functions[] = {
>   		.lock_bit = 7,						\
>   		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
>   		.rcv_sel_bit = -1,					\
> -		.parked_bit = -1,					\
>   		.drv_reg = -1,						\
> +		.parked_bitmask = 0,					\
>   	}
>   
>   #define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b, drvdn_b,	\
> @@ -2154,7 +2154,6 @@ static struct tegra_function tegra30_functions[] = {
>   		.rcv_sel_bit = -1,					\
>   		.drv_reg = DRV_PINGROUP_REG(r),				\
>   		.drv_bank = 0,						\
> -		.parked_bit = -1,					\
>   		.hsm_bit = hsm_b,					\
>   		.schmitt_bit = schmitt_b,				\
>   		.lpmd_bit = lpmd_b,					\
> @@ -2167,6 +2166,7 @@ static struct tegra_function tegra30_functions[] = {
>   		.slwf_bit = slwf_b,					\
>   		.slwf_width = slwf_w,					\
>   		.drvtype_bit = -1,					\
> +		.parked_bitmask = 0,					\
>   	}
>   
>   static const struct tegra_pingroup tegra30_groups[] = {
