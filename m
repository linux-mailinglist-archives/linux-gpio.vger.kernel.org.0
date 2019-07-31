Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7513A7BDB9
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 11:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfGaJvM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 05:51:12 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41341 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfGaJvM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 05:51:12 -0400
Received: by mail-lj1-f194.google.com with SMTP id d24so64949546ljg.8;
        Wed, 31 Jul 2019 02:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uXMzma96yP1mu/MdRyIduiN1huH25HRlQy8bnWBwt3g=;
        b=Pu3WXnPX6uPxFbsTZexh+C6HQK8Y55AZReH4lb2Fiz8yMsyFkfYQkpHfYQQg7CsSUt
         ygWGP2JMigXfD8FUj1CGsbzPVKPaX0amz40V49XvOrQbHfSpSHHiuNVoq+FPUagdUIaC
         9LeTmnpuvnHkLqJ1tNvjjJm38XHe8IvgDOOnPYIKaRhf06/SEKBKgDNQloV1/innCNN5
         SghlBgcfHxtIS+/wfcs+64ZWVSBv/L4rTMN33UtdhLJnpR8gQY55+jpuxTf0uwDJxmsA
         N5aavL7sb7LRqOGMNGskCPdjJdekWBFbV0lgke0yRhgSHbhNctA6n7tx50BvMtF9/0B1
         HguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uXMzma96yP1mu/MdRyIduiN1huH25HRlQy8bnWBwt3g=;
        b=ZuzrXIqQrFCU0f4SH7887eCQzaU/FuO95mRrftonL7nANzXd3Z9ke4VZbWdRGincoz
         coBWRRoMBo3JQD7MRixVra06linao3fNjSWdDahw9nMw4iRHb9vB1nu6d6Iph4VmvKV/
         E2YkZKgN+1LFzxg8ecBXPqWrNl8H/7pTAjVP8+7S2yCBLuX6tPb6fxu1/SKXojQw8kpd
         fr0FBU0RYLZrDeV+keZ82gaCp+oMtBPjp7eedD3UI1GslO6Dmc5UAm+cDPIG2Fb0hMoc
         11QGGggCk7CHTk4FV1tiMMq98rOoOCORRdWEC44xg11+/l0YFJRKvexo2FY7oG6R9stL
         FyeQ==
X-Gm-Message-State: APjAAAWHPtV/mPJQTx7WaN0JoDq4DLq1hVPdxTha6eEZIWN/1oxb/L7N
        eScE6FXTIJgiMpYs1MvOEKkPKtYc
X-Google-Smtp-Source: APXvYqyx82z4kX/qQMvLFAPOYggQbAGp2YtEpUY47/9X1xrOTyeYEsbekaRIHTZvpg18fWOKU7+Xgw==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr64245005lja.230.1564566668268;
        Wed, 31 Jul 2019 02:51:08 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id x22sm11820919lfq.20.2019.07.31.02.51.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 02:51:07 -0700 (PDT)
Subject: Re: [PATCH v7 07/20] clk: tegra: clk-periph: Add save and restore
 support
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
 <1564532424-10449-8-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f90cf34d-c294-b23d-38e3-6de9a8fca7d6@gmail.com>
Date:   Wed, 31 Jul 2019 12:50:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1564532424-10449-8-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

31.07.2019 3:20, Sowjanya Komatineni пишет:
> This patch implements save and restore context for peripheral fixed
> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
> peripheral clock ops.
> 
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
> 
> So during suspend entry clock and reset state of peripherals is saved
> and on resume they are restored to have clocks back to same rate and
> state as before suspend.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-periph-fixed.c | 33 ++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-periph-gate.c  | 34 +++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-periph.c       | 37 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-sdmmc-mux.c    | 28 +++++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h              |  6 ++++++
>  5 files changed, 138 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-periph-fixed.c b/drivers/clk/tegra/clk-periph-fixed.c
> index c088e7a280df..21b24530fa00 100644
> --- a/drivers/clk/tegra/clk-periph-fixed.c
> +++ b/drivers/clk/tegra/clk-periph-fixed.c
> @@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct clk_hw *hw,
>  	return (unsigned long)rate;
>  }
>  
> +static int tegra_clk_periph_fixed_save_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_periph_fixed *fixed = to_tegra_clk_periph_fixed(hw);
> +	u32 mask = 1 << (fixed->num % 32);
> +
> +	fixed->enb_ctx = readl_relaxed(fixed->base + fixed->regs->enb_reg) &
> +			 mask;
> +	fixed->rst_ctx = readl_relaxed(fixed->base + fixed->regs->rst_reg) &
> +			 mask;
> +
> +	return 0;
> +}
> +
> +static void tegra_clk_periph_fixed_restore_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_periph_fixed *fixed = to_tegra_clk_periph_fixed(hw);
> +	u32 mask = 1 << (fixed->num % 32);
> +
> +	if (fixed->enb_ctx)
> +		writel_relaxed(mask, fixed->base + fixed->regs->enb_set_reg);
> +	else
> +		writel_relaxed(mask, fixed->base + fixed->regs->enb_clr_reg);
> +
> +	udelay(2);
> +
> +	if (!fixed->rst_ctx) {
> +		udelay(5); /* reset propogation delay */
> +		writel_relaxed(mask, fixed->base + fixed->regs->rst_reg);
> +	}
> +}
> +
>  static const struct clk_ops tegra_clk_periph_fixed_ops = {
>  	.is_enabled = tegra_clk_periph_fixed_is_enabled,
>  	.enable = tegra_clk_periph_fixed_enable,
>  	.disable = tegra_clk_periph_fixed_disable,
>  	.recalc_rate = tegra_clk_periph_fixed_recalc_rate,
> +	.save_context = tegra_clk_periph_fixed_save_context,
> +	.restore_context = tegra_clk_periph_fixed_restore_context,
>  };
>  
>  struct clk *tegra_clk_register_periph_fixed(const char *name,
> diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
> index 4b31beefc9fc..6ba5b08e0787 100644
> --- a/drivers/clk/tegra/clk-periph-gate.c
> +++ b/drivers/clk/tegra/clk-periph-gate.c
> @@ -25,6 +25,8 @@ static DEFINE_SPINLOCK(periph_ref_lock);
>  
>  #define read_rst(gate) \
>  	readl_relaxed(gate->clk_base + (gate->regs->rst_reg))
> +#define write_rst_set(val, gate) \
> +	writel_relaxed(val, gate->clk_base + (gate->regs->rst_set_reg))
>  #define write_rst_clr(val, gate) \
>  	writel_relaxed(val, gate->clk_base + (gate->regs->rst_clr_reg))
>  
> @@ -110,10 +112,42 @@ static void clk_periph_disable(struct clk_hw *hw)
>  	spin_unlock_irqrestore(&periph_ref_lock, flags);
>  }
>  
> +static int clk_periph_gate_save_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
> +
> +	gate->clk_state_ctx = read_enb(gate) & periph_clk_to_bit(gate);
> +	gate->rst_state_ctx = read_rst(gate) & periph_clk_to_bit(gate);
> +
> +	return 0;
> +}
> +
> +static void clk_periph_gate_restore_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
> +
> +	if (gate->clk_state_ctx)
> +		write_enb_set(periph_clk_to_bit(gate), gate);
> +	else
> +		write_enb_clr(periph_clk_to_bit(gate), gate);
> +
> +	udelay(5);
> +
> +	if (!(gate->flags & TEGRA_PERIPH_NO_RESET) &&
> +	    !(gate->flags & TEGRA_PERIPH_MANUAL_RESET)) {
> +		if (gate->rst_state_ctx)
> +			write_rst_set(periph_clk_to_bit(gate), gate);
> +		else
> +			write_rst_clr(periph_clk_to_bit(gate), gate);
> +	}
> +}
> +
>  const struct clk_ops tegra_clk_periph_gate_ops = {
>  	.is_enabled = clk_periph_is_enabled,
>  	.enable = clk_periph_enable,
>  	.disable = clk_periph_disable,
> +	.save_context = clk_periph_gate_save_context,
> +	.restore_context = clk_periph_gate_restore_context,
>  };
>  
>  struct clk *tegra_clk_register_periph_gate(const char *name,
> diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
> index 58437da25156..06fb62955768 100644
> --- a/drivers/clk/tegra/clk-periph.c
> +++ b/drivers/clk/tegra/clk-periph.c
> @@ -99,6 +99,37 @@ static void clk_periph_disable(struct clk_hw *hw)
>  	gate_ops->disable(gate_hw);
>  }
>  
> +static int clk_periph_save_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_periph *periph = to_clk_periph(hw);
> +	const struct clk_ops *gate_ops = periph->gate_ops;
> +	struct clk_hw *gate_hw = &periph->gate.hw;
> +
> +	if (!(periph->gate.flags & TEGRA_PERIPH_NO_GATE))
> +		gate_ops->save_context(gate_hw);
> +
> +	periph->parent_ctx = clk_periph_get_parent(hw);
> +
> +	return 0;
> +}
> +
> +static void clk_periph_restore_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_periph *periph = to_clk_periph(hw);
> +	const struct clk_ops *gate_ops = periph->gate_ops;
> +	struct clk_hw *gate_hw = &periph->gate.hw;
> +	const struct clk_ops *div_ops = periph->div_ops;
> +	struct clk_hw *div_hw = &periph->divider.hw;
> +
> +	clk_periph_set_parent(hw, periph->parent_ctx);
> +
> +	if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
> +		div_ops->restore_context(div_hw);

Could you please point to where the divider's save_context() happens?
Because I can't see it.

> +	if (!(periph->gate.flags & TEGRA_PERIPH_NO_GATE))
> +		gate_ops->restore_context(gate_hw);
> +}
> +
>  const struct clk_ops tegra_clk_periph_ops = {
>  	.get_parent = clk_periph_get_parent,
>  	.set_parent = clk_periph_set_parent,
> @@ -108,6 +139,8 @@ const struct clk_ops tegra_clk_periph_ops = {
>  	.is_enabled = clk_periph_is_enabled,
>  	.enable = clk_periph_enable,
>  	.disable = clk_periph_disable,
> +	.save_context = clk_periph_save_context,
> +	.restore_context = clk_periph_restore_context,
>  };
>  
>  static const struct clk_ops tegra_clk_periph_nodiv_ops = {
> @@ -116,6 +149,8 @@ static const struct clk_ops tegra_clk_periph_nodiv_ops = {
>  	.is_enabled = clk_periph_is_enabled,
>  	.enable = clk_periph_enable,
>  	.disable = clk_periph_disable,
> +	.save_context = clk_periph_save_context,
> +	.restore_context = clk_periph_restore_context,
>  };
>  
>  static const struct clk_ops tegra_clk_periph_no_gate_ops = {
> @@ -124,6 +159,8 @@ static const struct clk_ops tegra_clk_periph_no_gate_ops = {
>  	.recalc_rate = clk_periph_recalc_rate,
>  	.round_rate = clk_periph_round_rate,
>  	.set_rate = clk_periph_set_rate,
> +	.save_context = clk_periph_save_context,
> +	.restore_context = clk_periph_restore_context,
>  };
>  
>  static struct clk *_tegra_clk_register_periph(const char *name,
> diff --git a/drivers/clk/tegra/clk-sdmmc-mux.c b/drivers/clk/tegra/clk-sdmmc-mux.c
> index a5cd3e31dbae..48da9d7fea80 100644
> --- a/drivers/clk/tegra/clk-sdmmc-mux.c
> +++ b/drivers/clk/tegra/clk-sdmmc-mux.c
> @@ -194,6 +194,32 @@ static void clk_sdmmc_mux_disable(struct clk_hw *hw)
>  	gate_ops->disable(gate_hw);
>  }
>  
> +static int clk_sdmmc_mux_save_context(struct clk_hw *hw)
> +{
> +	struct tegra_sdmmc_mux *sdmmc_mux = to_clk_sdmmc_mux(hw);
> +	const struct clk_ops *gate_ops = sdmmc_mux->gate_ops;
> +	struct clk_hw *gate_hw = &sdmmc_mux->gate.hw;
> +
> +	sdmmc_mux->parent_ctx = clk_sdmmc_mux_get_parent(hw);
> +	gate_ops->save_context(gate_hw);
> +
> +	return 0;
> +}
> +
> +static void clk_sdmmc_mux_restore_context(struct clk_hw *hw)
> +{
> +	struct tegra_sdmmc_mux *sdmmc_mux = to_clk_sdmmc_mux(hw);
> +	const struct clk_ops *gate_ops = sdmmc_mux->gate_ops;
> +	struct clk_hw *gate_hw = &sdmmc_mux->gate.hw;
> +	struct clk_hw *parent = clk_hw_get_parent(hw);
> +	unsigned long parent_rate = clk_hw_get_rate(parent);
> +	unsigned long rate = clk_hw_get_rate(hw);
> +
> +	clk_sdmmc_mux_set_parent(hw, sdmmc_mux->parent_ctx);
> +	clk_sdmmc_mux_set_rate(hw, rate, parent_rate);
> +	gate_ops->restore_context(gate_hw);
> +}
> +
>  static const struct clk_ops tegra_clk_sdmmc_mux_ops = {
>  	.get_parent = clk_sdmmc_mux_get_parent,
>  	.set_parent = clk_sdmmc_mux_set_parent,
> @@ -203,6 +229,8 @@ static const struct clk_ops tegra_clk_sdmmc_mux_ops = {
>  	.is_enabled = clk_sdmmc_mux_is_enabled,
>  	.enable = clk_sdmmc_mux_enable,
>  	.disable = clk_sdmmc_mux_disable,
> +	.save_context = clk_sdmmc_mux_save_context,
> +	.restore_context = clk_sdmmc_mux_restore_context,
>  };
>  
>  struct clk *tegra_clk_register_sdmmc_mux_div(const char *name,
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index abba6d8a04cd..d61e61eebf4a 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -517,6 +517,8 @@ struct tegra_clk_periph_gate {
>  	int			clk_num;
>  	int			*enable_refcnt;
>  	const struct tegra_clk_periph_regs *regs;
> +	bool			clk_state_ctx;
> +	bool			rst_state_ctx;
>  };
>  
>  #define to_clk_periph_gate(_hw)					\
> @@ -543,6 +545,8 @@ struct tegra_clk_periph_fixed {
>  	unsigned int mul;
>  	unsigned int div;
>  	unsigned int num;
> +	bool enb_ctx;
> +	bool rst_ctx;
>  };
>  
>  struct clk *tegra_clk_register_periph_fixed(const char *name,
> @@ -575,6 +579,7 @@ struct tegra_clk_periph {
>  	const struct clk_ops	*mux_ops;
>  	const struct clk_ops	*div_ops;
>  	const struct clk_ops	*gate_ops;
> +	u8			parent_ctx;
>  };
>  
>  #define to_clk_periph(_hw) container_of(_hw, struct tegra_clk_periph, hw)
> @@ -726,6 +731,7 @@ struct tegra_sdmmc_mux {
>  	const struct clk_ops	*gate_ops;
>  	struct tegra_clk_periph_gate	gate;
>  	u8			div_flags;
> +	u8			parent_ctx;
>  };
>  
>  #define to_clk_sdmmc_mux(_hw) container_of(_hw, struct tegra_sdmmc_mux, hw)
> 

