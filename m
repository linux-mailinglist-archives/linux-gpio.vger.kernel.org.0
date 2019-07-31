Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59B7E7BE1F
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 12:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbfGaKNa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 06:13:30 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44950 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfGaKNa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 06:13:30 -0400
Received: by mail-lf1-f68.google.com with SMTP id r15so30052886lfm.11;
        Wed, 31 Jul 2019 03:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7SxGuds9OQOVwnoD/O7wV/C951qTVXKAusYltSAWo2E=;
        b=kU8NnR4lHdxPexUj2w7TRQ2ONxWzKF3ORsM4eaFWLT59cjDHRSreT8XsNuEhGejPYj
         LNIKPBdlQtfRJM3BmStlhZgFp86wdbAh7CjGZEQx6IOkfnIfC3zKLJWz3TAiN/7BlRQN
         JvmedyTOsw3HKwUNIrBq4C+rIxCvc5Xjo+mT/fR3HurISEmMzFpLphaQSSeYWEGgwF5q
         cE1J8C8kvbD/ztj+tHOLAPfb1wPEs5MEPelOoUo+GVdoVXt4fZT4hztr2BFCADMQrf/9
         lr9marqa5gYK77OjPy115xAlFw1uBUlG8bL8Q6ZLrzpNEEbvt25RZLVmI2Z/hxVV88M2
         ijYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7SxGuds9OQOVwnoD/O7wV/C951qTVXKAusYltSAWo2E=;
        b=qkz8YU5OrUedp6k/Q7vK76s83ibxrYk2pIzHstzNCf7Antk6HKGtm/BIn7F1mqZhgi
         E+ULP0cFkkIxx5b9PZ53xeOwcnoaCOD0ejbwUwqV3UB6fOhpKNc1BprMEebbH4oe75Kx
         RKJ3HNoJoq3sTSDtTWpG4LihkaVWJoFA+FwiISmGBbR7YHnlYHBVClABf+cBVLOcJl+u
         qmiiMFsIWKgTWBwXiCZCJeC+F4UXXdL3oyFSdttXHeqrk9gTNd5B2czTgRwDhshB2Nor
         lFabmneCSKLbM8Rk991Fk1bVY9dXNtAWsPKpL+C3/mdZNaVj1X/a6332rpWuUbQjdV/L
         ls8w==
X-Gm-Message-State: APjAAAVx/DkiScFk3IlQg8+TBVv5rck6fLvGZQRbWwy07UoLDrFE8JCA
        ckzJpTfIq8xm5TMvHfQZcdzsV7QM
X-Google-Smtp-Source: APXvYqzZ1UHd829MHPvXhuhYL3vcX7dTb78E05fpBFoBXx5+vBVCQb1Gl2IFQWf9tkeN6BtavgrZdQ==
X-Received: by 2002:a19:6e41:: with SMTP id q1mr47761072lfk.20.1564568006447;
        Wed, 31 Jul 2019 03:13:26 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id m17sm13150783lfb.9.2019.07.31.03.13.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 03:13:25 -0700 (PDT)
Subject: Re: [PATCH v7 10/20] clk: tegra: clk-dfll: Add suspend and resume
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
 <1564532424-10449-11-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <523ba069-5663-6593-d954-475720864eab@gmail.com>
Date:   Wed, 31 Jul 2019 13:12:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1564532424-10449-11-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

31.07.2019 3:20, Sowjanya Komatineni пишет:
> This patch implements DFLL suspend and resume operation.
> 
> During system suspend entry, CPU clock will switch CPU to safe
> clock source of PLLP and disables DFLL clock output.
> 
> DFLL driver suspend confirms DFLL disable state and errors out on
> being active.
> 
> DFLL is re-initialized during the DFLL driver resume as it goes
> through complete reset during suspend entry.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c               | 56 ++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-dfll.h               |  2 ++
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c |  1 +
>  3 files changed, 59 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index f8688c2ddf1a..9900097ec2aa 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -1513,6 +1513,62 @@ static int dfll_init(struct tegra_dfll *td)
>  	return ret;
>  }
>  
> +/**
> + * tegra_dfll_suspend - check DFLL is disabled
> + * @dev: DFLL device *
> + *
> + * DFLL clock should be disabled by the CPUFreq driver. So, make
> + * sure it is disabled and disable all clocks needed by the DFLL.
> + */
> +int tegra_dfll_suspend(struct device *dev)
> +{
> +	struct tegra_dfll *td = dev_get_drvdata(dev);
> +
> +	if (dfll_is_running(td)) {
> +		dev_err(td->dev, "dfll is enabled while shouldn't be\n");
> +		return -EBUSY;
> +	}
> +
> +	reset_control_assert(td->dvco_rst);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_dfll_suspend);
> +
> +/**
> + * tegra_dfll_resume - reinitialize DFLL on resume
> + * @dev: DFLL instance
> + *
> + * DFLL is disabled and reset during suspend and resume.
> + * So, reinitialize the DFLL IP block back for use.
> + * DFLL clock is enabled later in closed loop mode by CPUFreq
> + * driver before switching its clock source to DFLL output.
> + */
> +int tegra_dfll_resume(struct device *dev)
> +{
> +	struct tegra_dfll *td = dev_get_drvdata(dev);
> +
> +	reset_control_deassert(td->dvco_rst);
> +
> +	pm_runtime_irq_safe(td->dev);

1. Interrupts are allowed here.
2. It's enough to invoke that function once during probe.
3. That function bumps runtime-enable count of the parent, which
immediately should raise some questions.

Corollary: you should remove pm_runtime_irq_safe() because it is not needed.

> +	pm_runtime_get_sync(td->dev);
> +
> +	dfll_set_mode(td, DFLL_DISABLED);
> +	dfll_set_default_params(td);
> +
> +	if (td->soc->init_clock_trimmers)
> +		td->soc->init_clock_trimmers();
> +
> +	dfll_set_open_loop_config(td);
> +
> +	dfll_init_out_if(td);
> +
> +	pm_runtime_put_sync(td->dev);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_dfll_resume);
> +
>  /*
>   * DT data fetch
>   */
> diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
> index 1b14ebe7268b..fb209eb5f365 100644
> --- a/drivers/clk/tegra/clk-dfll.h
> +++ b/drivers/clk/tegra/clk-dfll.h
> @@ -42,5 +42,7 @@ int tegra_dfll_register(struct platform_device *pdev,
>  struct tegra_dfll_soc_data *tegra_dfll_unregister(struct platform_device *pdev);
>  int tegra_dfll_runtime_suspend(struct device *dev);
>  int tegra_dfll_runtime_resume(struct device *dev);
> +int tegra_dfll_suspend(struct device *dev);
> +int tegra_dfll_resume(struct device *dev);
>  
>  #endif /* __DRIVERS_CLK_TEGRA_CLK_DFLL_H */
> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> index e84b6d52cbbd..2ac2679d696d 100644
> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> @@ -631,6 +631,7 @@ static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
>  static const struct dev_pm_ops tegra124_dfll_pm_ops = {
>  	SET_RUNTIME_PM_OPS(tegra_dfll_runtime_suspend,
>  			   tegra_dfll_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_dfll_suspend, tegra_dfll_resume)
>  };
>  
>  static struct platform_driver tegra124_dfll_fcpu_driver = {
> 

