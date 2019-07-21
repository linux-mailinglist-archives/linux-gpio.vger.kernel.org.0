Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14A106F5D9
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 23:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfGUVc3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 17:32:29 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38145 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfGUVc3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 17:32:29 -0400
Received: by mail-lj1-f194.google.com with SMTP id r9so35553739ljg.5;
        Sun, 21 Jul 2019 14:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7pC/pygQnxXVdrtejHUkPFtVoKsU72zGHkszKq+xSic=;
        b=evNf3jpS5qYVY2p6JD1cDwNdrDLK4RLQmB/u1b2Rf06fuCeigEkGP9fggfi1hokO4O
         e4JB48pKUZae5fspzNNvka2NijxKvMl64etLikltUdhcYeNz2lt0k2wfe7/N0im/UL2y
         ATgeNIFLxSQYlaaMbzFQDTJHc+8370eSiTsh3E5NMXwXLrlShT4wa3k+8oPlJKb4yx7b
         erwtF70T02+VtgkzmUtgR6+OcVPyFdRAMZwHrfpWNJh8vcwcNOvc7vorbP78pfTGbrcf
         +xo9I/hm4FEQ+E3Dd6K3eKVnW/k/hbGOOQpBhfvCVgQhN0660HqM4fyo7BTh6VyRDlko
         bHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7pC/pygQnxXVdrtejHUkPFtVoKsU72zGHkszKq+xSic=;
        b=VaPPb0d1WJDYR9JJ3uj4+MRYfW6nxMfUsftxp6xOOwr9XdoehEJguOoZUsvylSGkU6
         UfaACzFSx6iC9+7DYzs95mArl39Pz4oc/EtNeGfznfNbK6lHLNnTwqLJVA96Fm5SNM/a
         NOGGtOP1e4TTx57ZngUEaCdMlGotxQh5SgfV6YDiIN+RLWUKboCE7mRq/S2jD48Pon3I
         mAtP+P5O4c6PAkIp4tyyN2dUDQZP4SCNaF9ql0hVnXiptuY3v/3kRJLeqc6P5uh27tfD
         JezwSZDjzcvfUaY9FUNzBuA5oQZaPebBFshd8uAiFxU1sTtsNwtOUpeNofZD8YeTDYaE
         SPtw==
X-Gm-Message-State: APjAAAV0ufHkviV2Rp8wW+WcbnvA+f0fSsMuGN9LqwAXFVzjfdfiNIHW
        GKfdwv3Cx40H0BlgsILXqHK3w0M3
X-Google-Smtp-Source: APXvYqy3tbv+tcPdjd6a/OMrspSUOM15guPCXPV80Q+aAEQXpW6Q7Ln9u91Wng8Vbh1eJbr0fhXXwA==
X-Received: by 2002:a2e:b009:: with SMTP id y9mr23414874ljk.152.1563744745672;
        Sun, 21 Jul 2019 14:32:25 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id x18sm5794381lfe.42.2019.07.21.14.32.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 14:32:24 -0700 (PDT)
Subject: Re: [PATCH V6 11/21] clk: tegra: clk-dfll: Add suspend and resume
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
 <1563738060-30213-12-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <54e3237d-c6c2-2007-99b2-89c26004da47@gmail.com>
Date:   Mon, 22 Jul 2019 00:32:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-12-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
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
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c               | 44 ++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-dfll.h               |  2 ++
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c |  1 +
>  3 files changed, 47 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index f8688c2ddf1a..7dcad4ccd0ae 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -1513,6 +1513,50 @@ static int dfll_init(struct tegra_dfll *td)
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
> +		dev_warn(td->dev, "failed disabling the dfll\n");

Something like "dfll is enabled while shouldn't be\n" will be more
informative.

This is a error, hence dev_err().

> +		return -EBUSY;
> +	}
> +
> +	pm_runtime_disable(dev);
> +
> +	clk_unprepare(td->ref_clk);
> +	clk_unprepare(td->soc_clk);
> +	clk_unprepare(td->i2c_clk);

Please don't do this, DFLL is already disabled if not running.

> +	reset_control_assert(td->dvco_rst);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_dfll_suspend);
> +
> +/**
> + * tegra_dfll_resume - reinitialize DFLL on resume
> + * @pdev: DFLL instance
> + *
> + * Re-initialize DFLL on resume as it gets disabled and reset during
> + * suspend entry. DFLL clock is enabled in closed loop mode later
> + * and CPU frequency will be switched to DFLL output.
> + */
> +int tegra_dfll_resume(struct device *dev)
> +{
> +	struct tegra_dfll *td = dev_get_drvdata(dev);
> +
> +	return dfll_init(td);

Just create dfll_reinit() variant.

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

