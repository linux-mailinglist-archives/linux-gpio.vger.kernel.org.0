Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3397E50609
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 11:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfFXJqd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 05:46:33 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37544 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfFXJqd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 05:46:33 -0400
Received: by mail-lf1-f65.google.com with SMTP id d11so9546681lfb.4;
        Mon, 24 Jun 2019 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ev9Tj2wrV2sHVa78lJSUKLNtj813pnRYEFAtRIvugjE=;
        b=qSCxSb4WXeoEdWJZpY6yBNK8LXScRMNlFQ6qW4vetx44ieE7bfXpvvHAA9dVyGi6W0
         CkXlZVeJ6Xyz60NBJHmRkxeu60aF9Pmh1rLzqqpvUJ/J60YEk0b7O6F/yzgnKUHkMl3r
         kSNAhNA0ozuVh4xziklAIjJ7ns5zqobvE0Z3I5SsdcXpc2MJM9jkpt55hD8UX98RjocV
         Ay5xrZK/YLYBdbtMPBGacuWXzKMSsfDpEX7jhBfWUgInyyJi3DkMwMDM+XA+/4/2rnBm
         3ZhfaUXVPaEKQQnlb1bL1Yft4giSc7pfAiB53860HM0iLNlHPY78Jov5uUZGTV/Mq2pI
         sxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ev9Tj2wrV2sHVa78lJSUKLNtj813pnRYEFAtRIvugjE=;
        b=Zm4dJUm/ViY1+n/hC6GJHb5weR5KeYLtdJ2Vvs4YXDkj5l42+o/YOYxRN/0AUK3enh
         KUIP1opHVQuITyHfSbgmmEwhTAGcTboj6xJRA7VmHMRnzD2KeIfokTmTpansB43DlWVM
         E77bbu71oAemMpo4Ta9VjUiCO+fKWhf9xfd3VZ+bASQY46rHKEpR2q4zSptPMzzNAww0
         RPea3h1NSLWda4rV5Q7I0tNxVCtIhkNgL4ICbtaf05jKGMgviIFn5YbZPVCDPwYzxEWu
         oew2e4R1jwBkoKAMJRbyRdZBW1gB9P0H8O3d7s0LEBzcrUlZCHiD9oEbr4JqDcw+dr6z
         Pi4w==
X-Gm-Message-State: APjAAAVas0V/XpGsgSmXW/PQgK/MfQRYWPLoOB/XqWT9njEzWuT+4w3M
        P0E4uhUMuzxe02s71Uz1V4vyxB7w
X-Google-Smtp-Source: APXvYqzsFhhIEFfn6HM3ZO8SBA4KV8ZzTlRkGff2B0yMJxryYKBTwQTW/XWgiiIfqrsVyzbYuiKkow==
X-Received: by 2002:a19:550f:: with SMTP id n15mr3464871lfe.34.1561369590174;
        Mon, 24 Jun 2019 02:46:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id z26sm1643515ljz.64.2019.06.24.02.46.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 02:46:29 -0700 (PDT)
Subject: Re: [PATCH V4 02/18] pinctrl: tegra: add suspend and resume support
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
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-3-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a03ce644-5efd-e721-fb06-16de097171bb@gmail.com>
Date:   Mon, 24 Jun 2019 12:46:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561345379-2429-3-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

24.06.2019 6:02, Sowjanya Komatineni пишет:
> This patch adds support for Tegra pinctrl driver suspend and resume.
> 
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 47 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  4 +++
>  drivers/pinctrl/tegra/pinctrl-tegra210.c |  6 ++++
>  3 files changed, 57 insertions(+)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index b03c465917b8..c0ba6fa63ad1 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -631,6 +631,38 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>  	}
>  }
>  
> +int __maybe_unused tegra_pinctrl_suspend(struct device *dev)

The "maybe_unused" attribute isn't needed for global functions because
compiler always assumes that such functions are used somewhere outside.

> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			*backup_regs++ = readl(regs++);
> +	}
> +
> +	return pinctrl_force_sleep(pmx->pctl);
> +}
> +
> +int __maybe_unused tegra_pinctrl_resume(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			writel(*backup_regs++, regs++);
> +	}
> +
> +	return 0;
> +}
> +
>  static bool gpio_node_has_range(const char *compatible)
>  {
>  	struct device_node *np;
> @@ -655,6 +687,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  	int i;
>  	const char **group_pins;
>  	int fn, gn, gfn;
> +	unsigned long backup_regs_size = 0;
>  
>  	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
>  	if (!pmx)
> @@ -707,6 +740,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>  		if (!res)
>  			break;
> +		backup_regs_size += resource_size(res);
>  	}
>  	pmx->nbanks = i;
>  
> @@ -715,11 +749,24 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  	if (!pmx->regs)
>  		return -ENOMEM;
>  
> +	pmx->reg_bank_size = devm_kcalloc(&pdev->dev, pmx->nbanks,
> +					  sizeof(*pmx->reg_bank_size),
> +					  GFP_KERNEL);
> +	if (!pmx->reg_bank_size)
> +		return -ENOMEM;
> +
> +	pmx->backup_regs = devm_kzalloc(&pdev->dev, backup_regs_size,
> +					GFP_KERNEL);
> +	if (!pmx->backup_regs)
> +		return -ENOMEM;
> +
>  	for (i = 0; i < pmx->nbanks; i++) {
>  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>  		pmx->regs[i] = devm_ioremap_resource(&pdev->dev, res);
>  		if (IS_ERR(pmx->regs[i]))
>  			return PTR_ERR(pmx->regs[i]);
> +
> +		pmx->reg_bank_size[i] = resource_size(res);
>  	}
>  
>  	pmx->pctl = devm_pinctrl_register(&pdev->dev, &tegra_pinctrl_desc, pmx);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
> index 32642af3f871..65fcbf8c7579 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
> @@ -17,6 +17,8 @@ struct tegra_pmx {
>  
>  	int nbanks;
>  	void __iomem **regs;
> +	size_t *reg_bank_size;
> +	u32 *backup_regs;
>  };
>  
>  enum tegra_pinconf_param {
> @@ -195,4 +197,6 @@ struct tegra_pinctrl_soc_data {
>  
>  int tegra_pinctrl_probe(struct platform_device *pdev,
>  			const struct tegra_pinctrl_soc_data *soc_data);
> +int __maybe_unused tegra_pinctrl_suspend(struct device *dev);
> +int __maybe_unused tegra_pinctrl_resume(struct device *dev);
>  #endif
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> index 617ad963f5ad..4616bbc2efba 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> @@ -1562,6 +1562,11 @@ static int tegra210_pinctrl_probe(struct platform_device *pdev)
>  	return tegra_pinctrl_probe(pdev, &tegra210_pinctrl);
>  }
>  
> +static const struct dev_pm_ops tegra_pinctrl_pm = {
> +	.suspend = &tegra_pinctrl_suspend,
> +	.resume = &tegra_pinctrl_resume
> +};

What about to move tegra_pinctrl_pm out into pinctrl-tegra.c to make it
common for all of the drivers?
