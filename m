Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35C6B6F5B9
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 23:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfGUVEu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 17:04:50 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38674 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfGUVEu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 17:04:50 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so35520380ljg.5;
        Sun, 21 Jul 2019 14:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ovL2Obp9Kl1hM8L5JOpuW+zjxLqSyAvaMd6JShBVye8=;
        b=dNKa1zSyEQJpmJFDq7xJgDIL2RE02fVBbG020904Fo48vTApw9dDdv+SxBX36zK47K
         aE1/rcse9/oSQXtoA0/ENWAY7ijXSzCqVdIJE10jbnWcixexS4cLHMukyfbut4VUccia
         FxnSwzdm54Q77pChlSyEwO8ikNWF2PM0lUE4ZzYgV8cZQNtFgy7YtYITYK16aOu/4HPw
         AKzJMsIVPIjbgFur2SF8kapBkLzEiAAHctbg7EHbdsC4K/dDfBrQllC2GPNEmXStNEH4
         dJOdMor1LSf4iEQ/yRnpxJ8xlQ0f/zom1ExPZ7fBxhohwSLTjhAOUhJRv9DN3NrdaMvD
         2tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ovL2Obp9Kl1hM8L5JOpuW+zjxLqSyAvaMd6JShBVye8=;
        b=W7V+MPjaXtPJi7TEwkuwcvrdILm147EsUEb9F+dS1dJqSvJmshjXbLToRiUr4HtbH3
         tz9gmfC5WPpwOQMpvPx7tKeCluGhbAk+laFsH7U2WfSC5KuYwWkcYf+xY+OGbYcmcUP0
         PpNeTXrHcwV5aEjuFlBbbPl0+V2w9kXoS+kxIrkuT6pSSib1iq18pbAGGEr0RrdBgnVW
         o3QP4HUrFv4y0Wzq/V6SqEHBU7Vlpp5MavMWcvaAScigGsgrWh1fiB4+1DXoCdXwXT9h
         TzKe+uGEYaksGd8C5PZx6foYNlGPy4a4VTDKTOGjd5+Nyjxc2mrc65yFNjJLdIWrg6Dz
         NJ3Q==
X-Gm-Message-State: APjAAAU8v0SuRhZURSygK9D/apfiomxXyHDpdW+K38r+pUZgqkj/eN00
        t2ZR4+u7UDHQhnXcfLpADHb0M+cm
X-Google-Smtp-Source: APXvYqyk/YWKz2S6MWvk62FSGL399FUvHi7vq6pEUnkhGW9raU32/vQ8qft8hJVJtqfY7xVftUZtAQ==
X-Received: by 2002:a2e:9b03:: with SMTP id u3mr14621973lji.15.1563743087188;
        Sun, 21 Jul 2019 14:04:47 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id v22sm5794075lfe.49.2019.07.21.14.04.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 14:04:46 -0700 (PDT)
Subject: Re: [PATCH V6 12/21] cpufreq: tegra124: Add suspend and resume
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-13-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6cb1c860-fdf3-e648-e920-50d4e8b9b0cf@gmail.com>
Date:   Mon, 22 Jul 2019 00:04:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-13-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> This patch adds suspend and resume pm ops for cpufreq driver.
> 
> PLLP is the safe clock source for CPU during system suspend and
> resume as PLLP rate is below the CPU Fmax at Vmin.
> 
> CPUFreq driver suspend switches the CPU clock source to PLLP and
> disables the DFLL clock.
> 
> During system resume, warmboot code powers up the CPU with PLLP
> clock source. So CPUFreq driver resume enabled DFLL clock and
> switches CPU back to DFLL clock source.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/cpufreq/tegra124-cpufreq.c | 46 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> index 4f0c637b3b49..4eff63379b0f 100644
> --- a/drivers/cpufreq/tegra124-cpufreq.c
> +++ b/drivers/cpufreq/tegra124-cpufreq.c
> @@ -6,6 +6,7 @@
>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>  
>  #include <linux/clk.h>
> +#include <linux/cpufreq.h>>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> @@ -128,8 +129,53 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static int tegra124_cpufreq_suspend(struct device *dev)

__maybe_unused

> +{
> +	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(dev);
> +
> +	/*
> +	 * PLLP rate 408Mhz is below the CPU Fmax at Vmin and is safe to
> +	 * use during suspend and resume. So, switch the CPU clock source
> +	 * to PLLP and disable DFLL.
> +	 */
> +	clk_set_parent(priv->cpu_clk, priv->pllp_clk);

Error check?

> +
> +	/* disable DFLL clock */
> +	clk_disable_unprepare(priv->dfll_clk);
> +
> +	return 0;
> +}
> +
> +static int tegra124_cpufreq_resume(struct device *dev)

__maybe_unused

> +{
> +	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	/*
> +	 * Warmboot code powers up the CPU with PLLP clock source.
> +	 * Enable DFLL clock and switch CPU clock source back to DFLL.
> +	 */
> +	ret = clk_prepare_enable(priv->dfll_clk);
> +	if (ret) {
> +		dev_warn(dev, "failed to enable DFLL clock for CPU\n");

dev_err("..: %d\n", err);

> +		clk_set_parent(priv->cpu_clk, priv->pllp_clk);

This is not needed because CPU is already on PLLP.

> +		disable_cpufreq();
> +		return ret;
> +	}
> +
> +	clk_set_parent(priv->cpu_clk, priv->dfll_clk);

Error check?

> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops tegra124_cpufreq_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra124_cpufreq_suspend,
> +				tegra124_cpufreq_resume)
> +};
> +
>  static struct platform_driver tegra124_cpufreq_platdrv = {
>  	.driver.name	= "cpufreq-tegra124",
> +	.driver.pm	= &tegra124_cpufreq_pm_ops,
>  	.probe		= tegra124_cpufreq_probe,
>  };
>  
> 

