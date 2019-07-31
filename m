Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23DDE7BEFB
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 13:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbfGaLMC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 07:12:02 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45420 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727856AbfGaLMC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 07:12:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id u10so8394611lfm.12;
        Wed, 31 Jul 2019 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+w/2TLh8qinXibKhyDRY1xBp+hIL8MQpeIp4scQJ6Ng=;
        b=eOtKsrBEBeBphhib0MLB/GmoYHdEeE61JvIBZr1Fa3SafCIifEm9Kmbt82k11+jrER
         IRBNAFjggI84gBe4T5ujcdX2fS5/Y8kDybbG5xGTZQcym5wBIOWCRAyA4U6Xp3xKhO1A
         IFzJQVUrLUj0zzoPk+yxhF7vtCv7BxYW0jNFEBzmqwsKJbb9BbAlZJyYKvsf0ukeua/K
         vtamnuZIoY897T30rRJxs9+D3U/l+s186MZ7vnTurMLWSUq9Sx8EoxOfVgup45SJhw1F
         k13yh3JqCIpiztOnzZF7Idsp0PJSO8M2kFxIVjCnvUuSBWf/wn4u0thId1D5olEzD9HR
         /z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+w/2TLh8qinXibKhyDRY1xBp+hIL8MQpeIp4scQJ6Ng=;
        b=F0sL0YjBHv218BuxwpVabw8U9szYZlGCjdiWjS1AWU5GvlW3mRUoBS1wHuymrBiSnM
         w8uBMTKAnUHiP7H2kPOMiDKT8rW0lSbLdu56rWFsqSTYAILQSWRCQZxJf3dZabEPU7CM
         +fu+eVAU0yLxDXw77pI4TcOGzKuYa/L6VJchWnNTThWgDjyclGOwvZ7DwF+ZIs6PkpSL
         suH2pqBzgkaszauSdU1/f6XiDgGdePnCCz02WrhpNzXvCXybKi6ipyOBc9trRLqUUx3K
         SLuKKJihFCkU+wbfgMmReQmzWm2ub1RuQueIxFZCXnv7k+IGpwq//l28fX8GA41qcyaX
         XTlw==
X-Gm-Message-State: APjAAAVz1RMBaFrUgVjIFUjFKO+e68T8v5TK51h1FmyF5jRzMeOYY6RO
        QYlu+7SraSJc2+EkFY11rP6URTzg
X-Google-Smtp-Source: APXvYqx7NJcpgs7mJjsWCoJeUt5yeaoTz27c0fmrOQxCKBUXEhKqaVwQeMeE2dYuXU2cA7a83TIh2g==
X-Received: by 2002:a19:ca1e:: with SMTP id a30mr56516415lfg.163.1564571519249;
        Wed, 31 Jul 2019 04:11:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id u15sm13892639lji.61.2019.07.31.04.11.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 04:11:58 -0700 (PDT)
Subject: Re: [PATCH v7 06/20] clk: tegra: Support for OSC context save and
 restore
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
 <1564532424-10449-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <16cca6aa-1034-f38a-49d1-d87b37fb6bbb@gmail.com>
Date:   Wed, 31 Jul 2019 14:11:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1564532424-10449-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

31.07.2019 3:20, Sowjanya Komatineni пишет:
> This patch adds support for saving OSC clock frequency and the
> drive-strength during OSC clock init and creates an API to restore
> OSC control register value from the saved context.
> 
> This API is invoked by Tegra210 clock driver during system resume
> to restore the  OSC clock settings.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-fixed.c | 15 +++++++++++++++
>  drivers/clk/tegra/clk.h             |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
> index 8d91b2b191cf..7c6c8abfcde6 100644
> --- a/drivers/clk/tegra/clk-tegra-fixed.c
> +++ b/drivers/clk/tegra/clk-tegra-fixed.c
> @@ -17,6 +17,10 @@
>  #define OSC_CTRL			0x50
>  #define OSC_CTRL_OSC_FREQ_SHIFT		28
>  #define OSC_CTRL_PLL_REF_DIV_SHIFT	26
> +#define OSC_CTRL_MASK			(0x3f2 |	\
> +					(0xf << OSC_CTRL_OSC_FREQ_SHIFT))
> +
> +static u32 osc_ctrl_ctx;
>  
>  int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
>  			      unsigned long *input_freqs, unsigned int num,
> @@ -29,6 +33,7 @@ int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
>  	unsigned osc_idx;
>  
>  	val = readl_relaxed(clk_base + OSC_CTRL);
> +	osc_ctrl_ctx = val & OSC_CTRL_MASK;
>  	osc_idx = val >> OSC_CTRL_OSC_FREQ_SHIFT;
>  
>  	if (osc_idx < num)
> @@ -96,3 +101,13 @@ void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)
>  		*dt_clk = clk;
>  	}
>  }
> +
> +void tegra_clk_osc_resume(void __iomem *clk_base)
> +{
> +	u32 val;
> +
> +	val = readl_relaxed(clk_base + OSC_CTRL) & ~OSC_CTRL_MASK;
> +	val |= osc_ctrl_ctx;
> +	writel_relaxed(val, clk_base + OSC_CTRL);

Why a full raw u32 OSC_CTRL value couldn't be simply saved and restored?

> +	fence_udelay(2, clk_base);
> +}
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index f1ef6ae8c979..abba6d8a04cd 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -842,6 +842,7 @@ u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
>  int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>  int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>  		 u8 frac_width, u8 flags);
> +void tegra_clk_osc_resume(void __iomem *clk_base);
>  
>  
>  /* Combined read fence with delay */
> 

