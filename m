Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEE85AB87
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 15:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfF2N27 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 09:28:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37878 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbfF2N27 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 09:28:59 -0400
Received: by mail-lj1-f193.google.com with SMTP id 131so8652960ljf.4;
        Sat, 29 Jun 2019 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mNaKReTBxItupfB7hwV2NSFq7sa0EUunngF802oSfeE=;
        b=i4mIRtOe8HtQ7Ri5WPszIt1qaxpMHuiyR1x1cRtbYiPOTcg+LeUUElXaeMrn4aOWeE
         MpJkiZVDvOC8Z1sBVWIRYdynWw3x8EDyg4oSY0WCJ1XIjnyJ7C8naksICqD/ARLpHHb1
         vRlKJjlFjYfbWTtngXGHl/izFJPPPUvE/elliLgahnQnfBgHjl5328EZO0CtzOAZYi0p
         XVmvFim/5YGmnvajQpgfnnOcsRobqz6SSvmNwf9NyRObQ54l67WejvATbjRoHOAH0wOF
         XYvn3qa6wBRjfjDCOqj1nrhmSP6yoPFAL8ehNDF26ZGDSPDKyfvMRmJWht7EtaATlncl
         /c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mNaKReTBxItupfB7hwV2NSFq7sa0EUunngF802oSfeE=;
        b=aMu9/bwhkN/PfPchVeU8mY+5VuraVwxFKwqq5Bgwf1ysnjO4H5iVJqgw0d4Bt/3Vuc
         i5DzjoEf5u4xmX6SVQsuw4TsGirFZ3J9lwojxTDZ5bJAn6aC8x7SmrQzemuh343NNFl8
         hoCF/x0vpNI7gDl9Wmloln+iPgG15FQDzrbz+kMJkEmVvp70TspVv5vK2y1kbmhuu6N5
         4iRd/VKQcaj8wdZgLVN3yiaVfCk8u8Az4iyjBWeadwup9erNBvOl68fZQFugcM5ct8cS
         yXUbJIQbShcFNhW4dOvEkTvrFhXv7a689vUW4DKQDkNUmdBln6JOjbXUuwyI7C+qkFzQ
         JNZA==
X-Gm-Message-State: APjAAAXCmSyUm9vrIn/z/1+TYdexT8rT/3CUJiYnJzUEmKEUkxgLkhev
        JtYU7UI3B7eTkWSwabd4EzXhZqcU
X-Google-Smtp-Source: APXvYqwlkJ5e3bmxsrY9EYf0GKHFaNtgqT4sbt9HMAN7se5yWW6c68gTJAfHhtoaRLyIGzvizZe+kA==
X-Received: by 2002:a2e:9213:: with SMTP id k19mr8948340ljg.237.1561814935934;
        Sat, 29 Jun 2019 06:28:55 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id j23sm1400232lfb.93.2019.06.29.06.28.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 06:28:55 -0700 (PDT)
Subject: Re: [PATCH V5 08/18] clk: tegra: Add suspend resume support for DFLL
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
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-9-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <594adc1e-4345-33ae-c79f-ad6f00964587@gmail.com>
Date:   Sat, 29 Jun 2019 16:28:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561687972-19319-9-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> This patch creates APIs for supporting Tegra210 clock driver to
> perform DFLL suspend and resume operation.
> 
> During suspend, DFLL mode is saved and on resume Tegra210 clock driver
> invokes DFLL resume API to re-initialize DFLL to enable target device
> clock in open loop mode or closed loop mode.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-dfll.h |  2 ++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index f8688c2ddf1a..a1f37cf99b00 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -277,6 +277,7 @@ struct tegra_dfll {
>  	unsigned long			dvco_rate_min;
>  
>  	enum dfll_ctrl_mode		mode;
> +	enum dfll_ctrl_mode		resume_mode;
>  	enum dfll_tune_range		tune_range;
>  	struct dentry			*debugfs_dir;
>  	struct clk_hw			dfll_clk_hw;
> @@ -1864,6 +1865,83 @@ static int dfll_fetch_common_params(struct tegra_dfll *td)
>  }
>  
>  /*
> + * tegra_dfll_suspend
> + * @pdev: DFLL instance
> + *
> + * dfll controls clock/voltage to other devices, including CPU. Therefore,
> + * dfll driver pm suspend callback does not stop cl-dvfs operations.
> + */
> +void tegra_dfll_suspend(struct platform_device *pdev)
> +{
> +	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
> +
> +	if (!td)
> +		return;
> +
> +	if (td->mode <= DFLL_DISABLED)
> +		return;
> +
> +	td->resume_mode = td->mode;
> +	switch (td->mode) {
> +	case DFLL_CLOSED_LOOP:
> +		dfll_set_mode(td, DFLL_CLOSED_LOOP);
> +		dfll_set_frequency_request(td, &td->last_req);
> +
> +		dfll_unlock(td);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +/**
> + * tegra_dfll_resume - reprogram the DFLL after context-loss
> + * @pdev: DFLL instance
> + *
> + * Re-initialize and enable target device clock in open loop mode. Called
> + * directly from SoC clock resume syscore operation. Closed loop will be
> + * re-entered in platform syscore ops as well after CPU clock source is
> + * switched to DFLL in open loop.
> + */
> +void tegra_dfll_resume(struct platform_device *pdev, bool on_dfll)
> +{
> +	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
> +
> +	if (!td)
> +		return;
> +
> +	if (on_dfll) {
> +		if (td->resume_mode == DFLL_CLOSED_LOOP)
> +			dfll_lock(td);
> +		td->resume_mode = DFLL_DISABLED;
> +		return;
> +	}
> +
> +	reset_control_deassert(td->dvco_rst);
> +
> +	pm_runtime_get(td->dev);

pm_runtime_get_sync()?

Otherwise looks like you're risking a lot here because pm_runtime_get() is an
asynchronous request.

> +	/* Re-init DFLL */
> +	dfll_init_out_if(td);
> +	dfll_set_default_params(td);
> +	dfll_set_open_loop_config(td);
> +
> +	pm_runtime_put(td->dev);
> +
> +	/* Restore last request and mode up to open loop */
> +	switch (td->resume_mode) {
> +	case DFLL_CLOSED_LOOP:
> +	case DFLL_OPEN_LOOP:
> +		dfll_set_mode(td, DFLL_OPEN_LOOP);
> +		if (td->pmu_if == TEGRA_DFLL_PMU_I2C)
> +			dfll_i2c_set_output_enabled(td, false);
> +		break;
> +	default:
> +		break;
> +	}
> +}


