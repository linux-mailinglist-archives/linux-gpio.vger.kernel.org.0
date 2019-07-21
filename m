Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1F1D6F682
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 00:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfGUWqs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 18:46:48 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15918 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfGUWqs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 18:46:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d34eb550002>; Sun, 21 Jul 2019 15:46:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 15:46:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 21 Jul 2019 15:46:44 -0700
Received: from [10.2.164.85] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 22:46:42 +0000
Subject: Re: [PATCH V6 06/21] clk: tegra: pll: Save and restore pll context
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
 <1563738060-30213-7-git-send-email-skomatineni@nvidia.com>
 <ba402ed3-0e6f-26ce-ac0a-8048babb50ca@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <4405ef63-6a6a-1373-bb62-2b8410eec6d4@nvidia.com>
Date:   Sun, 21 Jul 2019 15:47:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ba402ed3-0e6f-26ce-ac0a-8048babb50ca@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563749205; bh=CrvzLEwhCuHW931PfuXncafTPrXRxyHc88Ylt+Vddd0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=kwOJqKPIHM8vXo3kfhiO1EpmYAskRAV9/cSrk9UPhHq6OVb/AOpiM5PB/wTz0uqss
         f/utB7hl0UXsC0GE/Eq+bgOcBmSFVCd6NilkBg8pK3O00zU5aclSbtquoh6v2VR6Rv
         ot8Ne2g7caamPfE8LuSjOUKrgJZLFieHo7zhlbLkZLHVO0Sn8+AnCmCMz0qGD03zAz
         DqeqVCkmPHYPSfSaxGICt4HAvGefD8wF9InoIPrzE5GG5e2rLlu0kyr0T4QbtpV5up
         BcD/D3EHQw+DPEst7I+5GLVJ7jW4Yo393FzFhGTeJkeUdB2NAOKrl6xlCACi5bCB/1
         ar62jahTyoDAw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/21/19 2:44 PM, Dmitry Osipenko wrote:
> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch implements save and restore of PLL context.
>>
>> During system suspend, core power goes off and looses the settings
>> of the Tegra CAR controller registers.
>>
>> So during suspend entry pll rate is stored and on resume it is
>> restored back along with its state.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-pll.c      | 121 ++++++++++++++++++++++++++++---=
--------
>>   drivers/clk/tegra/clk-tegra210.c |   2 +-
>>   drivers/clk/tegra/clk.h          |  10 +++-
>>   3 files changed, 99 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>> index 1583f5fc992f..f136964e6c44 100644
>> --- a/drivers/clk/tegra/clk-pll.c
>> +++ b/drivers/clk/tegra/clk-pll.c
>> @@ -1008,6 +1008,59 @@ static unsigned long clk_plle_recalc_rate(struct =
clk_hw *hw,
>>   	return rate;
>>   }
>>  =20
>> +void tegra_clk_sync_state_pll(struct clk_hw *hw)
>> +{
>> +	if (!__clk_get_enable_count(hw->clk))
>> +		clk_pll_disable(hw);
>> +	else
>> +		clk_pll_enable(hw);
>> +}
>> +
>> +static int tegra_clk_pll_save_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_pll *pll =3D to_clk_pll(hw);
>> +	u32 val =3D 0;
>> +
>> +	pll->rate =3D clk_hw_get_rate(hw);
>> +
>> +	if (pll->params->flags & TEGRA_PLLMB)
>> +		val =3D pll_readl_base(pll);
>> +	else if (pll->params->flags & TEGRA_PLLRE)
>> +		val =3D pll_readl_base(pll) & divp_mask_shifted(pll);
>> +
>> +	pll->pllbase_ctx =3D val;
>> +
>> +	return 0;
>> +}
>> +
>> +static void tegra_clk_pll_restore_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_pll *pll =3D to_clk_pll(hw);
>> +	struct clk_hw *parent =3D clk_hw_get_parent(hw);
>> +	unsigned long parent_rate =3D clk_hw_get_rate(parent);
>> +	u32 val;
>> +
>> +	if (clk_pll_is_enabled(hw))
>> +		return;
>> +
>> +	if (pll->params->flags & TEGRA_PLLMB) {
>> +		pll_writel_base(pll->pllbase_ctx, pll);
>> +	} else if (pll->params->flags & TEGRA_PLLRE) {
>> +		val =3D pll_readl_base(pll);
>> +		val &=3D ~(divp_mask_shifted(pll));
>> +		pll_writel_base(pll->pllbase_ctx | val, pll);
>> +	}
>> +
>> +	if (pll->params->set_defaults)
>> +		pll->params->set_defaults(pll);
>> +
>> +	clk_pll_set_rate(hw, pll->rate, parent_rate);
>> +
>> +	/* do not sync pllx state here. pllx is sync'd after dfll resume */
>> +	if (!(pll->params->flags & TEGRA_PLLX))
>> +		tegra_clk_sync_state_pll(hw);
>> +}
>> +
>>   const struct clk_ops tegra_clk_pll_ops =3D {
>>   	.is_enabled =3D clk_pll_is_enabled,
>>   	.enable =3D clk_pll_enable,
>> @@ -1015,6 +1068,8 @@ const struct clk_ops tegra_clk_pll_ops =3D {
>>   	.recalc_rate =3D clk_pll_recalc_rate,
>>   	.round_rate =3D clk_pll_round_rate,
>>   	.set_rate =3D clk_pll_set_rate,
>> +	.save_context =3D tegra_clk_pll_save_context,
>> +	.restore_context =3D tegra_clk_pll_restore_context,
>>   };
>>  =20
>>   const struct clk_ops tegra_clk_plle_ops =3D {
>> @@ -1802,6 +1857,27 @@ static int clk_pllu_tegra114_enable(struct clk_hw=
 *hw)
>>  =20
>>   	return ret;
>>   }
>> +
>> +static void _clk_plle_tegra_init_parent(struct tegra_clk_pll *pll)
>> +{
>> +	u32 val, val_aux;
>> +
>> +	/* ensure parent is set to pll_ref */
>> +	val =3D pll_readl_base(pll);
>> +	val_aux =3D pll_readl(pll->params->aux_reg, pll);
>> +
>> +	if (val & PLL_BASE_ENABLE) {
>> +		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
>> +		    (val_aux & PLLE_AUX_PLLP_SEL))
>> +			WARN(1, "pll_e enabled with unsupported parent %s\n",
>> +			     (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
>> +			     "pll_re_vco");
>> +	} else {
>> +		val_aux &=3D ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
>> +		pll_writel(val_aux, pll->params->aux_reg, pll);
>> +		fence_udelay(1, pll->clk_base);
>> +	}
>> +}
>>   #endif
>>  =20
>>   static struct tegra_clk_pll *_tegra_init_pll(void __iomem *clk_base,
>> @@ -2214,27 +2290,12 @@ struct clk *tegra_clk_register_plle_tegra114(con=
st char *name,
>>   {
>>   	struct tegra_clk_pll *pll;
>>   	struct clk *clk;
>> -	u32 val, val_aux;
>>  =20
>>   	pll =3D _tegra_init_pll(clk_base, NULL, pll_params, lock);
>>   	if (IS_ERR(pll))
>>   		return ERR_CAST(pll);
>>  =20
>> -	/* ensure parent is set to pll_re_vco */
>> -
>> -	val =3D pll_readl_base(pll);
>> -	val_aux =3D pll_readl(pll_params->aux_reg, pll);
>> -
>> -	if (val & PLL_BASE_ENABLE) {
>> -		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
>> -			(val_aux & PLLE_AUX_PLLP_SEL))
>> -			WARN(1, "pll_e enabled with unsupported parent %s\n",
>> -			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
>> -					"pll_re_vco");
>> -	} else {
>> -		val_aux &=3D ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
>> -		pll_writel(val_aux, pll_params->aux_reg, pll);
>> -	}
>> +	_clk_plle_tegra_init_parent(pll);
>>  =20
>>   	clk =3D _tegra_clk_register_pll(pll, name, parent_name, flags,
>>   				      &tegra_clk_plle_tegra114_ops);
>> @@ -2276,6 +2337,8 @@ static const struct clk_ops tegra_clk_pllss_ops =
=3D {
>>   	.recalc_rate =3D clk_pll_recalc_rate,
>>   	.round_rate =3D clk_pll_ramp_round_rate,
>>   	.set_rate =3D clk_pllxc_set_rate,
>> +	.save_context =3D tegra_clk_pll_save_context,
>> +	.restore_context =3D tegra_clk_pll_restore_context,
>>   };
>>  =20
>>   struct clk *tegra_clk_register_pllss(const char *name, const char *par=
ent_name,
>> @@ -2375,6 +2438,7 @@ struct clk *tegra_clk_register_pllre_tegra210(cons=
t char *name,
>>   		pll_params->vco_min =3D pll_params->adjust_vco(pll_params,
>>   							     parent_rate);
>>  =20
>> +	pll_params->flags |=3D TEGRA_PLLRE;
>>   	pll =3D _tegra_init_pll(clk_base, pmc, pll_params, lock);
>>   	if (IS_ERR(pll))
>>   		return ERR_CAST(pll);
>> @@ -2520,11 +2584,19 @@ static void clk_plle_tegra210_disable(struct clk=
_hw *hw)
>>   		spin_unlock_irqrestore(pll->lock, flags);
>>   }
>>  =20
>> +static void tegra_clk_plle_t210_restore_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_pll *pll =3D to_clk_pll(hw);
>> +
>> +	_clk_plle_tegra_init_parent(pll);
>> +}
>> +
>>   static const struct clk_ops tegra_clk_plle_tegra210_ops =3D {
>>   	.is_enabled =3D  clk_plle_tegra210_is_enabled,
>>   	.enable =3D clk_plle_tegra210_enable,
>>   	.disable =3D clk_plle_tegra210_disable,
>>   	.recalc_rate =3D clk_pll_recalc_rate,
>> +	.restore_context =3D tegra_clk_plle_t210_restore_context,
>>   };
>>  =20
>>   struct clk *tegra_clk_register_plle_tegra210(const char *name,
>> @@ -2535,27 +2607,12 @@ struct clk *tegra_clk_register_plle_tegra210(con=
st char *name,
>>   {
>>   	struct tegra_clk_pll *pll;
>>   	struct clk *clk;
>> -	u32 val, val_aux;
>>  =20
>>   	pll =3D _tegra_init_pll(clk_base, NULL, pll_params, lock);
>>   	if (IS_ERR(pll))
>>   		return ERR_CAST(pll);
>>  =20
>> -	/* ensure parent is set to pll_re_vco */
>> -
>> -	val =3D pll_readl_base(pll);
>> -	val_aux =3D pll_readl(pll_params->aux_reg, pll);
>> -
>> -	if (val & PLLE_BASE_ENABLE) {
>> -		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
>> -			(val_aux & PLLE_AUX_PLLP_SEL))
>> -			WARN(1, "pll_e enabled with unsupported parent %s\n",
>> -			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
>> -					"pll_re_vco");
>> -	} else {
>> -		val_aux &=3D ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
>> -		pll_writel(val_aux, pll_params->aux_reg, pll);
>> -	}
>> +	_clk_plle_tegra_init_parent(pll);
>>  =20
>>   	clk =3D _tegra_clk_register_pll(pll, name, parent_name, flags,
>>   				      &tegra_clk_plle_tegra210_ops);
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-te=
gra210.c
>> index 4721ee030d1c..58397f93166c 100644
>> --- a/drivers/clk/tegra/clk-tegra210.c
>> +++ b/drivers/clk/tegra/clk-tegra210.c
>> @@ -1602,7 +1602,7 @@ static struct tegra_clk_pll_params pll_x_params =
=3D {
>>   	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
>>   	.div_nmp =3D &pllx_nmp,
>>   	.freq_table =3D pll_x_freq_table,
>> -	.flags =3D TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
>> +	.flags =3D TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLLX=
,
>>   	.dyn_ramp =3D tegra210_pllx_dyn_ramp,
>>   	.set_defaults =3D tegra210_pllx_set_defaults,
>>   	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>> index fb29a8c27873..8532f5150091 100644
>> --- a/drivers/clk/tegra/clk.h
>> +++ b/drivers/clk/tegra/clk.h
>> @@ -235,6 +235,8 @@ struct tegra_clk_pll;
>>    * TEGRA_PLLMB - PLLMB has should be treated similar to PLLM. This
>>    *     flag indicated that it is PLLMB.
>>    * TEGRA_PLL_VCO_OUT - Used to indicate that the PLL has a VCO output
>> + * TEGRA_PLLRE - Used to indicate that it is PLLRE.
>> + * TEGRA_PLLX - Used to indicate that it is PLLX.
>>    */
>>   struct tegra_clk_pll_params {
>>   	unsigned long	input_min;
>> @@ -301,6 +303,8 @@ struct tegra_clk_pll_params {
>>   #define TEGRA_MDIV_NEW BIT(11)
>>   #define TEGRA_PLLMB BIT(12)
>>   #define TEGRA_PLL_VCO_OUT BIT(13)
>> +#define TEGRA_PLLRE BIT(14)
>> +#define TEGRA_PLLX BIT(15)
>>  =20
>>   /**
>>    * struct tegra_clk_pll - Tegra PLL clock
>> @@ -310,6 +314,8 @@ struct tegra_clk_pll_params {
>>    * @pmc:	address of PMC, required to read override bits
>>    * @lock:	register lock
>>    * @params:	PLL parameters
>> + * @rate:	rate during system suspend and resume
>> + * @pllbase_ctx: pll base register value during suspend and resume
>>    */
>>   struct tegra_clk_pll {
>>   	struct clk_hw	hw;
>> @@ -317,6 +323,8 @@ struct tegra_clk_pll {
>>   	void __iomem	*pmc;
>>   	spinlock_t	*lock;
>>   	struct tegra_clk_pll_params	*params;
>> +	unsigned long	rate;
>> +	u32	pllbase_ctx;
>>   };
>>  =20
>>   #define to_clk_pll(_hw) container_of(_hw, struct tegra_clk_pll, hw)
>> @@ -840,7 +848,7 @@ u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsi=
gned long input_rate);
>>   int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>>   int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>>   		 u8 frac_width, u8 flags);
>> -
>> +void tegra_clk_sync_state_pll(struct clk_hw *hw);
> Looks like this function isn't used anywhere other than this patch. Bug?

With all dfll sequence moved to right places in this patch, yes this can=20
be collapsed within restore context itself.

Will change in next version

>>   /* Combined read fence with delay */
>>   #define fence_udelay(delay, reg)	\
>>
