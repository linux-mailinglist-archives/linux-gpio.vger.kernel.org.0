Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2031D6F5C4
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 23:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfGUVQn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 17:16:43 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36459 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfGUVQn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 17:16:43 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so35547996ljj.3;
        Sun, 21 Jul 2019 14:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3txf9Lvt0i2AtQo17oHOJUAM62u+WqQuxF6kiDtoHLY=;
        b=n4IyTJvEM7ucvxZSTKG88V0fo38OSIkeJnuHUKIgHr+uQIvh0pMSuyEnW7px0/h0Oq
         8wKr3pogMi6S59B5zk+MhOgaGAyAN+ruRqiQCVPz1tg84p3cKKQFDnszPhSEWW5K6WIh
         7WZ+FpHIM4XYAl98qlcih64/xG55mdgRQ8Z7zOEihzRmOxC95X2m966IyLOPZaNcrShn
         5sEGJjavZy5hSm7wO6Y/WV3X/Oy70f3NyVBN4/YeyY9lnp/PBamI8qmIn7YOmPKy9guV
         GusG3H6pXFcuTb0+JIr4TEYIsrTkjBBC9VEv0cvqz8WJ5l77XOxR9imwj4oSrLzalX9R
         74aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3txf9Lvt0i2AtQo17oHOJUAM62u+WqQuxF6kiDtoHLY=;
        b=VFkJ27Fu6gljy/E9bO2lMEaaxzcvgAjQrKQJX/pzCwhqL3i1WHakte1xcUZdb0rEjH
         ldiHm4JFzOqX2lwJSkok3kiDUacN9G9n9+oh5Os+EBacVBZ/162kroG1H8BEJ6wwJkRb
         eAYTwhfo2hYs27iWRfZwcMPXsXHwciBAPdCQLbdV3GDJV/xCiX5S5OPYxFvBL/QvV+uk
         PMdrw6qAHDE5bQK3fdWoUyT2o/bGuv3v6wkUYfR57U/fYhDnUbXj/OUvAPbNWJz6WJwk
         9g3hMYbn9XKdOz5W+P/CGhf+mXNefPp2LsGJjdlKidBsrUzNWg4fS/KT9X/mrFl4UyIR
         +iow==
X-Gm-Message-State: APjAAAVudLYvtIpcxS/HYoP/x3T77dnYLLIG75y5H7wbmRciDxT6wJlg
        4LkphZsklgIZP1+/h1zNPM/RVhnA
X-Google-Smtp-Source: APXvYqzHAEfh8Be1M4mR4Grt8lD41aHIlCWfGhYJYzBgxbGe3e/x+FuLRT/88frDBID33WGch1SPLA==
X-Received: by 2002:a2e:8ecb:: with SMTP id e11mr7378502ljl.218.1563743799834;
        Sun, 21 Jul 2019 14:16:39 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id y5sm7163581ljj.5.2019.07.21.14.16.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 14:16:39 -0700 (PDT)
Subject: Re: [PATCH V6 09/21] clk: tegra: clk-super: Fix to enable PLLP
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-10-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0c86cd7f-81b5-40c5-6f1e-796e8f13b522@gmail.com>
Date:   Mon, 22 Jul 2019 00:16:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-10-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> This patch has a fix to enable PLLP branches to CPU before changing
> the CPU clusters clock source to PLLP for Gen5 Super clock.
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
>  drivers/clk/tegra/clk-super.c            | 11 +++++++++++
>  drivers/clk/tegra/clk-tegra-super-gen4.c |  4 ++--
>  drivers/clk/tegra/clk.h                  |  4 ++++
>  3 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
> index 39ef31b46df5..d73c587e4853 100644
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
> @@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw *hw, u8 index)
>  		if (index == mux->div2_index)
>  			index = mux->pllx_index;
>  	}
> +
> +	/*
> +	 * Enable PLLP branches to CPU before selecting PLLP source
> +	 */
> +	if ((mux->flags & TEGRA_CPU_CLK) &&
> +	    ((index == CCLK_SRC_PLLP_OUT0) || (index == CCLK_SRC_PLLP_OUT4)))
> +		tegra_clk_set_pllp_out_cpu(true);

Should somewhere here be tegra_clk_set_pllp_out_cpu(false) when
switching from PLLP?

>  	val &= ~((super_state_to_src_mask(mux)) << shift);
>  	val |= (index & (super_state_to_src_mask(mux))) << shift;
>  
> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
> index cdfe7c9697e1..cd208d0eca2a 100644
> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
> @@ -180,7 +180,7 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
>  					gen_info->num_cclk_g_parents,
>  					CLK_SET_RATE_PARENT,
>  					clk_base + CCLKG_BURST_POLICY,
> -					0, 4, 8, 0, NULL);
> +					TEGRA_CPU_CLK, 4, 8, 0, NULL);
>  		} else {
>  			clk = tegra_clk_register_super_mux("cclk_g",
>  					gen_info->cclk_g_parents,
> @@ -201,7 +201,7 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
>  					gen_info->num_cclk_lp_parents,
>  					CLK_SET_RATE_PARENT,
>  					clk_base + CCLKLP_BURST_POLICY,
> -					0, 4, 8, 0, NULL);
> +					TEGRA_CPU_CLK, 4, 8, 0, NULL);
>  		} else {
>  			clk = tegra_clk_register_super_mux("cclk_lp",
>  					gen_info->cclk_lp_parents,
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index ac6de3a0b91f..c357b49e49b0 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -694,6 +694,9 @@ struct clk *tegra_clk_register_periph_data(void __iomem *clk_base,
>   * Flags:
>   * TEGRA_DIVIDER_2 - LP cluster has additional divider. This flag indicates
>   *     that this is LP cluster clock.
> + * TEGRA_CPU_CLK - This flag indicates this is CPU cluster clock. To use PLLP
> + * for CPU clock source, need to enable PLLP branches to CPU by setting the
> + * additional bit PLLP_OUT_CPU for gen5 super clock.
>   */
>  struct tegra_clk_super_mux {
>  	struct clk_hw	hw;
> @@ -710,6 +713,7 @@ struct tegra_clk_super_mux {
>  #define to_clk_super_mux(_hw) container_of(_hw, struct tegra_clk_super_mux, hw)
>  
>  #define TEGRA_DIVIDER_2 BIT(0)
> +#define TEGRA_CPU_CLK	BIT(1)

I'd name this TEGRA210_CPU_CLK for clarity.

>  extern const struct clk_ops tegra_clk_super_ops;
>  struct clk *tegra_clk_register_super_mux(const char *name,
> 

Will be better to move the tegra_clk_set_pllp_out_cpu() definition into
this patch, otherwise this looks inconsistent for reviewer.
