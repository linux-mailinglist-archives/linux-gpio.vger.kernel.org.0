Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD877BE24
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 12:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfGaKPm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 06:15:42 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44893 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfGaKPm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 06:15:42 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so64997219ljc.11;
        Wed, 31 Jul 2019 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kYuNKMCAxCoE9jGfijKuwUBIftsipcHdKWjFzPUyR1o=;
        b=Pd2paGNzXOmQAk49AesUQapUo5XqZH9+6bm+SgCq2QkSSRrhCbsUKRGzy/RqVnv3QM
         zTypuFuf8iN+MY7MgUx4RFf7C/VOyDx6yPdWNSmAs3lx+f+tw62iSViYeqlJptMn23sf
         YZsFElhyMr14d4onEys+WTHraBwel3ZzEAQqhuwWBqv5ABOU18oIifPTgq3LTE/ZL69s
         tZBmADUn4mQ3AXVE8vCQsaSZz5qBFWJSH1PU4adCx+hXn/v64wna3YrBtdiv8q1Apzt0
         niFTSwtAOxl/kpYqlGBxb+l3jnzndiNlG2SkeIx5df7D25ljkOInM/1DLyteXRbgoUup
         3S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kYuNKMCAxCoE9jGfijKuwUBIftsipcHdKWjFzPUyR1o=;
        b=oav52mtT7MI68PuoSzdiQPAMk3jTXe7F1BqyKQzxj4yUlWFtMAbRxsm3RZZSLHpR3N
         SjGl4ZnBkY2KpUlHdEdoNuWSc2KAdx9EBq53XB4t9cNt5SbHjFbg3PJ5cSgebI0KaeiZ
         ZRGow0Cxp4PE7N4D1l3RGmQdEpIXN/MBsOe88tQIA79O0rHdEQ2u7TZgnJLCFWwkTOiN
         Z7LWQwJARVu3Lk6cLmSjhA7vV6DTffKy0F08rmgmOFZEcneVCHNKRv6756MN0MnAVKht
         m5EmfScnRjdnHU+UKK4iLtgshdn+bC7e/EuIX4sN2aH6J1/OMPTg5BGv/yc1tazKHpgB
         z5qg==
X-Gm-Message-State: APjAAAVqHd+HeOYUt4Ghg/oEhrr+dkO6ih2RaLJw+aVs+CtTV9gs5u60
        uctM6d3FTpZ9++mPcILlH9RIaX/R
X-Google-Smtp-Source: APXvYqzDRHh537Wiw8+igHK/hVqvDbVwL1fBp0p92R5PGyaS22DG9/dGPZVaXS/FNGGh8QduFfm0kA==
X-Received: by 2002:a2e:9b10:: with SMTP id u16mr21862914lji.231.1564568138448;
        Wed, 31 Jul 2019 03:15:38 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id t1sm13946057lji.52.2019.07.31.03.15.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 03:15:37 -0700 (PDT)
Subject: Re: [PATCH v7 08/20] clk: tegra: clk-super: Fix to enable PLLP
 branches to CPU
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-9-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3ce20cbf-fe6f-c62b-c7b9-e3cad46f3381@gmail.com>
Date:   Wed, 31 Jul 2019 13:14:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1564532424-10449-9-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

31.07.2019 3:20, Sowjanya Komatineni пишет:
> This patch has a fix to enable PLLP branches to CPU before changing
> the CPU clusters clock source to PLLP for Gen5 Super clock and
> disables PLLP branches to CPU when not in use.
> 
> During system suspend entry and exit, CPU source will be switched
> to PLLP and this needs PLLP branches to be enabled to CPU prior to
> the switch.
> 
> On system resume, warmboot code enables PLLP branches to CPU and
> powers up the CPU with PLLP clock source.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-super.c            | 14 ++++++++++++++
>  drivers/clk/tegra/clk-tegra-super-gen4.c |  2 +-
>  drivers/clk/tegra/clk.c                  | 14 ++++++++++++++
>  drivers/clk/tegra/clk.h                  |  5 +++++
>  4 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
> index 39ef31b46df5..e2a1e95a8db7 100644
> --- a/drivers/clk/tegra/clk-super.c
> +++ b/drivers/clk/tegra/clk-super.c
> @@ -28,6 +28,9 @@
>  #define super_state_to_src_shift(m, s) ((m->width * s))
>  #define super_state_to_src_mask(m) (((1 << m->width) - 1))
>  
> +#define CCLK_SRC_PLLP_OUT0 4
> +#define CCLK_SRC_PLLP_OUT4 5
> +
>  static u8 clk_super_get_parent(struct clk_hw *hw)
>  {
>  	struct tegra_clk_super_mux *mux = to_clk_super_mux(hw);
> @@ -97,12 +100,23 @@ static int clk_super_set_parent(struct clk_hw *hw, u8 index)
>  		if (index == mux->div2_index)
>  			index = mux->pllx_index;
>  	}
> +
> +	/* enable PLLP branches to CPU before selecting PLLP source */
> +	if ((mux->flags & TEGRA210_CPU_CLK) &&
> +	    (index == CCLK_SRC_PLLP_OUT0 || index == CCLK_SRC_PLLP_OUT4))
> +		tegra_clk_set_pllp_out_cpu(true);
> +
>  	val &= ~((super_state_to_src_mask(mux)) << shift);
>  	val |= (index & (super_state_to_src_mask(mux))) << shift;
>  
>  	writel_relaxed(val, mux->reg);
>  	udelay(2);
>  
> +	/* disable PLLP branches to CPU if not used */
> +	if ((mux->flags & TEGRA210_CPU_CLK) &&
> +	    index != CCLK_SRC_PLLP_OUT0 && index != CCLK_SRC_PLLP_OUT4)
> +		tegra_clk_set_pllp_out_cpu(false);
> +
>  out:
>  	if (mux->lock)
>  		spin_unlock_irqrestore(mux->lock, flags);
> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
> index cdfe7c9697e1..888d76b01c75 100644
> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
> @@ -180,7 +180,7 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
>  					gen_info->num_cclk_g_parents,
>  					CLK_SET_RATE_PARENT,
>  					clk_base + CCLKG_BURST_POLICY,
> -					0, 4, 8, 0, NULL);
> +					TEGRA210_CPU_CLK, 4, 8, 0, NULL);

Don't we want a clarifying comment for cclk_lp telling why it doesn't
have the TEGRA210_CPU_CLK flag?

>  		} else {
>  			clk = tegra_clk_register_super_mux("cclk_g",
>  					gen_info->cclk_g_parents,
> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 573e3c967ae1..eb08047fd02f 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -23,6 +23,7 @@
>  #define CLK_OUT_ENB_W			0x364
>  #define CLK_OUT_ENB_X			0x280
>  #define CLK_OUT_ENB_Y			0x298
> +#define CLK_ENB_PLLP_OUT_CPU		BIT(31)
>  #define CLK_OUT_ENB_SET_L		0x320
>  #define CLK_OUT_ENB_CLR_L		0x324
>  #define CLK_OUT_ENB_SET_H		0x328
> @@ -199,6 +200,19 @@ const struct tegra_clk_periph_regs *get_reg_bank(int clkid)
>  	}
>  }
>  
> +void tegra_clk_set_pllp_out_cpu(bool enable)
> +{
> +	u32 val;
> +
> +	val = readl_relaxed(clk_base + CLK_OUT_ENB_Y);
> +	if (enable)
> +		val |= CLK_ENB_PLLP_OUT_CPU;
> +	else
> +		val &= ~CLK_ENB_PLLP_OUT_CPU;
> +
> +	writel_relaxed(val, clk_base + CLK_OUT_ENB_Y);
> +}
> +
>  struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
>  {
>  	clk_base = regs;
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index d61e61eebf4a..f8de447f505b 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -687,6 +687,9 @@ struct clk *tegra_clk_register_periph_data(void __iomem *clk_base,
>   * Flags:
>   * TEGRA_DIVIDER_2 - LP cluster has additional divider. This flag indicates
>   *     that this is LP cluster clock.
> + * TEGRA210_CPU_CLK - This flag indicates this is CPU cluster clock. To use
> + * PLLP for CPU clock source, need to enable PLLP branches to CPU by setting
> + * additional bit PLLP_OUT_CPU for gen5 super clock.
>   */
>  struct tegra_clk_super_mux {
>  	struct clk_hw	hw;
> @@ -703,6 +706,7 @@ struct tegra_clk_super_mux {
>  #define to_clk_super_mux(_hw) container_of(_hw, struct tegra_clk_super_mux, hw)
>  
>  #define TEGRA_DIVIDER_2 BIT(0)
> +#define TEGRA210_CPU_CLK BIT(1)
>  
>  extern const struct clk_ops tegra_clk_super_ops;
>  struct clk *tegra_clk_register_super_mux(const char *name,
> @@ -849,6 +853,7 @@ int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>  int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>  		 u8 frac_width, u8 flags);
>  void tegra_clk_osc_resume(void __iomem *clk_base);
> +void tegra_clk_set_pllp_out_cpu(bool enable);
>  
>  
>  /* Combined read fence with delay */
> 

