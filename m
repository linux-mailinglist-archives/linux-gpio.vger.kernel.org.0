Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1695998F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 13:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfF1L4j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 07:56:39 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44138 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfF1L4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 07:56:39 -0400
Received: by mail-qk1-f196.google.com with SMTP id p144so4494162qke.11;
        Fri, 28 Jun 2019 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2jERR1htLsj0259opQP6iZqdbvhKo7IE5BZi1R4vL58=;
        b=a9F3lclHUqf2w2vrqdAORV4XYJ3g9/cLzsfgk/JstGgHK33pSf9iEtBhoSDAILnNCb
         lHMMWX5duZyOPY6YhTDMXXvfhUBM+xTLgIPxOvcGD74VpCCjlw1yZbAPAqdTUxKw/SHG
         Zob6rus59DDu59lTgDDC4oDSpLYqDAb1hU2L3U6aEwH7QaF2kK2CfbrDT/uIsPjxl7To
         TNVDN0lZNbTjufWiehayKvTMnVFzdgclcLA1uJWthvXNASSOAP9jRa44GEVLMLB3NegT
         WWM9ms1qNXvQsjA+a3EymFZHzL3XtdD0BDfEY6tE+PQBq87v1Su3Ezmn+iL9P4puDpVt
         iTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2jERR1htLsj0259opQP6iZqdbvhKo7IE5BZi1R4vL58=;
        b=l4f1EkJFJpszWHFnRe/baTHIM8DafS0oo+4p895t2YJrKbgNtxc83z8Cokgc9fG7l+
         nchnKMAZc84g5LG9sa0bX75i7ANZbErVYTG8//WPJryRgQmsQvrCezNMi/rxuoHMqcLW
         aEb07HhqQkIJ9C/1OoU+4oWDsV5KCwzQnGr7us6nKOW22UyFYUFkmiDPO6FpSA9Njlm0
         pu1btAudGvUhAZICKOm36RZQNiUwEWBX7Qs9qQ6cT+mp63AjLbmpADw8CSoaeJ89gI81
         O7IcdegMrtMGJbNTMLnaF285KITyoJvsaO5/3lsTylpp2R9U4WcxLBSHykG0Bc6bGGYe
         tvEA==
X-Gm-Message-State: APjAAAVUDVCmCn+5Ry1L7zz7HYJI0yWVBhuBxjGgOQjVqORW7SOKRunN
        ObmQuvErPxUpUXmVQZcmnKlgKz/V
X-Google-Smtp-Source: APXvYqzvuGSTQ6WiXnxDL1MTM1M3vj+OfNZ3xa6fZad2jOaM1HFKAVDMZ7x2HY050fVRVmMFO9sGYQ==
X-Received: by 2002:a37:9c46:: with SMTP id f67mr8290537qke.455.1561722997649;
        Fri, 28 Jun 2019 04:56:37 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id i48sm989609qte.93.2019.06.28.04.56.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 04:56:36 -0700 (PDT)
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
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
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0409f478-e425-4e7f-5fff-8c3a94f47ee8@gmail.com>
Date:   Fri, 28 Jun 2019 14:56:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> This patch adds support for Tegra pinctrl driver suspend and resume.
> 
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>  drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 34596b246578..e7c0a1011cba 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -621,6 +621,43 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>  	}
>  }
>  
> +static int tegra_pinctrl_suspend(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	unsigned int i, j;

In general it's better not to use "j" in conjunction with "i" because they look
similar and I seen quite a lot of bugs caused by unnoticed typos like that. So I'm
suggesting to use "i, k" for clarity.

> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			*backup_regs++ = readl(regs++);

Please use readl_relaxed(), we don't need memory barriers here.

> +	}
> +
> +	return pinctrl_force_sleep(pmx->pctl);
> +}
> +
> +static int tegra_pinctrl_resume(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			writel(*backup_regs++, regs++);

Same for writel_relaxed(), memory barrier is inserted *before* the write to ensure
that all previous memory stores are completed. IOREMAP'ed memory is strongly-ordered,
memory barriers are not needed here.

> +	}
> +
> +	return 0;
> +}
> +
> +const struct dev_pm_ops tegra_pinctrl_pm = {
> +	.suspend = &tegra_pinctrl_suspend,
> +	.resume = &tegra_pinctrl_resume
> +};
> +
>  static bool gpio_node_has_range(const char *compatible)
>  {
>  	struct device_node *np;
> @@ -645,6 +682,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  	int i;
>  	const char **group_pins;
>  	int fn, gn, gfn;
> +	unsigned long backup_regs_size = 0;
>  
>  	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
>  	if (!pmx)
> @@ -697,6 +735,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>  		if (!res)
>  			break;
> +		backup_regs_size += resource_size(res);
>  	}
>  	pmx->nbanks = i;
>  
> @@ -705,11 +744,24 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  	if (!pmx->regs)
>  		return -ENOMEM;
>  
> +	pmx->reg_bank_size = devm_kcalloc(&pdev->dev, pmx->nbanks,
> +					  sizeof(*pmx->reg_bank_size),
> +					  GFP_KERNEL);
> +	if (!pmx->reg_bank_size)
> +		return -ENOMEM;

It looks to me that we don't really need to churn with this allocation because the
bank sizes are already a part of the platform driver's description.

We could add a simple helper function that retrieves the bank sizes, like this:

static unsigned int tegra_pinctrl_bank_size(struct device *dev,
					    unsigned int bank_id)
{
	struct platform_device *pdev;
	struct resource *res;

	pdev = to_platform_device(dev);
	res = platform_get_resource(pdev, IORESOURCE_MEM, bank_id);

	return resource_size(res) / 4;
}

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
> index 287702660783..55456f8d44cf 100644
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
> @@ -193,6 +195,7 @@ struct tegra_pinctrl_soc_data {
>  	bool drvtype_in_mux;
>  };
>  
> +extern const struct dev_pm_ops tegra_pinctrl_pm;

Please add a newline here.

>  int tegra_pinctrl_probe(struct platform_device *pdev,
>  			const struct tegra_pinctrl_soc_data *soc_data);
>  #endif
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> index 0b56ad5c9c1c..edd3f4606cdb 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> @@ -1571,6 +1571,7 @@ static struct platform_driver tegra210_pinctrl_driver = {
>  	.driver = {
>  		.name = "tegra210-pinctrl",
>  		.of_match_table = tegra210_pinctrl_of_match,
> +		.pm = &tegra_pinctrl_pm,
>  	},
>  	.probe = tegra210_pinctrl_probe,
>  };
> 

Could you please address my comments in the next revision if there will be one?
