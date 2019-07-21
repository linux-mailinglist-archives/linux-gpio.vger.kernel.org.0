Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3F86F65C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 00:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfGUWSu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 18:18:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42195 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfGUWSu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 18:18:50 -0400
Received: by mail-lj1-f196.google.com with SMTP id t28so35611065lje.9;
        Sun, 21 Jul 2019 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XwqaIN1biC66LCQo+AqmGLhnYOQ4BBW9pwy3RBygxE0=;
        b=BmIYRe19gtgTPA7tsJrTJpaE27pNLF0O4wukdNlr17kUsZ1h9M1mz5BF6sVcmy3VYT
         gdu+R73Zm5pFZsWgslslfB45dF0NOmn3YVe55aBQU0NX7FvgUfvIlv+KjZVRxv+ECIec
         1iQwW6Z/X9uLQEqeVR9mjS4+foakl26UefHNHtqB7Xn7uTW/li5Kp1K0RxRqDhy9KRbN
         65bwlOD9wljC0jWSmzY5hNI7euSU0rEDLAH1pk+/phqonF2T7worwEgbaxniABjJQE86
         vVV5TVRX2a5L95zc8J0vyxtTGGVyfrUeeCQPhlyAtU9PIijsSAWC2Vlv1x0LF0wljIkv
         fIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XwqaIN1biC66LCQo+AqmGLhnYOQ4BBW9pwy3RBygxE0=;
        b=K2ubK+mod/VykI8UqJtnIIzoUjOnpzJNGl2kA8aTljRY4DT6VqQncCNFxuPpRID2GY
         BnzeY2Udtw51v4xEXo50P4KToK83Oc/ily4z88ji+wYiFCEFAFxfTNzJ8L4Vk87CnBOr
         sEAlNTo4s+FPOspWyQck7Y7SQxhpYmlNvUMMUrnzjIra+p2PjnzbCmiKn8o+FhIPI4AX
         jsNH2JykwEmBZ7cAwl5ZQknn45Medu5t/P5ape2SqeVgx+1bOEP6wFHufq+iW+3Zsb9U
         JNkOryo5VZ30Fw2i98G7649uuo+6wQyu8hhn0cSP4h0evfCUzqvZaJbAzhTWuXqeW+bA
         f6qw==
X-Gm-Message-State: APjAAAV0MUngJjf6KLsBaYA1N/goYmqwgxc3Pu/32hCnJw2PQM3v1wYV
        eXqL4SxhcFrrkCvXpHiVImtp3IE2
X-Google-Smtp-Source: APXvYqw9E2EVstY9FLPIP5ENL75wOI/4BbrAeIWt1A3622hWz6P3+yNiqrrM/3nfXha+s27P61C3aw==
X-Received: by 2002:a2e:7315:: with SMTP id o21mr26711662ljc.3.1563747526579;
        Sun, 21 Jul 2019 15:18:46 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id e87sm8224796ljf.54.2019.07.21.15.18.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 15:18:46 -0700 (PDT)
Subject: Re: [PATCH V6 05/21] clk: tegra: pllout: Save and restore pllout
 context
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-6-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2990f6b1-a43f-d910-6743-1c13e029ce36@gmail.com>
Date:   Mon, 22 Jul 2019 01:18:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-6-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> This patch implements save and restore of pllout context.
> 
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
> 
> So during suspend entry the state of pllout is saved and on resume
> it is restored back to have pllout in same state as before suspend.
> 
> pllout rate is saved and restore in clock divider so it will be at
> same rate as before suspend when pllout state is restored.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll-out.c  | 28 ++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-tegra210.c |  3 ++-
>  drivers/clk/tegra/clk.h          |  9 +++++++++
>  3 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll-out.c b/drivers/clk/tegra/clk-pll-out.c
> index 35f2bf00e1e6..8f26a7e3e579 100644
> --- a/drivers/clk/tegra/clk-pll-out.c
> +++ b/drivers/clk/tegra/clk-pll-out.c
> @@ -69,10 +69,38 @@ static void clk_pll_out_disable(struct clk_hw *hw)
>  		spin_unlock_irqrestore(pll_out->lock, flags);
>  }
>  
> +static int tegra_clk_pll_out_save_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_pll_out *pll_out = to_clk_pll_out(hw);
> +
> +	if (pll_out->flags & TEGRA_PLLRE_OUT)
> +		pll_out->pllout_ctx = readl_relaxed(pll_out->reg);


> +	else
> +		pll_out->pllout_ctx = clk_hw_get_rate(hw);

This is unused?

> +	return 0;
> +}
> +
> +static void tegra_clk_pll_out_restore_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_pll_out *pll_out = to_clk_pll_out(hw);
> +
> +	if (pll_out->flags & TEGRA_PLLRE_OUT) {
> +		writel_relaxed(pll_out->pllout_ctx, pll_out->reg);
> +	} else {
> +		if (!__clk_get_enable_count(hw->clk))
> +			clk_pll_out_disable(hw);
> +		else
> +			clk_pll_out_enable(hw);
> +	}
> +}
> +
>  const struct clk_ops tegra_clk_pll_out_ops = {
>  	.is_enabled = clk_pll_out_is_enabled,
>  	.enable = clk_pll_out_enable,
>  	.disable = clk_pll_out_disable,
> +	.save_context = tegra_clk_pll_out_save_context,
> +	.restore_context = tegra_clk_pll_out_restore_context,
>  };
>  
>  struct clk *tegra_clk_register_pll_out(const char *name,
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index df172d5772d7..4721ee030d1c 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -3200,7 +3200,8 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
>  					 8, 8, 1, NULL);
>  	clk = tegra_clk_register_pll_out("pll_re_out1", "pll_re_out1_div",
>  					 clk_base + PLLRE_OUT1, 1, 0,
> -					 CLK_SET_RATE_PARENT, 0, NULL);
> +					 CLK_SET_RATE_PARENT, TEGRA_PLLRE_OUT,
> +					 NULL);
>  	clks[TEGRA210_CLK_PLL_RE_OUT1] = clk;
>  
>  	/* PLLE */
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 83623f5f55f3..fb29a8c27873 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -439,6 +439,12 @@ struct clk *tegra_clk_register_pllu_tegra210(const char *name,
>   * @rst_bit_idx:	bit to reset PLL divider
>   * @lock:		register lock
>   * @flags:		hardware-specific flags
> + * @pllout_ctx:		pllout context to save and restore during suspend
> + *			and resume
> + *
> + * Flags:
> + * TEGRA_PLLRE_OUT - This flag indicates that it is PLLRE_OUT and is used to
> + *		     identify PLLRE_OUT during clk_pll_out save and restore.
>   */
>  struct tegra_clk_pll_out {
>  	struct clk_hw	hw;
> @@ -447,8 +453,11 @@ struct tegra_clk_pll_out {
>  	u8		rst_bit_idx;
>  	spinlock_t	*lock;
>  	u8		flags;
> +	unsigned int	pllout_ctx;

u32

>  };
>  
> +#define TEGRA_PLLRE_OUT BIT(0)
> +
>  #define to_clk_pll_out(_hw) container_of(_hw, struct tegra_clk_pll_out, hw)
>  
>  extern const struct clk_ops tegra_clk_pll_out_ops;
> 

