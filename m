Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C745D7F6E1
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 14:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392616AbfHBMcv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 08:32:51 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40051 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729267AbfHBMcu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 08:32:50 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so66208820wmj.5;
        Fri, 02 Aug 2019 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dzUcg2Ik/ydWHD1gpTTQN7qp0Cm5aZCNkk/EL3Y9f5c=;
        b=XLPiUEkdK+L1GOgSoWoodritZzMqc6objb05zrI7kxLKR5Yo/Sk+ozcuT3AHiyU7kj
         uYsel7QcWKRq9nZkUfIJZatqTr9Hk04fv0q69bGZ+JbYvWeXRC8tjzTMs+q1WZMoyTKC
         Apy2EhMzkzZCb6DaAtQeguYQ4iT8yRB2JWHu8Hw9Ajkf7i9KeDMQANul9yr5COaEnKIq
         awqb7xFcWjUUNe4vJLQOWHV+nP1wccPVu7Q+eRUBpl8kmd4KzOFS6x0XUygqpaG6JJ2V
         68snS4X0erl2oiPZjeFSiPuSbV+lk4uqOxifPxczp5OwFaXIIaJQEqPllWp6Pe2IeTjV
         +eQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dzUcg2Ik/ydWHD1gpTTQN7qp0Cm5aZCNkk/EL3Y9f5c=;
        b=mmTiFTzWtWs7th+t9Y3PKVSCui2QBF1gCBvzTjuUpzV8dnRst4uLpNKR2dVkewlGsz
         77lJrcz5PhbPpglDJzRQ1EjqoZZ1EF2gyBe+DjI33DoRmHsQd3Xm73w1s9A8i1sWIqNM
         JsiWaXFhZwGos13UbYkgsnFjM7wjEiaJJBZYketCy43xL7+4b1wLU8psHLlGh8YTOP34
         xNW6bw08Hw+9LpwdRaBfvCyzcFd8qeVPV+Z+OeMvh00CFKgYJUIiCiPm58JZIq6DEj5/
         5WeQMJz2qSzUYkhJihrfuk+Jqb1BZGG2aRTOOg17avH/CycS40wKsdpCFcfx5wbu5TKl
         0PCg==
X-Gm-Message-State: APjAAAVluMFJ3RXTktVLiVJ8vDpTjtSmwCoK9JDB6onrtpV3VMrWC8ko
        dp2NF8HZpn5iuVuUxuE2DAFrGh3V
X-Google-Smtp-Source: APXvYqwrgmzSD203TM2VN0jdQRS3Rn1In9qn9CrUX+kYZPL1PXIqdO+pKDuXMbeQzsH//HjSvTkp7g==
X-Received: by 2002:a1c:2d8b:: with SMTP id t133mr4401017wmt.57.1564749166741;
        Fri, 02 Aug 2019 05:32:46 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id v12sm64652341wrr.87.2019.08.02.05.32.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:32:45 -0700 (PDT)
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
Message-ID: <c703b4fc-9ebb-0fd4-11de-80974b5c3842@gmail.com>
Date:   Fri, 2 Aug 2019 15:32:43 +0300
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

This could be BIT(fixed->num % 32).

> +	fixed->enb_ctx = readl_relaxed(fixed->base + fixed->regs->enb_reg) &
> +			 mask;
> +	fixed->rst_ctx = readl_relaxed(fixed->base + fixed->regs->rst_reg) &
> +			 mask;

The enb_ctx/rst_ctx are booleans, while you assigning an integer value
here. You're getting away here because bool is an 32bit unsigned int,
but you shouldn't rely on it and always explicitly convert to a bool.

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

Will be better to read out and compare the hardware's state with the
restored one, then bail out if the state is unchanged.

Shouldn't it be fence_udelay()?

> +	if (!fixed->rst_ctx) {
> +		udelay(5); /* reset propogation delay */

Why delaying is done before the writing to the reset register?

> +		writel_relaxed(mask, fixed->base + fixed->regs->rst_reg);

I'm not quite sure what's going on here, this looks wrong.

1. rst_reg points to RST_DEVICES_x
2. Each bit of RST_DEVICES_x represents the reset-assertion state of
each individual device
3. By writing to rst_reg, all (!) devices are deasserted, except the one
device which corresponds to the mask
4. The reset is asserted for a single device, while !fixed->rst_ctx
means that it actually should be deasserted (?)

Apparently you should use rst_set_reg / rst_clr_reg.

> +	}

What about the case where rst_ctx=true?

> +}

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

I'd expect these to be bool:1.
