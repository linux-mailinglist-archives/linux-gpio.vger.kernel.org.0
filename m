Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D24B96FD6F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 12:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbfGVKMG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 06:12:06 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38678 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfGVKMF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 06:12:05 -0400
Received: by mail-lj1-f194.google.com with SMTP id r9so37018472ljg.5;
        Mon, 22 Jul 2019 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RjdfovW3RHoFfEQZVfWIAkagwO9INai7vl2K1tgY6dU=;
        b=Ry9pFjl7mELzYNNqBO1IT08fXTWooiRV/vaqzmeCAQ0f8+zInO9tqPKSYodHRPuVKx
         YzZWuH38d6Hhzf/7yuUACKGZCOTl3QAyZdd++I132dcqAq66nb9dw1fY7LCgf94d/LUZ
         JRAdU8mjBuNgbPuh4YTxG0rRnVmE2TGqgy+iRoa83uwLQMZE5d6eh4FEGws++HNmiRng
         yAFpg8PMeDIomcigQmEhmnYc/eAVLXukdQrJ4uag3Ejbxjp1qVqUfgxsvBmeQIW5xVWN
         +rIDtwxwm5/ACGtJtKo4iqv0M13Z/qPV9NKy5mSHYLtKB4CLbMiaaQB2mQHFp4IZYkmt
         lVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RjdfovW3RHoFfEQZVfWIAkagwO9INai7vl2K1tgY6dU=;
        b=KuvQmCwXuhe5bvn5X/9DhG/GhseUCBzJU5i/wghzP4ZPgmeTd3Y5Y+vc9mr20wOA7C
         oZt+UCLIgKL6jnlXlA1kAO00lbAhYEdNWVcmUlYjME9zeWMLn8r6/GWb1PugsWPrFjV8
         DO6wgwdvJW/9V72TfSCIBYBNP0qusCzCQ881WOl3ZYYJwBudiTANE/K9PXQUqgvjQFyv
         ARasX/sVouvTOJSW3SyOa1d5WhMZ3O8tOnbV213Qz58u+IB8oUUgTJvrkJFXEfF5xXwm
         XrStDOhRrI4Nhanct0R8DEXvsd2i682PY3ES8umUkLeST+zeYdtcmTQKVEHGzxZ8gKQE
         H/Vg==
X-Gm-Message-State: APjAAAUuev2v8COADW7/pzEStAuBL611Jy0bSR+eWCAZRzkxnubN3a+a
        zhG5feiz2QUlBwDCGeiz3ZPVC8li
X-Google-Smtp-Source: APXvYqz11iKxwnCtLwIZ3UTOrjhnKBtVkUcrvXm4WVqWHxYhLUxPzuv5GbwR71unpR5xAOLwKlJwkA==
X-Received: by 2002:a2e:2d12:: with SMTP id t18mr18767228ljt.175.1563790322657;
        Mon, 22 Jul 2019 03:12:02 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id y2sm7442646ljj.40.2019.07.22.03.12.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 03:12:02 -0700 (PDT)
Subject: Re: [PATCH V6 07/21] clk: tegra: Support for OSC context save and
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-8-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5d521102-83a5-ff5d-2301-4c6669bd7327@gmail.com>
Date:   Mon, 22 Jul 2019 13:12:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-8-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> X-NVConfidentiality: public

What's that?

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
> +	fence_udelay(2, clk_base);
> +}
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 8532f5150091..3cd003b7512a 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -849,6 +849,7 @@ int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>  int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>  		 u8 frac_width, u8 flags);
>  void tegra_clk_sync_state_pll(struct clk_hw *hw);
> +void tegra_clk_osc_resume(void __iomem *clk_base);
>  
>  /* Combined read fence with delay */
>  #define fence_udelay(delay, reg)	\
> 

